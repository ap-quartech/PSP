/* -----------------------------------------------------------------------------
Alter the data in the PIMS_ACQUISITION_FILE table.
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
Author        Date         Comment
------------  -----------  -----------------------------------------------------
Doug Filteau  2024-Nov-14  Initial version.
----------------------------------------------------------------------------- */

SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Alter table dbo.PIMS_ACQUISITION_FILE
PRINT N'Alter table dbo.PIMS_ACQUISITION_FILE'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_FILE]
	DROP CONSTRAINT IF EXISTS [ACQNFL_FILE_NO_SUFFIX_DEF]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop FILE_NUM_SUFFIX from PIMS_ACQUISITION_FILE
PRINT N'Drop FILE_NUM_SUFFIX from PIMS_ACQUISITION_FILE'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_FILE]
	DROP COLUMN IF EXISTS [FILE_NO_SUFFIX]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop FILE_NUM_SUFFIX from PIMS_ACQUISITION_FILE_HIST
PRINT N'Drop FILE_NUM_SUFFIX from PIMS_ACQUISITION_FILE_HIST'
GO
ALTER TABLE PIMS_ACQUISITION_FILE_HIST
	DROP COLUMN IF EXISTS FILE_NO_SUFFIX
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

ALTER TABLE PIMS_ACQUISITION_FILE_HIST
	ALTER COLUMN FILE_NUMBER NVARCHAR(18) NOT NULL;
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
