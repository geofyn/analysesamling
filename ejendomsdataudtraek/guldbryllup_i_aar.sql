SELECT
	*
FROM
	cpr.PersonKomGeoView
WHERE
	civilstand = 'G'
	AND YEAR(AegtepartStartdato) = YEAR(GETDATE()) - 50
ORDER BY
	AegtepartStartdato,
	Standardadresse
