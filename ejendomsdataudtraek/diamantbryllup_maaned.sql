SELECT
	*
FROM
	cpr.PersonKomGeoView
WHERE
	civilstand = 'G'
	AND AegtepartStartdato BETWEEN DATEADD(YEAR, -60, GETDATE()) AND DATEADD(MONTH, + 1, DATEADD(YEAR, -60, GETDATE()))
ORDER BY
	AegtepartStartdato,
	Standardadresse
