SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `brands` (`id`, `name`, `description`, `image_path`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'L’Oreal', 'L’Oreal  manufactures and markets a wide range of skincare, makeup, fragrance, and hair care products', 'uploads/brands/1.jpg?v=1645066502', 1, 0, '2022-02-17 10:55:02'),
(3, 'Nivea', 'Nivea manufactures and markets skin, sun, lip and deodorant products', 'uploads/brands/3.jpg?v=1645066772', 1, 0, '2022-02-17 10:59:32'),
(4, 'Olay', 'Olay manufactures and markets face and skin care products', 'uploads/brands/4.jpg?v=1645066818', 1, 0, '2022-02-17 11:00:18'),
(5, 'LUX', 'A global personal care brand by Unilever, Lux product categories include soaps, shower gels, bath products, shampoos, and conditioners. Lux is a strong advocate of sustainable causes and is sold in more than 100 countries worldwide.', 'uploads/brands/5.jpg?v=1645066872', 1, 0, '2022-02-17 11:01:12'),
(6, 'AVON', 'Avon is a direct sales company operating in the skin, body, fragrance, make-up, sun care and fashion markets. A leading company within the direct sales market, Avon has millions of beauty advisors worldwide and recently moved its headquarters from the U.S. to the UK.', 'uploads/brands/6.jpg?v=1645066909', 1, 0, '2022-02-17 11:01:49');

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Skin Care', 'Our skin care collection is carefully curated to address various skin concerns and promote a healthy, radiant complexion. From cleansers and toners to serums and moisturizers, our products are formulated with potent ingredients to nourish, hydrate, and revitalize your skin.', 1, 0, '2022-02-17 11:27:11'),
(3, 'Body Care', 'Our bodycare collection offers a range of products designed to nourish and pamper your skin, including moisturizers, body washes, and body scrubs. Indulge in luxurious formulations that leave your skin feeling soft, hydrated, and refreshed.', 1, 0, '2022-02-17 11:27:45'),
(4, 'Perfumes', 'Indulge your senses with our exquisite range of perfumes. From floral and citrusy to woody and oriental, our perfumes captivate with their enchanting aromas, leaving a lasting impression wherever you go.', 1, 0, '2022-02-17 11:27:55'),
(5, 'Hair Care', 'Elevate your hair game with our decorative hair care products. From styling tools and accessories to hair sprays and serums, we have everything you need to achieve your desired hairstyle and keep your locks looking fabulous all day long.', 1, 0, '2022-02-17 11:28:38'),
(6, 'Sun Care', 'Protect your skin from harmful UV rays with our sun care products. Whether you\'re heading to the beach or simply stepping outside, our sunscreens and after-sun care products shield your skin and soothe any sun-related irritation, ensuring a safe and enjoyable time under the sun.', 1, 0, '2022-02-17 11:29:00'),
(7, 'Nail Care', 'Elevate your nail game with our comprehensive range of nail care products. From vibrant nail polishes in a spectrum of shades to nourishing treatments and accessories, we have everything you need to keep your nails looking their best. Our collection includes long-lasting formulas, quick-drying options, and nail strengtheners to promote healthy, strong nails. Whether you\'re looking for a classic manicure or experimenting with trendy nail art, our nail care products are designed to provide the perfect canvas for your unique style. Show off your impeccable nails with confidence and make a statement with our high-quality nail care essentials.', 1, 0, '2022-02-17 11:29:19'),
(8, 'Lipsticks', 'Discover our collection of liptint lipsticks that provide a beautiful pop of color while hydrating your lips. These long-lasting formulas give a natural, effortless look and are available in a variety of shades to suit any occasion.', 1, 0, '2022-02-17 11:29:38'),
(9, 'Lip Tint', 'Discover our collection of liptint lipsticks that provide a beautiful pop of color while hydrating your lips. These long-lasting formulas give a natural, effortless look and are available in a variety of shades to suit any occasion.', 1, 0, '2022-02-17 11:29:59'),
(10, 'test', 'test', 0, 1, '2022-02-17 11:31:18');

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `status`, `delete_flag`, `date_created`) VALUES
(2, 'Samantha Jane', 'Miller', 'Female', '09123456789', 'sam23@sample.com', '45bff2a14658fc9b21c6e5e9bf75186b', 'Sample Address', 1, 0, '2022-02-17 14:24:00'),
(7, 'Priya', 'Sharma', 'Female', '9999999999', 'priya85@gmail.com', 'cae5161fc8156ab2de412ec4007a76e2', 'XYZ colony Sector 12, Uttar Pradesh', 1, 0, '2023-06-23 19:19:47'),
(8, 'Archana ', 'Rajput', 'Female', '8888888889', 'Arch65@gmail.com', 'cae5161fc8156ab2de412ec4007a76e2', 'F-101 ABC Building , 5th Floor, Delhi', 1, 0, '2023-06-23 19:22:22');

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `variant` text NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `inventory` (`id`, `variant`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 'Variant 1', 1, 10, 155, '2022-02-17 11:57:52', NULL),
(2, 'Variant 2', 1, 5, 200, '2022-02-17 12:01:15', NULL),
(3, 'Variant 3', 1, 100, 250, '2022-02-17 12:04:15', '2023-05-22 18:03:00'),
(4, 'Variant 1', 3, 25, 250, '2022-02-17 13:22:54', NULL),
(5, 'Variant 2', 3, 25, 300, '2022-02-17 13:23:05', NULL),
(6, 'Variant 1', 4, 100, 350, '2022-02-17 16:28:14', NULL),
(7, 'Variant 1', 5, 100, 500, '2023-05-22 18:01:54', NULL),
(8, 'Variant 2', 5, 49, 300, '2023-05-22 18:02:25', NULL),
(9, 'Variant 3', 5, 100, 650, '2023-05-22 18:02:45', NULL),
(10, 'Variant 1', 7, 300, 400, '2023-05-23 21:07:13', NULL);

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = pending,\r\n1= Packed,\r\n2 = Out for Delivery,\r\n3=Delivered,\r\n4=cancelled',
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `orders` (`id`, `ref_code`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(3, '20220200001', 2, 'Sample Address', 'cod', 0, 900, 4, 0, '2022-02-17 14:51:58', '2022-02-17 15:04:38'),
(4, '20220200002', 2, 'Sample Address', 'Online Payment', 0, 1800, 3, 1, '2022-02-17 15:26:17', '2022-02-17 15:35:45'),
(5, '20220200003', 2, 'Sample Address', 'cod', 0, 500, 3, 1, '2022-02-17 15:32:52', '2022-02-17 15:35:32'),
(13, '20230600001', 8, 'F-101 ABC Building , 5th Floor, Delhi', 'cod', 0, 400, 0, 0, '2023-06-23 19:31:16', NULL),
(14, '20230600002', 8, 'F-101 ABC Building , 5th Floor, Delhi', 'cod', 0, 505, 0, 0, '2023-06-23 19:32:34', NULL);

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `order_list` (`id`, `order_id`, `inventory_id`, `quantity`, `price`, `total`) VALUES
(4, 3, 3, 3, 300, 900),
(5, 4, 3, 4, 300, 1200),
(6, 4, 1, 3, 200, 600),
(7, 5, 3, 2, 250, 500),
(17, 13, 7, 1, 400, 400),
(18, 14, 1, 1, 155, 155),
(19, 14, 4, 1, 350, 350);

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `name`, `specs`, `status`, `delete_flag`, `date_created`) VALUES
(1, 6, 8, 'Avon True Color Perfectly Matte Lipstick', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Experience the epitome of beauty and style with Avon Lipstick. Renowned for its exceptional quality and diverse range of shades, Avon Lipstick offers a luxurious and long-lasting formula that glides effortlessly onto your lips, providing vibrant color and a luscious finish. \r\n&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Whether you prefer bold, statement-making hues or subtle, everyday shades, Avon Lipstick has something for everyone. Enriched with nourishing ingredients, these lipsticks not only deliver stunning color but also keep your lips hydrated and comfortable throughout the day. &lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;With Avon Lipstick, you can confidently express your unique personality and embrace the power of a beautifully defined pout. Explore the exquisite collection of Avon Lipstick and discover a world of endless possibilities for creating stunning lip looks.&lt;/p&gt;', 1, 0, '2022-02-17 11:50:19'),
(3, 1, 5, 'LOreal Hair Expertise', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Experience the ultimate care and transformation for your hair with LOr&eacute;al Hair Expertise. This renowned brand brings you a comprehensive range of hair care products designed to cater to a variety of hair types and concerns. Whether you are seeking hydration, repair, volume, or color protection, LOr&eacute;al Hair Expertise has the perfect solution to elevate your hair care routine.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Discover the power of scientifically advanced formulations infused with high-quality ingredients. From shampoos and conditioners to masks and serums, LOr&eacute;al Hair Expertise products are meticulously crafted to deliver visible results and address specific hair needs. Indulge in luxurious textures and captivating fragrances that turn your hair care routine into a sensorial experience.&lt;/p&gt;', 1, 0, '2022-02-17 13:22:33'),
(4, 4, 8, 'Olay ColorRevive Lipstick', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Elevate your lip game with Ole Lipstick, a brand dedicated to creating exquisite lip color options that effortlessly enhance your natural beauty. With a focus on quality and innovation, Ole Lipstick offers a wide range of shades and finishes to suit every mood and occasion. From classic nudes to bold statement hues, each lipstick is formulated with a rich and creamy texture that glides on smoothly, delivering intense color payoff and long-lasting wear. Experience the joy of wearing Ole Lipstick and express your individuality with confidence and style.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;&quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot;&gt;Discover the perfect balance of beauty and skincare with Olay Lipstick. Combining the transformative power of makeup with the nourishing benefits of skincare, Olay Lipstick is designed to make your lips look and feel their best. These lipsticks feature a luxurious and hydrating formula infused with ingredients like vitamin E and moisturizing oils, keeping your lips soft, smooth, and moisturized throughout the day. With a diverse range of shades, from subtle neutrals to vibrant pops of color, Olay Lipstick allows you to express your personal style effortlessly.&lt;/font&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2022-02-17 16:27:41'),
(5, 5, 3, 'LuxeNourish Body Care', '&lt;p&gt;Indulge in the ultimate luxury of self-care with LuxeNourish. Our exclusive collection of body care products is meticulously crafted to provide you with a pampering experience that nourishes your skin and uplifts your senses. Each product in the LuxeNourish range is infused with opulent ingredients and formulated to deliver optimal hydration, rejuvenation, and a touch of decadence.&lt;/p&gt;&lt;p&gt;Pamper yourself with our range of body washes and scrubs that transform your daily shower routine into a spa-like experience. LuxeNourish body washes cleanse and revitalize your skin, while our exfoliating scrubs gently buff away dead skin cells, revealing a smooth and glowing complexion.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Embrace the luxurious essence of LuxeNourish and envelop your body in a symphony of opulence and nourishment. Elevate your self-care routine with our indulgent body care products that cater to your skin\\\\\\\\\\\\\\\'s every need, helping you achieve a blissful state of relaxation and enhancing your natural beauty. Treat yourself to LuxeNourish, because you deserve nothing but the finest in body care.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-05-21 22:13:22'),
(7, 3, 1, 'Nivea Skin Essentials', '', 1, 0, '2023-05-23 20:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(3, 3, 900, '2022-02-17 14:51:58'),
(4, 4, 1800, '2022-02-17 15:26:17'),
(5, 5, 500, '2022-02-17 15:32:52'),
(13, 13, 400, '2023-06-23 19:31:16'),
(14, 14, 505, '2023-06-23 19:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Cosmetic and Beauty Products Online Shop'),
(11, 'logo', 'uploads/logo_new.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.jpg'),
(15, 'short_name', 'BeautyBliss');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1645064505', NULL, 1, '2021-01-20 14:02:37', '2022-02-17 10:21:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
