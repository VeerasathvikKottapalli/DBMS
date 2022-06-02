-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 10:14 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'satvik', 'veerasatvik@gmail.com', 'padma123');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Adidas'),
(2, 'Nike'),
(3, 'Everlast'),
(4, 'Carlton'),
(5, 'Yonex'),
(6,'puma');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 1),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(162, 1, '::1', 28, 1),
(163, 2, '::1', 28, 1),
(164, 1, '::1', 26, 1),
(165, 5, '::1', 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Cricket'),
(2, 'Badminton'),
(3, 'Football');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(1, 'veerasatvik@gmail.com'),
(2, 'jaitravineth@gmail.com'),
(3, 'reddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'jaitra', 'jaitravineth@gmail.com', 'gangavathi', 'Bangalore', 'Karnataka', 560074, 'visa', '4321 2345 6788 7654', '12/90', 3, 77000, 134),
(2, 26, 'santosh', 'santosh@gmail.com', 'tumkur', 'tumkur', 'karnataka', 560061, 'master', '1244566778990000', '12/23', 1, 5000, 125),
(3, 26, 'santosh', 'santosh@gmail.com', 'tumkur', 'tumkur', 'karnataka', 560061, 'master', '1244566778990000', '12/23', 3, 18000, 125),
(4, 26, 'santosh', 'santosh@gmail.com', 'tumkur', 'tumkur', 'karnataka', 560061, 'master', '1244566778990000', '12/23', 1, 3500, 125);
-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 1, 1, 5000),
(92, 3, 1, 1, 500),
(93, 4, 1, 1, 500),
(94, 4, 2, 1, 35000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`) VALUES
(1, 1, 1, 'Adidas Ball', 500, 'Good quality with two-piece construction Made with alum tanned leather Comprises of molded cork filling Apt for use on a grass surface Weighs 156 gm with a diameter of 7.3 cm Available in a set of two in red color Ideal for practice and training', 'adidas ball.jpeg'),
(2, 1, 1, 'Adidas Bat', 35000, 'iphone 5s', 'adidas bat.png'),
(3, 1, 3, 'everlast cricket bat', 4000, 'ipad apple brand', 'everlast cricket bat.png'),
(4, 1, 2, 'Nike Cricket Ball', 10000, 'Apple iPhone ', 'nike ball.png'),
(5, 1, 5, 'Yonex Cricket Ball', 30000, 'samsung ipad', 'yonex ball.jpg'),
(6, 1, 5, 'Yonex Cricket Bat', 25000, 'samsung Black combination Laptop', 'yonex cricket bat.jpg'),
(7, 1, 5, 'Yonex Cricket Shoes', 12000, 'Laptop Hp Pavillion', 'Yonex Cricket Shoes.png'),
(8, 1, 5, 'yonex cricket gloves', 32000, 'Sony Mobile', 'yonex cricket gloves.jpg'),
(9, 2,6,'puma shoes',5000,'sports','pumashoes.jpg'),
(10, 2, 0, 'Carlton Jersey', 1200, 'red dress for girls', 'carlton badminton jersey.jpg'),
(11, 2, 4, 'Carlton Blade\r\n', 1400, 'Blue dress', 'carlton blade.jpg'),
(12, 2, 4, 'Carlton Shoes', 1500, 'ladies casual summer two colors pleted', 'carlton badminton shoes.jpg'),
(13, 2, 4, 'Carlton Racquet', 1000, 'girls dress', 'carlton raquet.jpg'),
(14, 2, 4, 'Carlton Shuttlecork', 1200, 'girl dress', 'carlton shuttlecock.jpg'),
(15, 2, 4, 'Carlton Elite', 1500, 'girl dress', 'carlton elite.png'),
(16, 3, 4, 'Carlton Football', 6000, '2012-Winter-Sweater-for-Men-for-better-outlook', 'carlton football.jpg'),
(17, 3, 4, 'Carlton Cleats', 1000, 'gents formal look', 'carlton cleats.jpg'),
(19, 3, 4, 'Carlton Jersey\r\n', 1600, 'ad', 'carlton jersey.jpg'),
(20, 3, 4, 'Carlton Shinguard', 3000, 'jg', 'carlton shin guards.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'jaitra', 'vineth', 'jaitravineth@gmail.com', 'jaitra', '9448121558', 'gangavathi', 'bangalore'),
(14,'ujwal','D','ujwalD@gmail.com','ujwal','8763572910','hassan','bangalore'),
(15, 'reddy', 'g', 'reddy@gmail.com', 'golla', '5364872763', 'kadapa', 'rayalaseema'),
(16, 'vedant', 'b', 'vedant@gmail.com', '1BI19CS182', '9877454334', 'hospet', 'koppal'),
(19, 'abhishek', 'b', 'abhishekb@gmail.com', 'abhi@123', '9871236534', 'bangalore', 'hassan'),
(21, 'praveen', 'm', 'praveenm@gmail.com', 'praveen@14', '1234545662', 'bangalore', 'kumbalagodu'),
(22, 'tejes', 'v', 'tejes@gmail.com', 'teja@2468', '9877654334', 'hsr layout', 'bangalore'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'hemareddy@123', '9876543234', 'akashya nagar', 'bangalore'),
(24, 'raja', 'm', 'rajam@gmail.com', 'raja@173', '9735688928', 'mg road', 'mangalore'),
(25, 'goutam', 'roy', 'goutam@gmail.com', 'roy@126', '9535688928', 'jc road', 'bangalore'),
(26, 'santosh', 'J', 'sanntosh@gmail.com', 'santosh', '8971025667', 'tumkur', 'tumkur'),
(27, 'sudeep', 'kevin', 'sudeepkevin@gmail.com', 'sudeepkevin', '8431335659', 'Gummaiah layout', 'mangalore'),
(28, 'hariteja', 's', 'hariteja@gmail.com', 'hariteja', '9739032456', 'Gundamma Layout', 'hydrabad');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'jaitra', 'vineth', 'jaitravineth@gmail.com', 'jaitra', '9448121558', 'gangavathi', 'bangalore'),
(14,'ujwal','D','ujwalD@gmail.com','ujwal','8763572910','hassan','bangalore'),
(15, 'reddy', 'g', 'reddy@gmail.com', 'golla', '5364872763', 'kadapa', 'rayalaseema'),
(16, 'vedant', 'b', 'vedant@gmail.com', '1BI19CS182', '9877454334', 'hospet', 'koppal'),
(19, 'abhishek', 'b', 'abhishekb@gmail.com', 'abhi@123', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'v', 'pramod@gmail.com', 'pramod353', '9767645653', 'kolar', 'bangalore'),
(21, 'praveen', 'm', 'praveenm@gmail.com', 'praveen@14', '1234545662', 'bangalore', 'kumbalagodu'),
(22, 'tejes', 'v', 'tejes@gmail.com', 'teja@2468', '9877654334', 'hsr layout', 'bangalore'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'hemareddy@123', '9876543234', 'akashya nagar', 'bangalore'),
(24, 'raja', 'm', 'rajam@gmail.com', 'raja@173', '9735688928', 'mg road', 'mangalore'),
(25, 'goutam', 'roy', 'goutam@gmail.com', 'roy@126', '9535688928', 'jc road', 'bangalore'),
(26, 'santosh', 'J', 'sanntosh@gmail.com', 'santosh', '8971025667', 'tumkur', 'tumkur'),
(27, 'sudeep', 'kevin', 'sudeepkevin@gmail.com', 'sudeepkevin', '8431335659', 'Gummaiah layout', 'mangalore'),
(28, 'hariteja', 's', 'hariteja@gmail.com', 'hariteja', '9739032456', 'Gundamma Layout', 'hydrabad');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `payment` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
