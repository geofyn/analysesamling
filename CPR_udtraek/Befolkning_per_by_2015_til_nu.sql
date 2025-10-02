declare @kommunekode int = SKRIVKOMMUNEKODEHER;
WITH hist AS (
    SELECT 
        pnr, tilflytningsdato, fraflytningsdato,
        kommunekode, vejkode, husnr, geometri, Aendring_T
    FROM cpr.HisAdresseGeoView
    WHERE (Aendring_T IS NULL OR LTRIM(RTRIM(Aendring_T)) NOT IN ('Fortryd'))
),
curr AS (
    SELECT 
        pnr, Tilflytningsdato AS tilflytningsdato,
        NULL AS fraflytningsdato,
        Kommunekode, Vejkode, Husnr, geometri, NULL AS Aendring_T
    FROM CPR.AdresseringsGeoView
),
udrejse_addr AS (
    SELECT 
        pnr, Udrejsedato AS tilflytningsdato,
        Udrejsedato AS fraflytningsdato,
        -1 AS kommunekode, NULL AS vejkode, NULL AS husnr,
        NULL AS geometri, NULL AS Aendring_T
    FROM CPR.HisUdrejseView
    WHERE Udrejsedato IS NOT NULL
),
all_addr AS (
    SELECT * FROM hist
    UNION ALL SELECT * FROM curr
    UNION ALL SELECT * FROM udrejse_addr
),
addr_dedup AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY pnr, tilflytningsdato, kommunekode, vejkode, husnr
               ORDER BY 
                 CASE 
                   WHEN Aendring_T IS NULL OR LTRIM(RTRIM(Aendring_T)) = '' THEN 1
                   WHEN Aendring_T = 'Ret' THEN 2
                   WHEN Aendring_T = 'Teknisk ændring' THEN 3
                   ELSE 4
                 END
           ) AS rn
    FROM all_addr
),
addr_clean AS (
    SELECT 
        pnr,
        tilflytningsdato,
        fraflytningsdato,
        kommunekode,
        vejkode,
        husnr,
        geometri
    FROM addr_dedup
    WHERE rn = 1
),
status2015 AS (
    SELECT 
        pnr,
        tilflytningsdato,
        fraflytningsdato,
        kommunekode,
        vejkode,
        husnr,
        geometri
    FROM addr_clean
    WHERE tilflytningsdato <= '2015-01-01'
      AND (fraflytningsdato IS NULL OR fraflytningsdato > '2015-01-01')
),
bef2015 AS (
    SELECT 
        b.Navn_1_skrivemaade AS Bynavn,
        COUNT(DISTINCT s.pnr) AS Antal2015
    FROM status2015 s
    JOIN Stednavne.BebyggelseGeoView b
      ON s.geometri.STIntersects(b.geometri) = 1
    WHERE s.kommunekode = @kommunekode
      AND NOT EXISTS (
            SELECT 1 FROM CPR.HisUdrejseView u
            WHERE u.pnr = s.pnr
              AND u.Udrejsedato < '2015-01-01'
              AND (u.Indrejsedato IS NULL OR u.Indrejsedato > '2015-01-01')
      )
      AND NOT EXISTS (
            SELECT 1 FROM CPR.ForsvindView f
            WHERE f.PNR = s.pnr
              AND f.Forsvindingsdato < '2015-01-01'
      )
      AND b.Bebyggelsestype = 'by'
    GROUP BY b.Navn_1_skrivemaade
),
/* ---------- Befolkning i dag ---------- */
befNu AS (
    SELECT 
        b.Navn_1_skrivemaade AS Bynavn,
        COUNT(DISTINCT p.pnr) AS AntalNu
    FROM cpr.PersonKomGeoView p
    JOIN Stednavne.BebyggelseGeoView b
      ON p.geometri.STIntersects(b.geometri) = 1
    WHERE p.kommunekode = @kommunekode
      AND b.Bebyggelsestype = 'by'
    GROUP BY b.Navn_1_skrivemaade
)
/* ---------- Samlet output ---------- */
SELECT 
    COALESCE(n.Bynavn, f.Bynavn) AS Bynavn,
    f.Antal2015,
    n.AntalNu,
    (ISNULL(n.AntalNu,0) - ISNULL(f.Antal2015,0)) AS Udvikling
FROM bef2015 f
FULL OUTER JOIN befNu n
  ON f.Bynavn = n.Bynavn
ORDER BY Bynavn
