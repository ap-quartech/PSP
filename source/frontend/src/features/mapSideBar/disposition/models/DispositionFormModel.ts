import {
  Api_DispositionFile,
  Api_DispositionFileProperty,
  Api_DispositionFileTeam,
} from '@/models/api/DispositionFile';
import {
  emptyStringtoNullable,
  fromTypeCode,
  toTypeCode,
  toTypeCodeNullable,
} from '@/utils/formUtils';

import { PropertyForm } from '../../shared/models';
import { ChecklistItemFormModel } from '../../shared/tabs/checklist/update/models';
import { DispositionOfferFormModel } from '../tabs/offersAndSale/dispositionOffer/models/DispositionOfferFormModel';
import { DispositionAppraisalFormModel } from './DispositionAppraisalFormModel';
import { DispositionSaleFormModel } from './DispositionSaleFormModel';
import { DispositionTeamSubFormModel, WithDispositionTeam } from './DispositionTeamSubFormModel';

export class DispositionFormModel implements WithDispositionTeam {
  fileName: string | null = '';
  fileStatusTypeCode: string | null = null;
  referenceNumber: string | null = '';
  assignedDate: string | null = null;
  completionDate: string | null = null;
  dispositionTypeCode: string | null = null;
  dispositionTypeOther: string | null = '';
  dispositionStatusTypeCode: string | null = null;
  initiatingBranchTypeCode: string | null = null;
  physicalFileStatusTypeCode: string | null = null;
  fundingTypeCode: string | null = null;
  initiatingDocumentTypeCode: string | null = null;
  initiatingDocumentTypeOther: string | null = '';
  initiatingDocumentDate: string | null = null;
  regionCode: string | null = '';
  fileProperties: PropertyForm[] = [];
  team: DispositionTeamSubFormModel[] = [];
  offers: DispositionOfferFormModel[] = [];
  fileChecklist: ChecklistItemFormModel[] = [];
  sale: DispositionSaleFormModel | null = null;
  appraisal: DispositionAppraisalFormModel | null = null;

  constructor(
    readonly id: number | null = null,
    readonly fileNumber: string | null = null,
    readonly rowVersion: number | null = null,
    dispositionFileStatus: string = 'ACTIVE',
    dispositionStatus: string = 'UNKNOWN',
  ) {
    this.id = id;
    this.fileNumber = fileNumber;
    this.fileStatusTypeCode = dispositionFileStatus;
    this.dispositionStatusTypeCode = dispositionStatus;
  }

  toApi(): Api_DispositionFile {
    return {
      id: this.id ?? undefined,
      fileName: this.fileName ?? undefined,
      fileNumber: this.fileNumber ?? undefined,
      fileStatusTypeCode: toTypeCode(this.fileStatusTypeCode),
      fileReference: emptyStringtoNullable(this.referenceNumber),
      assignedDate: this.assignedDate,
      completionDate: this.completionDate,
      dispositionTypeCode: toTypeCodeNullable(this.dispositionTypeCode),
      dispositionTypeOther: this.dispositionTypeOther ? this.dispositionTypeOther : null,
      dispositionStatusTypeCode: toTypeCodeNullable(this.dispositionStatusTypeCode),
      initiatingBranchTypeCode: toTypeCode(this.initiatingBranchTypeCode),
      physicalFileStatusTypeCode: toTypeCode(this.physicalFileStatusTypeCode),
      fundingTypeCode: toTypeCodeNullable(this.fundingTypeCode),
      initiatingDocumentTypeCode: toTypeCode(this.initiatingDocumentTypeCode),
      initiatingDocumentTypeOther: this.initiatingDocumentTypeOther
        ? this.initiatingDocumentTypeOther
        : null,
      initiatingDocumentDate: this.initiatingDocumentDate,
      regionCode: toTypeCodeNullable(Number(this.regionCode)),
      dispositionTeam: this.team
        .filter(x => !!x.contact && !!x.teamProfileTypeCode)
        .map(x => x.toApi(this.id || 0))
        .filter((x): x is Api_DispositionFileTeam => x !== null),
      fileProperties: this.fileProperties.map<Api_DispositionFileProperty>(ap => {
        return {
          id: ap.id,
          propertyName: ap.name,
          displayOrder: ap.displayOrder,
          rowVersion: ap.rowVersion,
          property: ap.toApi(),
          propertyId: ap.apiId,
          acquisitionFile: { id: this.id },
        };
      }),

      dispositionOffers: this.offers.map(x => x.toApi()),
      dispositionSale: this.sale ? this.sale.toApi() : null,
      project: null,
      projectId: null,
      product: null,
      productId: null,
      dispositionAppraisal: this.appraisal ? this.appraisal.toApi() : null,
      fileChecklistItems: this.fileChecklist.map(x => x.toApi()),
      rowVersion: this.rowVersion ?? 0,
    };
  }

  static fromApi(model: Api_DispositionFile): DispositionFormModel {
    const dispositionForm = new DispositionFormModel(
      model.id,
      model.fileNumber,
      model.rowVersion,
      model.fileStatusTypeCode?.id,
      model.dispositionStatusTypeCode?.id,
    );

    dispositionForm.fundingTypeCode = fromTypeCode(model.fundingTypeCode) ?? '';
    dispositionForm.fileName = model.fileName ?? '';
    dispositionForm.referenceNumber = model.fileReference;
    dispositionForm.assignedDate = model.assignedDate;
    dispositionForm.completionDate = model.completionDate;
    dispositionForm.dispositionTypeCode = fromTypeCode(model.dispositionTypeCode) ?? '';
    dispositionForm.dispositionTypeOther = model.dispositionTypeOther;
    dispositionForm.initiatingBranchTypeCode = fromTypeCode(model.initiatingBranchTypeCode) ?? '';
    dispositionForm.physicalFileStatusTypeCode =
      fromTypeCode(model.physicalFileStatusTypeCode) ?? '';
    dispositionForm.initiatingDocumentTypeCode =
      fromTypeCode(model.initiatingDocumentTypeCode) ?? '';
    dispositionForm.initiatingDocumentTypeOther = model.initiatingDocumentTypeOther;
    dispositionForm.initiatingDocumentDate = model.initiatingDocumentDate;
    dispositionForm.regionCode = fromTypeCode(model.regionCode)?.toString() ?? '';

    dispositionForm.team =
      model.dispositionTeam?.map(x => DispositionTeamSubFormModel.fromApi(x)) || [];
    dispositionForm.fileProperties = model.fileProperties?.map(x => PropertyForm.fromApi(x)) || [];

    return dispositionForm;
  }
}