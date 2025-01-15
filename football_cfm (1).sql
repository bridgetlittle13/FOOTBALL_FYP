-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2025 at 03:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football_cfm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_ID` int(5) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(30) NOT NULL,
  `admin_phone` int(8) NOT NULL,
  `admin_password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='admin';

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_ID`, `admin_name`, `admin_email`, `admin_phone`, `admin_password`) VALUES
(10000, 'Jenny Ying', 'jenny_ying@rp.edu.sg', 10000000, 'JenYin10000'),
(10001, 'Alvin Sing', 'alvinsing@myrp.edu.sg', 98901234, 'alvin_sing@1996'),
(10002, 'Spencer Lee Wei Hang', 'spencerleeweihang@myrp.edu.sg', 99012345, 'spencelwh1234');

-- --------------------------------------------------------

--
-- Table structure for table `cashback`
--

CREATE TABLE `cashback` (
  `cashback_ID` int(8) NOT NULL,
  `members_ID` int(8) NOT NULL,
  `members_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cashback_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cashback`
--

INSERT INTO `cashback` (`cashback_ID`, `members_ID`, `members_name`, `email`, `cashback_amount`) VALUES
(1, 1, 'James Huang', '2392@myrp.edu.sg', 20.56),
(2, 4, 'Bernard Lim Jun Jie', '1128@myrp.edu.sg', 50),
(4, 10, 'John Tan', '24000000@myrp.edu.sg', 100);

-- --------------------------------------------------------

--
-- Table structure for table `incentive_category`
--

CREATE TABLE `incentive_category` (
  `category_ID` varchar(4) NOT NULL,
  `tier` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='incentive cat';

--
-- Dumping data for table `incentive_category`
--

INSERT INTO `incentive_category` (`category_ID`, `tier`) VALUES
('C001', 'Bronze'),
('C002', 'Silver'),
('C003', 'Gold'),
('C004', 'Platinium');

-- --------------------------------------------------------

--
-- Table structure for table `incentive_program`
--

CREATE TABLE `incentive_program` (
  `incentive_ID` varchar(4) NOT NULL,
  `description` text NOT NULL,
  `discount_rate` int(2) NOT NULL,
  `cashback_rate` int(2) NOT NULL,
  `membership_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='incentives';

--
-- Dumping data for table `incentive_program`
--

INSERT INTO `incentive_program` (`incentive_ID`, `description`, `discount_rate`, `cashback_rate`, `membership_type`) VALUES
('C002', '1 pair of personalized socks on birthday month.\r\nFree personalized headband with $25 spent in a single receipt', 5, 2, 'Silver'),
('C003', 'Personalized water bottle with $50 spent in a single receipt\r\nFree redeemable duffel bag (Claim once)', 5, 2, 'Gold'),
('C000', '1 pair of personalized socks with $15 spent in a single receipt', 5, 2, 'Bronze'),
('C004', '', 0, 0, ''),
('C004', 'Free seasonal ticket (Any match of their choice during game season)\r\n1 signed jersey with $100 spent in a single receipt \r\nPersonalised water bottle on birthday month \r\nFree personalised headband (Claim once)\r\n', 10, 5, 'Platinum');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `password` varchar(16) NOT NULL,
  `student_email` varchar(30) NOT NULL,
  `save_password` tinyint(1) NOT NULL,
  `AdminID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='login';

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `password`, `student_email`, `save_password`, `AdminID`) VALUES
(1, 'JohTan24000', '2400000@myrp.edu.sg', 0, 0),
(2, 'stupidass', '22013272@myrp.edu.sg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `match_info`
--

CREATE TABLE `match_info` (
  `player_ID` varchar(4) NOT NULL,
  `match_time` time NOT NULL,
  `player_name` varchar(100) NOT NULL,
  `match_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='match information';

--
-- Dumping data for table `match_info`
--

INSERT INTO `match_info` (`player_ID`, `match_time`, `player_name`, `match_date`) VALUES
('1101', '17:00:00', 'James Huang', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `members_ID` int(8) NOT NULL,
  `members_role` varchar(10) NOT NULL,
  `members_name` varchar(100) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `player_ID` int(4) DEFAULT NULL,
  `student_email` varchar(30) NOT NULL,
  `student_phone` int(8) NOT NULL,
  `membership_type` varchar(30) DEFAULT NULL,
  `member_stars` int(100) DEFAULT NULL,
  `upcoming_event` varchar(1000) DEFAULT NULL,
  `cashback_amount` int(2) NOT NULL,
  `cashback_expirydate` date NOT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='main table';

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`members_ID`, `members_role`, `members_name`, `player_name`, `player_ID`, `student_email`, `student_phone`, `membership_type`, `member_stars`, `upcoming_event`, `cashback_amount`, `cashback_expirydate`, `password`) VALUES
(1, 'member', 'James Huang', NULL, NULL, '1101@myrp.edu.sg', 90000000, 'Bronze', 175, NULL, 10, '2024-12-21', ''),
(2, 'member', 'Justin Ang', NULL, NULL, '1102@myrp.edu.sg', 91234567, 'Bronze', 168, NULL, 15, '2025-02-14', ''),
(3, 'player', 'Teo En Ming', 'Teo En Ming', 1116, '1116@myrp.edu.sg', 92345678, 'SIlver', 287, 'POL-ITE Match', 25, '2025-04-19', ''),
(4, 'member', 'Bernard Lim Jun Jie', NULL, NULL, '1128@myrp.edu.sg', 93456789, 'SIlver', 493, NULL, 26, '2025-04-30', ''),
(6, 'player', 'Marcus Neo Kai Ming', 'Marcus Neo Kai Ming', 1599, '1599@myrp.edu.sg', 94567890, 'Gold', 687, 'POL-ITE Match', 19, '2025-05-04', ''),
(7, 'player', 'Derrick Chua Le Jing', 'Derrick Chua Le Jing', 1028, '1028@myrp.edu.sg', 95678901, 'Gold', 744, 'POL-ITE Match', 26, '2025-02-14', ''),
(8, 'player', 'Anthony Ma', 'Anthony Ma', 1123, '1123@myrp.edu.sg', 96789012, 'Platinum', 866, 'POL-ITE Match', 23, '2025-06-12', ''),
(9, 'member', 'Gary Kim', NULL, NULL, '1863@myrp.edu.sg', 97890123, 'Platinum', 1267, NULL, 37, '2025-08-14', ''),
(10, 'member', 'John Tan', 'Harold Yeo', 1106, '24000000@myrp.edu.sg', 62459081, 'Gold', 650, 'NULL', 100, '2025-02-25', 'JohTan24000'),
(12, 'member', 'Bryce Chua', NULL, NULL, '1848@myrp.edu.sg', 90123456, 'Bronze', NULL, NULL, 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_ID` varchar(8) NOT NULL,
  `member_ID` varchar(8) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='payment';

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_ID`, `member_ID`, `amount`, `payment_date`, `payment_type`) VALUES
('P001', '1', 35.00, '0000-00-00', 'Visa');

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `creditcard_number` varchar(16) NOT NULL,
  `creditcard_cvv` int(3) NOT NULL,
  `member_ID` varchar(8) NOT NULL,
  `product_ID` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='payment information';

--
-- Dumping data for table `payment_info`
--

INSERT INTO `payment_info` (`creditcard_number`, `creditcard_cvv`, `member_ID`, `product_ID`) VALUES
('4600-3500-2000', 134, '1', '80000000');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `player_name` varchar(100) NOT NULL,
  `player_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_name`, `player_ID`) VALUES
('James Huang', 1101),
('William Tan', 1102),
('David Jones', 1103),
('Mark Malone', 1104),
('Matthew Tam', 1105),
('Harold Yeo', 1106),
('Kevin Wilson', 1107),
('Randall Teo', 1108),
('Alvin Chua', 1109),
('Aaron Fang', 1110),
('Christopher Lim', 1111),
('David Lai', 1201),
('William Chen', 1202),
('Philip Chan', 1203),
('Lawrence Bai', 1204),
('Jeremy Lu', 1205),
('Harold Han', 1206),
('Roger Yin', 1207),
('Oliver Ye', 1208),
('John Koh', 1209),
('George Cheng', 1210),
('Timothy Fang', 1211);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheule_ID` int(8) NOT NULL,
  `event_name` text NOT NULL,
  `event_date` date NOT NULL,
  `event_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='schedule';

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheule_ID`, `event_name`, `event_date`, `event_type`) VALUES
(5000, 'General Meeting', '2025-01-01', 'Meeting');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(11) NOT NULL,
  `student_email` varchar(30) NOT NULL,
  `password` varchar(16) NOT NULL,
  `members_name` varchar(100) NOT NULL,
  `promo_email` tinyint(1) NOT NULL,
  `player_choice` tinyint(1) NOT NULL,
  `student_phone` int(8) NOT NULL,
  `dateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='signup';

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `student_email`, `password`, `members_name`, `promo_email`, `player_choice`, `student_phone`, `dateOfBirth`) VALUES
(1, '22022989@myrp.edu.sg', 'stupidass', 'stupididoit', 0, 1, 6523, '2000-12-20'),
(2, '22013272@myrp.edu.sg', 'stupidass', 'DrinkWota', 0, 1, 6523, '1999-12-01'),
(6, '22013272@myrp.edu.sg', '$2y$10$3L.PvhjJ9', 'DrinkWota', 0, 1, 6523, '1999-12-01'),
(7, '1234@myrp.edu.sg', '$2y$10$kk3buWFmF', 'jen', 0, 1, 6901, '2017-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `store_item`
--

CREATE TABLE `store_item` (
  `product_ID` int(6) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_category` text NOT NULL,
  `product_quantity` int(100) NOT NULL,
  `product_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='store';

--
-- Dumping data for table `store_item`
--

INSERT INTO `store_item` (`product_ID`, `product_name`, `product_price`, `product_category`, `product_quantity`, `product_desc`) VALUES
(80000000, 'test product', 20.00, 'Apparel', 5, 'Testing product'),
(600010, 'Jersey', 15.00, 'Apparels', 100, 'Gear up with this lightweight, breathable football jersey, perfect for players and fans. Its moisture-wicking fabric keeps you cool and dry, while the athletic fit ensures comfort and mobility. Featuring durable stitching and bold team colors, this jersey is built to perform on and off the field. Machine washable for easy care.\r\n\r\nMaterial: Lightweight, breathable, and moisture-wicking polyester blend\r\n\r\nFit: Athletic cut for unrestricted movement\r\n\r\nDurability: Reinforced seams for long-lasting use\r\n\r\nStyle: Bold team colors and customizable name/number options\r\n\r\nCare: Machine washable for easy maintenance'),
(600011, 'Socks', 5.00, 'Footwear', 300, 'Stay comfortable on the field with these premium football socks. Made from breathable, moisture-wicking fabric, they keep your feet dry and supported during every match. Reinforced heels and toes add durability, while the snug fit ensures they stay in place. Perfect for players who demand performance and comfort.'),
(600069, 'Sports Bag', 25.00, 'Accessories', 100, 'Carry your gear in style with this durable sports bag. Designed with spacious compartments and water-resistant fabric, it keeps your essentials organized and protected. Featuring padded straps for comfort and a sleek, sporty design, it\'s perfect for workouts, matches, or travel.'),
(600050, 'Sports Drink (Prime)', 3.00, 'Drinks', 300, 'Fuel your performance with Prime Sports Drink, packed with electrolytes and essential nutrients to keep you hydrated and energized. With a refreshing taste and zero artificial flavors, it’s perfect for workouts, games, or staying active. Rehydrate, recharge, and perform at your peak!'),
(600025, 'Water Bottle', 8.00, 'Accessories', 80, 'Stay hydrated with this durable sports water bottle. Made from BPA-free materials, it features a leak-proof design and easy-grip exterior. The wide mouth allows for quick refills, and the ergonomic spout ensures smooth sipping on the go. Perfect for workouts, sports, and everyday use!'),
(600045, 'Cleats', 18.00, 'Footwear', 100, 'Dominate the field with these high-performance football cleats. Designed for speed and stability, they feature a lightweight, durable build and a molded sole for superior traction. The snug fit and cushioned interior ensure all-day comfort, making them perfect for every game or practice.'),
(60035, 'Headband', 2.00, 'Accessories', 60, 'Stay focused with this comfortable sports headband. Made from soft, stretchy, moisture-wicking fabric, it keeps sweat out of your eyes during intense workouts or matches. Lightweight and secure, it’s the perfect accessory for athletes on the move.'),
(600089, 'Shorts', 11.00, 'Apparels', 100, 'Stay cool and comfortable with these lightweight sports shorts. Made from breathable, moisture-wicking fabric, they offer a flexible fit for unrestricted movement. Perfect for workouts, games, or casual wear, these shorts are built for performance and style.'),
(600075, 'Dri-Fit Shirts', 10.00, 'Apparels', 100, 'Stay dry and comfortable with this performance Dri-Fit shirt. Crafted from breathable, moisture-wicking fabric, it keeps sweat at bay while providing a lightweight, flexible fit. Perfect for workouts, sports, or everyday wear, it’s designed to keep you moving in style.'),
(600078, 'Protein Bar', 1.50, 'Food', 700, 'Fuel your body with this delicious protein bar, packed with high-quality protein and essential nutrients. Perfect for post-workout recovery or a quick snack, it offers a balance of energy and muscle support without the added sugars. Convenient, tasty, and designed for your active lifestyle.'),
(800001, 'Ticket', 8.00, 'Tickets', 500, 'Experience the excitement live with this exclusive match ticket. Gain access to all the action, from thrilling plays to unforgettable moments. Perfect for fans who want to be part of the game, this ticket ensures you don\'t miss a minute of the action.'),
(600047, 'Protein Shake', 2.50, 'Drinks', 100, 'Boost your recovery with this delicious protein shake, packed with high-quality protein to support muscle growth and repair. With a smooth, creamy texture and great taste, it\'s the perfect post-workout drink or snack to fuel your active lifestyle. Convenient and nutritious, anytime, anywhere.');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_store`
--

CREATE TABLE `ticket_store` (
  `ticket_price` decimal(10,2) NOT NULL,
  `ticket_details` mediumtext NOT NULL,
  `ticket_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ticket';

--
-- Dumping data for table `ticket_store`
--

INSERT INTO `ticket_store` (`ticket_price`, `ticket_details`, `ticket_ID`) VALUES
(10.99, 'TEAM 1 VS TEAM 2', 1112);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_ID` varchar(11) NOT NULL,
  `member_ID` varchar(11) NOT NULL,
  `product_ID` varchar(8) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` int(100) NOT NULL,
  `cashback_used` int(2) NOT NULL,
  `discount_applied` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='transaction';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `cashback`
--
ALTER TABLE `cashback`
  ADD PRIMARY KEY (`cashback_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`members_ID`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10003;

--
-- AUTO_INCREMENT for table `cashback`
--
ALTER TABLE `cashback`
  MODIFY `cashback_ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `members_ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
