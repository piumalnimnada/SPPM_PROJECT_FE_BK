-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2022 at 02:06 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `Address` varchar(500) NOT NULL,
  `Town` varchar(100) NOT NULL,
  `State` varchar(50) NOT NULL,
  `PostCode` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Notes` varchar(500) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`id`, `FirstName`, `LastName`, `CompanyName`, `Address`, `Town`, `State`, `PostCode`, `Email`, `Phone`, `Notes`, `user_id`) VALUES
(3, 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string', 1),
(4, 'shakila piumal nimnada', 'piumalnimnada@gmail.com', 'sfd', 'Kahanda kanada,', 'Imaduwa', 'southern', '80650', 'piumalnimnada@gmail.com', '0773066026', 'scasccad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `salePrice` double NOT NULL,
  `discount` double NOT NULL,
  `pictures` varchar(100) NOT NULL,
  `shortDetails` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `newPro` tinyint(1) NOT NULL,
  `sale` tinyint(1) NOT NULL,
  `state` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `stock`, `salePrice`, `discount`, `pictures`, `shortDetails`, `description`, `brand`, `newPro`, `sale`, `state`, `category`) VALUES
(3, 'cocount cup', 750, 15, 800, 10, 'assets/images/products/cocount-cup.jpg', 'Size-10 cm*6 cm\r\nMateriel-coconut shell\r\nMade-Hand made\r\nuse-Drinking purpose\r\nVolume-170 ml\r\nGift for-Your beloved ones', '\r\nSri Lankan people use coconut shell for drinking purpose in long ago.\r\nThis cup is very beautiful,artistic,Eco friendly and good for your health.\r\nGood for gift for your elderly parents.\r\n\r\nSri Lankan artists use coconut shells for many kinds of handicrafts.\r\nThey are very beautiful hard working hand works of Sri Lankan artists.', 'Lion Kithul Wood', 1, 1, 'small', 'kitchen'),
(4, 'coconut spoon', 700, 20, 750, 20, 'assets/images/products/coconut-spoon.jpg', '100% Brand New And High Quality ECO Friendly.\r\n\r\nMade Of High Quality Wooden And High Quality Coconut Shell.\r\n\r\nColor: As Shown As Picture\r\nSize : As Shown As Picture', '\r\nThese Spoons Are Made With Coconut Shell And Have Wooden Handles Lacquered By Hand Using Traditional Sri Lankan Methods.\r\n\r\nAnd no two are the same due to their handmade nature. Often used in Sri Lanka when making curries, placed in individual spice bowls to add flavors to the curry while cooking. They can also be used as little serving spoons or dessert spoons. A charming rustic addition to your kitchen!\r\n100% NATURAL- Organic And Biodegradable Products Are Used. These Little Pieces Of Tropical Paradise Make A Great Addition To Your Kitchen.', 'Lion Kithul Wood', 1, 1, 'Large', 'kitchen'),
(5, 'Pen holder', 800, 40, 850, 10, 'assets/images/products/Pen-holder.jpg', 'Ideal for organizing your desk and making your workspace more efficient\r\nThe cube-shaped interior will keep your office supplies upright and easily accessible\r\nThis set of 2 desktop pen & stationery holders is made of a dark, natural-grain wood\r\nMultifunctional in their use, these cups are ideal for holding pens, pencils, scissors, small notepads and stationery sets, and other office supplies\r\nApproximate Dimensions (each cup, in inches): 4 W X 4.75 H X 4 D', 'These stylish pen and pencil holder cups will keep your desktop clutter-free. The sturdy, natural brown wood structure will keep your office supplies together and the cube-shaped interior can hold a variety of pens, pencils, highlighters, scissors, and other office supplies. This wooden office supplies holder will keep your workspace efficiently organized.', 'Lion Kithul Wood', 1, 1, 'small', 'ornaments'),
(6, 'jewelry box', 2000, 15, 2500, 100, 'assets/images/products/jewelry-box.jpg\r\n', 'Product Parameters:\r\nProduct Size (Approx.):\r\nOuter Diameter: 13cm * 12cm * 5.4cm\r\nInner Diameter: 12cm * 9.5cm * 4.7cm\r\nProduct Material: Wood', 'This  wooden jewelry box  beautiful iron accents and hinged lid. It measures 5 inches long, 3 inches tall, and 3.1 inches deep and is designed to resemble an authentic treasure chest in a miniature form that you can hold in your hand. It is both decorative and functional and is the perfect size for storing jewelry, coins, or other small treasure! Makes a lovely decoration for a nautical themed event, bedroom, or beach home', 'Lion Kithul Wood', 1, 1, 'Medium', 'ornaments'),
(7, 'table', 6000, 2, 6500, 200, 'assets/images/products/table.jpg\r\n', 'The thickness of the wood is approximately 4.5cm.\r\n\r\n\r\nYou can choose a wax finish to suit your desired colour scheme.\r\n\r\n\r\nEach board is carefully selected and contains its own characteristics, so every custom order we create will have their own markings and it will be unique.\r\nThe picture is a very large customer order which is finished in Dark Oak Jacobean wax.\r\nSizes of the tables are approx and can differ between 1-2cm due to the wood.', 'Rustic Table Wooden Hairpin Legs Handmade Timber Custom Bespoke', 'Lion Kithul Wood', 1, 1, 'Medium', 'ornaments'),
(8, 'Mini table', 4500, 5, 5000, 300, 'assets/images/products/Mini-table.jpg\r\n', 'Size:- 110 cm x 66 cm x 36 cm ( L X W X H ) CM Approx.\r\nWeight:- 15 kg. Approx.', 'Classic High quality Handcrafted Solid Wood Mini Table with carving leg', 'Lion Kithul Wood', 1, 1, 'small', 'ornaments'),
(9, 'bath store box', 4000, 8, 4500, 100, 'assets/images/products/bath-store-box.jpg', 'Assembly Assembled\r\nProduct Dimensions L 23cm x D 18cm x H 12cm (large one)\r\nBrand Dunelm\r\nCare Instructions Wipe clean with a soft cloth\r\nComposition 100% Paper\r\nPack Contents 3 x Baskets', 'Our storage baskets bring the fun back into organizing, giving you full creative freedom. Place one in your bedroom as a stylish yet practical bedroom accessory, use it as a shelf basket or as a make-up organizer on your dressing table, or even use it in the nursery to store your little one’s toys. Handmade by skilled craftsmen guaranteeing three lightweight yet durable baskets that are easy to hold and practical. The perfect storage assistant in your home or office and a great gift option for your friends or family.\r\n\r\n', 'Lion Kithul wood', 1, 1, 'Medium', 'bathware'),
(10, 'coconut-tray', 2500, 15, 3000, 100, 'assets/images/products/coconut-tray.jpg\r\n', '3 DIFFERENT SIZE TRAY SET – this comes in pack of 3 trays, when not in use this can be stacked together to save space.\r\n\r\nPRODUCT DIEMSTION: Large tray 43 x 30 x5cm medium 40 x 28 x 5 cm small 38 x 25.5 x 5cm.\r\n\r\nEASY TO CLEAN - Simply wipe with a damp cloth.', 'MULTIFUNCTIONAL TRAY SET – this easy to use multi-functional serving tray perfect for carrying food, drinks, serving breakfast in bed or just using as a storage tray.\r\n\r\nMADE FROM 100%NATURAL COCONUT- made from naturally durable eco friendly bamboo material, trays are lightweight and portable. Integrated handles offer a secure grip for comfortable carrying.\r\n\r\n3 DIFFERENT SIZE TRAY SET – this comes in pack of 3 trays, when not i', 'Lion Kithul Wood', 1, 1, 'Medium', 'kitchen'),
(11, 'soap box', 750, 20, 800, 10, 'assets/images/products/soap-box.jpg', 'Shape Uno: 11.5 x 9 x 2.5cm\r\n\r\nShape Dos: 11.5 x 8 x 2cm\r\n\r\nShape Tres: 12 x 8 x 2.5cm\r\n\r\nShape Cuatro: 10 x 7 x 1.7cm\r\n\r\nWood: Bamboo', 'Our beautiful Kithul wooden soap dishes are perfect for any soap to hold! They are environmentally friendly and have our unique lion kithul logo engraved in them.', 'Lion Kithul wood', 1, 1, 'small', 'bathware'),
(12, 'storage box', 2000, 15, 2500, 100, 'assets/images/products/storage-box.jpg', 'Size- 28cm  x  21cmx  13.5cm', 'Wooden  box  with  cover  and lock.  Rectangular  shaped  box\r\nFor  private  belongings  and  small  treasures\r\nIdeal  for  decoupage or  painting', 'Lion Kithul wood', 1, 1, 'Medium', 'ornaments'),
(13, 'key storage box', 2000, 20, 2500, 10, 'assets/images/products/keyy-storage-box.jpg', '	\r\nSize:	Large\r\nShape:	Square	\r\nColour:	Natural Pine Colour\r\nItem Height:	10cm	\r\nItem Depth:	34cm\r\nItem Width:	25	\r\nMaterial:	Pine Wood\r\nType:	Decorative Storage Box	\r\nItem Length:	25cm', 'Wooden box with cover. Rectangular shaped box for privatebelongings and small treasures. Ideal for decoupage or painting.', 'Lion Kithul wood', 1, 1, 'Medium', 'ornaments'),
(14, 'leg massager', 4500, 5, 6500, 200, 'assets/images/products/leg-massager.jpg', 'Product Length:	\r\n40 cm\r\nFeatures:	\r\nHandheld	\r\nWeight:	\r\n0,3 kg\r\nEAN:	\r\n3830058240915	\r\nUnit Quantity:	\r\n1\r\nBrand:	\r\nTuuli Accessories	\r\nMaterial:	\r\nWood\r\nMeasuring Unit:	\r\nUnit	\r\nCountry/Region of Manufacture:	\r\nSlovenia\r\nHeight:	\r\n5 cm	\r\nWidth:	\r\n5 cm\r\nMassage Functions:	\r\nRolls	\r\nType:	\r\nAnti-Cellulite Massager\r\nColour:	\r\nBraun	\r\nBody Area:	\r\nLegs, Back, Arm', 'The wooden massage roller helps you in the fight against unpleasant fat deposits and removes the unattractive orange peel. It helps improve blood circulation, forms muscles and smoothes the skin. With minutes of relaxation every day, the wooden massage roller made of natural beech wood is enough for perfect therapy and a feeling of wellbeing.', 'Lion Kithul wood', 1, 1, 'Medium', 'ornaments'),
(15, 'locker', 4500, 5, 5000, 100, 'assets/images/products/locker.jpg', '	\r\nBrand:	\r\nHasbro\r\nCharacter:	\r\nGI Joe	\r\nFranchise:	\r\nGI Joe\r\nGenre:	\r\nMilitary War	\r\nPackaging:	\r\nWithout Packaging\r\nSeries:	\r\nG.I. Joe	\r\nTime Period Manufactured:	\r\n1960-1969\r\nVintage:	\r\nNo	\r\nYear Manufactured:	\r\n1964\r\nColor:	\r\nGreen	\r\nMaterial:	\r\nWood', 'Wooden locker Locker GREEN 1964 GI Joe ARAH Hasbro Vintage', 'Lion Kithul Wood', 1, 1, 'Medium', 'furniture'),
(16, 'kithul tray set', 4500, 8, 5000, 100, 'assets/images/products/kithul-tray-set.jpg\r\n', 'NATURAL KITHUL- Made from naturally durable material bamboo, VonShef trays are lightweight and portable. Integrated handles offer a secure grip for comfortable carrying.\r\nCOMPLETE SET - Comprises 1 x Large (42 x 29cm) 1 x Medium (39 x 26cm) 1 x Small (36 x 23cm) - trays nest together for convenient storage.\r\nEASY TO CLEAN - Simply wipe with a damp cloth.', 'MULTIFUNCTIONAL - Set of three multi-functional serving trays great for carrying food and drinks, serving breakfast in style or using it as a storage tray for smaller items.', 'lION Kithul Wood', 1, 1, 'small', 'kitchen'),
(17, 'comb', 300, 20, 350, 20, 'assets/images/products/comb.jpg', 'Colour:	\r\nBrown\r\nDepartment:	\r\nUnisex	\r\nCustom Bundle:	\r\nNo\r\nMaterial:	\r\nPear wood, Wood	\r\nType:	\r\nBeard Comb\r\nHair Type:	\r\nAll Hair Types	\r\nFeatures:	\r\nAntistatic\r\nMPN:	\r\nHBCC2	\r\nGender:	\r\nUnisex\r\nItem Length:	\r\n13.5 cm	\r\nBrand:	\r\nHundred Beard Company\r\nManufacturer Warranty:	\r\nNone	\r\nSuitable For:	\r\nBeard', 'The Perfect Match\r\nPremium comb made from pear wood.\r\nUse this comb on your beard or moustache for an anti-static tangle free grooming experience.\r\nIdeal for use with beard oils and balms to maintain that well groomed look.', 'Lion Kithul Wood', 1, 1, 'small', 'ornaments'),
(18, 'spoon set', 2000, 20, 2500, 100, 'assets/images/products/spoon-set.jpg', 'Package Content -7 spoons(Set of 7 spoons)\r\nMaterial - Wood, Each spoon and spatula in this kitchen utensil set measures - 10 to 15 inches\r\nIt can be used for serving various items such as rice, sabzi and for cooking rotis, dosas, omelettes and more\r\nVersatile cooking and serving spoon set, Made from wood\r\nStylish handmade design to provide a comfortable grip, This multipurpose set is ideal for daily use', 'Long Handle Wooden Coffee Spoon Portable Practical Measure Spoons Kitchen Tool Coffee Bean Spoon Milk Powder Spoon Spice Powder', 'Lion Kithul Wood', 1, 1, 'Medium', 'kitchen'),
(19, 'string', 0, 0, 0, 0, 'string', 'string', 'string', 'string', 0, 1, 'string', 'string'),
(20, 'test', 123.45, 21, 123.98, 76, 'https://drive.google.com/uc?export=download&id=1cEFcIeE5oOWTtfL9wPih2htUD02FJHqt', 'sfds', 'lddhjghg', 'bmw', 0, 1, 'small', 'kitchen');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `EnrollmentDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `FirstName`, `LastName`, `Username`, `Password`, `EnrollmentDate`) VALUES
(1, 'shakila', 'nimnada', 'piumalnimnada@gmail.com', '123', '2022-08-20 12:09:03'),
(2, 'sss', 'string', 'string', 'string', '2022-08-26 21:05:50'),
(3, 'sadas', 'scdsa', 'sadas', 'sadsdas', '2022-08-26 21:07:32'),
(4, 'test1', 'test@123.com', 'test3', 'fdghdf', '2022-08-26 21:13:01'),
(5, 'shakila', 'te', 'ppp', '1234', '2022-08-26 21:15:12'),
(6, 'sda', 'das', 'ppp@g', '123', '2022-08-26 21:16:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
