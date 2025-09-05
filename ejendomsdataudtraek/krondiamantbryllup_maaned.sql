SELECT
	*
FROM
	cpr.PersonKomGeoView
WHERE
	civilstand = 'G'
	AND AegtepartStartdato BETWEEN DATEADD(YEAR, -65, GETDATE()) AND DATEADD(MONTH, + 1, DATEADD(YEAR, -65, GETDATE()))
ORDER BY
	AegtepartStartdato,
	Standardadresse
