import { useMapSearch } from 'components/maps/hooks/useMapSearch';
import * as API from 'constants/API';
import MapSideBarLayout from 'features/mapSideBar/layout/MapSideBarLayout';
import { FormikProps } from 'formik';
import useLookupCodeHelpers from 'hooks/useLookupCodeHelpers';
import { Api_Project } from 'models/api/Project';
import { useCallback, useRef } from 'react';
import { FaBriefcase } from 'react-icons/fa';
import { useHistory } from 'react-router-dom';
import { mapLookupCode } from 'utils';

import SidebarFooter from '../../shared/SidebarFooter';
import { useAddProjectForm } from '../hooks/useAddProjectFormManagement';
import AddProjectForm from './AddProjectForm';
import { ProjectForm } from './models';

export interface IAddProjectContainerProps {
  onClose?: () => void;
}

const AddProjectContainer: React.FC<React.PropsWithChildren<IAddProjectContainerProps>> = props => {
  const { onClose } = props;
  const history = useHistory();
  const { search } = useMapSearch();

  const { getOptionsByType, getByType } = useLookupCodeHelpers();
  const projectStatusTypeCodes = getOptionsByType(API.PROJECT_STATUS_TYPES);
  const regionTypeCodes = getByType(API.REGION_TYPES).map(c => mapLookupCode(c));

  const formikRef = useRef<FormikProps<ProjectForm>>(null);

  const close = useCallback(() => onClose && onClose(), [onClose]);

  const handleSave = () => {
    formikRef.current?.submitForm();
  };

  const onSuccess = async (proj: Api_Project) => {
    formikRef.current?.resetForm();
    await search();
    history.replace(`/mapview/sidebar/project/${proj.id}`);
  };

  const helper = useAddProjectForm({ onSuccess });

  return (
    <MapSideBarLayout
      showCloseButton
      title="Create Project"
      icon={<FaBriefcase className="mr-2 mb-2" size={32} />}
      onClose={close}
      footer={<SidebarFooter onSave={handleSave} onCancel={close} />}
    >
      <AddProjectForm
        formikRef={formikRef}
        initialValues={helper.initialValues}
        projectStatusOptions={projectStatusTypeCodes}
        projectRegionOptions={regionTypeCodes}
        onSubmit={helper.handleSubmit}
        validationSchema={helper.validationSchema}
      />
    </MapSideBarLayout>
  );
};

export default AddProjectContainer;