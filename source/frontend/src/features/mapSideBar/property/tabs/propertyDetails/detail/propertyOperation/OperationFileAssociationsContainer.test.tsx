import { createMemoryHistory } from 'history';
import { Claims } from '@/constants/index';
import { render, RenderOptions } from '@/utils/test-utils';
import { usePropertyOperationRepository } from '@/hooks/repositories/usePropertyOperationRepository';
import { getEmptyPropertyOperation } from '@/mocks/propertyOperation.mock';
import { ApiGen_Concepts_PropertyOperation } from '@/models/api/generated/ApiGen_Concepts_PropertyOperation';
import { lookupCodesSlice } from '@/store/slices/lookupCodes';
import { mockLookups } from '@/mocks/lookups.mock';
import { usePimsPropertyRepository } from '@/hooks/repositories/usePimsPropertyRepository';
import { ApiGen_Concepts_Property } from '@/models/api/generated/ApiGen_Concepts_Property';
import { getEmptyProperty } from '@/models/defaultInitializers';
import { IOperationSectionViewProps } from './OperationSectionView';
import { IOperationContainerProps, OperationContainer } from './OperationContainer';
import { toTypeCode } from '@/utils/formUtils';
import { ApiGen_CodeTypes_PropertyOperationTypes } from '@/models/api/generated/ApiGen_CodeTypes_PropertyOperationTypes';
import OperationFileAssociationsContainer, {
  IOperationFileAssociationsContainerProps,
} from './OperationFileAssocationsContainer';
import { PropertyOperationResult } from './OperationView';
import { usePropertyAssociations } from '@/hooks/repositories/usePropertyAssociations';
import { ApiGen_Concepts_Association } from '@/models/api/generated/ApiGen_Concepts_Association';
import { ApiGen_Concepts_PropertyAssociations } from '@/models/api/generated/ApiGen_Concepts_PropertyAssociations';
import { LeaseAndLicenses } from '@/components/layout';

const history = createMemoryHistory();
const storeState = {
  [lookupCodesSlice.name]: { lookupCodes: mockLookups },
};

const mockGetPropertyAssociations = jest.fn<
  Promise<ApiGen_Concepts_PropertyAssociations | undefined>,
  any[]
>();
jest.mock('@/hooks/repositories/usePropertyAssociations');
(usePropertyAssociations as jest.Mock).mockReturnValue({
  execute: mockGetPropertyAssociations,
  response: {},
});

describe('OperationContainer component', () => {
  const setup = (
    renderOptions: RenderOptions & Partial<IOperationFileAssociationsContainerProps> = {
      operation: { id: 1 } as unknown as PropertyOperationResult,
    },
  ) => {
    const component = render(
      <OperationFileAssociationsContainer operation={renderOptions.operation} />,
      {
        ...renderOptions,
        store: storeState,
        claims: [Claims.PROPERTY_VIEW],
        history,
      },
    );

    return { ...component };
  };
  beforeEach(() => {
    mockGetPropertyAssociations.mockResolvedValue(undefined);
  });

  it('displays without error when no associations present', async () => {
    mockGetPropertyAssociations.mockResolvedValue({
      id: 1,
      pid: '',
      acquisitionAssociations: [],
      researchAssociations: [],
      dispositionAssociations: [],
      leaseAssociations: [],
    });
    const { findByText } = setup();
    await findByText('There are no files associated to the property.');
  });

  it('displays without error when all associations present', async () => {
    (usePropertyAssociations as jest.Mock).mockReturnValue({
      execute: mockGetPropertyAssociations,
      response: {
        id: 1,
        pid: '',
        acquisitionAssociations: [
          {
            ...getEmptyAssociation(),
            fileNumber: 'A-1',
          },
        ],
        researchAssociations: [
          {
            ...getEmptyAssociation(),
            fileNumber: 'R-1',
          },
        ],
        dispositionAssociations: [
          {
            ...getEmptyAssociation(),
            fileNumber: 'D-1',
          },
        ],
        leaseAssociations: [
          {
            ...getEmptyAssociation(),
            fileNumber: 'L-1',
          },
        ],
      },
    });
    const { findByText } = setup();
    await findByText('A-1');
    await findByText('R-1');
    await findByText('D-1');
    await findByText('L-1');
  });
});

const getEmptyAssociation = () => ({
  id: 1,
  fileNumber: '1',
  fileName: 'acq file',
  createdBy: '',
  createdByGuid: '',
  createdDateTime: '',
  status: 'Active',
});