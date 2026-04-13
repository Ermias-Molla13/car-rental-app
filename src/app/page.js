"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import { Carousel, Checkbox, Button, Divider, Slider } from "antd";
import {
  CarOutlined,
  DollarOutlined,
  StarOutlined,
  CheckOutlined,
  SafetyOutlined,
  CustomerServiceOutlined,
  FilterOutlined
} from "@ant-design/icons";

export default function Home() {
  const router = useRouter();
  const [priceRange, setPriceRange] = useState([0, 1000]);
  const [selectedTypes, setSelectedTypes] = useState([]);
  const [selectedFeatures, setSelectedFeatures] = useState([]);

  // Promotional slides content
  const promoSlides = [
    {
      title: "Premium Fleet",
      description: "Discover our luxury vehicle collection",
      image: "/vipcars/Fr.jpg",
      color: "from-blue-800 to-blue-600"
    },
    {
      title: "30% Off First Rental",
      description: "Special discount for new customers",
      image: "/vipcars/v1.jpg",
      color: "from-amber-600 to-amber-400"
    },
    {
      title: "24/7 Roadside Assistance",
      description: "We've got you covered anywhere, anytime",
      image: "/vipcars/f1.jpg",
      color: "from-green-700 to-green-500"
    }
  ];

  // Handler functions
  const resetFilters = () => {
    setPriceRange([0, 1000]);
    setSelectedTypes([]);
    setSelectedFeatures([]);
  };

  const handleNavigation = (path) => {
    router.push(path);
  };

  return (
    <div className="min-h-screen flex flex-col lg:flex-row bg-gray-50">
      {/* Promotional Carousel*/}
      <div className="w-full lg:w-2/5 xl:w-1/3 h-64 lg:h-auto relative">
        <Carousel 
          autoplay 
          effect="fade" 
          className="h-full"
          dotPosition="right"
        >
          {promoSlides.map((slide, index) => (
            <div 
              key={index} 
              className={`h-full bg-gradient-to-br ${slide.color} text-white p-6 lg:p-12 flex flex-col justify-center`}
            >
              <div className="max-w-md mx-auto">
                <h2 className="text-xl lg:text-3xl font-bold mb-2 lg:mb-4">{slide.title}</h2>
                <p className="text-sm lg:text-xl mb-4 lg:mb-8">{slide.description}</p>
                <Button 
                  type="default" 
                  size="small lg:large"
                  className="border-white text-white hover:bg-white hover:text-blue-600"
                >
                  Learn More
                </Button>
              </div>
              <div className="absolute inset-0 overflow-hidden w-full">
                <img 
                  src={slide.image} 
                  alt={slide.title}
                  className="w-full h-full object-cover opacity-20"
                />
              </div>
            </div>
          ))}
        </Carousel>
      </div>

      {/* Right Side - Main Content */}
      <div className="flex-1 overflow-y-auto">
        <div className="max-w-4xl mx-auto p-4 lg:p-6">
          {/* Header */}
          <header className="mb-6 lg:mb-10 text-center">
            <h1 className="text-2xl lg:text-4xl font-bold text-gray-800 mb-2">
              Welcome to <span className="text-blue-600">Er-Car</span>
            </h1>
            <p className="text-base lg:text-lg text-gray-600">
              Your journey begins with the perfect rental car
            </p>
          </header>

          {/* Quick Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3 lg:gap-4 mb-6 lg:mb-10">
            {[
              { icon: <CarOutlined />, value: "200+", label: "Vehicles" },
              { icon: <CheckOutlined />, value: "98%", label: "Satisfaction" },
              { icon: <SafetyOutlined />, value: "24/7", label: "Support" },
              { icon: <CustomerServiceOutlined />, value: "5-Star", label: "Service" }
            ].map((stat, i) => (
              <div key={i} className="bg-white p-2 lg:p-4 rounded-lg shadow-sm text-center">
                <div className="text-xl lg:text-2xl text-blue-600 mb-1 lg:mb-2">{stat.icon}</div>
                <div className="text-lg lg:text-2xl font-bold">{stat.value}</div>
                <div className="text-xs lg:text-sm text-gray-500">{stat.label}</div>
              </div>
            ))}
          </div>

          {/* Categories Section */}
          <div className="mb-6 lg:mb-10">
            <h2 className="text-xl lg:text-2xl font-bold mb-4 lg:mb-6 text-gray-800">Our Vehicle Categories</h2>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 lg:gap-6">
              {[
                {
                  name: "Economic",
                  price: "$60 - $95",
                  image: "/toyota.jpg",
                  path: "/EconomicCar",
                  color: "bg-blue-100 text-blue-800"
                },
                {
                  name: "Middle Class",
                  price: "$100 - $300",
                  image: "/minbus.jpg",
                  path: "/midcarsfold",
                  color: "bg-green-100 text-green-800"
                },
                {
                  name: "VIP",
                  price: "$500 - $950",
                  image: "/novitec.jpg",
                  path: "/vipcars",
                  color: "bg-amber-100 text-amber-800"
                }
              ].map((category, i) => (
                <div 
                  key={i} 
                  className="group overflow-hidden rounded-xl shadow-md hover:shadow-lg transition-shadow cursor-pointer relative"
                  onClick={() => handleNavigation(category.path)}
                >
                  <div className="relative pt-[75%]">
                    <img
                      src={category.image}
                      alt={category.name}
                      className="absolute top-0 left-0 w-full h-full object-cover transition-transform duration-300 group-hover:scale-105"
                    />
                  </div>
                  <div className={`absolute h-15 bottom-0 left-0 right-0 ${category.color} text-center`}>
                    <h3 className="font-bold text-sm md:text-xl">{category.name}</h3>
                    <p className="text-sm md:text-base">{category.price}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>

          
          <div className="bg-blue-600 text-white rounded-xl p-4 lg:p-8 text-center">
            <h2 className="text-xl lg:text-2xl font-bold mb-2 lg:mb-3">Ready for Your Next Adventure?</h2>
            <p className="mb-4 lg:mb-6 text-sm lg:text-base">Book your perfect car today and enjoy special discounts</p>
          </div>
        </div>
      </div>
    </div>
  );
}