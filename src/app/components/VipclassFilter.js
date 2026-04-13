'use client'

import { useState, useEffect, useRef } from 'react';
import { Button, Checkbox, Slider, Divider, Collapse } from 'antd';
import { CarOutlined, DollarOutlined, FilterOutlined } from '@ant-design/icons';

export default function FilterSidebar({ Vip, onFilter, onReset }) {
  const [filters, setFilters] = useState({
    make: [],
    priceRange: [0, 1000]
  });

  const prevFilterdRef = useRef();
  // Get all unique makes for filtering
  const makeOptions = [...new Set(Vip.map(car => car.make))];

  const handleMakeChange = (selectedMakes) => {
    setFilters(prev => ({ ...prev, make: selectedMakes }));
  };

  const handlePriceChange = (value) => {
    setFilters(prev => ({ ...prev, priceRange: value }));
  };

  // Apply filters automatically whenever filters change
  useEffect(() => {
    const filtered = Vip.filter(car => {
      const makeMatch = filters.make.length === 0 || filters.make.includes(car.make);
      const priceMatch = car.price >= filters.priceRange[0] && car.price <= filters.priceRange[1];
      return makeMatch && priceMatch;
    });
    
    if (JSON.stringify(filtered) !== JSON.stringify(prevFilterdRef.current)) {
    onFilter(filtered);
    prevFilterdRef.current= filtered;
    }
  }, [filters, Vip, onFilter]);

  const resetAll = () => {
    setFilters({
      make: [],
      priceRange: [0, 1000]
    });
    onReset();
  };

  const collapseItems = [
    {
      key: '1',
      label: (
        <span className="font-semibold">
          <DollarOutlined className="mr-2" />
          Price Range
        </span>
      ),
      children: (
        <>
          <Slider
            range
            min={0}
            max={1000}
            value={filters.priceRange}
            onChange={handlePriceChange}
            tooltip={{ formatter: value => `$${value}` }}
          />
          <div className="flex justify-between mt-2 text-sm">
            <span>${filters.priceRange[0]}</span>
            <span>${filters.priceRange[1]}</span>
          </div>
        </>
      )
    },
    {
      key: '2',
      label: (
        <span className="font-semibold">
          <CarOutlined className="mr-2" />
          Make
        </span>
      ),
      children: (
        <Checkbox.Group
          options={makeOptions.map(make => ({ label: make, value: make }))}
          onChange={handleMakeChange}
          value={filters.make}
          className="flex flex-col space-y-2"
        />
      )
    }
  ];

  return (
    <div className="bg-white p-4 h-full">
      <div className="flex justify-between items-center mb-6">
        <h2 className="text-lg font-bold flex items-center">
          <FilterOutlined className="mr-2" /> Filters
        </h2>
        <Button type="text" onClick={resetAll} className="text-blue-500">
          Reset All
        </Button>
      </div>

      <Collapse 
        bordered={false} 
        defaultActiveKey={['1', '2']}
        items={collapseItems}
      />

      <Divider className="my-4" />
    </div>
  );
}