/**
 * File autogenerated by TsGenerator.
 * Do not manually modify, changes made to this file will be lost when this file is regenerated.
 * Generated on 27/11/2023 10:19
 */
import { ApiGen_AcquisitionFileOwner } from './ApiGen_AcquisitionFileOwner';
import { ApiGen_BaseAudit } from './ApiGen_BaseAudit';
import { ApiGen_ExpropriationPaymentItem } from './ApiGen_ExpropriationPaymentItem';
import { ApiGen_InterestHolder } from './ApiGen_InterestHolder';
import { ApiGen_Organization } from './ApiGen_Organization';

// LINK: @backend/apimodels/Models/Concepts/ExpropriationPayment/ExpropriationPaymentModel.cs
export interface ApiGen_ExpropriationPayment extends ApiGen_BaseAudit {
  id: number | null;
  acquisitionFileId: number;
  acquisitionOwnerId: number | null;
  acquisitionOwner: ApiGen_AcquisitionFileOwner | null;
  interestHolderId: number | null;
  interestHolder: ApiGen_InterestHolder | null;
  expropriatingAuthorityId: number | null;
  expropriatingAuthority: ApiGen_Organization | null;
  description: string | null;
  isDisabled: boolean | null;
  paymentItems: ApiGen_ExpropriationPaymentItem[] | null;
}