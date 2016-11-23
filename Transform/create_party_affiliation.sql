----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name: create_party_affiliation.sql
-- Description:
-- Date       : 11/22/2016
----------------------------------------------------------------------------
DROP TABLE party_affiliation;

CREATE TABLE party_affiliation AS
SELECT DISTINCT UPPER(county) AS county_name,
cast(population AS BIGINT) AS population,
cast(registered_voters as DOUBLE) AS registered_voters,
cast(democratic as DOUBLE) AS democratic,
cast(republican as DOUBLE) AS republican,
cast(spread as DOUBLE) AS spread,
cast(other as DOUBLE) AS other,
cast(no_party_pref as DOUBLE) AS no_party_pref
FROM party_raw;
