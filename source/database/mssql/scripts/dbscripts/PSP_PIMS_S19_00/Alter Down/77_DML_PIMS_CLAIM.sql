/* -----------------------------------------------------------------------------
Delete data from the PIMS_CLAIM table.
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
Author        Date         Comment
------------  -----------  -----------------------------------------------------
Devin Smith  2021-Nov-18  Initial version
----------------------------------------------------------------------------- */

DELETE FROM [dbo].[PIMS_CLAIM]
WHERE  CLAIM_UID = N'a9b9075b-2ea5-43b6-91df-2cc075453428'
GO
