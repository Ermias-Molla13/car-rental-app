'use client';

import { useState } from 'react';
import { Drawer, Form, Input, DatePicker, Button, message, Rate } from 'antd';
import dayjs from 'dayjs';
import Image from 'next/image';

export default function MidCars({ car }) {
  const [detailsOpen, setDetailsOpen] = useState(false);
  const [bookingOpen, setBookingOpen] = useState(false);
  const [form] = Form.useForm();
  const [userRating, setUserRating] = useState(0);

  const showDetailsDrawer = () => {
    setDetailsOpen(true);
  };

  const onDetailsClose = () => {
    setDetailsOpen(false);
  };

  const showBookingDrawer = () => {
    setBookingOpen(true);
  };

  const onBookingClose = () => {
    setBookingOpen(false);
    form.resetFields();
  };

  const handleRateChange = (value) => {
    setUserRating(value);
    message.success(`Thank you for your ${value}-star rating!`);
  };

  const onFinish = (values) => {
    console.log('Booking details:', {
      car: car.make,
      ...values,
      pickupDate: values.pickupDate.format('YYYY-MM-DD'),
      returnDate: values.returnDate.format('YYYY-MM-DD'),
    });

    message.success('Booking submitted successfully!');
    onBookingClose();
    onDetailsClose();
  };

  const disabledDate = (current) => {
    return current && current < dayjs().startOf('day');
  };

  return (
    <>
      <div className="bg-slate-100 rounded-xl shadow-md overflow-hidden cursor-pointer hover:shadow-lg transition-all border border-blue-500 w-full h-full flex flex-col">
        <div className="relative w-full h-48">
          <Image
            src={car.image}
            alt={car.make}
            fill
            className="object-cover"
            priority
          />
        </div>
        <div className="p-4 flex-1 flex flex-col">
          <h2 className="text-xl font-bold mb-2 truncate">{car.make}</h2>
          <div className="flex items-center mb-2">
            <Rate 
              disabled 
              value={car.rating || 0} 
              allowHalf 
              className="text-sm mr-1" 
            />
            <span className="text-gray-500 text-xs">
              ({car.reviews || 0} reviews)
            </span>
          </div>
          <p className="text-gray-600 mb-4 font-bold">${car.price}/day</p>
          
          <div className="mt-auto">
            <button
              onClick={showDetailsDrawer}
              className="w-full px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors font-medium"
            >
              View Details
            </button>
          </div>
        </div>
      </div>

      {/* Car Details Drawer */}
      <Drawer
        title="Car Details"
        placement="right"
        onClose={onDetailsClose}
        open={detailsOpen}
        width={500}
        className="[&_.ant-drawer-content]:bg-slate-100 [&_.ant-drawer-header]:border-b-blue-500"
      >
        <div className="max-w-md mx-auto bg-white rounded-xl shadow-md overflow-hidden border border-blue-500">
          <div className="relative w-full h-64">
            <Image
              src={car.image}
              alt={car.make}
              fill
              className="object-contain"
            />
          </div>
          <div className="p-4">
            <h2 className="text-2xl font-bold text-center mb-4">{car.make} {car.model}</h2>
            <div className="mb-4">
              <h3 className="text-lg font-bold text-blue-700 mb-2">Description</h3>
              <p className="text-gray-700">{car.description}</p>
            </div>

            <div className="mb-4">
             
              <div className="grid grid-cols-2 gap-2">
                <p className="text-sm"><span className="font-semibold">Year:</span> {car.year}</p>
                <p className="text-sm"><span className="font-semibold">Price:</span> ${car.price}/day</p>
                
              </div>
            </div>

           

            <div className="mt-6">
              <div className="mb-4 text-center">
                <p className="font-bold mb-2">Rate this car:</p>
                <Rate 
                  value={userRating} 
                  onChange={handleRateChange} 
                  allowHalf
                  className="text-2xl" 
                />
                {userRating > 0 && (
                  <p className="text-green-600 text-sm mt-1">
                    You rated this {userRating} star{userRating > 1 ? 's' : ''}
                  </p>
                )}
              </div>
              <button
                onClick={showBookingDrawer}
                className="w-full px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors font-medium"
              >
                Book Now
              </button>
            </div>
          </div>
        </div>
      </Drawer>

      {/* Booking Form Drawer */}
      <Drawer
        title={`Book ${car.make} ${car.model}`}
        placement="left"
        onClose={onBookingClose}
        open={bookingOpen}
        width={500}
        className="[&_.ant-drawer-content]:bg-slate-100 [&_.ant-drawer-header]:border-b-blue-500"
      >
        <Form
          form={form}
          layout="vertical"
          onFinish={onFinish}
          autoComplete="off"
          className="bg-white p-4 rounded-xl border border-blue-500"
        >
          <Form.Item
            label="Full Name"
            name="fullName"
            rules={[{ required: true, message: 'Please input your full name!' }]}
          >
            <Input placeholder="Enter your full name" />
          </Form.Item>

          <Form.Item
            label="Email"
            name="email"
            rules={[
              { required: true, message: 'Please input your email!' },
              { type: 'email', message: 'Please enter a valid email address!' }
            ]}
          >
            <Input placeholder="Enter your email" />
          </Form.Item>

          <Form.Item
            label="Phone Number"
            name="phone"
            rules={[
              { required: true, message: 'Please input your phone number!' }
            ]}
          >
            <Input placeholder="Enter your phone number" />
          </Form.Item>

          <Form.Item
            label="Pickup Date"
            name="pickupDate"
            rules={[{ required: true, message: 'Please select pickup date!' }]}
          >
            <DatePicker
              className="w-full"
              disabledDate={disabledDate}
            />
          </Form.Item>

          <Form.Item
            label="Return Date"
            name="returnDate"
            rules={[{ required: true, message: 'Please select return date!' }]}
          >
            <DatePicker
              className="w-full"
              disabledDate={disabledDate}
            />
          </Form.Item>

          <Form.Item
            label="Additional Notes"
            name="notes"
          >
            <Input.TextArea
              rows={3}
              placeholder="Any special requests or notes"
            />
          </Form.Item>

          <Form.Item>
            <Button
              type="primary"
              htmlType="submit"
              size="large"
              className="w-full bg-blue-500 hover:bg-blue-600"
            >
              Confirm Booking
            </Button>
          </Form.Item>
        </Form>
      </Drawer>
    </>
  );
}