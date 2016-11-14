----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name   : create_interconnection.sql
-- Description : 
-- Date        : 11/6/2016
-- Modified    : 11/13/2016 - VC: casted system_size_dc and system_size_ac 
--                                as double
----------------------------------------------------------------------------
DROP TABLE interconnection;

CREATE TABLE interconnection AS
SELECT DISTINCT application_id,
matched_csi_application_number AS csi_number,
UPPER(utility) AS utility,
UPPER(service_city) AS city,
service_zip AS zip,
UPPER(service_county) AS county,
CAST(system_size_dc AS DOUBLE) AS size_dc,
CAST(system_size_ac AS DOUBLE) AS size_ac,
CAST(tilt AS DOUBLE) AS tilt,
CAST(azimuth AS DOUBLE) AS azimuth,
UPPER(mounting_method) AS mounting_method,
UPPER(customer_sector) AS customer_sector, 
TO_DATE(from_unixtime(UNIX_TIMESTAMP(app_received_date, 'mm-dd-yyyy'))) AS app_received_date,
TO_DATE(from_unixtime(UNIX_TIMESTAMP(app_complete_date, 'mm-dd-yyyy'))) AS app_complete_date,
TO_DATE(from_unixtime(UNIX_TIMESTAMP(app_approved_date, 'mm-dd-yyyy'))) AS app_approved_date,
IF(UPPER(self_installer) = 'YES', 'Self Installer', installer_name) AS installer_name,
IF(electric_vehicle = 'Yes', 'Y', 
   IF(electric_vehicle IN ('No', 
      'No, there are no EV Chargers currently installed or planned to be installed'), 'N', NULL)) AS ev, 
CAST(electric_vehicle_count AS INT) AS ev_count,
CAST(total_system_cost AS DOUBLE) AS total_system_cost,
inverter_manufacturer_1 AS inverter_mfr
FROM interconnection_raw
WHERE technology_type = 'Solar PV';