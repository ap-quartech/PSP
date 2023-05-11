import { useActor, useInterpret, useSelector } from '@xstate/react';
import { DistrictCodes, RegionCodes } from 'constants/index';
import { useMapProperties } from 'features/properties/map/hooks/useMapProperties';
import { Feature, FeatureCollection, GeoJsonProperties, Geometry } from 'geojson';
import { geoJSON, LatLng, LatLngBounds, LeafletMouseEvent } from 'leaflet';
import isNumber from 'lodash/isNumber';
import React, { useReducer, useState } from 'react';
import { toast } from 'react-toastify';
import { useTenant } from 'tenants';
import { ActorRefFrom, StateFrom } from 'xstate';

import {
  LayerPopupInformation,
  municipalityLayerPopupConfig,
  parcelLayerPopupConfig,
  useLayerQuery,
} from '../leaflet/LayerPopup';
import { mapMachine } from '../stateMachines/mapMachine';
import { States } from '../stateMachines/mapMachine.types';

export interface MapInformation {
  loading: boolean;
  selectedMapFeature: Feature | undefined;
}

export interface IMapStateMachineContext {
  // shared map state
  map: MapInformation | undefined;
  sidebar: {} | undefined;
  popup: LayerPopupInformation | undefined;

  // event handlers
  useMapClick: () => (event: LeafletMouseEvent) => Promise<Feature | undefined>;
  closePopup: () => void;

  // access to underlying state machine
  service: ActorRefFrom<typeof mapMachine>;
  useMachine: () => [StateFrom<typeof mapMachine>, ActorRefFrom<typeof mapMachine>['send']];
}

export const MapStateMachineContext = React.createContext<IMapStateMachineContext>(
  {} as IMapStateMachineContext,
);

export const MapStateMachineContextProvider: React.FC<React.PropsWithChildren<unknown>> = ({
  children,
}) => {
  const [popup, setPopup] = useState<LayerPopupInformation | undefined>();
  const [mapInfo, setMapInfo] = useReducer(
    (prevState: MapInformation, newState: Partial<MapInformation>) => ({
      ...prevState,
      ...newState,
    }),
    {
      loading: false,
      selectedMapFeature: undefined,
    } as MapInformation,
  );

  const service = useInterpret(mapMachine);

  function useMachine() {
    return useActor(service);
  }

  const isSelecting = useSelector(service, state => state.matches(States.SELECTING_ON_MAP));

  function closePopup() {
    setPopup(undefined);
  }

  function useMapClick() {
    const { parcelsLayerUrl, municipalLayerUrl, motiRegionLayerUrl, hwyDistrictLayerUrl } =
      useTenant();
    const parcelsService = useLayerQuery(parcelsLayerUrl);
    const municipalitiesService = useLayerQuery(municipalLayerUrl);
    const regionService = useLayerQuery(motiRegionLayerUrl);
    const districtService = useLayerQuery(hwyDistrictLayerUrl);

    const {
      loadProperties: { execute: loadProperties },
    } = useMapProperties();

    async function handleMapClick(e: LeafletMouseEvent): Promise<Feature | undefined> {
      let properties: GeoJsonProperties | undefined = undefined;
      let center: LatLng | undefined;
      let mapBounds: LatLngBounds | undefined;
      let displayConfig = {};
      let title = 'Location Information';
      let feature: Feature | undefined = undefined;

      // call these APIs in parallel - notice there is no "await"
      const task1 = parcelsService.findOneWhereContains(e.latlng);
      const task2 = regionService.findMetadataByLocation(e.latlng, 'GEOMETRY');
      const task3 = districtService.findMetadataByLocation(e.latlng, 'GEOMETRY');

      const parcel = await task1;
      const region = await task2;
      const district = await task3;

      let pimsLocationProperties: FeatureCollection<Geometry, GeoJsonProperties> | undefined =
        undefined;

      if (parcel?.features?.length > 0) {
        const pid = parcel?.features[0].properties?.PID;
        const pin = parcel?.features[0].properties?.PIN;
        pimsLocationProperties = await loadProperties({
          PID: pid || '',
          PIN: pin || '',
        });
      }

      if (!isSelecting) {
        const municipality = await municipalitiesService.findOneWhereContains(e.latlng);

        if (municipality?.features?.length === 1) {
          title = 'Municipality Information';
          properties = municipality.features[0].properties!;
          displayConfig = municipalityLayerPopupConfig;
          feature = municipality.features[0];
          mapBounds = municipality.features[0]?.geometry
            ? geoJSON(municipality.features[0].geometry).getBounds()
            : undefined;
        }
      }

      if (parcel?.features?.length === 1) {
        displayConfig = parcelLayerPopupConfig;
        properties = parcel.features[0].properties!;
        feature = parcel.features[0];
        title = 'LTSA ParcelMap data';
        mapBounds = parcel.features[0]?.geometry
          ? geoJSON(parcel.features[0].geometry).getBounds()
          : undefined;
      }

      if (feature === undefined) {
        feature = {
          geometry: { coordinates: [e.latlng.lng, e.latlng.lat], type: 'Point' },
          type: 'Feature',
          properties: {},
        };
      }

      if (!isSelecting) {
        if (pimsLocationProperties !== undefined && pimsLocationProperties?.features?.length > 1) {
          toast.error(
            'Unable to determine desired PIMS Property due to overlapping map boundaries. Click directly on a map marker to view that markers details.',
          );
        }
        const pimsProperty = pimsLocationProperties?.features?.length
          ? pimsLocationProperties?.features[0]
          : undefined;

        setPopup({
          title,
          data: properties as any,
          config: displayConfig as any,
          latlng: e.latlng,
          center,
          bounds: mapBounds,
          feature,
          pimsProperty,
        } as any);
      }

      const activeFeature = { ...feature };
      activeFeature.properties = {
        ...activeFeature.properties,
        IS_SELECTED: isSelecting,
        CLICK_LAT_LNG: e.latlng,
        REGION_NUMBER: isNumber(region.REGION_NUMBER) ? region.REGION_NUMBER : RegionCodes.Unknown,
        REGION_NAME: region.REGION_NAME ?? 'Cannot determine',
        DISTRICT_NUMBER: isNumber(district.DISTRICT_NUMBER)
          ? district.DISTRICT_NUMBER
          : DistrictCodes.Unknown,
        DISTRICT_NAME: district.DISTRICT_NAME ?? 'Cannot determine',
      };

      setMapInfo({ selectedMapFeature: activeFeature });
      return activeFeature;
    }

    return handleMapClick;
  }

  return (
    <MapStateMachineContext.Provider
      value={{
        map: mapInfo,
        popup,
        sidebar: undefined,
        service,
        useMachine,
        useMapClick,
        closePopup,
      }}
    >
      {children}
    </MapStateMachineContext.Provider>
  );
};
