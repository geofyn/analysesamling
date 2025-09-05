SELECT
	*
FROM
	cpr.PersonKomGeoView
WHERE
	civilstand = 'G'
	AND YEAR(AegtepartStartdato) = YEAR(GETDATE()) - 60
ORDER BY
	AegtepartStartdato,
	Standardadresse
