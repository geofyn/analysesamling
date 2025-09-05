SELECT
	Adresseringsnavn,
	Standardadresse,
	FoedtDato,
	Postnr,
	PostDistrikt
FROM
	cpr.PersonKomGeoView
WHERE
	YEAR(FoedtDato) = YEAR(GETDATE()) - 100
