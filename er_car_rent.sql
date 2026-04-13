-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2026 at 10:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `er_car_rent`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `contact`, `address`, `email`, `password`) VALUES
(13, 'kebe', '0900989909', 'goder', 'ermiasmolla78@gmail.com', '$2b$10$Ri3IewTygHD5ZkkktITQ3OO3xPuCAZUhMJft3Q2g7AuD2wGdyM6CG'),
(14, 'test', '0968790974', 'Dire dewa', 'test@gmail.com', '$2b$10$1T7j3V06JY3FCyXJyuyzDeQ2Pt.MyaXvBLPYkJHIxOOXK24w/Ze.6'),
(15, 'test1', '0962146750', 'wollo dessie', 'test1@gmail.com', '$2b$10$UpmnUyN4RV0N0HEz2DRL7emu.ymCabFhkBYnhl4rz6mHsOrikZ6S.'),
(16, 'yoha', '0962146750', 'addis abeba', 'yohan@gmail.com', '$2b$10$OL4RmXxYvRT1MZySD4vFg.Oa.0TtrWMx6IMyoK37Xr5r6IJYu6nj6');

-- --------------------------------------------------------

--
-- Table structure for table `admin2`
--

CREATE TABLE `admin2` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `adrress` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `paassword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pickup_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `rental_days` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `car_id`, `customer_name`, `email`, `pickup_date`, `return_date`, `total_price`, `rental_days`, `created_at`) VALUES
(3, 0, 'jonyy', 'test1@gmail.com', '2025-06-11 00:00:00', '2025-06-13 00:00:00', 225.00, 3, '2025-06-10 15:27:54'),
(4, 0, 'jonyy', 'test1@gmail.com', '2025-06-11 00:00:00', '2025-06-13 00:00:00', 225.00, 3, '2025-06-10 15:28:00'),
(5, 0, 'jonyy', 'test1@gmail.com', '2025-06-11 00:00:00', '2025-06-13 00:00:00', 225.00, 3, '2025-06-10 15:28:00'),
(6, 0, 'ermi', 'sinqe@gmail.com', '2025-06-11 00:00:00', '2025-06-13 00:00:00', 240.00, 3, '2025-06-10 15:29:07'),
(7, 0, 'ermi1', 'sinqe@gmail.com', '2025-06-11 00:00:00', '2025-06-13 00:00:00', 240.00, 3, '2025-06-10 15:45:17'),
(8, 0, 'ermi1', 'sinqe@gmail.com', '2025-06-13 00:00:00', '2025-06-15 00:00:00', 225.00, 3, '2025-06-12 06:31:17'),
(9, 0, 'eyob', 'eyob14@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 09:06:29'),
(10, 0, 'testbokking table', 'sinqe@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 09:07:59'),
(11, 0, 'testbokking2 table', 'sinqe@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 09:17:20'),
(12, 0, 'testbokking2 table', 'sinqe@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 09:19:46'),
(13, 0, 'test1', 'test@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 09:41:50'),
(14, 0, 'test1', 'test@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 09:45:37'),
(15, 0, 'Habtamu', 'Hab@gmail.com', '2025-06-16 00:00:00', '2025-06-19 00:00:00', 885.00, 3, '2025-06-15 09:51:12'),
(16, 21, 'test1', 'test@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 09:57:43'),
(17, 21, 'test1', 'test@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 10:12:44'),
(18, 29, 'ewnet', 'eyob14@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 885.00, 3, '2025-06-15 10:42:56'),
(19, 21, 'Habtamu', 'ermiasmolla785@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 201.00, 3, '2025-06-15 10:50:30'),
(20, 22, 'Erma', 'My@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 225.00, 3, '2025-06-15 10:59:36'),
(21, 23, 're', 'test@gmail.com', '2025-06-16 00:00:00', '2025-06-18 00:00:00', 240.00, 3, '2025-06-15 11:49:55'),
(22, 28, 'werku', 'werku@gmail.com', '2025-06-19 00:00:00', '2025-06-21 00:00:00', 885.00, 3, '2025-06-18 17:58:21'),
(23, 21, 'werku', 'werku@gmail.com', '2025-06-19 00:00:00', '2025-06-28 00:00:00', 603.00, 9, '2025-06-18 18:06:04'),
(24, 29, 'Ermiayas molla', 'Erma@gmail.com', '2025-06-20 00:00:00', '2025-06-30 00:00:00', 3245.00, 11, '2025-06-18 19:50:17'),
(25, 24, 'Er', 'Er@gmail.com', '2025-06-19 00:00:00', '2025-06-25 00:00:00', 360.00, 6, '2025-06-18 19:56:31'),
(26, 22, 'werku', 'werku@gmail.com', '2025-06-27 00:00:00', '2025-06-28 00:00:00', 150.00, 2, '2025-06-19 08:32:43'),
(27, 29, 'ermias', 'erma13molla@gmail.com', '2025-06-21 00:00:00', '2025-06-23 00:00:00', 885.00, 3, '2025-06-20 08:25:27'),
(28, 23, 'yoha', 'yoha@gmial.com', '2025-06-21 00:00:00', '2025-06-23 00:00:00', 240.00, 3, '2025-06-20 09:19:10'),
(29, 43, 'yoha', 'yoha@gmial.com', '2025-06-25 00:00:00', '2025-06-27 00:00:00', 1500.00, 3, '2025-06-24 07:14:34'),
(30, 40, 'yoha', 'yoha@gmial.com', '2025-06-27 00:00:00', '2025-06-29 00:00:00', 240.00, 3, '2025-06-26 08:31:10'),
(31, 42, 'ermias', 'erma@gmail.com', '2025-06-27 00:00:00', '2025-06-30 00:00:00', 450.00, 3, '2025-06-26 08:35:25'),
(32, 43, 'ermias', 'erma@gmail.com', '2025-06-28 00:00:00', '2025-06-30 00:00:00', 1500.00, 3, '2025-06-27 07:58:37'),
(33, 44, 'te', 'test1@gmail.com', '2025-06-28 00:00:00', '2025-07-03 00:00:00', 375.00, 5, '2025-06-27 08:01:47'),
(34, 45, 'kid', 'erma@gmail.com', '2025-06-28 00:00:00', '2025-06-30 00:00:00', 1530.00, 3, '2025-06-27 08:04:59'),
(35, 47, 'ermias molla', 'erma13molla@gmail.com', '2025-06-28 00:00:00', '2025-06-30 00:00:00', 900.00, 3, '2025-06-27 08:46:54'),
(36, 47, 'ermias molla', 'erma13molla@gmail.com', '2025-06-28 00:00:00', '2025-06-30 00:00:00', 900.00, 3, '2025-06-27 08:46:55'),
(37, 47, 'ermias molla', 'erma13molla@gmail.com', '2025-06-28 00:00:00', '2025-06-30 00:00:00', 900.00, 3, '2025-06-27 08:46:56'),
(38, 42, 'itsme', 'sinqe@gmail.com', '2025-06-28 00:00:00', '2025-06-30 00:00:00', 450.00, 3, '2025-06-27 09:09:03'),
(39, 42, 'itsme', 'sinqe@gmail.com', '2025-06-28 00:00:00', '2025-07-09 00:00:00', 1650.00, 11, '2025-06-27 09:10:46'),
(40, 43, 'itsme', 'sinqe@gmail.com', '2025-06-28 00:00:00', '2025-06-30 00:00:00', 1500.00, 3, '2025-06-27 09:39:50'),
(41, 50, 'testdate', 'testdate@gmail.com', '2025-06-30 00:00:00', '2025-07-02 00:00:00', 435.00, 3, '2025-06-29 14:25:02'),
(42, 44, 'testdate2', 'testdate2@gmail.com', '2025-06-30 00:00:00', '2025-07-02 00:00:00', 225.00, 3, '2025-06-29 14:31:49'),
(43, 45, 'testdate3', 'testdate3@gmail.com', '2025-06-30 00:00:00', '2025-07-02 00:00:00', 1530.00, 3, '2025-06-29 14:33:20'),
(44, 42, 'hillina', 'hiluu@gmail.com', '2025-07-07 00:00:00', '2025-07-09 00:00:00', 450.00, 3, '2025-07-06 16:15:45'),
(45, 53, 'tewabech', 'tewa@gmail.com', '2025-09-09 00:00:00', '2025-09-11 00:00:00', 270.00, 3, '2025-09-08 16:11:06'),
(46, 53, 'tewabech', 'tewa@gmail.com', '2025-09-09 00:00:00', '2025-09-11 00:00:00', 270.00, 3, '2025-09-08 16:11:07'),
(47, 42, 'betsegaw', 'be@gmail.com', '2025-10-05 00:00:00', '2025-10-07 00:00:00', 450.00, 3, '2025-10-04 07:41:14'),
(48, 43, 'dagim', 'd@gmail.com', '2025-10-06 00:00:00', '2025-10-08 00:00:00', 1500.00, 3, '2025-10-05 06:55:56'),
(49, 48, 'ermias', 'sinqe@gmail.com', '2025-10-16 00:00:00', '2025-10-18 00:00:00', 1533.00, 3, '2025-10-15 09:22:46'),
(50, 51, 'ermiasm', 'ermiasmolla785@gmail.com', '2025-10-16 00:00:00', '2025-10-18 00:00:00', 300.00, 3, '2025-10-15 09:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `car_code` varchar(100) NOT NULL,
  `make` varchar(15) NOT NULL,
  `model` varchar(20) NOT NULL,
  `rating` double NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `image` varchar(150) NOT NULL,
  `year` int(5) NOT NULL,
  `car_type` varchar(15) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `is_booked` tinyint(1) NOT NULL,
  `booking_info` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `custm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `car_code`, `make`, `model`, `rating`, `description`, `price`, `image`, `year`, `car_type`, `owner_id`, `is_booked`, `booking_info`, `admin_id`, `custm_id`) VALUES
(42, 'a4', 'SUV', 'CS75', 4.5, 'Engine Options:\nThe CS75 typically offers a 1.5-liter turbocharged engine, and in some cases, a 1.8-liter hybrid option. \nTransmission:\nIt\'s commonly paired with a 6-speed automatic or a 7-speed dual-clutch transmission. \nDimensions:\nThe CS75 is generally around 4.7 meters long, 1.8 meters wide, and 1.7 meters high, placing it in the compact to mid-size SUV category. \nInterior:\nThe interior features a large touchscreen display, a comfortable seating layout, and potentially a panoramic sunroof. \nSafety:\nThe CS75 includes multiple airbags, lane departure warning, and adaptive cruise control as some of its safety features. \nDesign:\nThe CS75 often features a modern, sporty design, with a large front grille and sleek lines. \nTechnology:\nThe CS75 often includes features like a 360-degree camera, automatic parking, and smartphone integration. ', 150, '/uploads/admin/1750745375815_cs75.jpg', 2023, 'middleclass', 1, 0, '', 0, 0),
(43, 'a5', 'Ford Mustang', 'S550', 4.8, 'The car is a Ford Mustang, identified as an S550 generation model.It is equipped with carbon fiber parts from ADRO, indicated by the \"cdro\" text on the front license plate area and confirmed by search results mentioning ADRO carbon fiber components for this Mustang generation.', 500, '/uploads/admin/1750745782533_f1.jpg', 2022, 'vip', 1, 0, '', 0, 0),
(44, 'a6', 'Hyundai', 'i3O', 3.9, 'Color: Blue\nType: Hatchback car\nModel: Hyundai i30, likely from the FD generation \nPerspective: Shown from a front-three-quarter angle, highlighting the front and side profile.\nSetting: Isolated on a white background, suggesting a studio or edited photograph.', 75, '/uploads/admin/1750745937356_blue.jpg', 2011, 'economic', 1, 0, '', 0, 0),
(45, 'a7', 'Ford Mustang', 'RWD', 4.7, 'Vehicle Type: Two-door coupe, a classic American muscle car. \nColor: Dark, appearing to be a deep blue or black shade. \nKey Features:\nProminent front grille with the iconic Mustang emblem (a running horse). \nSleek, aerodynamic design characteristic of modern Mustang models. \nEquipped with a turbocharger, potentially indicating an EcoBoost model for increased performance and fuel efficiency. ', 510, '/uploads/admin/1750746107909_fB.jpg', 2023, 'vip', 1, 0, '', 0, 0),
(46, 'a8', 'SUV', 'Ssang Yong Rexton', 4, 'Vehicle Type: This is a mid-size SUV (Sport Utility Vehicle). \nColor: The vehicle is a metallic gold or champagne color with grey lower body cladding and wheel arches. \nFeatures: It features a roof rack, tinted windows, and multi-spoke alloy wheels. ', 140, '/uploads/admin/1750746277523_golden_land.jpg', 2005, 'middleclass', 1, 0, '{}', 0, 0),
(47, 'a9', 'Ferrari', 'FF', 3.7, 'Model: Ferrari FF. \nColor: White with black and yellow racing stripes. \nWheels: Features 6 Sporz² ultra-light forged wheels by Wheelsandmore, sized 9.5×21 inches in the front and 12.0×22 inches at the rear. The wheels are black with white outside rims and white-colored inlays, and the brake calipers are yellow. \nTires: Wrapped with 255/30/21 Pirelli P Zero Nero tires', 300, '/uploads/admin/1750746439828_ferrari.jpg', 2013, 'middleclass', 1, 0, '', 0, 0),
(48, 'a10', 'Ford Mustang', 'Fastback', 4.4, 'Design:\nIt features a distinctive, aggressive design with a wide mesh grille, re-profiled bumper, and air extractor bonnet vents. \nPerformance:\nKnown for its power and driving pleasure, it traditionally features a V8 engine and offers various driving modes, including a \"Track mode\" for enhanced performance and a \"Quiet mode\" for reduced noise. ', 511, '/uploads/admin/1750746620431_fbb.jpg', 2021, 'vip', 1, 0, '', 0, 0),
(49, 'a11', 'SUV', 'Premier Rio', 4.3, 'Type:\nIt is a compact SUV or crossover, often classified as a C-segment or small family car.\nThe Premier Rio was available with various engine options, including a 1.2-litre petrol engine, a 1.5 TUD5 diesel, and a 1.3-litre Multijet diesel engine. ', 120, '/uploads/admin/1750746776268_land_black2.png', 2017, 'middleclass', 1, 0, '{}', 0, 0),
(50, 'a12', 'Toyota', 'HiAce', 4.4, 'Type: Minibus or van, designed for transporting multiple passengers or cargo. \nColor: White. \nFeatures: It has a high roof, multiple windows along the side, and a side door typical of a van or minibus. The vehicle appears to be a 3D render or illustration, isolated on a white background. ', 145, '/uploads/admin/1750746946586_minbus.jpg', 2023, 'middleclass', 1, 0, '', 0, 0),
(51, 'a13', 'Toyota', 'HiAce', 4.4, 'Type: Van, specifically a Toyota HiAce. \nColor: White.\nFeatures: It is a high-roof, long-body version, commonly used for transporting people or cargo. \nSafety: Certain models, like the Toyota HiAce, have received safety ratings, such as a 2-star overall safety rating in the Used Car Safety Rating (UCSR) report for a specific model. ', 100, '/uploads/admin/1750747103900_minibus3.jpg', 2016, 'economic', 1, 1, '{\"customer_name\":\"ermiasm\",\"email\":\"ermiasmolla785@gmail.com\",\"pickup_date\":\"2025-10-16T09:41:02.293Z\",\"return_date\":\"2025-10-18T09:41:02.293Z\",\"total_price\":300,\"rental_days\":3}', 0, 0),
(52, 'a14', 'Ford Shelby', 'GT350', 4.9, 'Engine: Features a special flat-plane crankshaft V8 engine capable of revving over 8,000 rpm, a technology typically found in high-end supercars. \nInterior: The cockpit is designed with a spartan feel, removing chrome brightwork and incorporating deeply-bolstered Recaro bucket seats and a flat-bottomed steering wheel. \nTechnology: Depending on the model year, features like SYNC 3 infotainment, voice-activated navigation, and a nine-speaker audio system may be included with the Electronics Package. ', 550, '/uploads/admin/1750747562212_Fr.jpg', 2024, 'vip', 2, 0, '{}', 0, 0),
(53, 'a15', 'Honda', 'CR-V', 4.1, 'Make and Model: Honda CR-V.\nBody Style: Wagon or Sport Utility Vehicle (SUV).\nColor: Silver/Grey.\nFeatures Visible:\nSide-mounted spare tire on the rear door, characteristic of this generation CR-V.\nAlloy rims.\nRoof rails (partially visible).', 90, '/uploads/admin/1750747680832_land_crusier.jpg', 2013, 'economic', 2, 0, '', 0, 0),
(54, 'a16', 'Ford', 'F-150', 4.4, 'Vehicle Type:\nThis is a four-door pickup truck, commonly known for its open cargo bed at the rear. \nColor:\nThe truck is white. \nFeatures:\nIt features a crew cab (four doors) and a standard bed length. The wheels appear to be factory alloy wheels.', 100, '/uploads/admin/1750748041911_pickup1.jpg', 2018, 'economic', 1, 0, '{}', 0, 0),
(56, 'e11', 'toyota', 't1', 3, 'best car for vaciation', 150, '/uploads/admin/1760521572469_blue.jpg', 2022, 'middleclass', 1, 0, '{}', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `car_review`
--

CREATE TABLE `car_review` (
  `review_id` int(11) NOT NULL,
  `review` text NOT NULL,
  `review_score` decimal(3,2) NOT NULL,
  `review_date` datetime DEFAULT current_timestamp(),
  `custm_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_review`
--

INSERT INTO `car_review` (`review_id`, `review`, `review_score`, `review_date`, `custm_id`, `car_id`) VALUES
(1, '[its best car]', 0.30, '2025-04-10 17:06:56', NULL, 1),
(2, '[its greate car]', 0.50, '2025-04-15 03:30:00', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `crud`
--

CREATE TABLE `crud` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `fathername` varchar(50) NOT NULL,
  `gfathername` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `fav_color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crud`
--

INSERT INTO `crud` (`id`, `firstname`, `fathername`, `gfathername`, `description`, `fav_color`) VALUES
(5, 'kebede', 'hut', 'sdfgsdg', 'sdffsgfsg', 'green'),
(6, 'ewtfsdf', 'sdfg', 'sdfgsdg', 'sdfadsf', 'green'),
(7, 'ewtfsdffg', 'sdfg', 'sdfgsdg', 'sdfadsf', 'green'),
(8, 'fa', 'asdf', 'sdf', 'ert', 'red'),
(9, 'ewtggg', 'sdfggsdgf', 'sdfgsd', 'sdf', 'green');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custm_id` int(11) NOT NULL,
  `customer_name` varchar(25) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(25) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custm_id`, `customer_name`, `contact`, `address`, `email`, `password`, `admin_id`) VALUES
(26, 'ErmiasMolla13', '0962146750', 'addis abeba', 'erma13molla@gmail.com', '$2b$10$GHQQGHS9MawhgtaZll2zHuLaYRXTYmTqvB/Y8Cz1bSk8u1nzGWTOG', 0),
(28, 'Ermias Molla', '0962146750', 'awash', 'ermiasmolla78@gmail.com', '$2b$10$IVJ2O7CvCln3W4YN5t.Q8OEVyizDG.dzXrKqKnJOeLNIxEzZCBlWW', 0),
(29, 'Ermias Molla', '0962146750', 'addis abeba', 'ermiasmolla785@gmail.com', '$2b$10$TZRGaau158p0avXlTgnyCOAN0j4cWohVq0/5eOG5ODXKHR4n0Je2.', 0),
(30, 'test1', '0962146750', 'adiss', 'ermias@gmail.com', '$2b$10$kX32EfpZSKFIJqO78snQuefEfV/PFO.ISPmI3g8YQT1adbchNEBEW', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_credential`
--

CREATE TABLE `customer_credential` (
  `credential_id` int(11) NOT NULL,
  `credential_name` varchar(30) DEFAULT NULL,
  `file_upload_path` varchar(255) NOT NULL,
  `custm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_credential`
--

INSERT INTO `customer_credential` (`credential_id`, `credential_name`, `file_upload_path`, `custm_id`) VALUES
(3, 'National ID', 'src/hp/id', 1);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL,
  `owner_name` varchar(25) NOT NULL,
  `address` varchar(25) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(250) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_id`, `owner_name`, `address`, `contact`, `email`, `password`, `admin_id`) VALUES
(9, 'test1', 'kk22212121', '0962146750', 'test1@gmail.com', '$2b$10$5/uh0VT73JZGSMqA3ZSVi.05fbAf24bvcgw886F6JpFwEaVVKBVyu', 0),
(10, 'ayal', 'dire', '0968790974', 'tes@gmail.com', '$2b$10$5/jmlWNnaCaP/xzLxzuh7OrB6QWaEMQrI57WViqEFNVW0dGFEjFju', 0),
(13, 'Ermias Molla', 'addis abeba', '0962146750', 'ermiasmolla78@gmail.com', '$2b$10$Mo0gRRCtjOOonoIMXmbdrOdPGLAh9qIUuEXG2emWK.PbIsYZw2dtm', 0);

-- --------------------------------------------------------

--
-- Table structure for table `owner_credential`
--

CREATE TABLE `owner_credential` (
  `credential_id` int(11) NOT NULL,
  `credential_name` varchar(30) DEFAULT NULL,
  `file_upload_path` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner_credential`
--

INSERT INTO `owner_credential` (`credential_id`, `credential_name`, `file_upload_path`, `owner_id`) VALUES
(1, 'CBE Bank', 'cbe/file/id', 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_amount` int(10) NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `custm_id` int(11) DEFAULT NULL,
  `rent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_amount`, `payment_date`, `custm_id`, `rent_id`) VALUES
(1, 200, '2024-04-02 17:46:53', NULL, NULL),
(2, 234, '2024-04-02 17:47:25', NULL, NULL),
(3, 99, '2025-04-03 17:47:39', NULL, NULL),
(4, 345, '2025-04-11 17:48:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL,
  `rent_date` date NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `car_id` int(11) NOT NULL,
  `custm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`rent_id`, `rent_date`, `pickup_date`, `return_date`, `customer_name`, `email`, `car_id`, `custm_id`) VALUES
(43, '2025-06-05', '0000-00-00', '2025-06-08', 'bante', 'test1@gmail.com', 0, 0),
(44, '2025-06-27', '0000-00-00', '2025-06-30', 'ermias molla', 'erma13molla@gmail.com', 47, 0),
(45, '2025-06-27', '0000-00-00', '2025-06-30', 'ermias molla', 'erma13molla@gmail.com', 47, 0),
(46, '2025-06-27', '0000-00-00', '2025-06-30', 'ermias molla', 'erma13molla@gmail.com', 47, 0),
(47, '2025-06-27', '0000-00-00', '2025-06-30', 'itsme', 'sinqe@gmail.com', 42, 0),
(48, '2025-06-27', '0000-00-00', '2025-07-09', 'itsme', 'sinqe@gmail.com', 42, 0),
(49, '2025-06-27', '0000-00-00', '2025-06-30', 'itsme', 'sinqe@gmail.com', 43, 0),
(50, '2025-06-29', '0000-00-00', '2025-07-02', 'testdate', 'testdate@gmail.com', 50, 0),
(51, '2025-06-29', '2025-06-30', '2025-07-02', 'testdate2', 'testdate2@gmail.com', 44, 0),
(52, '2025-06-29', '2025-06-30', '2025-07-02', 'testdate3', 'testdate3@gmail.com', 45, 0),
(53, '2025-07-06', '2025-07-07', '2025-07-09', 'hillina', 'hiluu@gmail.com', 42, 0),
(54, '2025-09-08', '2025-09-09', '2025-09-11', 'tewabech', 'tewa@gmail.com', 53, 0),
(55, '2025-09-08', '2025-09-09', '2025-09-11', 'tewabech', 'tewa@gmail.com', 53, 0),
(56, '2025-10-04', '2025-10-05', '2025-10-07', 'betsegaw', 'be@gmail.com', 42, 0),
(57, '2025-10-05', '2025-10-06', '2025-10-08', 'dagim', 'd@gmail.com', 43, 0),
(58, '2025-10-15', '2025-10-16', '2025-10-18', 'ermias', 'sinqe@gmail.com', 48, 0),
(59, '2025-10-15', '2025-10-16', '2025-10-18', 'ermiasm', 'ermiasmolla785@gmail.com', 51, 0);

-- --------------------------------------------------------

--
-- Table structure for table `test_car`
--

CREATE TABLE `test_car` (
  `id` int(11) NOT NULL,
  `car_code` varchar(100) NOT NULL,
  `make` varchar(15) NOT NULL,
  `model` varchar(20) NOT NULL,
  `rating` float NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `image` varchar(150) NOT NULL,
  `year` int(5) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `car_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `CAR_ID` int(11) NOT NULL,
  `MAKE` varchar(15) NOT NULL,
  `MODEL` varchar(20) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `PRICE` double NOT NULL,
  `IMAGE` varchar(150) NOT NULL,
  `MODEL_YEAR` int(5) NOT NULL,
  `RATE` float DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `CAR_TYPE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`CAR_ID`, `MAKE`, `MODEL`, `DESCRIPTION`, `PRICE`, `IMAGE`, `MODEL_YEAR`, `RATE`, `owner_id`, `CAR_TYPE_ID`) VALUES
(1, 'dfg', 'sag', 'sagg', 2000, 'z', 34, 456, 1, 3),
(2, 'TOYOTA 2', 'YARIS 4', 'good cadsgsgr', 2020, 'image path', 2020, 5, 90, 33),
(3, 'TOYOTA 2', 'YARIS 4', 'good cadsgsgr', 2020, 'image path', 2020, 5, 90, 33),
(4, 'TOYOTA 2667', 'YARIS 43', 'good cadsgsgr', 2020, 'image path', 2025, 5, 9, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin2`
--
ALTER TABLE `admin2`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_ibfk_1` (`owner_id`);

--
-- Indexes for table `car_review`
--
ALTER TABLE `car_review`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `custm_id` (`custm_id`,`car_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `crud`
--
ALTER TABLE `crud`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custm_id`);

--
-- Indexes for table `customer_credential`
--
ALTER TABLE `customer_credential`
  ADD PRIMARY KEY (`credential_id`),
  ADD UNIQUE KEY `custm_id` (`custm_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `owner_credential`
--
ALTER TABLE `owner_credential`
  ADD PRIMARY KEY (`credential_id`),
  ADD UNIQUE KEY `owner_id` (`owner_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `custm_id` (`custm_id`,`rent_id`),
  ADD KEY `rent_id` (`rent_id`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_id`);

--
-- Indexes for table `test_car`
--
ALTER TABLE `test_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`CAR_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `admin2`
--
ALTER TABLE `admin2`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `car_review`
--
ALTER TABLE `car_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `crud`
--
ALTER TABLE `crud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `custm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `customer_credential`
--
ALTER TABLE `customer_credential`
  MODIFY `credential_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `owner_credential`
--
ALTER TABLE `owner_credential`
  MODIFY `credential_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `test_car`
--
ALTER TABLE `test_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `CAR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_review`
--
ALTER TABLE `car_review`
  ADD CONSTRAINT `car_review_ibfk_1` FOREIGN KEY (`custm_id`) REFERENCES `customer` (`custm_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`custm_id`) REFERENCES `customer` (`custm_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`rent_id`) REFERENCES `rent` (`rent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
