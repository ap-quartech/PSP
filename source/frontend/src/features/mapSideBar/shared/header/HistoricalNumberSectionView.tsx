import { useMemo } from 'react';

import { HeaderField } from '@/components/common/HeaderField/HeaderField';
import { ApiGen_Concepts_HistoricalFileNumber } from '@/models/api/generated/ApiGen_Concepts_HistoricalFileNumber';
import { exists } from '@/utils';

export interface IHistoricalNumbersViewProps {
  historicalNumbers: ApiGen_Concepts_HistoricalFileNumber[];
}

const HistoricalNumberFieldView: React.FC<IHistoricalNumbersViewProps> = ({
  historicalNumbers,
}) => {
  const uniqueNumbers = useMemo(() => {
    const flatNumberArray = historicalNumbers
      .filter(exists)
      .sort(h => h.historicalFileNumberTypeCode.displayOrder)
      .map(h => `${h.historicalFileNumber}[${h.historicalFileNumberTypeCode.description}]`);

    const uniqueNumberSet = new Set(flatNumberArray);
    return Array.from(uniqueNumberSet);
  }, [historicalNumbers]);

  return (
    <HeaderField label="Historical File #:" labelWidth="3" contentWidth="9">
      {uniqueNumbers.join(', ')}
    </HeaderField>
  );
};

export default HistoricalNumberFieldView;