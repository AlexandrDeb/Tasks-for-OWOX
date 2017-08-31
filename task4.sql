

CREATE TABLE `customers` (
  `customer_number` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_last_name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postal_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE `orders` (
  `order_numder` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `required_date` date NOT NULL,
  `shipped_date` date NOT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text NOT NULL,
  `customer_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE `payments` (
  `customer_number` int(11) NOT NULL,
  `check_number` varchar(50) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE `products` (
  `product_code` int(15) NOT NULL,
  `product_name` varchar(70) NOT NULL,
  `product_vendor` varchar(50) NOT NULL,
  `product_description` text NOT NULL,
  `quantity_in_stock` tinyint(6) NOT NULL,
  `buy price` double NOT NULL,
  `msrp` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_number`),
  ADD KEY `customer_number` (`customer_number`);

-


ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_numder`),
  ADD KEY `customer_number` (`customer_number`);




ALTER TABLE `payments`
  ADD PRIMARY KEY (`customer_number`),
  ADD KEY `customer_number` (`customer_number`);




ALTER TABLE `products`
  ADD PRIMARY KEY (`product_code`);





ALTER TABLE `customers`
  MODIFY `customer_number` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `orders`
  MODIFY `order_numder` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `products`
  MODIFY `product_code` int(15) NOT NULL AUTO_INCREMENT;




ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_number`) REFERENCES `customers` (`customer_number`) ON DELETE CASCADE ON UPDATE CASCADE;




ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customer_number`) REFERENCES `customers` (`customer_number`) ON DELETE CASCADE ON UPDATE CASCADE;
