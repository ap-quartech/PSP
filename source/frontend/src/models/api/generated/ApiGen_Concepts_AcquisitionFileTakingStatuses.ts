/**
 * File autogenerated by TsGenerator.
 * Do not manually modify, changes made to this file will be lost when this file is regenerated.
 */
import { ApiGen_Base_BaseAudit } from './ApiGen_Base_BaseAudit';
import { ApiGen_Base_CodeType } from './ApiGen_Base_CodeType';

// LINK: @backend/apimodels/Models/Concepts/AcquisitionFile/AcquisitionFileTakingStatusesModel.cs
export interface ApiGen_Concepts_AcquisitionFileTakingStatuses extends ApiGen_Base_BaseAudit {
  id: number;
  acquisitionFileId: number;
  takingStatusTypeCode: ApiGen_Base_CodeType<string> | null;
}