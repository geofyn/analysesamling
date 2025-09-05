SELECT
	Adresseringsnavn,
	Standardadresse,
	FoedtDato,
	Postnr,
	PostDistrikt
FROM
	cpr.PersonKomGeoView
WHERE
	FoedtDato BETWEEN DATEADD(YEAR, -100, GETDATE()) AND DATEADD(MONTH, + 1, DATEADD(YEAR, -100, GETDATE()))
