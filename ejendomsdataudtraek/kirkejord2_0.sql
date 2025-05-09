USE [LOIS]
GO

/****** Object:  View [NYBORG].[kirkejord2]    Script Date: 09-05-2025 10:52:51 ******
******* SQL danner et view med ejendomme ejet af folkekirken - menighedsråd eller præstegård  *********/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




create view [NYBORG].[kirkejord2] as
with q1 as (
select distinct a.PrimaerKontakt_Navn from matrikel.JordstykkeEjerGeoView a, bbr.BygningGeoDkGeoView b where a.geometri.STIntersects(b.Geometri.STCentroid()) = 1 and byg021BygningensAnvendelse_t = 'Kirke eller anden bygning til trosudøvelse for statsanerkendte trossamfund'
), q2 as (
select row_number() Over(order by lifaid) as id, a.LifaId from matrikel.JordstykkeEjerGeoView a, q1 b where a.PrimaerKontakt_Navn = b.PrimaerKontakt_Navn or lower(a.PrimaerKontakt_Navn) like '%menighedsråd%'
), q3 as (
select distinct(a.lifaid) from q2 a
)
select f.lifaId, f.jordstykkeejerid, f.matrikelnummer, f.landbrugsnotering, f.beliggenhedsadresse, f.PrimaerKontakt_Navn, f.PrimaerKontakt_EjerForholdsK_T, f.bfenummer, f.Geometri from q3 e left join matrikel.JordstykkeEjerGeoView f on e.LifaId = f.LifaId

GO


