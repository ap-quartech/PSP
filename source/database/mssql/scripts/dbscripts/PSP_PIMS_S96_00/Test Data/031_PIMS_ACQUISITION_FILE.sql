DELETE FROM PIMS_ACQUISITION_FILE
GO

DECLARE @i   INT = 0
DECLARE @max INT = 50

WHILE @i < @max
  BEGIN
  SET @i = @i + 1
  INSERT INTO dbo.PIMS_ACQUISITION_FILE (ACQUISITION_FILE_STATUS_TYPE_CODE, ACQUISITION_TYPE_CODE, ACQUISITION_FUNDING_TYPE_CODE, ACQ_PHYS_FILE_STATUS_TYPE_CODE, REGION_CODE, FILE_NAME, FILE_NO, FILE_NO_SUFFIX, APP_CREATE_TIMESTAMP, APP_CREATE_USERID, APP_CREATE_USER_GUID, APP_CREATE_USER_DIRECTORY, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_USER_GUID, APP_LAST_UPDATE_USER_DIRECTORY)
    VALUES
      ((SELECT TOP 1 ACQUISITION_FILE_STATUS_TYPE_CODE FROM PIMS_ACQUISITION_FILE_STATUS_TYPE ORDER BY NEWID()), 
       (SELECT TOP 1 ACQUISITION_TYPE_CODE              FROM PIMS_ACQUISITION_TYPE             ORDER BY NEWID()), 
       (SELECT TOP 1 ACQUISITION_FUNDING_TYPE_CODE      FROM PIMS_ACQUISITION_FUNDING_TYPE     ORDER BY NEWID()), 
       (SELECT TOP 1 ACQ_PHYS_FILE_STATUS_TYPE_CODE     FROM PIMS_ACQ_PHYS_FILE_STATUS_TYPE    ORDER BY NEWID()), 
       (SELECT TOP 1 REGION_CODE                        FROM PIMS_REGION                       ORDER BY NEWID()),
       (SELECT CONVERT(varchar(255), NEWID())),
       ABS(Checksum(NewID()) % (10000 - 1000)) + 1000,
       N'0',
       getutcdate(), CURRENT_USER, NEWID(), CURRENT_USER, getutcdate(), CURRENT_USER, NEWID(), CURRENT_USER)
  END
GO