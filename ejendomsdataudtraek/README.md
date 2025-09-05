# Ejendomsdataudtræk
Geo Fyn har her samlet en række eksempler på udtræk af ejendomsdata.

## Personer der bor i sommerhuse
Udvælger alle personer der i sommerhuse, uanset om der er dispensation til helårsbeboelse eller ej. <br>
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/personer_der_bor_i_sommerhuse.sql)

## Ejerlejligheder uden adresse
Udvælger alle ejerlejligheder der ikke har enten en adresse eller et husnummer. Der bør være få af disse.
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/ejerlejligheder_uden_adresse.sql)

## Borgere der fylder 100 år i 2025
Ud fra fødselsdato beregnes, hvem der fylder 100 år i 2025. Når der skal vælges et andet år, skal årstallet justeres 2 gange i WHERE-sætningen
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/100_aars_foedselsdag_i_aarstal.sql)

## Borgere der fylder 100 år den kommende løbende måned
Ud fra fødselsdato beregnes, hvem der fylder 100 år de næste 28-31 dage. Det vil sige køres forespørgslen d. 15. januar kommer alle med som fylder 100 år mellem 15. januar og 15. februar. 
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/100_aars_foedselsdag_maaned.sql)

## Borgere der har guldbryllup i nuværende år
Ud fra civilstandsdato beregnes hvilke borgere der har guldbryllup i nuværende år. Hvert ægtepar optræder 2 gange i resultatet.
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/guldbryllup_i_aarstal.sql)

## Borgere der har guldbryllup den kommende løbende måned
Ud fra civilstandsdato beregnes hvilke borgere der har guldbryllup de næste 28-31 dage. Det vil sige køres forespørgslen d. 15. januar kommer alle med som har guldbryllup 15. januar og 15. februar. 
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/guldbryllup_maaned.sql)

## Borgere der har diamantbryllup i nuværende år
Ud fra civilstandsdato beregnes hvilke borgere der har diamantbryllup i nuværende år. Hvert ægtepar optræder 2 gange i resultatet.
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/diamantbryllup_i_aar.sql)

## Borgere der har diamantbryllup den kommende løbende måned
Ud fra civilstandsdato beregnes hvilke borgere der har diamantbryllup de næste 28-31 dage. Det vil sige køres forespørgslen d. 15. januar kommer alle med som har diamantbryllup 15. januar og 15. februar. 
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/diamantbryllup_maaned.sql)

## Borgere der har krondiamantbryllup i nuværende år
Ud fra civilstandsdato beregnes hvilke borgere der har krondiamantbryllup i nuværende år. Hvert ægtepar optræder 2 gange i resultatet.
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/krondiamantbryllup_i_aar.sql)

## Borgere der har krondiamantbryllup den kommende løbende måned
Ud fra civilstandsdato beregnes hvilke borgere der har krondiamantbryllup de næste 28-31 dage. Det vil sige køres forespørgslen d. 15. januar kommer alle med som har krondiamantbryllup 15. januar og 15. februar. 
[Se kode](https://github.com/geofyn/analysesamling/blob/main/ejendomsdataudtraek/krondiamantbryllup_maaned.sql)

## Udtræk af ejendomme ejet af folkekirken
Se et eksempel på hvordan ejendomme ejet af folkekirken -  menighedsråd eller præstegård.
[Se kode](kirkejord2_0.sql)

