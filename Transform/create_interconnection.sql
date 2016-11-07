----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_interconnection.sql
-- Description: 
-- Date       : 11/6/2016
----------------------------------------------------------------------------
DROP TABLE interconnection;

CREATE TABLE interconnection AS
SELECT DISTINCT application_id,
matched_csi_application_number AS csi_number,
utility,
service_city AS city,
service_zip AS zip,
service_county AS county,
system_size_dc AS size_dc,
system_size_ac AS size_ac,
cast(tilt AS DOUBLE) AS tilt,
cast(azimuth AS DOUBLE) AS azimuth,
mounting_method,
TO_DATE(from_unixtime(UNIX_TIMESTAMP(app_received_date, 'mm-dd-yyyy'))) AS app_received_date,
TO_DATE(from_unixtime(UNIX_TIMESTAMP(app_complete_date, 'mm-dd-yyyy'))) AS app_complete_date,
TO_DATE(from_unixtime(UNIX_TIMESTAMP(app_approved_date, 'mm-dd-yyyy'))) AS app_approved_date,
IF(UPPER(self_installer) = 'YES', 'Self Installer', installer_name) AS installer_name,
electric_vehicle,
cast(electric_vehicle_count AS INT) AS electric_vehicle_count,
cast(total_system_cost AS DOUBLE) AS total_system_cost,
inverter_manufacturer_1 AS inverter_mfr
FROM interconnection_raw
WHERE technology_type = 'Solar PV';