/**
 * File autogenerated by TsGenerator.
 * Do not manually modify, changes made to this file will be lost when this file is regenerated.
 */
import { ApiGen_Base_BaseAudit } from './ApiGen_Base_BaseAudit';
import { ApiGen_Concepts_Address } from './ApiGen_Concepts_Address';

// LINK: @backend/apimodels/Models/Concepts/AcquisitionFile/AcquisitionFileOwnerModel.cs
export interface ApiGen_Concepts_AcquisitionFileOwner extends ApiGen_Base_BaseAudit {
  id: number;
  acquisitionFileId: number;
  isOrganization: boolean;
  isPrimaryContact: boolean;
  lastNameAndCorpName: string | null;
  otherName: string | null;
  givenName: string | null;
  incorporationNumber: string | null;
  registrationNumber: string | null;
  contactEmailAddr: string | null;
  contactPhoneNum: string | null;
  address: ApiGen_Concepts_Address | null;
}