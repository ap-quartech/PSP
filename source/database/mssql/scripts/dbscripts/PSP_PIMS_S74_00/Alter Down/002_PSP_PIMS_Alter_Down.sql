-- Script generated by Aqua Data Studio Schema Synchronization for MS SQL Server 2016 on Wed Feb 14 11:54:44 GMT-08:00 2024
-- Execute this script on:
-- 		PSP_PIMS_S74.00/dbo - This database/schema will be modified
-- to synchronize it with MS SQL Server 2016:
-- 		PSP_PIMS_S73.00/dbo

-- We recommend backing up the database prior to executing the script.

SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop foreign key constraint dbo.PIM_PRPRTY_PIM_PROPOP_SRC_FK
PRINT N'Drop foreign key constraint dbo.PIM_PRPRTY_PIM_PROPOP_SRC_FK'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_OPERATION]
	DROP CONSTRAINT IF EXISTS [PIM_PRPRTY_PIM_PROPOP_SRC_FK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop foreign key constraint dbo.PIM_PRPRTY_PIM_PROPOP_DST_FK
PRINT N'Drop foreign key constraint dbo.PIM_PRPRTY_PIM_PROPOP_DST_FK'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_OPERATION]
	DROP CONSTRAINT IF EXISTS [PIM_PRPRTY_PIM_PROPOP_DST_FK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop foreign key constraint dbo.PIM_PRPOTY_PIM_PROPOP_FK
PRINT N'Drop foreign key constraint dbo.PIM_PRPOTY_PIM_PROPOP_FK'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_OPERATION]
	DROP CONSTRAINT IF EXISTS [PIM_PRPOTY_PIM_PROPOP_FK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PROPOP_I_S_U_TR
PRINT N'Drop trigger dbo.PIMS_PROPOP_I_S_U_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PROPOP_I_S_U_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PROPOP_I_S_I_TR
PRINT N'Drop trigger dbo.PIMS_PROPOP_I_S_I_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PROPOP_I_S_I_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PROPOP_A_S_IUD_TR
PRINT N'Drop trigger dbo.PIMS_PROPOP_A_S_IUD_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PROPOP_A_S_IUD_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop index dbo.PROPOP_SOURCE_PROPERTY_ID_IDX
PRINT N'Drop index dbo.PROPOP_SOURCE_PROPERTY_ID_IDX'
GO
DROP INDEX IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION].[PROPOP_SOURCE_PROPERTY_ID_IDX]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop index dbo.PROPOP_PROPERTY_OPERATION_TYPE_CODE_IDX
PRINT N'Drop index dbo.PROPOP_PROPERTY_OPERATION_TYPE_CODE_IDX'
GO
DROP INDEX IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION].[PROPOP_PROPERTY_OPERATION_TYPE_CODE_IDX]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop index dbo.PROPOP_PROPERTY_OPERATION_NO_IDX
PRINT N'Drop index dbo.PROPOP_PROPERTY_OPERATION_NO_IDX'
GO
DROP INDEX IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION].[PROPOP_PROPERTY_OPERATION_NO_IDX]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop index dbo.PROPOP_DESTINATION_PROPERTY_ID_IDX
PRINT N'Drop index dbo.PROPOP_DESTINATION_PROPERTY_ID_IDX'
GO
DROP INDEX IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION].[PROPOP_DESTINATION_PROPERTY_ID_IDX]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PRPOTY_I_S_U_TR
PRINT N'Drop trigger dbo.PIMS_PRPOTY_I_S_U_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PRPOTY_I_S_U_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PRPOTY_I_S_I_TR
PRINT N'Drop trigger dbo.PIMS_PRPOTY_I_S_I_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PRPOTY_I_S_I_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PRPRTY_I_S_U_TR
PRINT N'Drop trigger dbo.PIMS_PRPRTY_I_S_U_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PRPRTY_I_S_U_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PRPACT_I_S_I_TR
PRINT N'Drop trigger dbo.PIMS_PRPACT_I_S_I_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PRPACT_I_S_I_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PRPRTY_I_S_I_TR
PRINT N'Drop trigger dbo.PIMS_PRPRTY_I_S_I_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PRPRTY_I_S_I_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PRPACT_I_S_U_TR
PRINT N'Drop trigger dbo.PIMS_PRPACT_I_S_U_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PRPACT_I_S_U_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PRPACT_A_S_IUD_TR
PRINT N'Drop trigger dbo.PIMS_PRPACT_A_S_IUD_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PRPACT_A_S_IUD_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PRPRTY_A_S_IUD_TR
PRINT N'Drop trigger dbo.PIMS_PRPRTY_A_S_IUD_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PRPRTY_A_S_IUD_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop view dbo.PIMS_PROPERTY_BOUNDARY_VW
PRINT N'Drop view dbo.PIMS_PROPERTY_BOUNDARY_VW'
GO
DROP VIEW IF EXISTS [dbo].[PIMS_PROPERTY_BOUNDARY_VW]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop unique constraint dbo.PIMS_PROPOP_H_UK
PRINT N'Drop unique constraint dbo.PIMS_PROPOP_H_UK'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_OPERATION_HIST]
	DROP CONSTRAINT IF EXISTS [PIMS_PROPOP_H_UK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop primary key constraint dbo.PIMS_PROPOP_H_PK
PRINT N'Drop primary key constraint dbo.PIMS_PROPOP_H_PK'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_OPERATION_HIST]
	DROP CONSTRAINT IF EXISTS [PIMS_PROPOP_H_PK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop primary key constraint dbo.PROPOP_PK
PRINT N'Drop primary key constraint dbo.PROPOP_PK'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_OPERATION]
	DROP CONSTRAINT IF EXISTS [PROPOP_PK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop table dbo.PIMS_PROPERTY_OPERATION
PRINT N'Drop table dbo.PIMS_PROPERTY_OPERATION'
GO
DROP TABLE IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop primary key constraint dbo.PRPOTY_PK
PRINT N'Drop primary key constraint dbo.PRPOTY_PK'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_OPERATION_TYPE]
	DROP CONSTRAINT IF EXISTS [PRPOTY_PK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop view dbo.PIMS_PROPERTY_LOCATION_VW
PRINT N'Drop view dbo.PIMS_PROPERTY_LOCATION_VW'
GO
DROP VIEW IF EXISTS [dbo].[PIMS_PROPERTY_LOCATION_VW]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop sequence dbo.PIMS_PROPERTY_OPERATION_NO_SEQ
PRINT N'Drop sequence dbo.PIMS_PROPERTY_OPERATION_NO_SEQ'
GO
DROP SEQUENCE IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION_NO_SEQ]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create sequence dbo.PIMS_PROP_PROP_CLASSIFICATION_H_ID_SEQ
PRINT N'Create sequence dbo.PIMS_PROP_PROP_CLASSIFICATION_H_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[PIMS_PROP_PROP_CLASSIFICATION_H_ID_SEQ]
	AS bigint
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	NO CYCLE
	CACHE 50
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Alter table dbo.PIMS_PROPERTY
PRINT N'Alter table dbo.PIMS_PROPERTY'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY]
	DROP COLUMN IF EXISTS [IS_RETIRED]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Alter table dbo.PIMS_PROPERTY_HIST
PRINT N'Alter table dbo.PIMS_PROPERTY_HIST'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_HIST]
	DROP COLUMN IF EXISTS [IS_RETIRED]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Alter table dbo.PIMS_PROPERTY_ACTIVITY
PRINT N'Alter table dbo.PIMS_PROPERTY_ACTIVITY'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_ACTIVITY]
	ADD [PRETAX_AMT] money NULL, 
	[GST_AMT] money NULL, 
	[PST_AMT] money NULL, 
	[TOTAL_AMT] money NULL
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'Subtotal of the management activity cost.' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_PROPERTY_ACTIVITY', 
	@level2type = N'Column', @level2name = N'PRETAX_AMT'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'GST on the management activity.' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_PROPERTY_ACTIVITY', 
	@level2type = N'Column', @level2name = N'GST_AMT'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'PST on the management activity.' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_PROPERTY_ACTIVITY', 
	@level2type = N'Column', @level2name = N'PST_AMT'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'Total cost of the management activity.' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_PROPERTY_ACTIVITY', 
	@level2type = N'Column', @level2name = N'TOTAL_AMT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Alter table dbo.PIMS_PROPERTY_ACTIVITY_HIST
PRINT N'Alter table dbo.PIMS_PROPERTY_ACTIVITY_HIST'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_ACTIVITY_HIST]
	ADD [PRETAX_AMT] money NULL, 
	[GST_AMT] money NULL, 
	[PST_AMT] money NULL, 
	[TOTAL_AMT] money NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create view dbo.PIMS_PROPERTY_LOCATION_VW
PRINT N'Create view dbo.PIMS_PROPERTY_LOCATION_VW'
GO
CREATE VIEW [dbo].[PIMS_PROPERTY_LOCATION_VW] AS
SELECT PROP.PROPERTY_ID
     , PROP.PID
     , RIGHT('000000000' + CAST(PROP.PID AS VARCHAR(9)), 9) AS PID_PADDED
     , PROP.PIN                   
     , PROP.PROPERTY_TYPE_CODE
     , PROP.PROPERTY_STATUS_TYPE_CODE
     , PROP.PROPERTY_DATA_SOURCE_TYPE_CODE
     , PROP.PROPERTY_DATA_SOURCE_EFFECTIVE_DATE
     , PROP.PROPERTY_CLASSIFICATION_TYPE_CODE  
     , (SELECT STRING_AGG(TENURE_DESC, ', ')
        FROM   (SELECT TNUR.DESCRIPTION AS TENURE_DESC
                FROM   PIMS_PROPERTY_TENURE_TYPE  TNUR INNER JOIN
                       PIMS_PROP_PROP_TENURE_TYPE TNTY ON TNTY.PROPERTY_TENURE_TYPE_CODE = TNUR.PROPERTY_TENURE_TYPE_CODE
                                                      AND TNTY.PROPERTY_ID               = PROP.PROPERTY_ID) temp) AS PROPERTY_TENURE_TYPE_CODE
     , ADDR.STREET_ADDRESS_1
     , ADDR.STREET_ADDRESS_2
     , ADDR.STREET_ADDRESS_3
     , ADDR.MUNICIPALITY_NAME
     , ADDR.POSTAL_CODE
     , PROV.PROVINCE_STATE_CODE
     , PROV.DESCRIPTION AS PROVINCE_NAME
     , CNTY.COUNTRY_CODE
     , CNTY.DESCRIPTION AS COUNTRY_NAME
     , PROP.NAME
     , PROP.DESCRIPTION
     , PROP.ADDRESS_ID
     , PROP.REGION_CODE
     , PROP.DISTRICT_CODE
     , PROP.LOCATION AS GEOMETRY
     , PROP.PROPERTY_AREA_UNIT_TYPE_CODE
     , PROP.LAND_AREA
     , PROP.LAND_LEGAL_DESCRIPTION
     , PROP.SURVEY_PLAN_NUMBER
     , PROP.ENCUMBRANCE_REASON          
     , PROP.IS_SENSITIVE
     , PROP.IS_OWNED
     , PROP.IS_DISPOSED
     , PROP.IS_PROPERTY_OF_INTEREST 
     , PROP.IS_OTHER_INTEREST
     , PROP.IS_VISIBLE_TO_OTHER_AGENCIES
     , PROP.ZONING
     , PROP.ZONING_POTENTIAL 
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE IN ('PYBLMOTI', 'PYBLBCTFA')), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_PAYABLE_LEASE
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS                                          JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID LEFT JOIN
                          PIMS_LEASE_TERM     TERM ON TERM.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE IN ('PYBLMOTI', 'PYBLBCTFA')
                      AND ((getutcdate() BETWEEN LEAS.ORIG_START_DATE AND LEAS.ORIG_EXPIRY_DATE        ) OR
                           (getutcdate() >=      LEAS.ORIG_START_DATE AND LEAS.ORIG_EXPIRY_DATE IS NULL) OR
                           (getutcdate() BETWEEN TERM.TERM_START_DATE AND TERM.TERM_EXPIRY_DATE        ) OR
                           (getutcdate() >=      TERM.TERM_START_DATE AND TERM.TERM_EXPIRY_DATE IS NULL))), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_ACTIVE_PAYABLE_LEASE
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE = 'RCVBL'), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_RECEIVABLE_LEASE
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS                                          JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID LEFT JOIN
                          PIMS_LEASE_TERM     TERM ON TERM.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE = 'RCVBL'
                      AND ((getutcdate() BETWEEN LEAS.ORIG_START_DATE AND LEAS.ORIG_EXPIRY_DATE        ) OR
                           (getutcdate() >=      LEAS.ORIG_START_DATE AND LEAS.ORIG_EXPIRY_DATE IS NULL) OR
                           (getutcdate() BETWEEN TERM.TERM_START_DATE AND TERM.TERM_EXPIRY_DATE        ) OR
                           (getutcdate() >=      TERM.TERM_START_DATE AND TERM.TERM_EXPIRY_DATE IS NULL))), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_ACTIVE_RECEIVABLE_LEASE
FROM   PIMS_PROPERTY       PROP                                                    LEFT OUTER JOIN                                                                                     
       PIMS_ADDRESS        ADDR ON ADDR.ADDRESS_ID        = PROP.ADDRESS_ID        LEFT OUTER JOIN
       PIMS_PROVINCE_STATE PROV ON PROV.PROVINCE_STATE_ID = ADDR.PROVINCE_STATE_ID LEFT OUTER JOIN
       PIMS_COUNTRY        CNTY ON CNTY.COUNTRY_ID        = ADDR.COUNTRY_ID
WHERE  PROP.LOCATION IS NOT NULL

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create view dbo.PIMS_PROPERTY_BOUNDARY_VW
PRINT N'Create view dbo.PIMS_PROPERTY_BOUNDARY_VW'
GO
CREATE VIEW [dbo].[PIMS_PROPERTY_BOUNDARY_VW] AS
SELECT PROP.PROPERTY_ID
     , PROP.PID
     , RIGHT('000000000' + CAST(PROP.PID AS VARCHAR(9)), 9) AS PID_PADDED
     , PROP.PIN
     , PROP.PROPERTY_TYPE_CODE
     , PROP.PROPERTY_STATUS_TYPE_CODE
     , PROP.PROPERTY_DATA_SOURCE_TYPE_CODE
     , PROP.PROPERTY_DATA_SOURCE_EFFECTIVE_DATE
     , PROP.PROPERTY_CLASSIFICATION_TYPE_CODE
     , (SELECT STRING_AGG(TENURE_DESC, ', ')
        FROM   (SELECT TNUR.DESCRIPTION AS TENURE_DESC
                FROM   PIMS_PROPERTY_TENURE_TYPE  TNUR INNER JOIN
                       PIMS_PROP_PROP_TENURE_TYPE TNTY ON TNTY.PROPERTY_TENURE_TYPE_CODE = TNUR.PROPERTY_TENURE_TYPE_CODE
                                                      AND TNTY.PROPERTY_ID               = PROP.PROPERTY_ID) temp) AS PROPERTY_TENURE_TYPE_CODE
     , ADDR.STREET_ADDRESS_1
     , ADDR.STREET_ADDRESS_2
     , ADDR.STREET_ADDRESS_3
     , ADDR.MUNICIPALITY_NAME
     , ADDR.POSTAL_CODE
     , PROV.PROVINCE_STATE_CODE
     , PROV.DESCRIPTION AS PROVINCE_NAME
     , CNTY.COUNTRY_CODE
     , CNTY.DESCRIPTION AS COUNTRY_NAME
     , PROP.NAME
     , PROP.DESCRIPTION
     , PROP.ADDRESS_ID
     , PROP.REGION_CODE
     , PROP.DISTRICT_CODE
     , PROP.BOUNDARY AS GEOMETRY  
     , PROP.PROPERTY_AREA_UNIT_TYPE_CODE
     , PROP.LAND_AREA
     , PROP.LAND_LEGAL_DESCRIPTION
     , PROP.SURVEY_PLAN_NUMBER
     , PROP.ENCUMBRANCE_REASON        
     , PROP.IS_SENSITIVE
     , PROP.IS_OWNED
     , PROP.IS_DISPOSED                    
     , PROP.IS_PROPERTY_OF_INTEREST 
     , PROP.IS_OTHER_INTEREST
     , PROP.IS_VISIBLE_TO_OTHER_AGENCIES
     , PROP.ZONING
     , PROP.ZONING_POTENTIAL
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE IN ('PYBLMOTI', 'PYBLBCTFA')), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_PAYABLE_LEASE
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS                                          JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID LEFT JOIN
                          PIMS_LEASE_TERM     TERM ON TERM.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE IN ('PYBLMOTI', 'PYBLBCTFA')
                      AND ((getutcdate() BETWEEN LEAS.ORIG_START_DATE AND LEAS.ORIG_EXPIRY_DATE        ) OR
                           (getutcdate() >=      LEAS.ORIG_START_DATE AND LEAS.ORIG_EXPIRY_DATE IS NULL) OR
                           (getutcdate() BETWEEN TERM.TERM_START_DATE AND TERM.TERM_EXPIRY_DATE        ) OR
                           (getutcdate() >=      TERM.TERM_START_DATE AND TERM.TERM_EXPIRY_DATE IS NULL))), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_ACTIVE_PAYABLE_LEASE
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE = 'RCVBL'), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_RECEIVABLE_LEASE
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS                                          JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID LEFT JOIN
                          PIMS_LEASE_TERM     TERM ON TERM.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE = 'RCVBL'
                      AND ((getutcdate() BETWEEN LEAS.ORIG_START_DATE AND LEAS.ORIG_EXPIRY_DATE        ) OR
                           (getutcdate() >=      LEAS.ORIG_START_DATE AND LEAS.ORIG_EXPIRY_DATE IS NULL) OR
                           (getutcdate() BETWEEN TERM.TERM_START_DATE AND TERM.TERM_EXPIRY_DATE        ) OR
                           (getutcdate() >=      TERM.TERM_START_DATE AND TERM.TERM_EXPIRY_DATE IS NULL))), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_ACTIVE_RECEIVABLE_LEASE
FROM   PIMS_PROPERTY       PROP                                                    LEFT OUTER JOIN
       PIMS_ADDRESS        ADDR ON ADDR.ADDRESS_ID        = PROP.ADDRESS_ID        LEFT OUTER JOIN
       PIMS_PROVINCE_STATE PROV ON PROV.PROVINCE_STATE_ID = ADDR.PROVINCE_STATE_ID LEFT OUTER JOIN
       PIMS_COUNTRY        CNTY ON CNTY.COUNTRY_ID        = ADDR.COUNTRY_ID
WHERE  PROP.BOUNDARY IS NOT NULL

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PRPRTY_A_S_IUD_TR
PRINT N'Create trigger dbo.PIMS_PRPRTY_A_S_IUD_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PRPRTY_A_S_IUD_TR] ON PIMS_PROPERTY FOR INSERT, UPDATE, DELETE AS
SET NOCOUNT ON
BEGIN TRY
DECLARE @curr_date datetime;
SET @curr_date = getutcdate();
  IF NOT EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- historical
  IF EXISTS(SELECT * FROM deleted)
    update PIMS_PROPERTY_HIST set END_DATE_HIST = @curr_date where PROPERTY_ID in (select PROPERTY_ID from deleted) and END_DATE_HIST is null;
  
  IF EXISTS(SELECT * FROM inserted)
    insert into PIMS_PROPERTY_HIST ([PROPERTY_ID], [PROPERTY_TYPE_CODE], [ADDRESS_ID], [REGION_CODE], [DISTRICT_CODE], [PROPERTY_AREA_UNIT_TYPE_CODE], [PROPERTY_DATA_SOURCE_TYPE_CODE], [PROPERTY_STATUS_TYPE_CODE], [SURPLUS_DECLARATION_TYPE_CODE], [VOLUMETRIC_TYPE_CODE], [VOLUME_UNIT_TYPE_CODE], [PPH_STATUS_TYPE_CODE], [PROPERTY_CLASSIFICATION_TYPE_CODE], [PROPERTY_DATA_SOURCE_EFFECTIVE_DATE], [NAME], [DESCRIPTION], [PID], [PIN], [FILE_NUMBER], [FILE_NUMBER_SUFFIX], [LAND_AREA], [GENERAL_LOCATION], [SURVEY_PLAN_NUMBER], [ENCUMBRANCE_REASON], [SURPLUS_DECLARATION_COMMENT], [SURPLUS_DECLARATION_DATE], [MUNICIPAL_ZONING], [IS_VOLUMETRIC_PARCEL], [VOLUMETRIC_MEASUREMENT], [IS_OWNED], [IS_DISPOSED], [IS_PROPERTY_OF_INTEREST], [IS_OTHER_INTEREST], [IS_VISIBLE_TO_OTHER_AGENCIES], [IS_SENSITIVE], [IS_PROVINCIAL_PUBLIC_HWY], [PPH_STATUS_UPDATE_USERID], [PPH_STATUS_UPDATE_TIMESTAMP], [PPH_STATUS_UPDATE_USER_GUID], [IS_RWY_BELT_DOM_PATENT], [ZONING], [ZONING_POTENTIAL], [ADDITIONAL_DETAILS], [IS_UTILITIES_PAYABLE], [IS_TAXES_PAYABLE], [BAND_NAME], [RESERVE_NAME], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], _PROPERTY_HIST_ID, END_DATE_HIST, EFFECTIVE_DATE_HIST)
      select [PROPERTY_ID], [PROPERTY_TYPE_CODE], [ADDRESS_ID], [REGION_CODE], [DISTRICT_CODE], [PROPERTY_AREA_UNIT_TYPE_CODE], [PROPERTY_DATA_SOURCE_TYPE_CODE], [PROPERTY_STATUS_TYPE_CODE], [SURPLUS_DECLARATION_TYPE_CODE], [VOLUMETRIC_TYPE_CODE], [VOLUME_UNIT_TYPE_CODE], [PPH_STATUS_TYPE_CODE], [PROPERTY_CLASSIFICATION_TYPE_CODE], [PROPERTY_DATA_SOURCE_EFFECTIVE_DATE], [NAME], [DESCRIPTION], [PID], [PIN], [FILE_NUMBER], [FILE_NUMBER_SUFFIX], [LAND_AREA], [GENERAL_LOCATION], [SURVEY_PLAN_NUMBER], [ENCUMBRANCE_REASON], [SURPLUS_DECLARATION_COMMENT], [SURPLUS_DECLARATION_DATE], [MUNICIPAL_ZONING], [IS_VOLUMETRIC_PARCEL], [VOLUMETRIC_MEASUREMENT], [IS_OWNED], [IS_DISPOSED], [IS_PROPERTY_OF_INTEREST], [IS_OTHER_INTEREST], [IS_VISIBLE_TO_OTHER_AGENCIES], [IS_SENSITIVE], [IS_PROVINCIAL_PUBLIC_HWY], [PPH_STATUS_UPDATE_USERID], [PPH_STATUS_UPDATE_TIMESTAMP], [PPH_STATUS_UPDATE_USER_GUID], [IS_RWY_BELT_DOM_PATENT], [ZONING], [ZONING_POTENTIAL], [ADDITIONAL_DETAILS], [IS_UTILITIES_PAYABLE], [IS_TAXES_PAYABLE], [BAND_NAME], [RESERVE_NAME], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], (next value for [dbo].[PIMS_PROPERTY_H_ID_SEQ]) as [_PROPERTY_HIST_ID], null as [END_DATE_HIST], @curr_date as [EFFECTIVE_DATE_HIST] from inserted;

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PRPACT_A_S_IUD_TR
PRINT N'Create trigger dbo.PIMS_PRPACT_A_S_IUD_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PRPACT_A_S_IUD_TR] ON PIMS_PROPERTY_ACTIVITY FOR INSERT, UPDATE, DELETE AS
SET NOCOUNT ON
BEGIN TRY
DECLARE @curr_date datetime;
SET @curr_date = getutcdate();
  IF NOT EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- historical
  IF EXISTS(SELECT * FROM deleted)
    update PIMS_PROPERTY_ACTIVITY_HIST set END_DATE_HIST = @curr_date where PIMS_PROPERTY_ACTIVITY_ID in (select PIMS_PROPERTY_ACTIVITY_ID from deleted) and END_DATE_HIST is null;
  
  IF EXISTS(SELECT * FROM inserted)
    insert into PIMS_PROPERTY_ACTIVITY_HIST ([PIMS_PROPERTY_ACTIVITY_ID], [PROP_MGMT_ACTIVITY_TYPE_CODE], [PROP_MGMT_ACTIVITY_SUBTYPE_CODE], [PROP_MGMT_ACTIVITY_STATUS_TYPE_CODE], [SERVICE_PROVIDER_PERSON_ID], [SERVICE_PROVIDER_ORG_ID], [REQUEST_ADDED_DT], [COMPLETION_DT], [DESCRIPTION], [REQUEST_SOURCE], [PRETAX_AMT], [GST_AMT], [PST_AMT], [TOTAL_AMT], [IS_DISABLED], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], _PROPERTY_ACTIVITY_HIST_ID, END_DATE_HIST, EFFECTIVE_DATE_HIST)
      select [PIMS_PROPERTY_ACTIVITY_ID], [PROP_MGMT_ACTIVITY_TYPE_CODE], [PROP_MGMT_ACTIVITY_SUBTYPE_CODE], [PROP_MGMT_ACTIVITY_STATUS_TYPE_CODE], [SERVICE_PROVIDER_PERSON_ID], [SERVICE_PROVIDER_ORG_ID], [REQUEST_ADDED_DT], [COMPLETION_DT], [DESCRIPTION], [REQUEST_SOURCE], [PRETAX_AMT], [GST_AMT], [PST_AMT], [TOTAL_AMT], [IS_DISABLED], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], (next value for [dbo].[PIMS_PROPERTY_ACTIVITY_H_ID_SEQ]) as [_PROPERTY_ACTIVITY_HIST_ID], null as [END_DATE_HIST], @curr_date as [EFFECTIVE_DATE_HIST] from inserted;

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PRPACT_I_S_U_TR
PRINT N'Create trigger dbo.PIMS_PRPACT_I_S_U_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PRPACT_I_S_U_TR] ON PIMS_PROPERTY_ACTIVITY INSTEAD OF UPDATE AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- validate concurrency control
  if exists (select 1 from inserted, deleted where inserted.CONCURRENCY_CONTROL_NUMBER != deleted.CONCURRENCY_CONTROL_NUMBER+1 AND inserted.PIMS_PROPERTY_ACTIVITY_ID = deleted.PIMS_PROPERTY_ACTIVITY_ID)
    raiserror('CONCURRENCY FAILURE.',16,1)


  -- update statement
  update PIMS_PROPERTY_ACTIVITY
    set "PIMS_PROPERTY_ACTIVITY_ID" = inserted."PIMS_PROPERTY_ACTIVITY_ID",
      "PROP_MGMT_ACTIVITY_TYPE_CODE" = inserted."PROP_MGMT_ACTIVITY_TYPE_CODE",
      "PROP_MGMT_ACTIVITY_SUBTYPE_CODE" = inserted."PROP_MGMT_ACTIVITY_SUBTYPE_CODE",
      "PROP_MGMT_ACTIVITY_STATUS_TYPE_CODE" = inserted."PROP_MGMT_ACTIVITY_STATUS_TYPE_CODE",
      "SERVICE_PROVIDER_PERSON_ID" = inserted."SERVICE_PROVIDER_PERSON_ID",
      "SERVICE_PROVIDER_ORG_ID" = inserted."SERVICE_PROVIDER_ORG_ID",
      "REQUEST_ADDED_DT" = inserted."REQUEST_ADDED_DT",
      "COMPLETION_DT" = inserted."COMPLETION_DT",
      "DESCRIPTION" = inserted."DESCRIPTION",
      "REQUEST_SOURCE" = inserted."REQUEST_SOURCE",
      "PRETAX_AMT" = inserted."PRETAX_AMT",
      "GST_AMT" = inserted."GST_AMT",
      "PST_AMT" = inserted."PST_AMT",
      "TOTAL_AMT" = inserted."TOTAL_AMT",
      "IS_DISABLED" = inserted."IS_DISABLED",
      "CONCURRENCY_CONTROL_NUMBER" = inserted."CONCURRENCY_CONTROL_NUMBER",
      "APP_LAST_UPDATE_TIMESTAMP" = inserted."APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID" = inserted."APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID" = inserted."APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY" = inserted."APP_LAST_UPDATE_USER_DIRECTORY"
    , DB_LAST_UPDATE_TIMESTAMP = getutcdate()
    , DB_LAST_UPDATE_USERID = user_name()
    from PIMS_PROPERTY_ACTIVITY
    inner join inserted
    on (PIMS_PROPERTY_ACTIVITY.PIMS_PROPERTY_ACTIVITY_ID = inserted.PIMS_PROPERTY_ACTIVITY_ID);

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PRPRTY_I_S_I_TR
PRINT N'Create trigger dbo.PIMS_PRPRTY_I_S_I_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PRPRTY_I_S_I_TR] ON PIMS_PROPERTY INSTEAD OF INSERT AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM inserted) 
    RETURN;

  
  insert into PIMS_PROPERTY ("PROPERTY_ID",
      "PROPERTY_TYPE_CODE",
      "ADDRESS_ID",
      "REGION_CODE",
      "DISTRICT_CODE",
      "PROPERTY_AREA_UNIT_TYPE_CODE",
      "PROPERTY_DATA_SOURCE_TYPE_CODE",
      "PROPERTY_STATUS_TYPE_CODE",
      "SURPLUS_DECLARATION_TYPE_CODE",
      "VOLUMETRIC_TYPE_CODE",
      "VOLUME_UNIT_TYPE_CODE",
      "PPH_STATUS_TYPE_CODE",
      "PROPERTY_CLASSIFICATION_TYPE_CODE",
      "PROPERTY_DATA_SOURCE_EFFECTIVE_DATE",
      "NAME",
      "DESCRIPTION",
      "PID",
      "PIN",
      "FILE_NUMBER",
      "FILE_NUMBER_SUFFIX",
      "LAND_AREA",
      "LAND_LEGAL_DESCRIPTION",
      "BOUNDARY",
      "LOCATION",
      "GENERAL_LOCATION",
      "SURVEY_PLAN_NUMBER",
      "ENCUMBRANCE_REASON",
      "SURPLUS_DECLARATION_COMMENT",
      "SURPLUS_DECLARATION_DATE",
      "NOTES",
      "MUNICIPAL_ZONING",
      "IS_VOLUMETRIC_PARCEL",
      "VOLUMETRIC_MEASUREMENT",
      "IS_OWNED",
      "IS_DISPOSED",
      "IS_PROPERTY_OF_INTEREST",
      "IS_OTHER_INTEREST",
      "IS_VISIBLE_TO_OTHER_AGENCIES",
      "IS_SENSITIVE",
      "IS_PROVINCIAL_PUBLIC_HWY",
      "PPH_STATUS_UPDATE_USERID",
      "PPH_STATUS_UPDATE_TIMESTAMP",
      "PPH_STATUS_UPDATE_USER_GUID",
      "IS_RWY_BELT_DOM_PATENT",
      "ZONING",
      "ZONING_POTENTIAL",
      "ADDITIONAL_DETAILS",
      "IS_UTILITIES_PAYABLE",
      "IS_TAXES_PAYABLE",
      "BAND_NAME",
      "RESERVE_NAME",
      "CONCURRENCY_CONTROL_NUMBER",
      "APP_CREATE_TIMESTAMP",
      "APP_CREATE_USERID",
      "APP_CREATE_USER_GUID",
      "APP_CREATE_USER_DIRECTORY",
      "APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY")
    select "PROPERTY_ID",
      "PROPERTY_TYPE_CODE",
      "ADDRESS_ID",
      "REGION_CODE",
      "DISTRICT_CODE",
      "PROPERTY_AREA_UNIT_TYPE_CODE",
      "PROPERTY_DATA_SOURCE_TYPE_CODE",
      "PROPERTY_STATUS_TYPE_CODE",
      "SURPLUS_DECLARATION_TYPE_CODE",
      "VOLUMETRIC_TYPE_CODE",
      "VOLUME_UNIT_TYPE_CODE",
      "PPH_STATUS_TYPE_CODE",
      "PROPERTY_CLASSIFICATION_TYPE_CODE",
      "PROPERTY_DATA_SOURCE_EFFECTIVE_DATE",
      "NAME",
      "DESCRIPTION",
      "PID",
      "PIN",
      "FILE_NUMBER",
      "FILE_NUMBER_SUFFIX",
      "LAND_AREA",
      "LAND_LEGAL_DESCRIPTION",
      "BOUNDARY",
      "LOCATION",
      "GENERAL_LOCATION",
      "SURVEY_PLAN_NUMBER",
      "ENCUMBRANCE_REASON",
      "SURPLUS_DECLARATION_COMMENT",
      "SURPLUS_DECLARATION_DATE",
      "NOTES",
      "MUNICIPAL_ZONING",
      "IS_VOLUMETRIC_PARCEL",
      "VOLUMETRIC_MEASUREMENT",
      "IS_OWNED",
      "IS_DISPOSED",
      "IS_PROPERTY_OF_INTEREST",
      "IS_OTHER_INTEREST",
      "IS_VISIBLE_TO_OTHER_AGENCIES",
      "IS_SENSITIVE",
      "IS_PROVINCIAL_PUBLIC_HWY",
      "PPH_STATUS_UPDATE_USERID",
      "PPH_STATUS_UPDATE_TIMESTAMP",
      "PPH_STATUS_UPDATE_USER_GUID",
      "IS_RWY_BELT_DOM_PATENT",
      "ZONING",
      "ZONING_POTENTIAL",
      "ADDITIONAL_DETAILS",
      "IS_UTILITIES_PAYABLE",
      "IS_TAXES_PAYABLE",
      "BAND_NAME",
      "RESERVE_NAME",
      "CONCURRENCY_CONTROL_NUMBER",
      "APP_CREATE_TIMESTAMP",
      "APP_CREATE_USERID",
      "APP_CREATE_USER_GUID",
      "APP_CREATE_USER_DIRECTORY",
      "APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY"
    from inserted;

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PRPACT_I_S_I_TR
PRINT N'Create trigger dbo.PIMS_PRPACT_I_S_I_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PRPACT_I_S_I_TR] ON PIMS_PROPERTY_ACTIVITY INSTEAD OF INSERT AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM inserted) 
    RETURN;

  
  insert into PIMS_PROPERTY_ACTIVITY ("PIMS_PROPERTY_ACTIVITY_ID",
      "PROP_MGMT_ACTIVITY_TYPE_CODE",
      "PROP_MGMT_ACTIVITY_SUBTYPE_CODE",
      "PROP_MGMT_ACTIVITY_STATUS_TYPE_CODE",
      "SERVICE_PROVIDER_PERSON_ID",
      "SERVICE_PROVIDER_ORG_ID",
      "REQUEST_ADDED_DT",
      "COMPLETION_DT",
      "DESCRIPTION",
      "REQUEST_SOURCE",
      "PRETAX_AMT",
      "GST_AMT",
      "PST_AMT",
      "TOTAL_AMT",
      "IS_DISABLED",
      "CONCURRENCY_CONTROL_NUMBER",
      "APP_CREATE_TIMESTAMP",
      "APP_CREATE_USERID",
      "APP_CREATE_USER_GUID",
      "APP_CREATE_USER_DIRECTORY",
      "APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY")
    select "PIMS_PROPERTY_ACTIVITY_ID",
      "PROP_MGMT_ACTIVITY_TYPE_CODE",
      "PROP_MGMT_ACTIVITY_SUBTYPE_CODE",
      "PROP_MGMT_ACTIVITY_STATUS_TYPE_CODE",
      "SERVICE_PROVIDER_PERSON_ID",
      "SERVICE_PROVIDER_ORG_ID",
      "REQUEST_ADDED_DT",
      "COMPLETION_DT",
      "DESCRIPTION",
      "REQUEST_SOURCE",
      "PRETAX_AMT",
      "GST_AMT",
      "PST_AMT",
      "TOTAL_AMT",
      "IS_DISABLED",
      "CONCURRENCY_CONTROL_NUMBER",
      "APP_CREATE_TIMESTAMP",
      "APP_CREATE_USERID",
      "APP_CREATE_USER_GUID",
      "APP_CREATE_USER_DIRECTORY",
      "APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY"
    from inserted;

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PRPRTY_I_S_U_TR
PRINT N'Create trigger dbo.PIMS_PRPRTY_I_S_U_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PRPRTY_I_S_U_TR] ON PIMS_PROPERTY INSTEAD OF UPDATE AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- validate concurrency control
  if exists (select 1 from inserted, deleted where inserted.CONCURRENCY_CONTROL_NUMBER != deleted.CONCURRENCY_CONTROL_NUMBER+1 AND inserted.PROPERTY_ID = deleted.PROPERTY_ID)
    raiserror('CONCURRENCY FAILURE.',16,1)


  -- update statement
  update PIMS_PROPERTY
    set "PROPERTY_ID" = inserted."PROPERTY_ID",
      "PROPERTY_TYPE_CODE" = inserted."PROPERTY_TYPE_CODE",
      "ADDRESS_ID" = inserted."ADDRESS_ID",
      "REGION_CODE" = inserted."REGION_CODE",
      "DISTRICT_CODE" = inserted."DISTRICT_CODE",
      "PROPERTY_AREA_UNIT_TYPE_CODE" = inserted."PROPERTY_AREA_UNIT_TYPE_CODE",
      "PROPERTY_DATA_SOURCE_TYPE_CODE" = inserted."PROPERTY_DATA_SOURCE_TYPE_CODE",
      "PROPERTY_STATUS_TYPE_CODE" = inserted."PROPERTY_STATUS_TYPE_CODE",
      "SURPLUS_DECLARATION_TYPE_CODE" = inserted."SURPLUS_DECLARATION_TYPE_CODE",
      "VOLUMETRIC_TYPE_CODE" = inserted."VOLUMETRIC_TYPE_CODE",
      "VOLUME_UNIT_TYPE_CODE" = inserted."VOLUME_UNIT_TYPE_CODE",
      "PPH_STATUS_TYPE_CODE" = inserted."PPH_STATUS_TYPE_CODE",
      "PROPERTY_CLASSIFICATION_TYPE_CODE" = inserted."PROPERTY_CLASSIFICATION_TYPE_CODE",
      "PROPERTY_DATA_SOURCE_EFFECTIVE_DATE" = inserted."PROPERTY_DATA_SOURCE_EFFECTIVE_DATE",
      "NAME" = inserted."NAME",
      "DESCRIPTION" = inserted."DESCRIPTION",
      "PID" = inserted."PID",
      "PIN" = inserted."PIN",
      "FILE_NUMBER" = inserted."FILE_NUMBER",
      "FILE_NUMBER_SUFFIX" = inserted."FILE_NUMBER_SUFFIX",
      "LAND_AREA" = inserted."LAND_AREA",
      "LAND_LEGAL_DESCRIPTION" = inserted."LAND_LEGAL_DESCRIPTION",
      "BOUNDARY" = inserted."BOUNDARY",
      "LOCATION" = inserted."LOCATION",
      "GENERAL_LOCATION" = inserted."GENERAL_LOCATION",
      "SURVEY_PLAN_NUMBER" = inserted."SURVEY_PLAN_NUMBER",
      "ENCUMBRANCE_REASON" = inserted."ENCUMBRANCE_REASON",
      "SURPLUS_DECLARATION_COMMENT" = inserted."SURPLUS_DECLARATION_COMMENT",
      "SURPLUS_DECLARATION_DATE" = inserted."SURPLUS_DECLARATION_DATE",
      "NOTES" = inserted."NOTES",
      "MUNICIPAL_ZONING" = inserted."MUNICIPAL_ZONING",
      "IS_VOLUMETRIC_PARCEL" = inserted."IS_VOLUMETRIC_PARCEL",
      "VOLUMETRIC_MEASUREMENT" = inserted."VOLUMETRIC_MEASUREMENT",
      "IS_OWNED" = inserted."IS_OWNED",
      "IS_DISPOSED" = inserted."IS_DISPOSED",
      "IS_PROPERTY_OF_INTEREST" = inserted."IS_PROPERTY_OF_INTEREST",
      "IS_OTHER_INTEREST" = inserted."IS_OTHER_INTEREST",
      "IS_VISIBLE_TO_OTHER_AGENCIES" = inserted."IS_VISIBLE_TO_OTHER_AGENCIES",
      "IS_SENSITIVE" = inserted."IS_SENSITIVE",
      "IS_PROVINCIAL_PUBLIC_HWY" = inserted."IS_PROVINCIAL_PUBLIC_HWY",
      "PPH_STATUS_UPDATE_USERID" = inserted."PPH_STATUS_UPDATE_USERID",
      "PPH_STATUS_UPDATE_TIMESTAMP" = inserted."PPH_STATUS_UPDATE_TIMESTAMP",
      "PPH_STATUS_UPDATE_USER_GUID" = inserted."PPH_STATUS_UPDATE_USER_GUID",
      "IS_RWY_BELT_DOM_PATENT" = inserted."IS_RWY_BELT_DOM_PATENT",
      "ZONING" = inserted."ZONING",
      "ZONING_POTENTIAL" = inserted."ZONING_POTENTIAL",
      "ADDITIONAL_DETAILS" = inserted."ADDITIONAL_DETAILS",
      "IS_UTILITIES_PAYABLE" = inserted."IS_UTILITIES_PAYABLE",
      "IS_TAXES_PAYABLE" = inserted."IS_TAXES_PAYABLE",
      "BAND_NAME" = inserted."BAND_NAME",
      "RESERVE_NAME" = inserted."RESERVE_NAME",
      "CONCURRENCY_CONTROL_NUMBER" = inserted."CONCURRENCY_CONTROL_NUMBER",
      "APP_LAST_UPDATE_TIMESTAMP" = inserted."APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID" = inserted."APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID" = inserted."APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY" = inserted."APP_LAST_UPDATE_USER_DIRECTORY"
    , DB_LAST_UPDATE_TIMESTAMP = getutcdate()
    , DB_LAST_UPDATE_USERID = user_name()
    from PIMS_PROPERTY
    inner join inserted
    on (PIMS_PROPERTY.PROPERTY_ID = inserted.PROPERTY_ID);

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create index dbo.PRPRTY_BOUNDARY_IDX
PRINT N'Create index dbo.PRPRTY_BOUNDARY_IDX'
GO
-- [PRPRTY_BOUNDARY_IDX] : Scripting for Spatial Index currently not supported
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create index dbo.PRPRTY_LOCATION_IDX
PRINT N'Create index dbo.PRPRTY_LOCATION_IDX'
GO
-- [PRPRTY_LOCATION_IDX] : Scripting for Spatial Index currently not supported
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop table dbo.PIMS_PROPERTY_OPERATION_HIST
PRINT N'Drop table dbo.PIMS_PROPERTY_OPERATION_HIST'
GO
DROP TABLE IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION_HIST]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop sequence dbo.PIMS_PROPERTY_OPERATION_H_ID_SEQ
PRINT N'Drop sequence dbo.PIMS_PROPERTY_OPERATION_H_ID_SEQ'
GO
DROP SEQUENCE IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION_H_ID_SEQ]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop sequence dbo.PIMS_PROPERTY_OPERATION_ID_SEQ
PRINT N'Drop sequence dbo.PIMS_PROPERTY_OPERATION_ID_SEQ'
GO
DROP SEQUENCE IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION_ID_SEQ]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop table dbo.PIMS_PROPERTY_OPERATION_TYPE
PRINT N'Drop table dbo.PIMS_PROPERTY_OPERATION_TYPE'
GO
DROP TABLE IF EXISTS [dbo].[PIMS_PROPERTY_OPERATION_TYPE]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
   IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
   PRINT 'The database update failed'
END
GO