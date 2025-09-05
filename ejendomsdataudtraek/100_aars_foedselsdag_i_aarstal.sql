SELECT
	Adresseringsnavn,
	Standardadresse,
	FoedtDato,
	Postnr,
	PostDistrikt,
	YEAR(GETDATE())
FROM
	cpr.PersonKomGeoView
WHERE
	YEAR(FoedtDato) = YEAR(GETDATE()) - 100
