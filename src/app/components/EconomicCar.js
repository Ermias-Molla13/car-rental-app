'use client';

import { useState } from 'react';
import { Drawer, Form, Input, DatePicker, Button, message, Rate} from 'antd';
import dayjs from 'dayjs';



export default function EcoCars({ car }) {
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

  const onFinish = (values) => {
    console.log('Booking details:', {
      car: car.name,
      ...values,
      pickupDate: values.pickupDate.format('YYYY-MM-DD'),
      returnDate: values.returnDate.format('YYYY-MM-DD'),
    });

    message.success('Booking submitted successfully!',3);
    onBookingClose();
    onDetailsClose();
  };

  const disabledDate = (current) => {
    return current && current < dayjs().startOf('day');
  };

  const handleRateChange = (value) => {
    setUserRating(value);
    message.success(`Thank you for your ${value}-star rating!`);
    // Here you would typically send the rating to your backend
    // Example: await api.submitRating(car.id, value);
  };

   


  return (
    <>
   

      <div className="bg-slate-100 rounded-xl shadow-xl overflow-hidden cursor-pointer transition-all border border-blue-500 w-full">
        <div className="relative w-full h-auto">
          <img
            src={car.image}
            alt={car.name}
            className="w-full h-48 object-cover  shadow-black not-even:shadow-2xl hover-bg-black"
          />
          <div className="absolute top-2 left-2 bg-white/90 px-2 py-1 rounded-md flex items-center">
           
          </div>
        </div>
        <div className="p-4 w-fit min-w-[250px]">
          <h2 className="text-xl font-bold mb-2 truncate max-w-[200px]">{car.make}</h2>
          <div className="flex items-center mb-2">
            
          </div>
          <p className="text-gray-600 mb-4 font-bold">{car.price}$</p>
          <Rate 
              disabled 
              value={car.rating || 0} 
              allowHalf 
              className="text-sm mr-1" 
            />

            <span className="text-gray-500 text-xs">
              ({car.reviews || 0} reviews)
            </span>
            <div className='p-4'>

            </div>
          <button
            onClick={showDetailsDrawer}
            className="px-4 py-2 bg-blue-500 text-white rounded-xl hover:bg-blue-600 transition-colors font-bold border border-blue-600 w-fit"
          >
            View Detail
          </button>
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
        <div className="max-w-md mx-auto bg-white rounded-xl shadow-md overflow-hidden border border-blue-500 w-fit">
          <div className="w-fit">
            <img
              src={car.image}
              alt={car.name}
              className="w-full h-64 object-contain"
            />
          </div>
          <div className="bg-slate-100 text-center p-4 w-fit min-w-[300px]">
            <p className="text-2xl font-bold text-blue-700 mb-2 truncate">{car.make}</p>
            <div className="flex justify-center items-center mb-3">
              <Rate 
                value={car.rating || 0} 
                disabled 
                allowHalf 
                className="text-lg" 
              />
              <span className="ml-2 text-amber-600 text-sm">
                ({car.reviews || 0} reviews)
              </span>
            </div>
            <div className="mt-4 text-left">
            
            <p className="text-sm"><span className="text-blue-700 font-bold text-sm mb-3 line-clamp-2">Model:</span>{car.model}</p> 
            <p className="text-sm"><span className="text-blue-700 font-bold text-sm mb-3 line-clamp-2">Price:</span>{car.price}$</p>
            <p className="text-sm"><span className="text-blue-700 font-bold text-sm mb-3 line-clamp-2">Year:</span>{car.year}</p>
            <h3 className="text-lg font-bold text-blue-700 mb-2">Description</h3>
            <p className="text-sm"><span className="text-gray-600 text-sm mb-3 line-clamp-2"></span>{car.description}</p>
           
   
  </div>
         </div>
          <div className="p-4 text-center bg-slate-100 border-t border-blue-200">
            <div className="mb-4">
              <p className="font-bold text-amber-600 mb-2">Rate this car:</p>
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
              className="px-4 py-2 bg-blue-500 text-white rounded-xl hover:bg-blue-600 transition-colors font-bold border border-blue-600 w-fit"
            >
              Book Car
            </button>
          </div>
        </div>
      </Drawer>

      {/* Booking Form Drawer */}
      <Drawer
        title={`Book ${car.name}`}
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
          className="bg-white p-4 rounded-xl border border-blue-500 w-fit min-w-[400px]"
        >
          <Form.Item
            label={<span className="font-bold">Full Name</span>}
            name="fullName"
            rules={[{ required: true, message: 'Please input your full name!' }]}
            className="w-fit min-w-[300px]"
          >
            <Input
              placeholder="Enter your full name"
              className="hover:border-blue-500 focus:border-blue-500 w-full"
            />
          </Form.Item>

          <Form.Item
            label={<span className="font-bold">Email</span>}
            name="email"
            rules={[
              { required: true, message: 'Please input your email!' },
              { type: 'email', message: 'Please enter a valid email address!' }
            ]}
            className="w-fit min-w-[300px]"
          >
            <Input
              placeholder="Enter your email"
              className="hover:border-blue-500 focus:border-blue-500 w-full"
            />
          </Form.Item>

          <Form.Item
            label={<span className="font-bold">Phone Number</span>}
            name="phone"
            rules={[
              { required: true, message: 'Please input your phone number!' }
            ]}
            className="w-fit min-w-[300px]"
          >
            <Input
              placeholder="Enter your phone number"
              className="hover:border-blue-500 focus:border-blue-500 w-full"
            />
          </Form.Item>

          <Form.Item
            label={<span className="font-bold">Pickup Date</span>}
            name="pickupDate"
            rules={[{ required: true, message: 'Please select pickup date!' }]}
            className="w-fit min-w-[300px]"
          >
            <DatePicker
              className="w-full hover:border-blue-500 focus:border-blue-500"
              disabledDate={disabledDate}
            />
          </Form.Item>

          <Form.Item
            label={<span className="font-bold">Return Date</span>}
            name="returnDate"
            rules={[{ required: true, message: 'Please select return date!' }]}
            className="w-fit min-w-[300px]"
          >
            <DatePicker
              className="w-full hover:border-blue-500 focus:border-blue-500"
              disabledDate={disabledDate}
            />
          </Form.Item>

          <Form.Item
            label={<span className="font-bold">Additional Notes</span>}
            name="notes"
            className="w-fit min-w-[300px]"
          >
            <Input.TextArea
              rows={3}
              placeholder="Any special requests or notes"
              className="hover:border-blue-500 focus:border-blue-500 w-full"
            />
          </Form.Item>

          <Form.Item className="w-fit min-w-[300px]">
            <Button
              type="primary"
              htmlType="submit"
              size="large"
              className="font-bold bg-blue-500 hover:bg-blue-600 border-blue-600 w-full"
            >
              Confirm Booking
            </Button>
          </Form.Item>
        </Form>
      </Drawer>
    </>
  );
}