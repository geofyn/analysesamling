SELECT
	*
FROM
	cpr.PersonKomGeoView
WHERE
	civilstand = 'G'
	AND AegtepartStartdato BETWEEN DATEADD(YEAR, -50, GETDATE()) AND DATEADD(MONTH, + 1, DATEADD(YEAR, -50, GETDATE()))
ORDER BY
	AegtepartStartdato,
	Standardadresse
