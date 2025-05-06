# Ejendomsdataudtræk
Geo Fyn har her samlet en række eksempler på udtræk af ejendomsdata.

## BBR bygning stemmer ikke overens med GeoDanmark
Her er et eksempel på et udtræk fra BBR, hvor bygningsareal ikke stemmer overens med GeoDanmark bygningensareal.<br>
[Se kode](udtraek_af_bbr_bygning_som_ikke_stemmer_overens_med_geodanmark.sql)

## Personer der bor i sommerhuse
Udvælger alle personer der i sommerhuse, uanset om der er dispensation til helårsbeboelse eller ej. <br>
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/personer_der_bor_i_sommerhuse.sql)

## Ejerlejligheder uden adresse
Udvælger alle ejerlejligheder der ikke har enten en adresse eller et husnummer. Der bør være få af disse.
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/ejerlejligheder_uden_adresse.sql)

## Borgere der fylder 100 år i 2025
Ud fra fødselsdato beregnes, hvem der fylder 100 år i 2025. Når der skal vælges et andet år, skal årstallet justeres 2 gange i WHERE-sætningen

## Borgere der fylder 100 år den kommende løbende måned
Ud fra fødselsdato beregnes, hvem der fylder 100 år de næste 28-31 dage. Det vil sige køres forespørgslen d. 15. januar kommer alle med som fylder 100 år mellem 15. januar og 15. februar. 

## Borgere der har diamantbryllup i 2025
Ud fra civilstandsdato beregnes hvilke borgere der har diamantbryllup i  2025. Hvert ægtepar optræder 2 gange i resultatet. Når der skal vælges et andet år, skal årstallet justeres 2 gange i WHERE-sætningen

## Borgere der har diamantbryllup den kommende løbende måned
Ud fra civilstandsdato beregnes hvilke borgere der har diamantbryllup de næste 28-31 dage. Det vil sige køres forespørgslen d. 15. januar kommer alle med som har diamasntbryllup 15. januar og 15. februar. 
