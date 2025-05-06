Select cpr.Fornavn,
cpr.Efternavn,
cpr.CPR_nr,
enh.enh041LovligAnvendelse_T,
enh.enh042DatoForTidbegraensDisp, 
enh.enh048GodkendtTomBolig_T,
enh.enh068FlexboligTillArt_T,
enh.enh069FlexboligOphoersDato,
byg.Vejnavn,
byg.HusNr, 
byg.Postnr,
byg.PostDistrikt,
byg.byg021BygningensAnvendelse_T,
AdresseId,
enh.Bygning
From cpr.PersonKomGeoView cpr 

Inner Join BBR.EnhedGeoView enh On enh.Adresse = cpr.AdresseId 
Inner Join BBR.BygningGeoView byg On byg.BygningId = enh.Bygning 

Where byg.byg021BygningensAnvendelse = 510
