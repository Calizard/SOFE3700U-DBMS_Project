-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 22, 2023 at 03:34 PM
-- Server version: 8.0.35
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Category_ID` int NOT NULL AUTO_INCREMENT,
  `Category_Name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `Category_Name`) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Furniture'),
(5, 'Toys'),
(6, 'Kitchen Appliances');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cust_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cust_telephone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cust_email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `cust_name`, `cust_address`, `cust_telephone`, `cust_email`) VALUES
(1, 'John Smith', '123 Main St', '123-456-7890', 'john.smith@email.com'),
(2, 'Emily Johnson', '456 Elm St', '214-748-3647', 'emily.johnson@email.com'),
(3, 'Michael Williams', '789 Oak St', '214-748-3647', 'michael.williams@email.com'),
(4, 'Jennifer Brown', '234 Pine St', '214-748-3647', 'jennifer.brown@email.com'),
(5, 'David Davis', '567 Birch St', '111-222-3333', 'david.davis@email.com'),
(6, 'Olivia Wilson', '890 Cedar St', '214-748-3647', 'olivia.wilson@email.com'),
(7, 'James Taylor', '345 Spruce St', '214-748-3647', 'james.taylor@email.com'),
(8, 'Mary Miller', '678 Fir St', '214-748-3647', 'mary.miller@email.com'),
(9, 'Liam Anderson', '123 Maple St', '214-748-3647', 'liam.anderson@email.com'),
(10, 'Sophia Thomas', '456 Willow St', '214-748-3647', 'sophia.thomas@email.com'),
(11, 'Ethan Jackson', '789 Redwood St', '214-748-3647', 'ethan.jackson@email.com'),
(12, 'Ava White', '345 Oakwood St', '214-748-3647', 'ava.white@email.com'),
(13, 'Noah Harris', '123 Pinecrest St', '214-748-3647', 'noah.harris@email.com'),
(14, 'Charlotte Lee', '678 Magnolia St', '214-748-3647', 'charlotte.lee@email.com'),
(15, 'Mason Clark', '456 Birchwood St', '123-456-7777', 'mason.clark@email.com'),
(16, 'Isabella Baker', '234 Willowcrest St', '214-748-3647', 'isabella.baker@email.com'),
(17, 'William Hall', '567 Cedarwood St', '214-748-3647', 'william.hall@email.com'),
(18, 'Sophia Adams', '789 Elmwood St', '214-748-3647', 'sophia.adams@email.com'),
(19, 'James Johnson', '123 Oakcrest St', '214-748-3647', 'james.johnson@email.com'),
(20, 'Grace Miller', '234 Maplecrest St', '214-748-3647', 'grace.miller@email.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerhighestorderamount`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `customerhighestorderamount`;
CREATE TABLE IF NOT EXISTS `customerhighestorderamount` (
`CustomerID` int
,`CustomerName` varchar(30)
,`HighestOrderAmount` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `Dno` int NOT NULL AUTO_INCREMENT,
  `Dname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dep_mngr_ID` int DEFAULT NULL,
  PRIMARY KEY (`Dno`),
  KEY `managed_by` (`Dep_mngr_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dno`, `Dname`, `Dep_mngr_ID`) VALUES
(1, 'HR', 1),
(2, 'Finance', 2),
(3, 'Marketing', 3),
(4, 'Sales', 4),
(5, 'IT', 5),
(6, 'Shipping', 6);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `E_ID` int NOT NULL AUTO_INCREMENT,
  `Emp_Fname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Emp_Minit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Emp_Lname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dep_No` int NOT NULL,
  `War_ID` int NOT NULL,
  `Super_ID` int NOT NULL,
  `Start_Date` date NOT NULL,
  `Salary` int NOT NULL,
  `E_SIN` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`E_ID`),
  KEY `works_For` (`Dep_No`),
  KEY `works_At` (`War_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`E_ID`, `Emp_Fname`, `Emp_Minit`, `Emp_Lname`, `Dep_No`, `War_ID`, `Super_ID`, `Start_Date`, `Salary`, `E_SIN`) VALUES
(1, 'John', 'M', 'Smith', 1, 1, 1, '2022-03-10', 58000, 'E12345678'),
(2, 'Jane', 'A', 'Doe', 1, 2, 2, '2022-05-15', 62000, 'E23456789'),
(3, 'Michael', 'D', 'Johnson', 1, 3, 3, '2022-08-20', 55000, 'E34567890'),
(4, 'Emily', 'J', 'Williams', 2, 4, 4, '2022-04-02', 59000, 'E45678901'),
(5, 'Christopher', 'E', 'Jones', 2, 5, 5, '2022-06-18', 63000, 'E56789012'),
(6, 'Elizabeth', 'R', 'Brown', 2, 6, 6, '2022-09-25', 52000, 'E67890123'),
(7, 'Daniel', 'L', 'Davis', 3, 1, 1, '2022-03-08', 60000, 'E78901234'),
(8, 'Sarah', 'N', 'Miller', 3, 2, 2, '2022-07-14', 54000, 'E89012345'),
(9, 'Matthew', 'T', 'Anderson', 3, 3, 3, '2022-10-30', 61000, 'E90123456'),
(10, 'Jessica', 'G', 'Martinez', 4, 4, 4, '2022-04-15', 57000, 'E01234567'),
(11, 'David', 'K', 'Taylor', 4, 5, 5, '2022-08-02', 64000, 'E11234567'),
(12, 'Melissa', 'Z', 'White', 4, 6, 6, '2022-11-12', 50000, 'E21234567'),
(13, 'Andrew', 'Q', 'Hernandez', 5, 1, 1, '2022-03-22', 59000, 'E31234567'),
(14, 'Emma', 'X', 'Thompson', 5, 2, 2, '2022-06-05', 63000, 'E41234567'),
(15, 'Christopher', 'Y', 'Clark', 5, 3, 3, '2022-09-10', 55000, 'E51234567'),
(16, 'Olivia', 'H', 'Ward', 6, 4, 4, '2022-05-01', 60000, 'E61234567'),
(17, 'Aiden', 'F', 'Fisher', 6, 5, 5, '2022-07-20', 52000, 'E71234567'),
(18, 'Sophia', 'P', 'Cooper', 6, 6, 6, '2022-10-29', 61000, 'E81234567'),
(19, 'Ethan', 'S', 'Evans', 1, 1, 1, '2022-04-18', 57000, 'E91234567'),
(20, 'Isabella', 'C', 'Perez', 2, 2, 2, '2022-06-29', 64000, 'E10123456'),
(21, 'Mia', 'W', 'Rogers', 3, 3, 3, '2022-09-07', 50000, 'E11234567'),
(22, 'Alexander', 'U', 'Reed', 4, 4, 4, '2022-03-03', 59000, 'E12234567'),
(23, 'Madison', 'I', 'Barnes', 5, 5, 5, '2022-07-16', 63000, 'E13234567'),
(24, 'Henry', 'O', 'Gomez', 6, 6, 6, '2022-10-21', 55000, 'E14234567'),
(25, 'Sophie', 'M', 'Richardson', 1, 2, 2, '2022-05-11', 60000, 'E15234567'),
(26, 'Zachary', 'V', 'Griffin', 2, 3, 3, '2022-08-30', 52000, 'E16234567'),
(27, 'Natalie', 'B', 'Watson', 3, 4, 4, '2022-11-09', 61000, 'E17234567'),
(28, 'Gabriel', 'R', 'Harrison', 4, 5, 5, '2022-04-14', 57000, 'E18234567'),
(29, 'Ava', 'L', 'Ferguson', 5, 6, 6, '2022-06-25', 64000, 'E19234567'),
(30, 'Jackson', 'H', 'Hill', 6, 1, 1, '2022-09-03', 50000, 'E20234567'),
(31, 'Ella', 'Z', 'Stewart', 1, 2, 2, '2022-03-27', 59000, 'E21234567'),
(32, 'Logan', 'A', 'Hunter', 2, 3, 3, '2022-07-08', 63000, 'E22234567'),
(33, 'Chloe', 'S', 'Sullivan', 3, 4, 4, '2022-10-17', 55000, 'E23234567'),
(34, 'Carter', 'N', 'Bishop', 4, 5, 5, '2022-04-30', 61000, 'E24234567'),
(35, 'Oscar', 'P', 'Crawford', 6, 6, 6, '2022-11-29', 58000, 'E25234567'),
(36, 'Lily', 'R', 'Gilbert', 1, 1, 1, '2022-10-05', 59000, 'E26234567');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manu_ID` int NOT NULL AUTO_INCREMENT,
  `manu_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manu_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manu_telephone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manu_email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`manu_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manu_ID`, `manu_name`, `manu_address`, `manu_telephone`, `manu_email`) VALUES
(1, 'TechPro Electronics', '123 Tech St', '123-456-7890', 'techpro@example.com'),
(2, 'FashionX Clothing', '456 Fashion Rd', '987-654-3210', 'fashionx@example.com'),
(3, 'Readwell Books', '789 Read Ave', '555-666-7777', 'readwell@example.com'),
(4, 'HomeStyle Furniture', '321 Home Ln', '999-888-7777', 'homestyle@example.com'),
(5, 'ToyZone Toys', '654 Play Dr', '111-222-3333', 'toyzone@example.com'),
(6, 'KitchenTech Appliance', '888 Kitchen Rd', '444-555-6666', 'kitchentech@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `Order_Date` date NOT NULL,
  `Cust_ID` int NOT NULL,
  `Emp_ID` int NOT NULL,
  `Ship_ID` int NOT NULL,
  `ware_ID` int NOT NULL,
  `Total_Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `belongs_to` (`Cust_ID`),
  KEY `shipped` (`Ship_ID`),
  KEY `from_ware` (`ware_ID`),
  KEY `handled_by` (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `Order_Date`, `Cust_ID`, `Emp_ID`, `Ship_ID`, `ware_ID`, `Total_Price`) VALUES
(1, '2023-10-05', 3, 16, 1, 4, '1229.94'),
(2, '2023-10-10', 7, 17, 2, 5, '2599.82'),
(3, '2023-10-15', 14, 18, 3, 6, '197.39'),
(4, '2023-10-20', 1, 24, 4, 6, '289.86'),
(5, '2023-10-25', 11, 30, 5, 1, '718.35'),
(6, '2023-10-30', 19, 35, 6, 6, '1114.94'),
(7, '2023-11-05', 4, 16, 7, 4, '2579.74'),
(8, '2023-11-10', 8, 17, 8, 5, '267.47'),
(9, '2023-11-15', 15, 18, 9, 6, '658.87'),
(10, '2023-11-20', 2, 24, 10, 6, '839.82'),
(11, '2023-11-25', 12, 30, 11, 1, '618.84'),
(12, '2023-11-30', 20, 35, 12, 6, '184.94');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE IF NOT EXISTS `order_products` (
  `Order_ID` int NOT NULL,
  `Prod_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Order_ID`,`Prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`Order_ID`, `Prod_ID`, `Quantity`) VALUES
(1, 1, 2),
(1, 5, 1),
(1, 9, 3),
(2, 2, 3),
(2, 7, 2),
(2, 12, 1),
(3, 3, 1),
(3, 8, 2),
(3, 14, 3),
(4, 4, 2),
(4, 9, 1),
(4, 18, 3),
(5, 6, 3),
(5, 11, 1),
(5, 15, 2),
(6, 1, 2),
(6, 7, 1),
(6, 13, 3),
(7, 2, 3),
(7, 8, 2),
(7, 12, 1),
(8, 3, 1),
(8, 9, 2),
(8, 14, 3),
(9, 4, 2),
(9, 10, 1),
(9, 16, 3),
(10, 5, 3),
(10, 11, 1),
(10, 15, 2),
(11, 6, 2),
(11, 12, 1),
(11, 17, 3),
(12, 7, 3),
(12, 13, 1),
(12, 18, 2);

--
-- Triggers `order_products`
--
DROP TRIGGER IF EXISTS `after_order_products_delete`;
DELIMITER $$
CREATE TRIGGER `after_order_products_delete` AFTER DELETE ON `order_products` FOR EACH ROW BEGIN
    -- Delete transaction history records for the deleted order product
    DELETE FROM TransactionHist WHERE order_id = OLD.order_id AND product_id = OLD.prod_id;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `after_order_products_insert`;
DELIMITER $$
CREATE TRIGGER `after_order_products_insert` AFTER INSERT ON `order_products` FOR EACH ROW BEGIN
    INSERT INTO TransactionHist (order_id, product_id, quantity, trans_date)
    SELECT op.order_id, op.prod_id, op.quantity, o.order_date
    FROM Order_Products op
    JOIN Orders o ON op.order_id = o.order_id
    WHERE op.order_id = NEW.order_id;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `after_order_products_update`;
DELIMITER $$
CREATE TRIGGER `after_order_products_update` AFTER UPDATE ON `order_products` FOR EACH ROW BEGIN
    -- Delete existing transaction history records for the updated order
    DELETE FROM TransactionHist WHERE order_id = NEW.order_id;

    -- Insert updated records into Transaction_History
    INSERT INTO TransactionHist (order_id, product_id, quantity, trans_date)
    SELECT op.order_id, op.prod_id, op.quantity, o.order_date
    FROM Order_Products op
    JOIN Orders o ON op.order_id = o.order_id
    WHERE op.order_id = NEW.order_id;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_total_price`;
DELIMITER $$
CREATE TRIGGER `update_total_price` AFTER INSERT ON `order_products` FOR EACH ROW BEGIN
    DECLARE orderTotal DECIMAL(10, 2);
    
    -- Calculate the total price for the order
    SELECT SUM(op.quantity * p.prod_price) INTO orderTotal
    FROM Order_Products op
    JOIN Product p ON op.prod_id = p.product_id
    WHERE op.order_id = NEW.order_id;
    
    -- Update the Orders table with the calculated total price
    UPDATE Orders
    SET total_price = orderTotal
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prod_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `cate_ID` int NOT NULL,
  `supp_ID` int NOT NULL,
  `manu_ID` int NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `classifed_as` (`cate_ID`),
  KEY `supplied_by` (`supp_ID`),
  KEY `made_by` (`manu_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `prod_name`, `prod_desc`, `prod_price`, `cate_ID`, `supp_ID`, `manu_ID`) VALUES
(1, 'Smartphone X', 'High-performance smartphone with advanced features.', '499.99', 1, 1, 1),
(2, 'UltraHD Smart TV', 'Immersive entertainment with stunning 4K resolution.', '799.95', 1, 1, 1),
(3, 'Wireless Earbuds', 'Compact and high-quality wireless earbuds for on-the-go listening.', '129.99', 1, 1, 1),
(4, 'Men\'s Casual Shirt', 'Comfortable and stylish shirt for casual occasions.', '59.95', 2, 2, 2),
(5, 'Women\'s Running Shoes', 'Durable and supportive running shoes for active lifestyles.', '79.99', 2, 2, 2),
(6, 'Kid\'s Cartoon T-Shirt', 'Adorable T-shirt featuring popular cartoon characters for kids.', '39.50', 2, 2, 2),
(7, 'Sci-Fi Novel: Beyond the Stars', 'A gripping science fiction novel that explores the unknown.', '24.99', 3, 3, 3),
(8, 'Cookbook: Culinary Delights', 'Discover a variety of delicious recipes for every occasion.', '14.95', 3, 3, 3),
(9, 'Historical Fiction: Secrets of', 'An intriguing historical fiction novel filled with mystery and suspense.', '49.99', 3, 3, 3),
(10, 'Modern Coffee Table', 'Sleek and stylish coffee table to complement your living space.', '299.00', 4, 4, 4),
(11, 'Leather Recliner Sofa', 'Luxurious leather sofa with built-in recliners for ultimate comfort.', '499.95', 4, 4, 4),
(12, 'Dining Table Set', 'Elegant dining table set for hosting family and friends.', '149.99', 4, 4, 4),
(13, 'Remote Control Car', 'Fun and fast remote control car for hours of entertainment.', '29.99', 5, 5, 5),
(14, 'Plush Teddy Bear', 'Soft and huggable teddy bear for kids of all ages.', '12.50', 5, 5, 5),
(15, 'Board Game: Adventure Quest', 'Exciting board game that takes players on a thrilling adventure.', '49.95', 5, 5, 5),
(16, 'Countertop Blender', 'Powerful blender for making smoothies, soups, and more.', '79.99', 6, 6, 6),
(17, 'Stainless Steel Cookware Set', 'High-quality cookware set for all your culinary needs.', '129.95', 6, 6, 6),
(18, 'Digital Kitchen Scale', 'Accurate and easy-to-use kitchen scale for precise measurements.', '39.99', 6, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
CREATE TABLE IF NOT EXISTS `shipping` (
  `Shipping_ID` int NOT NULL AUTO_INCREMENT,
  `Shipment_Date` date NOT NULL,
  `Ord_ID` int NOT NULL,
  PRIMARY KEY (`Shipping_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`Shipping_ID`, `Shipment_Date`, `Ord_ID`) VALUES
(1, '2023-10-06', 1),
(2, '2023-10-11', 2),
(3, '2023-10-16', 3),
(4, '2023-10-20', 4),
(5, '2023-10-26', 5),
(6, '2023-10-30', 6),
(7, '2023-11-05', 7),
(8, '2023-11-10', 8),
(9, '2023-11-16', 9),
(10, '2023-11-21', 10),
(11, '2023-11-25', 11),
(12, '2023-12-01', 12);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `supp_ID` int NOT NULL AUTO_INCREMENT,
  `supp_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `supp_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `supp_telephone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `supp_email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`supp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supp_ID`, `supp_name`, `supp_address`, `supp_telephone`, `supp_email`) VALUES
(1, 'ElectroTech Supplies', '123 Supplier St', '123-456-7890', 'electrotech@example.com'),
(2, 'Fashion World', '456 Fashion Rd', '987-654-3210', 'fashionworld@example.com'),
(3, 'ReadIt Books', '789 Bookstore Ave', '555-666-7777', 'readit@example.com'),
(4, 'HomeDecor Plus', '321 Home Furnishings Ln', '999-888-7777', 'homedecor@example.com'),
(5, 'Kids Emporium', '654 Toyland Dr', '111-222-3333', 'kidsemporium@example.com'),
(6, 'TechZone Electronics', '888 Electronics Center', '444-555-6666', 'techzone@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `transactionhist`
--

DROP TABLE IF EXISTS `transactionhist`;
CREATE TABLE IF NOT EXISTS `transactionhist` (
  `Trans_ID` int NOT NULL AUTO_INCREMENT,
  `Order_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  `Trans_Date` date NOT NULL,
  PRIMARY KEY (`Trans_ID`),
  KEY `apart_of_order` (`Order_ID`),
  KEY `purchased_product` (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactionhist`
--

INSERT INTO `transactionhist` (`Trans_ID`, `Order_ID`, `Product_ID`, `Quantity`, `Trans_Date`) VALUES
(1, 1, 1, 2, '2023-10-05'),
(2, 1, 1, 2, '2023-10-05'),
(3, 1, 5, 1, '2023-10-05'),
(5, 1, 1, 2, '2023-10-05'),
(6, 1, 5, 1, '2023-10-05'),
(7, 1, 9, 3, '2023-10-05'),
(8, 2, 2, 3, '2023-10-10'),
(9, 2, 2, 3, '2023-10-10'),
(10, 2, 7, 2, '2023-10-10'),
(12, 2, 2, 3, '2023-10-10'),
(13, 2, 7, 2, '2023-10-10'),
(14, 2, 12, 1, '2023-10-10'),
(15, 3, 3, 1, '2023-10-15'),
(16, 3, 3, 1, '2023-10-15'),
(17, 3, 8, 2, '2023-10-15'),
(19, 3, 3, 1, '2023-10-15'),
(20, 3, 8, 2, '2023-10-15'),
(21, 3, 14, 3, '2023-10-15'),
(22, 4, 4, 2, '2023-10-20'),
(23, 4, 4, 2, '2023-10-20'),
(24, 4, 9, 1, '2023-10-20'),
(26, 4, 4, 2, '2023-10-20'),
(27, 4, 9, 1, '2023-10-20'),
(28, 4, 18, 3, '2023-10-20'),
(29, 5, 6, 3, '2023-10-25'),
(30, 5, 6, 3, '2023-10-25'),
(31, 5, 11, 1, '2023-10-25'),
(33, 5, 6, 3, '2023-10-25'),
(34, 5, 11, 1, '2023-10-25'),
(35, 5, 15, 2, '2023-10-25'),
(36, 6, 1, 2, '2023-10-30'),
(37, 6, 1, 2, '2023-10-30'),
(38, 6, 7, 1, '2023-10-30'),
(40, 6, 1, 2, '2023-10-30'),
(41, 6, 7, 1, '2023-10-30'),
(42, 6, 13, 3, '2023-10-30'),
(43, 7, 2, 3, '2023-11-05'),
(44, 7, 2, 3, '2023-11-05'),
(45, 7, 8, 2, '2023-11-05'),
(47, 7, 2, 3, '2023-11-05'),
(48, 7, 8, 2, '2023-11-05'),
(49, 7, 12, 1, '2023-11-05'),
(50, 8, 3, 1, '2023-11-10'),
(51, 8, 3, 1, '2023-11-10'),
(52, 8, 9, 2, '2023-11-10'),
(54, 8, 3, 1, '2023-11-10'),
(55, 8, 9, 2, '2023-11-10'),
(56, 8, 14, 3, '2023-11-10'),
(57, 9, 4, 2, '2023-11-15'),
(58, 9, 4, 2, '2023-11-15'),
(59, 9, 10, 1, '2023-11-15'),
(61, 9, 4, 2, '2023-11-15'),
(62, 9, 10, 1, '2023-11-15'),
(63, 9, 16, 3, '2023-11-15'),
(64, 10, 5, 3, '2023-11-20'),
(65, 10, 5, 3, '2023-11-20'),
(66, 10, 11, 1, '2023-11-20'),
(68, 10, 5, 3, '2023-11-20'),
(69, 10, 11, 1, '2023-11-20'),
(70, 10, 15, 2, '2023-11-20'),
(71, 11, 6, 2, '2023-11-25'),
(72, 11, 6, 2, '2023-11-25'),
(73, 11, 12, 1, '2023-11-25'),
(75, 11, 6, 2, '2023-11-25'),
(76, 11, 12, 1, '2023-11-25'),
(77, 11, 17, 3, '2023-11-25'),
(78, 12, 7, 3, '2023-11-30'),
(79, 12, 7, 3, '2023-11-30'),
(80, 12, 13, 1, '2023-11-30'),
(82, 12, 7, 3, '2023-11-30'),
(83, 12, 13, 1, '2023-11-30'),
(84, 12, 18, 2, '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `Warehouse_ID` int NOT NULL AUTO_INCREMENT,
  `War_Address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `War_Mngr_ID` int NOT NULL,
  PRIMARY KEY (`Warehouse_ID`),
  KEY `supervised_by` (`War_Mngr_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`Warehouse_ID`, `War_Address`, `War_Mngr_ID`) VALUES
(1, 'Warehouse 1 Address', 1),
(2, 'Warehouse 2 Address', 2),
(3, 'Warehouse 3 Address', 3),
(4, 'Warehouse 4 Address', 4),
(5, 'Warehouse 5 Address', 5),
(6, 'Warehouse 6 Address', 6);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_inventory`
--

DROP TABLE IF EXISTS `warehouse_inventory`;
CREATE TABLE IF NOT EXISTS `warehouse_inventory` (
  `ware_ID` int NOT NULL,
  `prod_ID` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`ware_ID`,`prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse_inventory`
--

INSERT INTO `warehouse_inventory` (`ware_ID`, `prod_ID`, `quantity`) VALUES
(1, 1, 20),
(1, 2, 30),
(1, 3, 10),
(1, 4, 20),
(1, 5, 30),
(1, 6, 10),
(2, 7, 20),
(2, 8, 30),
(2, 9, 10),
(2, 10, 20),
(2, 11, 30),
(2, 12, 10),
(3, 13, 20),
(3, 14, 30),
(3, 15, 10),
(3, 16, 20),
(3, 17, 30),
(3, 18, 10),
(4, 1, 20),
(4, 2, 30),
(4, 3, 10),
(4, 4, 20),
(4, 5, 30),
(4, 6, 10),
(5, 7, 20),
(5, 8, 30),
(5, 9, 10),
(5, 10, 20),
(5, 11, 30),
(5, 12, 10),
(6, 13, 20),
(6, 14, 30),
(6, 15, 10),
(6, 16, 20),
(6, 17, 30),
(6, 18, 10);

-- --------------------------------------------------------

--
-- Structure for view `customerhighestorderamount`
--
DROP TABLE IF EXISTS `customerhighestorderamount`;

DROP VIEW IF EXISTS `customerhighestorderamount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerhighestorderamount`  AS SELECT `c`.`ID` AS `CustomerID`, `c`.`cust_name` AS `CustomerName`, max(`o`.`Total_Price`) AS `HighestOrderAmount` FROM (`customer` `c` join `orders` `o` on((`c`.`ID` = `o`.`Cust_ID`))) GROUP BY `c`.`ID`, `c`.`cust_name` ORDER BY `c`.`ID` ASC ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `managed_by` FOREIGN KEY (`Dep_mngr_ID`) REFERENCES `warehouse` (`Warehouse_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `works_At` FOREIGN KEY (`War_ID`) REFERENCES `warehouse` (`Warehouse_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `works_For` FOREIGN KEY (`Dep_No`) REFERENCES `department` (`Dno`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `belongs_to` FOREIGN KEY (`Cust_ID`) REFERENCES `customer` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `from_ware` FOREIGN KEY (`ware_ID`) REFERENCES `warehouse` (`Warehouse_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `handled_by` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`E_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `shipped` FOREIGN KEY (`Ship_ID`) REFERENCES `shipping` (`Shipping_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `classifed_as` FOREIGN KEY (`cate_ID`) REFERENCES `category` (`Category_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `made_by` FOREIGN KEY (`manu_ID`) REFERENCES `manufacturer` (`manu_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `supplied_by` FOREIGN KEY (`supp_ID`) REFERENCES `supplier` (`supp_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `transactionhist`
--
ALTER TABLE `transactionhist`
  ADD CONSTRAINT `apart_of_order` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `purchased_product` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `supervised_by` FOREIGN KEY (`War_Mngr_ID`) REFERENCES `employee` (`E_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
