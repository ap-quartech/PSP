import {
  getMockApiPropertyManagement,
  getMockApiPropertyManagementPurpose,
} from '@/mocks/propertyManagement.mock';
import { Api_PropertyManagement, Api_PropertyManagementPurpose } from '@/models/api/Property';
import Api_TypeCode from '@/models/api/TypeCode';
import { ILookupCode } from '@/store/slices/lookupCodes';

import { ManagementPurposeModel, PropertyManagementFormModel } from './models';

describe('Property management model tests', () => {
  describe('PropertyManagementFormModel', () => {
    it('creates an empty management model without throwing an error', () => {
      const model = PropertyManagementFormModel.fromApi(null);
      expect(model.id).toBe(0);
      expect(model.rowVersion).toBe(0);
      expect(model.managementPurposes).toStrictEqual([]);
      expect(model.additionalDetails).toBe('');
      expect(model.isTaxesPayable).toBe(null);
      expect(model.isUtilitiesPayable).toBe(null);
      expect(model.isLeaseActive).toBe(false);
      expect(model.leaseExpiryDate).toBe('');
    });

    it('fromApi sets values as expected from api response', () => {
      const apiManagement: Api_PropertyManagement = {
        ...getMockApiPropertyManagement(),
        id: 1,
        rowVersion: 1,
        managementPurposes: [getMockApiPropertyManagementPurpose()],
      };
      const model = PropertyManagementFormModel.fromApi(apiManagement);
      expect(model.id).toBe(1);
      expect(model.rowVersion).toBe(1);
      expect(model.managementPurposes).toHaveLength(1);
      expect(model.additionalDetails).toBe('test');
      expect(model.isTaxesPayable).toBe(null);
      expect(model.isUtilitiesPayable).toBe(null);
      expect(model.isLeaseActive).toBe(false);
      expect(model.leaseExpiryDate).toBe('');
    });

    it('returns default text when no lease information is available', () => {
      const model = PropertyManagementFormModel.fromApi(getMockApiPropertyManagement());
      expect(model.formatLeaseInformation()).toBe('No active Lease/License');
    });

    it('returns active lease information and expiry date', () => {
      let apiManagement: Api_PropertyManagement = {
        ...getMockApiPropertyManagement(),
        isLeaseActive: true,
        leaseExpiryDate: '2020-03-15',
      };
      const model = PropertyManagementFormModel.fromApi(apiManagement);
      expect(model.formatLeaseInformation()).toBe('Yes (Mar 15, 2020)');
    });

    it('returns expired lease information and expiry date', () => {
      let apiManagement: Api_PropertyManagement = {
        ...getMockApiPropertyManagement(),
        isLeaseActive: true,
        isLeaseExpired: true,
        leaseExpiryDate: '2020-03-15',
      };
      const model = PropertyManagementFormModel.fromApi(apiManagement);
      expect(model.formatLeaseInformation()).toBe('Expired (Mar 15, 2020)');
    });

    it('returns available lease information without an expiry date', () => {
      let apiManagement: Api_PropertyManagement = {
        ...getMockApiPropertyManagement(),
        isLeaseActive: true,
        isLeaseExpired: false,
        leaseExpiryDate: null,
      };
      const model = PropertyManagementFormModel.fromApi(apiManagement);
      expect(model.formatLeaseInformation()).toBe('Yes');
    });

    it('toApi converts form values to the api format', () => {
      const purpose = new ManagementPurposeModel();
      purpose.id = 1;
      purpose.rowVersion = 1;
      purpose.typeCode = 'TEST';
      purpose.typeDescription = 'test description';

      const model = new PropertyManagementFormModel();
      model.id = 123459;
      model.rowVersion = 1;
      model.managementPurposes.push(purpose);
      model.additionalDetails = 'test';
      model.isUtilitiesPayable = true;

      const apiManagement = model.toApi();
      expect(apiManagement.id).toBe(123459);
      expect(apiManagement.additionalDetails).toBe('test');
      expect(apiManagement.isUtilitiesPayable).toBe(true);
      expect(apiManagement.isTaxesPayable).toBe(null);
      expect(apiManagement.leaseExpiryDate).toBe(null);
      expect(apiManagement.managementPurposes).toHaveLength(1);
      expect(apiManagement.managementPurposes[0]).toEqual(
        expect.objectContaining({
          id: 1,
          rowVersion: 1,
          propertyId: 123459,
          propertyPurposeTypeCode: {
            id: 'TEST',
            description: 'test description',
          },
        } as Api_PropertyManagementPurpose),
      );
    });
  });

  describe('ManagementPurposeModel', () => {
    it('can create an empty purpose model without throwing an error', () => {
      const purpose = ManagementPurposeModel.fromApi(null);
      expect(purpose.id).toBe(0);
      expect(purpose.propertyId).toBe(null);
      expect(purpose.typeCode).toBe('');
      expect(purpose.typeDescription).toBe('');
    });

    it('fromLookup sets values as expected from lookup code value', () => {
      const purpose = ManagementPurposeModel.fromLookup({
        id: 'TEST',
        name: 'description',
      } as ILookupCode);
      expect(purpose.id).toBe(0);
      expect(purpose.propertyId).toBe(null);
      expect(purpose.typeCode).toBe('TEST');
      expect(purpose.typeDescription).toBe('description');
    });

    it('fromApi sets values as expected from api response', () => {
      const apiPurpose: Api_PropertyManagementPurpose = {
        ...getMockApiPropertyManagementPurpose(1),
        propertyPurposeTypeCode: {
          id: 'TEST',
          description: 'test description',
        },
      };
      const purpose = ManagementPurposeModel.fromApi(apiPurpose);
      expect(purpose.id).toBe(1);
      expect(purpose.typeCode).toBe('TEST');
      expect(purpose.typeDescription).toBe('test description');
    });

    it('toApi converts form values to the api format', () => {
      const purpose = new ManagementPurposeModel();
      purpose.id = 1;
      purpose.rowVersion = 1;
      purpose.typeCode = 'TEST';
      purpose.typeDescription = 'test description';

      const apiPurpose = purpose.toApi();
      expect(apiPurpose.id).toBe(1);
      expect(apiPurpose.rowVersion).toBe(1);
      expect(apiPurpose.propertyId).toBe(null);
      expect(apiPurpose.propertyPurposeTypeCode).toEqual(
        expect.objectContaining({
          id: 'TEST',
          description: 'test description',
        } as Api_TypeCode<string>),
      );
    });
  });
});