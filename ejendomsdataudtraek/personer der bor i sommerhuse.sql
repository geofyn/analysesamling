Select cpr.Fornavn,
cpr.Efternavn,
cpr.CPR,
enh.enh041LovligAnvendelse_T,
enh.enh042DatoForTidbegraensDisp, 
enh.enh048GodkendtTomBolig_T,
enh.enh068FlexboligTillArt_T,
enh.enh069FlexboligOphoersDato,
byg.Vejnavn, byg.HusNr, 
byg.Postnr As Postnr1,
byg.PostDistrikt,
byg.byg021BygningensAnvendelse_T,
cpr.Adressedato, EnhAdr_id, enh.Bygning
From CPR_AktivView cpr 

Inner Join BBR.EnhedGeoView enh On enh.Adresse = cpr.EnhAdr_id 
Inner Join BBR.BygningGeoView byg On byg.BygningId = enh.Bygning 

Where byg.byg021BygningensAnvendelse = 510
