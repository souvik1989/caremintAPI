-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 21, 2024 at 08:25 AM
-- Server version: 10.5.24-MariaDB-cll-lve-log
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caremint_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` char(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `mobile`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'caremintservices@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'public/adminProfile/1uGXbyj0e6m5Sjd64sXi8Ekl98f3EPWr8edABk9v.png', 'active', NULL, '2023-08-16 04:39:36', '2023-09-25 17:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `blog_date` varchar(25) DEFAULT NULL,
  `img` varchar(2083) DEFAULT NULL,
  `des` varchar(225) DEFAULT NULL,
  `read_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `author`, `blog_date`, `img`, `des`, `read_title`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Feb 13, 2023', 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fblog1.png?alt=media&token=43087664-a811-4c02-87bd-ddbbec0a672b', 'Harmful Effects You may not often think so, but getting a full car wash service can have various impacts on the environment if the facility does not take the proper steps. There are quite a few different opinions on the topic', 'Harmful Effects of Car wash with Water', 'Harmful effects of car washing with water', '2023-08-11 11:32:51', '2023-08-11 12:22:45'),
(2, 'Admin', 'Feb 13 2023', 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fblog2.png?alt=media&token=650b2162-8df7-4ee4-899b-5d5a613e0883', 'If you want to avoid using water or live in an area with water restrictions, a Dry car wash might be a good alternative to soap and water. CAREMINT is providing dry car wash services in India and uses Plant based herbal clean', 'How to Wash your Car without Water', 'How to wash your car without water', '2023-08-11 11:32:51', '2023-08-11 12:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` int(100) DEFAULT NULL,
  `service_id` bigint(20) NOT NULL,
  `provider_id` bigint(20) NOT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `item_status` enum('pending','completed','','') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `img` varchar(2083) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `img`, `created_at`, `updated_at`) VALUES
(1, 'Interior Service', 'https://admindashboard.caremint.in/public/storage/category/UTFiiE430UqJRtbMYq0iaoAU1jQnpGNyEPIbir06.jpg', '2023-08-09 07:21:31', '2024-03-27 05:17:52'),
(2, 'Exterior Service', 'https://admindashboard.caremint.in/public/storage/category/5SFH764UgxEBVPiINiAAMphZE1WD7OUtRGlHfvBM.jpg', '2023-08-09 07:21:31', '2024-03-27 05:18:27'),
(3, 'Exterior + Interior Service', 'https://admindashboard.caremint.in/public/storage/category/ejyeQ8KVZUj7DCEQ6McLCGySrzZwuZzwZqA4SzQE.png', '2023-08-09 07:21:31', '2024-04-02 07:01:02'),
(4, 'Monthly Subscription', 'https://admindashboard.caremint.in/public/storage/category/I169KewHLiAfRmXpO75EEfiKuPqiXW9nd4rrkO5f.jpg', '2023-08-09 07:21:31', '2024-03-27 05:19:03'),
(5, 'Deep Cleaning', 'https://admindashboard.caremint.in/public/storage/category/NZf58Rx5pjAYlocOQ1kGbsZ5EL32hpsIJVgZEa0J.png', '2023-08-09 07:21:31', '2024-03-27 05:19:20'),
(6, 'Ceramic Coating', 'https://admindashboard.caremint.in/public/storage/category/3W0qb9KZQANpzdh0kwh0Y961EzHcIlkjiDiGNbwy.png', '2023-08-09 07:21:31', '2024-04-02 07:00:38');

-- --------------------------------------------------------

--
-- Table structure for table `category_user`
--

CREATE TABLE `category_user` (
  `id` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_user`
--

INSERT INTO `category_user` (`id`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(30, 1, 59, '2024-01-10 19:15:33', '2024-01-10 13:45:33'),
(31, 2, 59, '2024-01-10 19:15:33', '2024-01-10 13:45:33'),
(32, 3, 59, '2024-01-10 19:15:33', '2024-01-10 13:45:33'),
(33, 4, 59, '2024-01-10 19:15:33', '2024-01-10 13:45:33'),
(34, 5, 59, '2024-01-10 19:15:33', '2024-01-10 13:45:33'),
(35, 6, 59, '2024-01-10 19:15:33', '2024-01-10 13:45:33'),
(36, 1, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(37, 2, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(38, 3, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(39, 4, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(40, 5, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(41, 6, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(42, 1, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(43, 2, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(44, 3, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(45, 4, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(46, 5, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(47, 6, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(48, 1, 78, '2024-03-21 04:08:13', '2024-03-21 04:08:13'),
(49, 2, 78, '2024-03-21 04:08:13', '2024-03-21 04:08:13'),
(50, 1, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(51, 2, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(52, 3, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(53, 4, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(54, 1, 94, '2024-04-23 10:49:47', '2024-04-23 10:49:47'),
(55, 2, 94, '2024-04-23 10:49:47', '2024-04-23 10:49:47'),
(56, 3, 94, '2024-04-23 10:49:47', '2024-04-23 10:49:47'),
(57, 1, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(58, 2, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(59, 3, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(60, 4, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(61, 1, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(62, 2, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(63, 3, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(64, 4, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(65, 1, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(66, 2, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(67, 3, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(68, 4, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(69, 5, 109, '2024-05-23 11:04:42', '2024-05-23 11:04:42'),
(70, 6, 109, '2024-05-23 11:04:42', '2024-05-23 11:04:42'),
(71, 1, 115, '2024-05-29 10:04:31', '2024-05-29 10:04:31'),
(72, 2, 115, '2024-05-29 10:04:31', '2024-05-29 10:04:31'),
(73, 3, 115, '2024-05-29 10:04:31', '2024-05-29 10:04:31'),
(74, 1, 116, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(75, 2, 116, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(76, 3, 116, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(77, 1, 117, '2024-05-29 10:32:43', '2024-05-29 10:32:43'),
(78, 1, 118, '2024-05-29 10:33:58', '2024-05-29 10:33:58'),
(79, 1, 119, '2024-05-29 12:56:50', '2024-05-29 12:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2014_10_14_000000_create_users_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `provider_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `pincode` varchar(25) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT current_timestamp(),
  `order_time` time DEFAULT current_timestamp(),
  `order_price` double DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  `order_status` enum('accepted','completed','cancelled','') DEFAULT NULL,
  `image` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `vehicle_brand` varchar(255) DEFAULT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(255) DEFAULT NULL,
  `timeslot_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `service_id`, `provider_id`, `user_id`, `name`, `mobile_number`, `pincode`, `address`, `order_date`, `order_time`, `order_price`, `delivery_date`, `order_status`, `image`, `description`, `review`, `rating`, `vehicle_brand`, `vehicle_model`, `vehicle_no`, `timeslot_id`, `created_at`, `updated_at`) VALUES
(131, NULL, 59, 58, 'safa', '8507689904', '743425', 'kjkladjs, Kolkata, West Bengal', '2024-02-06 18:30:00', '17:05:58', 250, '2024-02-20 18:30:00', 'completed', '131-1', 'tc t trc', NULL, 4.5, 'asdsa', 'asdsa213', '123213', 5, '2024-02-07 11:35:58', '2024-04-15 10:15:09'),
(132, NULL, 59, 61, 'Raaf', '2139829009', '31231', 'dasdsa, Kolkata, WB', '2024-02-06 18:30:00', '18:29:21', 500, '2024-02-19 18:30:00', 'completed', '132-1', 'Complete', NULL, 5, 'asdasd', '123213', '13123123', 7, '2024-02-07 12:59:21', '2024-04-02 07:40:20'),
(133, NULL, 59, 61, 'hakjah', '8942378980', '743429', 'kolkata, Kolkata, WB', '2024-02-07 18:30:00', '10:25:36', 300, '2024-02-14 18:30:00', 'cancelled', NULL, 'asdads', NULL, NULL, 'ada', '123133', '1321', 6, '2024-02-08 04:55:36', '2024-03-21 06:51:18'),
(134, NULL, 59, 61, 'tctc5c6v6', '8370866678', '743425', 'snenb, Kolkata , West Bengal', '2024-02-07 18:30:00', '13:28:11', 800, '2024-02-21 18:30:00', 'cancelled', NULL, 'ehej3j', NULL, NULL, 'shsjsjdj', '23443nenen', '272828', 5, '2024-02-08 07:58:11', '2024-04-15 10:12:48'),
(135, NULL, 59, 63, 'Arup Samadar', '9831611666', '700050', 'Binayak Enclave Block 1 507, Kolkata, West bengal', '2024-02-07 18:30:00', '13:55:08', 250, '2024-02-08 18:30:00', 'completed', '135-1', 'hggg', NULL, NULL, 'Maruti', 'Baleno', 'WB01 6455', 3, '2024-02-08 08:25:08', '2024-03-25 06:38:51'),
(137, NULL, 59, 60, 'Sangita Kaur', '9674962817', '700050', 'Binayak Enclave Block 2 flat 306 59 kalicharan ghosh road, kolkata , West Bengal', '2024-02-14 18:30:00', '08:18:20', 700, '2024-02-14 18:30:00', 'completed', '137-1', 'yyyy', NULL, NULL, 'Kia', 'Seltos', 'WB02AU6755', 4, '2024-02-15 02:48:20', '2024-03-25 06:39:19'),
(149, NULL, 59, 62, 'ABC', NULL, '700054', NULL, '2024-03-14 18:30:00', '16:00:33', 250, '2025-09-02 18:30:00', 'accepted', NULL, NULL, 'It has perfectly done,and perfect cleaning buddy for daily needs of car.', 5, NULL, NULL, NULL, NULL, '2024-03-15 10:30:33', '2024-04-19 09:19:43'),
(150, NULL, 59, 66, 'ABC', NULL, '700054', NULL, '2024-03-14 18:30:00', '16:07:27', 250, '2025-09-02 18:30:00', 'completed', NULL, NULL, NULL, 2.5, NULL, NULL, NULL, NULL, '2024-03-15 10:37:27', '2024-04-02 07:41:21'),
(151, NULL, 59, 56, 'Harsh Jain', NULL, '700054', NULL, '2024-03-14 18:30:00', '16:30:26', 250, '2025-09-02 18:30:00', 'completed', '151-1', 'uuuu', 'Self services car wash station provide you modern tools to clean your car.', 5, NULL, NULL, NULL, NULL, '2024-03-15 11:00:26', '2024-04-19 09:20:33'),
(152, NULL, 59, 58, 'ABC', NULL, '700054', NULL, '2024-03-14 18:30:00', '16:31:28', 250, '2025-09-02 18:30:00', 'completed', '152-1', 'yyyyy', 'I was so excited when I booked my slot for car cleaning, it was an awesome experience with Caremint. The waterless car wash left my car beautifully cleaned and dust free. I would highly recommend Caremint for every car owner. Their staff were also so humble and well behaved. Looking forward for more car washes from Caremint.', 5, NULL, NULL, NULL, NULL, '2024-03-15 11:01:28', '2024-04-15 10:19:53'),
(153, NULL, 59, 66, 'ABC', NULL, '700054', NULL, '2024-03-14 18:30:00', '16:31:39', 250, '2025-09-02 18:30:00', 'cancelled', '153-1', 'rjjdjdd', 'I recently visited caremint and was thoroughly impressed.Their attention to detail,friendly staff and efficient service made the experiences exceptional.', 4, NULL, NULL, NULL, NULL, '2024-03-15 11:01:39', '2024-04-19 09:16:52'),
(154, NULL, 59, 63, 'ABC', NULL, '700051', NULL, '2024-03-14 18:30:00', '16:32:07', 250, '2025-09-02 18:30:00', 'cancelled', '154-1', 'eujrru', 'I used there car dry cleaning service recommended by one of my friend… and the service was superb… they have done a really nice job with my car cleaning', 2.5, NULL, NULL, NULL, NULL, '2024-03-15 11:02:07', '2024-04-19 09:19:12'),
(155, NULL, 59, 60, 'ABC', NULL, '700012', NULL, '2024-03-14 18:30:00', '16:32:19', 250, '2025-09-02 18:30:00', 'completed', NULL, NULL, 'Caremint is one of the best cleaning services for your car in Kolkata. I recommend it not only because of the efficiency of the crew or the amazing professional outlook of the man behind the scene, I recommend it because it is a service that is dedicated to save water. Water is precious, whether we understand it or not, and car washes often waste water. Here is a service that uses car-friendly substances to get a shine that is incredible. My car is 7 years old. But thanks to Manish-ji, it looks fantastic.', 5, NULL, NULL, NULL, NULL, '2024-03-15 11:02:19', '2024-04-15 10:22:24'),
(156, NULL, 59, 66, 'ABC', NULL, '700312', NULL, '2024-03-14 18:30:00', '16:32:26', 250, '2025-09-02 18:30:00', 'accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-15 11:02:26', '2024-03-26 09:37:34'),
(157, NULL, 59, 66, 'ABC', NULL, '700054', NULL, '2024-03-14 18:30:00', '16:43:16', 250, '2025-09-02 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-15 11:13:16', '2024-03-15 11:13:16'),
(158, NULL, 59, 61, 'ABC', NULL, '700054', NULL, '2024-03-14 18:30:00', '16:44:13', 250, '2025-09-02 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-15 11:14:13', '2024-03-15 11:14:13'),
(159, NULL, 59, 61, 'ABC', NULL, '700054', NULL, '2024-03-14 18:30:00', '16:44:27', 250, '2025-09-02 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-15 11:14:27', '2024-03-15 11:14:27'),
(160, NULL, 59, 61, 'ashkdjahkjh', '7652789831', '700054', 'Kingstone Vally, New, WB', '2024-03-19 18:30:00', '18:42:43', 300, '2024-03-25 18:30:00', 'completed', '160-1', '4jjrjr', NULL, NULL, 'SUV', '123123', '12341', 6, '2024-03-20 13:12:43', '2024-03-25 06:40:18'),
(165, NULL, 59, 61, 'asdasd', '8370995563', '700054', 'SAdad, Kolkata, Wd', '2024-03-20 18:30:00', '11:48:06', 250, '2024-03-23 18:30:00', 'completed', '165-1', 'heheh', NULL, NULL, 'asodjkla', 'lkaslda', '39173812391', 5, '2024-03-21 06:18:06', '2024-03-25 06:40:30'),
(166, NULL, 59, 61, 'd', '8370994407', '700054', 'dsadas, asda, dsadasd', '2024-03-20 18:30:00', '13:25:22', 250, '2024-03-24 18:30:00', 'completed', '166-1', 'Complete', NULL, 4, 'alskdjklasd', 'SYUV', 'asdasd', 2, '2024-03-21 07:55:22', '2024-04-02 07:40:31'),
(167, NULL, 59, 61, 'hdhdhdhd', '8370996674', '700054', 'jdjsjsj, Kolkata , wb', '2024-03-20 18:30:00', '15:01:13', 350, '2024-03-28 18:30:00', NULL, NULL, 'dhhdhdhhd', NULL, NULL, 'jdjjdjjdjd', '1737e7e7e7', 'dhxhhxxh', 6, '2024-03-21 09:31:13', '2024-03-21 09:31:13'),
(168, NULL, 59, 61, 'vvvvg', '8765787890', '700054', 'bbbvvvvf, hbhh, bbbv', '2024-03-20 18:30:00', '15:29:55', 250, '2024-03-21 18:30:00', NULL, NULL, 'hhhgg', NULL, NULL, 'vvvvvv', '2376544', '7776', 3, '2024-03-21 09:59:55', '2024-03-21 09:59:55'),
(169, NULL, 59, 61, 'shhdhdh', '1263636738', '700050', 'hzhshhdhxhhdh, hdhdhd, wb', '2024-03-20 18:30:00', '16:59:09', 300, '2024-03-27 18:30:00', NULL, NULL, 'f7ufuf', NULL, NULL, 'hdhdhd', 'hhdhdhd', 'hdhddhdhddh', 5, '2024-03-21 11:29:09', '2024-03-21 11:29:09'),
(170, NULL, 59, 61, 'dadsasasdas', '8029939819', '700050', 'hasdgahsd, Kolkata, West Bengal', '2024-03-20 18:30:00', '18:20:52', 500, '2024-03-28 18:30:00', NULL, NULL, 'asdasd', NULL, NULL, 'qworhjqloirhqghril', 'iudhjiqwkahskldjuas', 'asghudgasdkajs', 5, '2024-03-21 12:50:52', '2024-03-21 12:50:52'),
(179, NULL, 59, 61, 'Kobe', '8764738908', '700054', 'dhdbjd, ssjsj, debeb', '2024-03-21 18:30:00', '18:40:50', 350, '2024-03-24 18:30:00', 'completed', '179-1', 'hhh', NULL, NULL, 'hshehe', 'jsjsjsj', '1338838', 4, '2024-03-22 13:10:50', '2024-03-25 06:40:52'),
(180, NULL, 59, 61, 'hmasterr', '8367890765', '700054', 'hddhjd, shshhd, wb', '2024-03-22 18:30:00', '10:26:51', 300, '2024-03-25 18:30:00', 'completed', '180-1', 'hhhhy', NULL, NULL, 'sjsj', '377373', '3737', 4, '2024-03-23 04:56:51', '2024-03-25 06:41:04'),
(182, NULL, 59, 61, 'souvikjj', '8370996755', '700054', 'ueueud, koljsjdj, djdj', '2024-03-22 18:30:00', '11:32:55', 350, '2024-03-27 18:30:00', 'completed', '182-1', 'ggghhh', 'The service was very nice .. good team work .. I was really satisfied with their work ..\nall the Best caremint!', 5, 'eiieis', 'djejdjdj', 'ssjjsjddj', 8, '2024-03-23 06:02:55', '2024-04-19 09:21:47'),
(183, NULL, 59, 61, 'hdhdhdhdhhdxxxxx', '8746890371', '700054', 'hrrhrh, kolkta, hrheh', '2024-03-22 18:30:00', '11:46:27', 300, '2024-03-27 18:30:00', 'cancelled', '183-1', 'nbbh', NULL, 3.5, 'ejeueu', 'djue38737', '388383838', 5, '2024-03-23 06:16:27', '2024-04-18 04:47:35'),
(186, NULL, 59, 61, 'dhhrhdhdhdyzyzyu', '8370896545', '700054', 'jdhhdhd, djjeejje, rjeueuur', '2024-03-22 18:30:00', '11:59:40', 300, '2024-03-30 18:30:00', 'completed', '186-1', 'hhhh', NULL, 3, 'euueue', 'eueueue7', '8272773774', 3, '2024-03-23 06:29:40', '2024-04-02 07:41:05'),
(187, NULL, 59, 61, 'jdjdjdjadjdjdjd', '8370994487', '700054', 'ueueue, Kolkata, wb', '2024-03-25 18:30:00', '11:33:25', 300, '2024-03-25 18:30:00', NULL, NULL, 'ejjejrj', NULL, NULL, 'urjjrh', '7474747', '848848', 4, '2024-03-26 06:03:25', '2024-03-26 06:03:25'),
(189, NULL, 59, 61, 'lisa', '7003940654', '700054', 'kljaslkd, adsads, wb', '2024-03-25 18:30:00', '12:47:18', 250, '2024-03-25 18:30:00', 'accepted', NULL, 'asdsad', NULL, NULL, 'asdas', '12321', 'dasdasd', 1, '2024-03-26 07:17:18', '2024-03-26 09:37:54'),
(190, NULL, 59, 61, 'gurman', '9831230163', '700050', '59 kalicharan Ghosh road, Kolkata , West Bengal', '2024-03-25 18:30:00', '15:21:32', 600, '2024-03-28 18:30:00', NULL, NULL, 'interior and exterior cleaning', NULL, NULL, 'kia', 'seltos', '7455', 4, '2024-03-26 09:51:32', '2024-03-26 09:51:32'),
(191, NULL, 59, 86, 'Rajiv Ghosh', '9836810316', '700054', 'P 11 CIT ROAD SCHEME VI M S NEAR PHOOLBAGAN METRO STATION , Kolkata, West Bengal', '2024-04-13 18:30:00', '15:38:37', 700, '2024-04-14 18:30:00', NULL, NULL, 'interior and exterior cleaning', NULL, NULL, 'toyota', 'Innova', 'WB08C1315', 4, '2024-04-14 10:08:37', '2024-04-14 10:08:37'),
(192, NULL, 93, 105, 'Ratul Mondal', '8370994407', '700050', 'Minakhan, Kolkata, West Bengal', '2024-05-07 18:30:00', '11:46:13', 300, '2024-05-07 18:30:00', 'accepted', NULL, 'Car Wash', NULL, NULL, 'SUV', '11F', NULL, 12, '2024-05-08 06:16:13', '2024-05-29 07:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 4, 'myToken', '613a012369ef5324653895d14a13ae74f82b1023b9f2ab6709e9a76dfbf6f399', '[\"*\"]', NULL, NULL, '2023-08-09 06:51:00', '2023-08-09 06:51:00'),
(10, 'App\\Models\\User', 6, 'myToken', '53eddf2c2a44d40f7f69f07a6f0a8ce3b573cd959d33a67c8e130fdd8e300615', '[\"*\"]', NULL, NULL, '2023-08-10 10:03:13', '2023-08-10 10:03:13'),
(11, 'App\\Models\\User', 7, 'myToken', 'a076f02193dde38a3c350836c663745ac3628b353d69a98c3f7d5bc91ec3be7e', '[\"*\"]', NULL, NULL, '2023-08-10 10:05:41', '2023-08-10 10:05:41'),
(12, 'App\\Models\\User', 7, 'API Token', '091a76a815292a8d34289c2c77423d8c4740d6ca9cd1b6afede41a3ded415edc', '[\"*\"]', NULL, NULL, '2023-08-10 10:13:36', '2023-08-10 10:13:36'),
(13, 'App\\Models\\User', 8, 'myToken', '217f82d4c8992329fdd997486966360ac8aa88801ec7ba5f45266863226a99b5', '[\"*\"]', NULL, NULL, '2023-08-10 10:19:17', '2023-08-10 10:19:17'),
(14, 'App\\Models\\User', 9, 'myToken', '7f15a421a00ee803e6ceeac96820a06aebd1fcf952001a1189ba09ac92bb5cb5', '[\"*\"]', NULL, NULL, '2023-08-10 10:22:23', '2023-08-10 10:22:23'),
(20, 'App\\Models\\User', 10, 'myToken', '78fd48fcc171db144062e6795e0698cbb18f84ad0611ec1189e86b314658ce83', '[\"*\"]', NULL, NULL, '2023-08-10 11:01:19', '2023-08-10 11:01:19'),
(22, 'App\\Models\\User', 7, 'API Token', 'c2758a5e9ee5b5d8100d9eb6ac36e7b573cb039fcf94548986a44ec2c3a932d8', '[\"*\"]', '2023-08-14 09:09:32', NULL, '2023-08-10 11:14:36', '2023-08-14 09:09:32'),
(23, 'App\\Models\\User', 11, 'myToken', 'a229d1daddb23d05e689987790e95959b971d5fe3443096804ae8412f1ab8026', '[\"*\"]', NULL, NULL, '2023-08-10 11:21:10', '2023-08-10 11:21:10'),
(24, 'App\\Models\\User', 12, 'myToken', 'cac7d1f0b6fbc23386f650299e3080f1e52ecf39ebd74c61a37a9785d4878c96', '[\"*\"]', NULL, NULL, '2023-08-10 11:22:41', '2023-08-10 11:22:41'),
(28, 'App\\Models\\User', 13, 'myToken', '346ae18a89fe6899291dd7d76d6884cd4931a8206dd2678a219e14327b4b148e', '[\"*\"]', NULL, NULL, '2023-08-10 11:30:42', '2023-08-10 11:30:42'),
(29, 'App\\Models\\User', 14, 'myToken', 'ce741a394bd9db2939c914b7302b6afad56daba3f854df7022354774e44b1b9b', '[\"*\"]', NULL, NULL, '2023-08-10 11:32:43', '2023-08-10 11:32:43'),
(30, 'App\\Models\\User', 15, 'myToken', '28d7852d3e5130f6882b4889a31d8a3df2d88e10eb75666520217a39da5fc683', '[\"*\"]', NULL, NULL, '2023-08-10 11:33:24', '2023-08-10 11:33:24'),
(42, 'App\\Models\\User', 16, 'myToken', 'edf681b97c6a064c1439115ddc5f2299e4cf2df14b64b3a3a4968949307f1ff9', '[\"*\"]', NULL, NULL, '2023-08-10 11:57:26', '2023-08-10 11:57:26'),
(44, 'App\\Models\\User', 17, 'myToken', 'a2eb7fe2a7d141c49d6c1b7f67ed10f4d28b9331a3a8ee2cfe8705ba21393ea1', '[\"*\"]', NULL, NULL, '2023-08-10 12:00:04', '2023-08-10 12:00:04'),
(45, 'App\\Models\\User', 18, 'myToken', 'f22df8216f700954a3411c8229a834b481276683224e64e4e2568c36eaaeec95', '[\"*\"]', NULL, NULL, '2023-08-10 12:01:44', '2023-08-10 12:01:44'),
(46, 'App\\Models\\User', 19, 'myToken', '26256609be337cb3a397738b9eada3918cbc46d49a632c18cf12c9d1c1bc1893', '[\"*\"]', NULL, NULL, '2023-08-10 12:02:24', '2023-08-10 12:02:24'),
(48, 'App\\Models\\User', 20, 'myToken', '50fb0ef60b26d5052edc79ab7dc2e30c9af8ffdd3d869538877a3dfc5127d47d', '[\"*\"]', NULL, NULL, '2023-08-10 12:02:46', '2023-08-10 12:02:46'),
(49, 'App\\Models\\User', 21, 'myToken', '05f422665a074d2e8a0609d577ffaa27a1d42a2c694b8c79e0dc46b1beeaadb7', '[\"*\"]', NULL, NULL, '2023-08-10 12:04:13', '2023-08-10 12:04:13'),
(51, 'App\\Models\\User', 22, 'myToken', 'f0c3cc5e73080b4d6fafa57ae3eeef133ca3fea7dd219998bdbe61ca09aee69e', '[\"*\"]', NULL, NULL, '2023-08-10 12:44:32', '2023-08-10 12:44:32'),
(52, 'App\\Models\\User', 23, 'myToken', 'b4c3241169213a3e9150e09bf8cb37901a5f01e5598493d8d5c0e2524f021bdc', '[\"*\"]', NULL, NULL, '2023-08-10 12:44:51', '2023-08-10 12:44:51'),
(53, 'App\\Models\\User', 24, 'myToken', '8ac44513f8b0a716fafc4786a5fe73ea7f9bbd6a248aeb6653e935bfc8f667ee', '[\"*\"]', NULL, NULL, '2023-08-10 12:45:39', '2023-08-10 12:45:39'),
(54, 'App\\Models\\User', 25, 'myToken', '1952b1def86d9048107a8439b19b549e8f28c7cde1f55337391031d32ea65446', '[\"*\"]', NULL, NULL, '2023-08-10 12:46:46', '2023-08-10 12:46:46'),
(55, 'App\\Models\\User', 26, 'myToken', 'da7cae57a3039f9b42fff5e3fb255301ac4fb8d0603d5320743c86e985371478', '[\"*\"]', NULL, NULL, '2023-08-10 12:52:42', '2023-08-10 12:52:42'),
(57, 'App\\Models\\User', 27, 'myToken', '853898c6b8b91e9a1ae3169853c7b300d1e32ac29cfaab38be89f6af4b5a26f9', '[\"*\"]', NULL, NULL, '2023-08-10 12:56:53', '2023-08-10 12:56:53'),
(58, 'App\\Models\\User', 28, 'myToken', 'e635eba904af528895de60b0e91d141cdd6375871687c254e5afe99a4c587469', '[\"*\"]', NULL, NULL, '2023-08-10 12:59:35', '2023-08-10 12:59:35'),
(88, 'App\\Models\\User', 10, 'API Token', '514da281b7d54cfc976bf132ce18ef8b9c0546de5613f74254a20936fe7664e3', '[\"*\"]', NULL, NULL, '2023-08-10 14:24:55', '2023-08-10 14:24:55'),
(89, 'App\\Models\\User', 10, 'API Token', '70f599d23d6dacfa4918a74760afeed931c4f0b3c00c28494b4d7b73fca10c1a', '[\"*\"]', NULL, NULL, '2023-08-10 14:26:27', '2023-08-10 14:26:27'),
(90, 'App\\Models\\User', 10, 'API Token', '8e30547d380ccafe471b9e3e8f762a8ac0ed382415454f10c6d74a902b59c622', '[\"*\"]', NULL, NULL, '2023-08-10 14:27:56', '2023-08-10 14:27:56'),
(99, 'App\\Models\\User', 10, 'API Token', '93c68b380d0de6f658b719b5dfa842c37598c30fad9121944ec5b52f3181169e', '[\"*\"]', NULL, NULL, '2023-08-10 15:28:24', '2023-08-10 15:28:24'),
(113, 'App\\Models\\User', 10, 'API Token', 'c00127401ece77bd64c0af32ec34e4dfb32e28e945a60f412d34b51affce17fb', '[\"*\"]', NULL, NULL, '2023-08-10 16:41:58', '2023-08-10 16:41:58'),
(128, 'App\\Models\\User', 30, 'myToken', '707fad7da073555535065aab99a81eedb743c26ccd696189ead330ddc59993a0', '[\"*\"]', NULL, NULL, '2023-08-10 17:04:09', '2023-08-10 17:04:09'),
(129, 'App\\Models\\User', 30, 'API Token', '0b462947fdbeb4b61f128bcdaaeacb35ba0b4b55d406e9a81db78cdf456c4231', '[\"*\"]', NULL, NULL, '2023-08-10 17:04:39', '2023-08-10 17:04:39'),
(143, 'App\\Models\\User', 1, 'API Token', '4091dee82734b7c5063a4aa5c6c95dd1328298e880f1a453fb29a836d5faf4cc', '[\"*\"]', '2023-08-11 09:39:22', NULL, '2023-08-11 09:36:08', '2023-08-11 09:39:22'),
(157, 'App\\Models\\User', 31, 'API Token', '932e5f98b715f3a7118dd2e00283e21764e3d1b9229f8c068c944f5bc6f2cac6', '[\"*\"]', '2023-09-13 14:37:00', NULL, '2023-08-11 11:58:30', '2023-09-13 14:37:00'),
(158, 'App\\Models\\User', 31, 'API Token', '2433af8dc2382c26774277cc348fb78a49b092ea5fea89d9f4a22e431d92464b', '[\"*\"]', '2023-08-11 15:45:57', NULL, '2023-08-11 12:02:27', '2023-08-11 15:45:57'),
(159, 'App\\Models\\User', 31, 'API Token', '26de0d5da47db1d66177c6407362ad78dd6d2f8418424682e7eec5723fd5a826', '[\"*\"]', '2023-08-11 15:49:44', NULL, '2023-08-11 12:03:36', '2023-08-11 15:49:44'),
(166, 'App\\Models\\User', 32, 'API Token', '4545856adfac0625a3ca971e8e206141250644316db93ed86eada97c56ea6f85', '[\"*\"]', '2023-08-11 13:51:06', NULL, '2023-08-11 13:36:10', '2023-08-11 13:51:06'),
(167, 'App\\Models\\User', 32, 'API Token', '746a20c1346f3b98ee73f21eed235e7700febf8aedd910ca2dbbed549f3cdbe8', '[\"*\"]', '2023-08-11 14:08:55', NULL, '2023-08-11 14:02:08', '2023-08-11 14:08:55'),
(168, 'App\\Models\\User', 32, 'API Token', '63e80a198c91265e8e529826f101b4d8a49209856eb25a4e36ff106525efad2e', '[\"*\"]', '2023-08-11 15:07:48', NULL, '2023-08-11 14:15:12', '2023-08-11 15:07:48'),
(169, 'App\\Models\\User', 32, 'API Token', 'f97bddaef70ae0d9e13126283f647158438c1a8a258fd43fa2f61b53d1d66a03', '[\"*\"]', '2023-08-11 15:07:13', NULL, '2023-08-11 15:06:48', '2023-08-11 15:07:13'),
(170, 'App\\Models\\User', 31, 'API Token', '50a5ad6ec9abff146d64050bbe838f343c8c27a7f8c3aa154087639d00804ec8', '[\"*\"]', '2023-08-11 16:12:21', NULL, '2023-08-11 15:46:33', '2023-08-11 16:12:21'),
(171, 'App\\Models\\User', 32, 'API Token', '89e6887958f764a4ce660153a322651c0e583f865b7ce520ac95386a4f4d3544', '[\"*\"]', NULL, NULL, '2023-08-11 16:02:42', '2023-08-11 16:02:42'),
(172, 'App\\Models\\User', 31, 'API Token', '8f40731e22e4fb03eb7583b00b53c8b9407a367a11d2ca54c8cdf73597eb6a07', '[\"*\"]', '2023-08-11 16:12:58', NULL, '2023-08-11 16:12:57', '2023-08-11 16:12:58'),
(173, 'App\\Models\\User', 31, 'API Token', 'e1c5857618ed8628dda071adca407c90d15b0b6be658a8e8ee7a2a6b70c02069', '[\"*\"]', '2023-08-11 16:35:22', NULL, '2023-08-11 16:13:28', '2023-08-11 16:35:22'),
(174, 'App\\Models\\User', 5, 'API Token', '3194b07915653d64e7ba48c14b80dfab3c7dacfbc14fb44c3160111954caf7b6', '[\"*\"]', '2023-08-18 08:08:48', NULL, '2023-08-11 16:26:19', '2023-08-18 08:08:48'),
(175, 'App\\Models\\User', 31, 'API Token', 'b500e2a56c91cb4e69aabf1d2ba56ee1384f461dc59c5df056bd82892ddb7c6a', '[\"*\"]', '2023-08-11 17:12:08', NULL, '2023-08-11 17:11:48', '2023-08-11 17:12:08'),
(176, 'App\\Models\\User', 31, 'API Token', 'a111365231a00ac3436e1374e4215a0342f7483ec6108ee949e49d9d4f945117', '[\"*\"]', '2023-08-14 08:08:51', NULL, '2023-08-11 17:15:03', '2023-08-14 08:08:51'),
(177, 'App\\Models\\User', 32, 'API Token', '64d7e80a375585fed5fd4ff350c2669ff0f573362f821c3f2264eae2a27a97c0', '[\"*\"]', NULL, NULL, '2023-08-12 11:45:28', '2023-08-12 11:45:28'),
(178, 'App\\Models\\User', 32, 'API Token', '4dfd59c060e06e1758537cb80b27bd5511aa53950bb1720b823a651dd4c5aaeb', '[\"*\"]', NULL, NULL, '2023-08-12 11:46:48', '2023-08-12 11:46:48'),
(179, 'App\\Models\\User', 32, 'API Token', 'f753f0b731cccc3e1cc760caefd4f2aabe1b984334253a9e513d31fae8aa4abc', '[\"*\"]', '2023-08-12 18:17:59', NULL, '2023-08-12 11:54:00', '2023-08-12 18:17:59'),
(180, 'App\\Models\\User', 32, 'API Token', '3cb3dd33040eb2e971d30565b9912e06d8901bcad97e0cc8f02600107e7de59b', '[\"*\"]', NULL, NULL, '2023-08-12 17:18:57', '2023-08-12 17:18:57'),
(181, 'App\\Models\\User', 32, 'API Token', 'cf08400804b37a0013beeca53075dd5882a68393d3b23495e9d1ff90157edc12', '[\"*\"]', NULL, NULL, '2023-08-12 17:48:14', '2023-08-12 17:48:14'),
(182, 'App\\Models\\User', 32, 'API Token', '80d9c4987444ee9990dbe12277353f9e6274a7c7bb977c60a8c0ca4f1ba1fc9e', '[\"*\"]', NULL, NULL, '2023-08-12 17:56:48', '2023-08-12 17:56:48'),
(183, 'App\\Models\\User', 32, 'API Token', 'bf5bb891a58f02463ef614111bf3ef2a401ac4b405600df4edb360cd87aa94b5', '[\"*\"]', '2023-08-12 18:04:02', NULL, '2023-08-12 18:01:24', '2023-08-12 18:04:02'),
(184, 'App\\Models\\User', 31, 'API Token', 'bb177ae514f15a90111abd8a9edc63117e77b6c05859a553c597a54b1d851797', '[\"*\"]', '2023-08-14 08:32:54', NULL, '2023-08-12 22:24:54', '2023-08-14 08:32:54'),
(185, 'App\\Models\\User', 5, 'API Token', '8e76ab051b56612bf75debaa29dd89e9e2f771e9024bdff1a0d58d9b9a0c401e', '[\"*\"]', '2023-08-14 08:16:13', NULL, '2023-08-14 08:15:58', '2023-08-14 08:16:13'),
(186, 'App\\Models\\User', 3, 'API Token', 'b2dfdf13a30c5528e3720f835c93e28bae7c3dbb9215a4abb76e1b191602f53c', '[\"*\"]', NULL, NULL, '2023-08-14 08:16:48', '2023-08-14 08:16:48'),
(187, 'App\\Models\\User', 5, 'API Token', '31664bfceb6d5109f869e06dbdbb640ee677b7af9ae2aba8e352f513e1e6d4e5', '[\"*\"]', NULL, NULL, '2023-08-14 08:33:22', '2023-08-14 08:33:22'),
(188, 'App\\Models\\User', 5, 'API Token', '5f711406d1b84ed2545f33ccf3b84a20bf1de763f6706616128e975351a0fcd7', '[\"*\"]', '2023-08-14 12:00:20', NULL, '2023-08-14 08:45:30', '2023-08-14 12:00:20'),
(189, 'App\\Models\\User', 31, 'API Token', 'ac5257080fc2090c3b88ecd08e689424f96ce8b556868a1e10afdbaa84699788', '[\"*\"]', NULL, NULL, '2023-08-14 08:59:07', '2023-08-14 08:59:07'),
(190, 'App\\Models\\User', 5, 'API Token', 'd136d276b2f883ffb214e625af40142920679a281cfd28d6e94ff82e57e34b01', '[\"*\"]', '2023-08-14 16:07:53', NULL, '2023-08-14 11:36:42', '2023-08-14 16:07:53'),
(191, 'App\\Models\\User', 31, 'API Token', '419d7b692de7664af15c83989e0fb5a5524a9d9e7edd13ecaf404eb71e69394d', '[\"*\"]', '2023-08-14 12:16:16', NULL, '2023-08-14 12:05:41', '2023-08-14 12:16:16'),
(192, 'App\\Models\\User', 31, 'API Token', '674033d5886a1ab2c4b042e5b7dbe3aa7315d5ac45be66f27b88dc273119c91e', '[\"*\"]', '2023-08-14 12:35:16', NULL, '2023-08-14 12:28:37', '2023-08-14 12:35:16'),
(193, 'App\\Models\\User', 31, 'API Token', 'ec50b11cdf881370e0d4c41e22387c641e2c7e0dd63bfcb652afe878d1d578dc', '[\"*\"]', '2023-08-28 17:32:49', NULL, '2023-08-14 13:13:57', '2023-08-28 17:32:49'),
(194, 'App\\Models\\User', 5, 'API Token', 'ab0c401ba23a500c21cb4c96000abaef59a4910fdcd53c0704392b50a047e721', '[\"*\"]', '2023-08-14 16:13:02', NULL, '2023-08-14 16:12:22', '2023-08-14 16:13:02'),
(195, 'App\\Models\\User', 31, 'API Token', 'a883baf34d8f1afa57aac7295ddcdf165e898ed46dad48d67a9ecd89c0abcdd6', '[\"*\"]', '2023-08-14 16:15:12', NULL, '2023-08-14 16:13:32', '2023-08-14 16:15:12'),
(196, 'App\\Models\\User', 5, 'API Token', 'd7d0d723c44aadd3f10d774ad9bf64cbdaa75a8bcaa53d2a360a938119d2561b', '[\"*\"]', '2023-08-14 16:21:43', NULL, '2023-08-14 16:19:42', '2023-08-14 16:21:43'),
(197, 'App\\Models\\User', 31, 'API Token', '9288161e73edd2faad38df0ca62558187bc3330e58ad7dda8eee989f149da239', '[\"*\"]', '2023-08-14 16:23:23', NULL, '2023-08-14 16:22:22', '2023-08-14 16:23:23'),
(198, 'App\\Models\\User', 5, 'API Token', 'fbe4fb6b6b3cb4df0899dea9858d2d7b7ab8abea2b44da9d98c7285d815c4ff5', '[\"*\"]', '2023-08-14 16:41:17', NULL, '2023-08-14 16:38:01', '2023-08-14 16:41:17'),
(199, 'App\\Models\\User', 5, 'API Token', 'aeba9ee1fabafb2ee79f8698e69896e1541573db26f6f10d6d2cc723f86031ca', '[\"*\"]', '2023-08-14 16:42:07', NULL, '2023-08-14 16:38:44', '2023-08-14 16:42:07'),
(200, 'App\\Models\\User', 5, 'API Token', '1383ef56477d54296ac8781126a300ee4bdea9f7f3d394efd0aafff0a187a9b2', '[\"*\"]', NULL, NULL, '2023-08-15 15:16:18', '2023-08-15 15:16:18'),
(201, 'App\\Models\\User', 5, 'API Token', 'aea5e88535120ae1207b3012025889b1da936e25005d55093f543517abd72baf', '[\"*\"]', NULL, NULL, '2023-08-15 15:19:18', '2023-08-15 15:19:18'),
(202, 'App\\Models\\User', 1, 'API Token', '8dc7e848a1f68fd5c42c93c4bd31a084bf99d4ceba75b3668e3a2fda57a57e5e', '[\"*\"]', NULL, NULL, '2023-08-16 11:30:47', '2023-08-16 11:30:47'),
(203, 'App\\Models\\User', 1, 'API Token', '964c76e3ef4e7dd2977bf23c284c9a18496ef4fd8dbc6cec601ad68fdac509a5', '[\"*\"]', NULL, NULL, '2023-08-16 11:54:11', '2023-08-16 11:54:11'),
(204, 'App\\Models\\User', 31, 'API Token', 'a7b49504d7f951276087caee16ea3f04535e525f2fe94aaad727a0531a826210', '[\"*\"]', NULL, NULL, '2023-08-16 16:26:51', '2023-08-16 16:26:51'),
(205, 'App\\Models\\User', 33, 'myToken', 'b557c1424c9b7f55d0c00fc56eb13c10d8ac00c37ae90b1a231698e98c7f8e15', '[\"*\"]', NULL, NULL, '2023-08-16 16:29:37', '2023-08-16 16:29:37'),
(206, 'App\\Models\\User', 33, 'API Token', 'd6235413b6d251790165c02d2b018e8023dee7ea5f6db90758be021770694dd6', '[\"*\"]', NULL, NULL, '2023-08-16 16:30:52', '2023-08-16 16:30:52'),
(207, 'App\\Models\\User', 5, 'API Token', 'a02d1bc6b2fb1b59e48d0e4d3dbbc596b9de9c3ac281a41fa10445ff5bfc36df', '[\"*\"]', '2023-08-17 11:13:58', NULL, '2023-08-17 11:12:03', '2023-08-17 11:13:58'),
(208, 'App\\Models\\User', 31, 'API Token', '572fd502cb31b6b2adc6c8112f5b7b7e6d81799cc8d0a178923eb905523d468e', '[\"*\"]', '2023-08-18 08:47:21', NULL, '2023-08-18 08:08:35', '2023-08-18 08:47:21'),
(209, 'App\\Models\\User', 31, 'API Token', '359a32b792713790ef2959a2edd33d7ef8aac3343f9398566029d135517a0853', '[\"*\"]', '2023-09-01 19:21:12', NULL, '2023-08-18 11:13:58', '2023-09-01 19:21:12'),
(210, 'App\\Models\\User', 5, 'API Token', 'd097cc359e3584baccd365dd2228f0ff633a198b961c1d2f09c25433134be0e5', '[\"*\"]', '2023-08-27 10:40:07', NULL, '2023-08-27 10:36:57', '2023-08-27 10:40:07'),
(211, 'App\\Models\\User', 5, 'API Token', '8dbf8d9b4da22dd6be2b9d6cd38f44e5caf01f886526879b908524a501604b84', '[\"*\"]', '2023-08-27 16:06:25', NULL, '2023-08-27 16:03:47', '2023-08-27 16:06:25'),
(212, 'App\\Models\\User', 5, 'API Token', '6d1776e01e8318e5f80fcf55c6c461c86cfb7c669adef149234efdf14f28cdbd', '[\"*\"]', NULL, NULL, '2023-08-29 08:59:30', '2023-08-29 08:59:30'),
(213, 'App\\Models\\User', 5, 'API Token', 'b00e44e59fa38e20d2bf996fe382bd5e18213fba6de7dd1de0c3d0a2616c664d', '[\"*\"]', '2023-08-29 09:05:53', NULL, '2023-08-29 09:04:46', '2023-08-29 09:05:53'),
(214, 'App\\Models\\User', 5, 'API Token', '395aed0a12627745f92cc1af5662ead77ce5ccd758e528d6b43af02104f91156', '[\"*\"]', NULL, NULL, '2023-08-29 09:25:07', '2023-08-29 09:25:07'),
(215, 'App\\Models\\User', 5, 'API Token', '6ab351dd699c74ae5c8f8e6df95534bfbe8ab2f01baf0fa4e9455e526aeeb0e5', '[\"*\"]', '2023-08-29 11:28:45', NULL, '2023-08-29 11:26:03', '2023-08-29 11:28:45'),
(216, 'App\\Models\\User', 5, 'API Token', '4550d7e96244f657f50a7f773a8a310d25b54a0beb2b2ae29109abee6456871d', '[\"*\"]', '2023-08-29 14:11:17', NULL, '2023-08-29 13:53:42', '2023-08-29 14:11:17'),
(217, 'App\\Models\\User', 5, 'API Token', '72ccc3a88593574dd92b42e7cc2d9ec55d3d45ff3d678f7ae86228a1dc1416d4', '[\"*\"]', '2023-08-29 14:19:53', NULL, '2023-08-29 14:19:01', '2023-08-29 14:19:53'),
(218, 'App\\Models\\User', 5, 'API Token', '26a5acf7d0f2c602a06b7c28a1d2e30bbf71cdebc9adbab57277af9ea4ec5a5b', '[\"*\"]', '2023-08-29 14:26:09', NULL, '2023-08-29 14:25:51', '2023-08-29 14:26:09'),
(219, 'App\\Models\\User', 5, 'API Token', 'dbb2a3df1b26967873dc9e1569884b80c711e549da8df36d0068f93723e7ce79', '[\"*\"]', '2023-08-29 14:28:10', NULL, '2023-08-29 14:26:30', '2023-08-29 14:28:10'),
(220, 'App\\Models\\User', 5, 'API Token', 'f3b1ce86c4ae1017ec0ccb4928e16c123f44be4ef934678d02d7cf3ba9d085c7', '[\"*\"]', '2023-08-29 14:32:54', NULL, '2023-08-29 14:31:19', '2023-08-29 14:32:54'),
(221, 'App\\Models\\User', 5, 'API Token', '3fc067bee046627ed6207e568847dce706650e75e26616320fb43a5b11f01c74', '[\"*\"]', '2023-08-29 14:49:53', NULL, '2023-08-29 14:46:49', '2023-08-29 14:49:53'),
(222, 'App\\Models\\User', 5, 'API Token', '8d5dc7f2fd91d58500693be16482ba016b00c3c633aada1352e1956c0ef0b8a8', '[\"*\"]', '2023-08-30 03:01:54', NULL, '2023-08-30 03:01:40', '2023-08-30 03:01:54'),
(223, 'App\\Models\\User', 5, 'API Token', '1dc787d66b131adf4157ce9d2d92645c39c0576fea5719b89ce5c849e9533cd8', '[\"*\"]', '2023-08-31 13:37:01', NULL, '2023-08-31 13:36:40', '2023-08-31 13:37:01'),
(224, 'App\\Models\\User', 31, 'API Token', '7baade2c4dd925fb286336db3003978be77cc00f0689f7d251f17c8bf651301b', '[\"*\"]', '2023-08-31 13:37:39', NULL, '2023-08-31 13:37:37', '2023-08-31 13:37:39'),
(225, 'App\\Models\\User', 5, 'API Token', '0ad43ef7ab4ed79383faf2b2880176f2b6b807f8242829038931fc9a95818865', '[\"*\"]', '2023-08-31 13:39:24', NULL, '2023-08-31 13:39:17', '2023-08-31 13:39:24'),
(226, 'App\\Models\\User', 5, 'API Token', 'bc85c3b8f63ba4c3cc7d952b063cc30c787c7bdb5949a9c9742303329eecebb9', '[\"*\"]', '2023-08-31 13:41:55', NULL, '2023-08-31 13:40:15', '2023-08-31 13:41:55'),
(227, 'App\\Models\\User', 5, 'API Token', '3d010439b80b9a8aa000fb7d866c8c4dcd52babf4617d32865f7671b305baddc', '[\"*\"]', '2023-08-31 13:45:04', NULL, '2023-08-31 13:43:28', '2023-08-31 13:45:04'),
(228, 'App\\Models\\User', 34, 'myToken', '5181e1f98cbd02dfe3b71b2141336f3089a9b273bf21b0707a57c57620fc8375', '[\"*\"]', NULL, NULL, '2023-08-31 13:44:23', '2023-08-31 13:44:23'),
(229, 'App\\Models\\User', 34, 'API Token', 'e3f5c77b198ef6710ebae203af2a8b348873d0625bc2649a3622998c397c4e7d', '[\"*\"]', '2023-08-31 19:27:12', NULL, '2023-08-31 13:45:08', '2023-08-31 19:27:12'),
(230, 'App\\Models\\User', 31, 'API Token', 'fb3bbbf95a7943c439f47c84f77d41478ea1351276aea966548d1cc6b5c48974', '[\"*\"]', '2023-08-31 13:48:56', NULL, '2023-08-31 13:47:21', '2023-08-31 13:48:56'),
(231, 'App\\Models\\User', 31, 'API Token', 'df7cd45f280a365384ae9fe1f8deda8a86a215afaa6d6ac7b5decbdd2d8bb771', '[\"*\"]', '2023-08-31 19:31:15', NULL, '2023-08-31 19:31:09', '2023-08-31 19:31:15'),
(232, 'App\\Models\\User', 31, 'API Token', '84247f0a19931a373cc15009c918a0e3bf74a0062de61cf057991429baf61efd', '[\"*\"]', '2023-08-31 19:33:26', NULL, '2023-08-31 19:31:58', '2023-08-31 19:33:26'),
(233, 'App\\Models\\User', 34, 'API Token', '98e4533cfeb58d9d439b2ae3b23ca7367e86bbd565601c4f910913f02f76141a', '[\"*\"]', '2023-08-31 19:46:53', NULL, '2023-08-31 19:34:55', '2023-08-31 19:46:53'),
(234, 'App\\Models\\User', 31, 'API Token', 'c88c5429e39f7fb5d97784bbeec52aa36a2f29cf622cc0487d76228a4c1593b5', '[\"*\"]', '2023-08-31 19:36:12', NULL, '2023-08-31 19:35:15', '2023-08-31 19:36:12'),
(235, 'App\\Models\\User', 5, 'API Token', '4780f1fa4c5d7a1199cee154ff599b386ae926b7eb4766e22f3d85a4361c69d6', '[\"*\"]', '2023-08-31 21:07:39', NULL, '2023-08-31 21:05:45', '2023-08-31 21:07:39'),
(236, 'App\\Models\\User', 31, 'API Token', '7aeb748181f35090d0c01cb7b02cbbee0a04de8920526221da96060d680984c5', '[\"*\"]', '2023-09-01 15:41:19', NULL, '2023-09-01 15:38:27', '2023-09-01 15:41:19'),
(237, 'App\\Models\\User', 31, 'API Token', 'f18864c133a70914e225666b3ff75403d62e00a28ac7923c49089e9462878566', '[\"*\"]', '2023-09-01 21:37:47', NULL, '2023-09-01 15:42:47', '2023-09-01 21:37:47'),
(238, 'App\\Models\\User', 5, 'API Token', '18ab704802266364040109c69d56d8a9d7e7e80444ba64066441e1971ea2f3a1', '[\"*\"]', '2023-09-01 17:18:58', NULL, '2023-09-01 17:17:45', '2023-09-01 17:18:58'),
(239, 'App\\Models\\User', 5, 'API Token', '55dee9ca7300328bd9255ae8ae29af5dd020c70a0ef0862a5c00169902e16788', '[\"*\"]', '2023-09-01 21:39:00', NULL, '2023-09-01 21:38:15', '2023-09-01 21:39:00'),
(240, 'App\\Models\\User', 31, 'API Token', 'ba2110c5c33bc67387ba23b456f69d989b5195a25cf6a39eea85d0dec75f8910', '[\"*\"]', '2023-09-07 15:31:50', NULL, '2023-09-01 21:39:28', '2023-09-07 15:31:50'),
(241, 'App\\Models\\User', 35, 'myToken', 'f2633a8c44f932be648e6ff1f5e7ee0f9d08d039098ecfab0295b5d95fdd5727', '[\"*\"]', NULL, NULL, '2023-09-03 03:41:30', '2023-09-03 03:41:30'),
(242, 'App\\Models\\User', 35, 'API Token', '75487c04f1617d38eef48bbe4401940cf67e78ec51f676458dd6914645fb768c', '[\"*\"]', '2023-09-03 03:42:49', NULL, '2023-09-03 03:41:41', '2023-09-03 03:42:49'),
(243, 'App\\Models\\User', 35, 'API Token', '97ab74d8e5fe074e4ed325446d2e3d9ec2c6679a2949efc81fbfbf211aebc511', '[\"*\"]', '2023-09-03 10:35:56', NULL, '2023-09-03 10:35:30', '2023-09-03 10:35:56'),
(244, 'App\\Models\\User', 5, 'API Token', '6aceccf17b26deb8f7f8cb12bee54f1453a3f0a5a4521a342313faa5f50d1027', '[\"*\"]', NULL, NULL, '2023-09-07 22:40:50', '2023-09-07 22:40:50'),
(245, 'App\\Models\\User', 5, 'API Token', 'd5ecc6857a79649c3c621be8379c05eedea6a5afb9ad52bcb30ea1f16d3ab955', '[\"*\"]', '2023-09-07 23:02:16', NULL, '2023-09-07 22:41:55', '2023-09-07 23:02:16'),
(246, 'App\\Models\\User', 31, 'API Token', '8f13a953b64f6ccb8cbde4d3041a154585a494be590fca02854f2f988d6b9430', '[\"*\"]', '2023-09-07 23:20:29', NULL, '2023-09-07 23:12:49', '2023-09-07 23:20:29'),
(247, 'App\\Models\\User', 5, 'API Token', '495ecde72e4ec22e5373a9a58a372dcd465bcb65cf984e357f04c9bb42b9df6a', '[\"*\"]', '2023-09-07 23:25:00', NULL, '2023-09-07 23:24:22', '2023-09-07 23:25:00'),
(248, 'App\\Models\\User', 31, 'API Token', '3be85b84184183e3831a2a63996c522eb2c86b60aea32dbe00bd06dc03badbe1', '[\"*\"]', '2023-09-07 23:25:25', NULL, '2023-09-07 23:25:18', '2023-09-07 23:25:25'),
(249, 'App\\Models\\User', 5, 'API Token', 'f6c8861a5e325ae9fd67bdeb62f4c9961eb0ee837acf64accdb0346cffa833d3', '[\"*\"]', '2023-09-08 17:36:56', NULL, '2023-09-08 17:35:44', '2023-09-08 17:36:56'),
(250, 'App\\Models\\User', 5, 'API Token', '57dfe98aae5df1f82638c0bbf52213a062bfe485b1e906b47659f8b9823e7c21', '[\"*\"]', '2023-09-11 16:00:07', NULL, '2023-09-11 15:17:25', '2023-09-11 16:00:07'),
(251, 'App\\Models\\User', 5, 'API Token', '12af2622522e13718296e36cb9c3cfdf296b8c4671658da566a938201ae932d9', '[\"*\"]', '2023-09-11 16:15:45', NULL, '2023-09-11 16:15:33', '2023-09-11 16:15:45'),
(252, 'App\\Models\\User', 5, 'API Token', 'd1afef9c04d3d15c50f6f68b3ec1288208c54656435356889282317debfd86bf', '[\"*\"]', NULL, NULL, '2023-09-11 16:17:41', '2023-09-11 16:17:41'),
(253, 'App\\Models\\User', 5, 'API Token', 'a9cc182a96a40e1832aab651f1511d032911c56fc2f7739581a8902435e42d82', '[\"*\"]', '2023-09-11 16:18:57', NULL, '2023-09-11 16:18:51', '2023-09-11 16:18:57'),
(254, 'App\\Models\\User', 5, 'API Token', '7c5ee766e54abd3f9a0f1588961e3ba79369f802d44f0bf3183c580b4459cb20', '[\"*\"]', '2023-09-11 16:29:02', NULL, '2023-09-11 16:27:57', '2023-09-11 16:29:02'),
(255, 'App\\Models\\User', 5, 'API Token', '5a6cd15cb8b072ee4cf61081bbd0d16c6d7aaa5545dfc73a0c0fc710f4e6304c', '[\"*\"]', '2023-09-11 18:55:01', NULL, '2023-09-11 18:54:55', '2023-09-11 18:55:01'),
(256, 'App\\Models\\User', 5, 'API Token', '3e42a648055c1b59d99f4e204a9000449e87e37745394eef950c2c1edd7a3210', '[\"*\"]', '2023-09-11 19:11:40', NULL, '2023-09-11 19:11:31', '2023-09-11 19:11:40'),
(257, 'App\\Models\\User', 5, 'API Token', '97f6ce57cc401a22af282bc3b91a7ec736c8ac35d07bab00c97ab9d170a4533d', '[\"*\"]', '2023-09-12 15:45:57', NULL, '2023-09-12 15:44:24', '2023-09-12 15:45:57'),
(258, 'App\\Models\\User', 5, 'API Token', '396ed8943a9cb77bfb7a74418053807a66803afdc7031e53f3f9ad194ade5cd4', '[\"*\"]', '2023-09-12 16:34:18', NULL, '2023-09-12 16:32:10', '2023-09-12 16:34:18'),
(259, 'App\\Models\\User', 41, 'myToken', '0b76545583d3701fbea76478cac87d5848047edfb11a89387ebdfe7fe61062c8', '[\"*\"]', NULL, NULL, '2023-09-12 16:35:12', '2023-09-12 16:35:12'),
(260, 'App\\Models\\User', 42, 'myToken', '59880859ee4843ae829b137defdb76bab2c48315f30d3304c0ed175a978fa64d', '[\"*\"]', NULL, NULL, '2023-09-12 16:44:56', '2023-09-12 16:44:56'),
(261, 'App\\Models\\User', 5, 'API Token', 'c058ee6c4f777714a5a1847f6ef95d186e97298b1de22f1a16063147c7407b83', '[\"*\"]', '2023-09-12 20:14:23', NULL, '2023-09-12 17:18:21', '2023-09-12 20:14:23'),
(262, 'App\\Models\\User', 43, 'myToken', 'a341f821c75232048d9b40bc5ff1da1fe918d5e913635e41d90e184d6887281b', '[\"*\"]', NULL, NULL, '2023-09-12 18:26:42', '2023-09-12 18:26:42'),
(263, 'App\\Models\\User', 43, 'API Token', 'e123482410d715419006bfce1b322642b422bfd32428607a3aaa95188ebdd808', '[\"*\"]', '2023-09-12 19:19:57', NULL, '2023-09-12 18:27:09', '2023-09-12 19:19:57'),
(264, 'App\\Models\\User', 43, 'API Token', 'c32fff2463813846eac74938fcc52fcff29d441865d9e1affdcc628e54135cce', '[\"*\"]', '2023-09-12 19:28:25', NULL, '2023-09-12 19:25:26', '2023-09-12 19:28:25'),
(265, 'App\\Models\\User', 43, 'API Token', 'a87ca244cd12bf5919d11a99cf0e2c20680dc9e20127a1b98c30e3b9c3aa21ee', '[\"*\"]', '2023-09-12 19:32:41', NULL, '2023-09-12 19:32:35', '2023-09-12 19:32:41'),
(266, 'App\\Models\\User', 5, 'API Token', '959f4485685bdf3ac287d35dbb25cdb52f3d36286ad97f845eae5a3f315b4c3d', '[\"*\"]', '2023-09-12 19:41:06', NULL, '2023-09-12 19:39:50', '2023-09-12 19:41:06'),
(267, 'App\\Models\\User', 31, 'API Token', '3847e1a7feed4080eb6f3a6aaa9194b44d7a401dda22f91ff2db2bcecb7a6d11', '[\"*\"]', '2023-09-12 19:42:27', NULL, '2023-09-12 19:42:00', '2023-09-12 19:42:27'),
(268, 'App\\Models\\User', 5, 'API Token', '5ce419e34a4993e38a8c95447c77e0e15543e14165b2f3342adc07c53748bfa9', '[\"*\"]', '2023-09-12 20:13:21', NULL, '2023-09-12 20:13:17', '2023-09-12 20:13:21'),
(269, 'App\\Models\\User', 5, 'API Token', 'ca510fb6e7b0822cea4b3b2cc719074674cfc92958fc533e45a967d6d3ea5770', '[\"*\"]', '2023-09-12 20:34:25', NULL, '2023-09-12 20:33:57', '2023-09-12 20:34:25'),
(270, 'App\\Models\\User', 5, 'API Token', '08d45f21e0882b4f81394880d2f74983a0dd841e610873618d2d82bb57d093cb', '[\"*\"]', '2023-09-12 20:38:46', NULL, '2023-09-12 20:35:49', '2023-09-12 20:38:46'),
(271, 'App\\Models\\User', 5, 'API Token', '1cc87352c35d47e8a19eb23f60e9cd496f4aed422e56c86927829bfb96146201', '[\"*\"]', '2023-09-12 20:43:08', NULL, '2023-09-12 20:43:03', '2023-09-12 20:43:08'),
(272, 'App\\Models\\User', 5, 'API Token', 'ac84bff35e02d3c915c07a2a6a36ccc6c039537b33bc4fa16e6f443911ce8e90', '[\"*\"]', '2023-09-12 20:44:45', NULL, '2023-09-12 20:44:27', '2023-09-12 20:44:45'),
(273, 'App\\Models\\User', 5, 'API Token', '60083ab9f95488beb639726f7f95f05283c6e4d8eb15357ffd888a7c7a4841ef', '[\"*\"]', '2023-09-12 20:46:01', NULL, '2023-09-12 20:45:46', '2023-09-12 20:46:01'),
(274, 'App\\Models\\User', 5, 'API Token', 'bc127dfcf092ad4cb80cf2d9280d317ed5c32808dd4facdf1cb0c2990ba3e25a', '[\"*\"]', '2023-09-12 21:24:20', NULL, '2023-09-12 21:22:25', '2023-09-12 21:24:20'),
(275, 'App\\Models\\User', 5, 'API Token', 'bb5a7ae712e4a1a466c08ebe7946e945f171ab57367efe9282ca56aec1153c54', '[\"*\"]', '2023-09-12 21:30:06', NULL, '2023-09-12 21:28:39', '2023-09-12 21:30:06'),
(276, 'App\\Models\\User', 5, 'API Token', '575bfe3a58862441d1319b4f465931757b9ef21b4fff3e3dc74ea30472612287', '[\"*\"]', '2023-09-12 21:32:00', NULL, '2023-09-12 21:31:33', '2023-09-12 21:32:00'),
(277, 'App\\Models\\User', 5, 'API Token', 'c8110f10920b891606d7c1aa47383e96c7e681931f4ca194c81005bf077785da', '[\"*\"]', '2023-09-12 21:34:22', NULL, '2023-09-12 21:34:05', '2023-09-12 21:34:22'),
(278, 'App\\Models\\User', 5, 'API Token', '48baed75c41bff3a457b8c284a5728c631ea7ca47b3bcadd28df6607feaef94d', '[\"*\"]', NULL, NULL, '2023-09-12 21:59:54', '2023-09-12 21:59:54'),
(279, 'App\\Models\\User', 5, 'API Token', 'a0fcbdcc20a507267255f0553c42cc3e28a97bb28f223e3c26bf398dfc2226f0', '[\"*\"]', '2023-09-13 14:32:08', NULL, '2023-09-13 14:31:47', '2023-09-13 14:32:08'),
(280, 'App\\Models\\User', 31, 'API Token', '7701e838574a75dd8efa255037e6228c9fb583337f12adf19058092c996b17a3', '[\"*\"]', '2023-09-13 16:46:23', NULL, '2023-09-13 14:34:19', '2023-09-13 16:46:23'),
(281, 'App\\Models\\User', 5, 'API Token', 'c40d78b3840c95daa0a099728a0a5c9742a3e8d931a43ec1124b14221f2036ef', '[\"*\"]', '2023-09-13 16:48:05', NULL, '2023-09-13 16:48:00', '2023-09-13 16:48:05'),
(282, 'App\\Models\\User', 5, 'API Token', 'e912684ec22fa9c1aa72c581d99ceb4ece06dc10228dbc20687b112a7fca560c', '[\"*\"]', NULL, NULL, '2023-09-13 16:49:32', '2023-09-13 16:49:32'),
(283, 'App\\Models\\User', 5, 'API Token', 'fb8ecdaf1f40c30dcfc29cd0278dfce73f23a55333bef13d6f60191debafd2e5', '[\"*\"]', '2023-09-13 16:59:29', NULL, '2023-09-13 16:54:04', '2023-09-13 16:59:29'),
(284, 'App\\Models\\User', 5, 'API Token', '124c12036485ded641fb51616f295b87349f513c8c4e5a5e97a295bae5c00003', '[\"*\"]', '2023-09-13 16:59:58', NULL, '2023-09-13 16:59:53', '2023-09-13 16:59:58'),
(285, 'App\\Models\\User', 5, 'API Token', 'e7bc8ae9389d068250d6b4eb40596bb92b89bb8bf3bc1f4cc9de5c09833c2af3', '[\"*\"]', '2023-09-13 17:02:31', NULL, '2023-09-13 17:02:26', '2023-09-13 17:02:31'),
(286, 'App\\Models\\User', 5, 'API Token', '17aaade12befa1bbc8f807439c2805d14ea6a44b4fcee3628278b9f96792e686', '[\"*\"]', '2023-09-13 21:55:48', NULL, '2023-09-13 21:55:24', '2023-09-13 21:55:48'),
(287, 'App\\Models\\User', 5, 'API Token', '2a3087fc769b1489149f0d3c1c92097c4f91bd0495c215afdf7b891e6bce1b15', '[\"*\"]', NULL, NULL, '2023-09-14 19:41:06', '2023-09-14 19:41:06'),
(288, 'App\\Models\\User', 5, 'API Token', '987ab08441fcebed09c165e4e7547a8f57adf6432aea2b06f61bd750e9324c9d', '[\"*\"]', NULL, NULL, '2023-09-18 15:42:37', '2023-09-18 15:42:37'),
(289, 'App\\Models\\User', 32, 'API Token', '78498648580c4ae8b008726670e955ac0f07efbf54961631ae0d4c29d192d4e7', '[\"*\"]', NULL, NULL, '2023-09-18 15:44:01', '2023-09-18 15:44:01'),
(290, 'App\\Models\\User', 5, 'API Token', '8e7a86e5df80a4e6ceeac0e48fc2ad3c286a1e54499aa2105d3a0ba7d2d488d1', '[\"*\"]', NULL, NULL, '2023-09-18 15:44:54', '2023-09-18 15:44:54'),
(291, 'App\\Models\\User', 44, 'myToken', '7e5e49e40d9ac7fdec6dcfb802515a04c524c15c0931ad7021e366995adba597', '[\"*\"]', NULL, NULL, '2023-09-18 15:46:42', '2023-09-18 15:46:42'),
(292, 'App\\Models\\User', 44, 'API Token', 'e55428e580afb7d14e4685f50cad64cd0c1821e7278ef008cea1af2fcf24efbd', '[\"*\"]', NULL, NULL, '2023-09-18 15:46:59', '2023-09-18 15:46:59'),
(293, 'App\\Models\\User', 44, 'API Token', '197acc27985d71080a2634732c0b9da42b1e0b05085bdc84219c524f74a792c4', '[\"*\"]', NULL, NULL, '2023-09-18 15:49:33', '2023-09-18 15:49:33'),
(294, 'App\\Models\\User', 5, 'API Token', '44d1339eaac1d709d6126d88b6b023c5a580feddb26dc4806c99ebc07efde0ce', '[\"*\"]', NULL, NULL, '2023-09-18 15:49:59', '2023-09-18 15:49:59'),
(296, 'App\\Models\\User', 46, 'myToken', '10bbfc92e8dd6de6a99ee4956f7408a5142606ccb073c1faee432833e90343b2', '[\"*\"]', NULL, NULL, '2023-09-18 16:45:46', '2023-09-18 16:45:46'),
(297, 'App\\Models\\User', 46, 'API Token', '8a53710108cb6621c8cde6dd5b206dd31105474625172ee4dfa403dc8a60fd0a', '[\"*\"]', NULL, NULL, '2023-09-18 16:46:12', '2023-09-18 16:46:12'),
(298, 'App\\Models\\User', 32, 'API Token', '60e5aa82f1c2e6acdc2ea5b870d95f9d66d22d9ee24d3e83b1daa11c38db0cf3', '[\"*\"]', NULL, NULL, '2023-09-18 16:48:04', '2023-09-18 16:48:04'),
(299, 'App\\Models\\User', 46, 'API Token', 'f43819f7da15ae7b3935feaed7713dd3e7c5337b115e54bd3260ebe8ad46bbbf', '[\"*\"]', NULL, NULL, '2023-09-18 16:48:33', '2023-09-18 16:48:33'),
(300, 'App\\Models\\User', 46, 'API Token', '132b16abcb7d6e2b1df75a40788c5f8c8c1e1a0ad650287e7b5a89ec6c2f9c83', '[\"*\"]', NULL, NULL, '2023-09-18 16:53:29', '2023-09-18 16:53:29'),
(301, 'App\\Models\\User', 32, 'API Token', '03f1966d4dae55716521dba55336b61dd9a76336f6bd023dce932c4d9b64174e', '[\"*\"]', NULL, NULL, '2023-09-18 16:55:32', '2023-09-18 16:55:32'),
(302, 'App\\Models\\User', 46, 'API Token', 'f1e57862cf9775325ee99355ab20379df80e08fe0351d8e56143fb8ffd386a8a', '[\"*\"]', NULL, NULL, '2023-09-18 17:02:46', '2023-09-18 17:02:46'),
(303, 'App\\Models\\User', 46, 'API Token', 'f614cd951c774a865867ccb350c141098d0592fbbe7ec18d89ee29cfd7700366', '[\"*\"]', NULL, NULL, '2023-09-18 17:04:18', '2023-09-18 17:04:18'),
(311, 'App\\Models\\User', 45, 'API Token', '46025df6568e8fea472e4f5c1ba27db0f5804dfab76c97bb41a3914a933c1a17', '[\"*\"]', '2023-09-18 17:44:21', NULL, '2023-09-18 17:43:43', '2023-09-18 17:44:21'),
(312, 'App\\Models\\User', 45, 'API Token', '7bc52f95311c7f377cd27789c4ead02a8899fe3456748785dba4a3f991144979', '[\"*\"]', '2023-09-18 17:45:13', NULL, '2023-09-18 17:44:45', '2023-09-18 17:45:13'),
(313, 'App\\Models\\User', 32, 'API Token', '17b9ff8c461a3a3356dd1cc137ef7b5bd2bd830f4dc0cda4a23fc244b740aaff', '[\"*\"]', '2023-09-18 18:32:26', NULL, '2023-09-18 18:28:14', '2023-09-18 18:32:26'),
(314, 'App\\Models\\User', 32, 'API Token', 'a59141bd351d2b470368844219f1fe1df051acfb4f06d108198fac8550245ccc', '[\"*\"]', '2023-09-18 18:39:15', NULL, '2023-09-18 18:36:33', '2023-09-18 18:39:15'),
(315, 'App\\Models\\User', 45, 'API Token', 'bbb83f217e5b3422b5f800d47f99abe8d3b6a64ca52300d910d59112d6aa10ac', '[\"*\"]', NULL, NULL, '2023-09-18 18:48:10', '2023-09-18 18:48:10'),
(316, 'App\\Models\\User', 45, 'API Token', '1262bd31736d475e6ca8cbb5764dfd1f6a2267712f29c55d43f19665badb5b11', '[\"*\"]', '2023-09-18 19:23:45', NULL, '2023-09-18 18:48:48', '2023-09-18 19:23:45'),
(317, 'App\\Models\\User', 31, 'API Token', '031a01c79fa2b558d521eb3e75a7412b6dccfb8687de96e5900dcb2fa3267b96', '[\"*\"]', '2023-09-18 18:50:30', NULL, '2023-09-18 18:50:28', '2023-09-18 18:50:30'),
(318, 'App\\Models\\User', 4, 'API Token', '60fe681ea8d5d6da0aab27ead1950247ed2ea3bd5579facd3448d1cb402bbb88', '[\"*\"]', NULL, NULL, '2023-09-18 18:51:26', '2023-09-18 18:51:26'),
(319, 'App\\Models\\User', 4, 'API Token', '004e2fb8244d57c5dfd1149b2ad242b78fd492204e1442b5eb6c6f5d5243004e', '[\"*\"]', NULL, NULL, '2023-09-18 18:51:54', '2023-09-18 18:51:54'),
(320, 'App\\Models\\User', 7, 'API Token', '9a263141ae47067a587433b74bc2edc1d49709186228e333e7e8b1107a6ad758', '[\"*\"]', NULL, NULL, '2023-09-18 18:54:45', '2023-09-18 18:54:45'),
(321, 'App\\Models\\User', 7, 'API Token', '84ea20e348699096fb28625eabc0aa93671787a69c4044373cbf37e5a05eae11', '[\"*\"]', NULL, NULL, '2023-09-18 18:55:14', '2023-09-18 18:55:14'),
(322, 'App\\Models\\User', 7, 'API Token', '552031da2f6be099c4627d11ac65c268f2b80ee8c7766c02d3ac28f0908f8461', '[\"*\"]', NULL, NULL, '2023-09-18 18:59:48', '2023-09-18 18:59:48'),
(323, 'App\\Models\\User', 32, 'API Token', '59a498f98ddc01bbde437020e2c84eea5943473a14da7dd59d09e1cf2a869b32', '[\"*\"]', '2023-09-18 19:00:20', NULL, '2023-09-18 19:00:14', '2023-09-18 19:00:20'),
(324, 'App\\Models\\User', 31, 'API Token', 'f8d7fd62e3251335ef2023ef49e56551c9a66a6e62959ceb1f0f021a849a888c', '[\"*\"]', '2023-09-18 19:01:15', NULL, '2023-09-18 19:01:11', '2023-09-18 19:01:15'),
(325, 'App\\Models\\User', 32, 'API Token', 'b10970ba8d7e9198f3c3d42413b0c8b78987c7864220bcab16933060474e39f9', '[\"*\"]', '2023-09-18 19:04:34', NULL, '2023-09-18 19:01:52', '2023-09-18 19:04:34'),
(326, 'App\\Models\\User', 5, 'API Token', 'bf817b8561cd4ce5218ab291c6a5aa2ab046cfac4ef2f987076960ef663fbf45', '[\"*\"]', '2023-09-18 19:11:36', NULL, '2023-09-18 19:06:10', '2023-09-18 19:11:36'),
(327, 'App\\Models\\User', 5, 'API Token', '16892decd1fd00b685544e3cb76b7c8cc96c3157805a47b8fcd361378e6ca98a', '[\"*\"]', '2023-09-18 19:15:45', NULL, '2023-09-18 19:13:05', '2023-09-18 19:15:45'),
(328, 'App\\Models\\User', 5, 'API Token', '818ffde1fc92602bbfcea3107f2fb9cfd8e84b4093222974d7ceeac1717145e4', '[\"*\"]', '2023-09-18 19:25:23', NULL, '2023-09-18 19:19:51', '2023-09-18 19:25:23'),
(329, 'App\\Models\\User', 5, 'API Token', '51e5f8a785ed110752cae70f4825c6d12bb11e2f341c890437de61ec6bab6815', '[\"*\"]', '2023-09-18 19:34:27', NULL, '2023-09-18 19:24:57', '2023-09-18 19:34:27'),
(330, 'App\\Models\\User', 5, 'API Token', '4337394c3ef16bc9555f4b771339ae6a1df20c20f3f743bd829a72bb8395ebf4', '[\"*\"]', '2023-09-18 19:41:40', NULL, '2023-09-18 19:27:16', '2023-09-18 19:41:40'),
(331, 'App\\Models\\User', 5, 'API Token', 'fd06476b5eec2e67bbb1cef693acc003087134885077f9abb5681297f4d33846', '[\"*\"]', '2023-09-18 19:49:34', NULL, '2023-09-18 19:32:21', '2023-09-18 19:49:34'),
(332, 'App\\Models\\User', 31, 'API Token', '493afc6f4cc38b75c5c8566f16064aad8384d87b2b6f8a27e2dde52cde6dff04', '[\"*\"]', '2023-09-18 19:44:39', NULL, '2023-09-18 19:43:12', '2023-09-18 19:44:39'),
(333, 'App\\Models\\User', 5, 'API Token', '02db610ae66f45d7d332fac73bd66dd3dc8d7331653b4b3b00b2d8d6346ca587', '[\"*\"]', '2023-09-18 19:45:23', NULL, '2023-09-18 19:45:09', '2023-09-18 19:45:23'),
(334, 'App\\Models\\User', 5, 'API Token', '0287888d7cac0825f1afc2cc3ea714dd9a39f3d7ee70136db66fb85f98e2c8c7', '[\"*\"]', '2023-09-18 20:00:13', NULL, '2023-09-18 19:54:02', '2023-09-18 20:00:13'),
(335, 'App\\Models\\User', 5, 'API Token', 'b708021a26718d5cdee471fcd973c5bbcb45147b9a1b6d9e1ffd59a98df4565a', '[\"*\"]', NULL, NULL, '2023-09-18 20:23:55', '2023-09-18 20:23:55'),
(336, 'App\\Models\\User', 47, 'myToken', '62d0298b849514470717548f9b3dd8afc3721d32116d6570caefed4bcb886f75', '[\"*\"]', NULL, NULL, '2023-09-18 20:29:19', '2023-09-18 20:29:19'),
(337, 'App\\Models\\User', 47, 'API Token', '9088ef86bd70919920d76c2778edc460f6cf102a98afb16005021d55b6500b46', '[\"*\"]', NULL, NULL, '2023-09-18 20:29:40', '2023-09-18 20:29:40'),
(338, 'App\\Models\\User', 47, 'API Token', 'f5727c047437c9c231bebd46a2c5669cd3b70813b84b965c25819ae018246720', '[\"*\"]', '2023-09-18 20:37:29', NULL, '2023-09-18 20:32:57', '2023-09-18 20:37:29'),
(339, 'App\\Models\\User', 31, 'API Token', 'b34ed602cfa3c59d4878018782f1aca3b66c33378bd0dedff78972b29cc466e1', '[\"*\"]', '2023-09-18 20:39:54', NULL, '2023-09-18 20:38:29', '2023-09-18 20:39:54'),
(340, 'App\\Models\\User', 47, 'API Token', '21e1b71d43d9ac54e1b3c653d24b9789fd6185d39a8fa7951a01acf1c42c3e50', '[\"*\"]', '2023-09-18 20:40:22', NULL, '2023-09-18 20:40:17', '2023-09-18 20:40:22'),
(341, 'App\\Models\\User', 31, 'API Token', '908247e10cdd570e4811bdba7279ba7906319745cfee01b28c39d87659c98996', '[\"*\"]', '2023-09-18 20:41:58', NULL, '2023-09-18 20:40:59', '2023-09-18 20:41:58'),
(342, 'App\\Models\\User', 47, 'API Token', '887e4ea3646f36bc50d81eba6aeb11d9ee1883dfd9a5093f1385b39acc4daf18', '[\"*\"]', '2023-09-18 20:44:53', NULL, '2023-09-18 20:42:32', '2023-09-18 20:44:53'),
(343, 'App\\Models\\User', 47, 'API Token', 'db0c61b5e70c1267f03579707b7e26e8d6157538b9db29b37ab95d4601d7fa10', '[\"*\"]', '2023-09-18 21:01:15', NULL, '2023-09-18 20:57:22', '2023-09-18 21:01:15'),
(344, 'App\\Models\\User', 31, 'API Token', '6956e4393cfd058aee3e9322fa4bd4d467f47f1aa98b996790b2ad99be3479b6', '[\"*\"]', '2023-09-18 21:07:12', NULL, '2023-09-18 21:05:58', '2023-09-18 21:07:12'),
(345, 'App\\Models\\User', 47, 'API Token', '8b0f0ab630461f3e5b3abe5ea27b27d45fd677c75f67d53df0e79d3da4bd3312', '[\"*\"]', '2023-09-18 21:09:18', NULL, '2023-09-18 21:08:18', '2023-09-18 21:09:18'),
(346, 'App\\Models\\User', 5, 'API Token', '86cda128547df76e419326e62e93dcf9cebe62c2a6cf87f0e7b294167135b7a6', '[\"*\"]', '2023-09-18 21:20:29', NULL, '2023-09-18 21:16:31', '2023-09-18 21:20:29'),
(347, 'App\\Models\\User', 31, 'API Token', 'e6db4aa7f19562b9a3a7f59683952c29ebc08cec5f252d71824eea60811d4eca', '[\"*\"]', '2023-09-18 21:21:58', NULL, '2023-09-18 21:20:59', '2023-09-18 21:21:58'),
(348, 'App\\Models\\User', 31, 'API Token', 'b844620c0869c2622c3999dca60c9f1472999756cdbc7445fc0bd18c5cadda66', '[\"*\"]', '2023-09-18 21:37:25', NULL, '2023-09-18 21:37:23', '2023-09-18 21:37:25'),
(349, 'App\\Models\\User', 5, 'API Token', '31b774c614796580b3fff1f3664d1b4f6d877d3a212f57ed66b458ec687641d8', '[\"*\"]', '2023-09-18 22:11:59', NULL, '2023-09-18 21:38:20', '2023-09-18 22:11:59'),
(350, 'App\\Models\\User', 31, 'API Token', '7decd1dc793e95e8fc8a54432a09d9c046ef2ede9c770626a82641dd05e1a7b3', '[\"*\"]', '2023-09-18 22:43:49', NULL, '2023-09-18 22:12:22', '2023-09-18 22:43:49'),
(351, 'App\\Models\\User', 5, 'API Token', '6150e103ba2890ad7338ed20c9412d3350720eaeccfacde70083381b9453c841', '[\"*\"]', '2023-09-18 22:19:26', NULL, '2023-09-18 22:18:15', '2023-09-18 22:19:26'),
(352, 'App\\Models\\User', 31, 'API Token', '2de4e6eb9f3eb9e2eea1794067fd54217c769291cc651501e1322752265d6908', '[\"*\"]', '2023-09-18 22:19:59', NULL, '2023-09-18 22:19:49', '2023-09-18 22:19:59'),
(353, 'App\\Models\\User', 5, 'API Token', '21ab0de9c7cb68e80a3cd4d664c418d7ba5bcd2af6b9a7d1d027f4cc01f34743', '[\"*\"]', '2023-09-18 22:20:54', NULL, '2023-09-18 22:20:29', '2023-09-18 22:20:54'),
(354, 'App\\Models\\User', 5, 'API Token', 'aa5655a777bf63b8bd8135c4a5f8ae03070baccd46c39043ecc97ccffb688481', '[\"*\"]', '2023-09-18 22:56:07', NULL, '2023-09-18 22:53:29', '2023-09-18 22:56:07'),
(355, 'App\\Models\\User', 5, 'API Token', '057d542baf79d70e084681578408681ea0660163d6fd0b98d03991eeb57ce7b2', '[\"*\"]', '2023-09-18 22:58:53', NULL, '2023-09-18 22:55:45', '2023-09-18 22:58:53'),
(356, 'App\\Models\\User', 5, 'API Token', '65ef33707f7b29751c676a1362cf58823b9c65e3772d70048773895b7ed3d482', '[\"*\"]', '2023-09-19 15:17:04', NULL, '2023-09-19 15:15:34', '2023-09-19 15:17:04'),
(357, 'App\\Models\\User', 31, 'API Token', '297e845739f724f4a31dfb38f5d0ee0e329b235cc2a02113a7e7a58a7ba24ee6', '[\"*\"]', '2023-09-19 15:18:25', NULL, '2023-09-19 15:17:55', '2023-09-19 15:18:25'),
(358, 'App\\Models\\User', 5, 'API Token', 'fdb70445fc0c4f13f7d91431f355a06a043055af8fa234e0a9a97c338524c543', '[\"*\"]', '2023-09-19 15:19:00', NULL, '2023-09-19 15:18:54', '2023-09-19 15:19:00'),
(359, 'App\\Models\\User', 5, 'API Token', '053622935fd99f0a51dfb62e0a5e5192755c6f04b5ee269aa6509f7a6aa4d9ef', '[\"*\"]', '2023-09-19 17:50:16', NULL, '2023-09-19 17:50:05', '2023-09-19 17:50:16'),
(360, 'App\\Models\\User', 32, 'API Token', '8ad3d6cf5b89fd1d071a7946b491503a38b280f2ed079db970302d723e3ce7b4', '[\"*\"]', '2023-09-20 02:53:01', NULL, '2023-09-20 02:51:03', '2023-09-20 02:53:01'),
(361, 'App\\Models\\User', 31, 'API Token', '3728d0d0106704c7c09852a3d934559a7cfebbf1461188823da7e9c316877eca', '[\"*\"]', '2023-09-20 02:55:17', NULL, '2023-09-20 02:53:40', '2023-09-20 02:55:17'),
(362, 'App\\Models\\User', 31, 'API Token', '940d1eae8c21da6609d701678ca4ee6a323f15075aae1aca61a94a881f6da90a', '[\"*\"]', '2023-09-20 02:55:45', NULL, '2023-09-20 02:55:44', '2023-09-20 02:55:45'),
(363, 'App\\Models\\User', 32, 'API Token', '494884bb17df60e7ed995802ab6f198ae7a683929af56eb868580dc99d93ffeb', '[\"*\"]', '2023-09-20 02:58:09', NULL, '2023-09-20 02:56:05', '2023-09-20 02:58:09'),
(364, 'App\\Models\\User', 5, 'API Token', '4702ccb23f055b50b352c5c592bef51d90ce50fbb2269a2bb4b99e01b2969f7e', '[\"*\"]', '2023-09-20 16:17:35', NULL, '2023-09-20 16:16:53', '2023-09-20 16:17:35'),
(365, 'App\\Models\\User', 31, 'API Token', 'b8f916397b7cfd3fe5882440bc6c818901f4c40e9af4d07dae0ab5ae3f80e8ac', '[\"*\"]', '2023-09-20 16:18:26', NULL, '2023-09-20 16:17:57', '2023-09-20 16:18:26'),
(366, 'App\\Models\\User', 5, 'API Token', 'bbb8e1a0f6d528d0f1b0cb2a037945d860a4b7657adb7530cc6b55ca21236118', '[\"*\"]', '2023-09-20 16:19:03', NULL, '2023-09-20 16:18:40', '2023-09-20 16:19:03'),
(367, 'App\\Models\\User', 32, 'API Token', 'd7c06038ae6226249cba7d38889f71b35be5561a749428dd0d7814c5a1c42561', '[\"*\"]', '2023-09-20 16:34:46', NULL, '2023-09-20 16:32:17', '2023-09-20 16:34:46'),
(368, 'App\\Models\\User', 31, 'API Token', 'dd4c207dbb2bb8c819db9b306588caeab85a169e8271958684bcec851c30da3c', '[\"*\"]', '2023-09-20 16:36:10', NULL, '2023-09-20 16:35:37', '2023-09-20 16:36:10'),
(369, 'App\\Models\\User', 32, 'API Token', 'd04b23e78cd88b6a7846a9c61f2a8644cbd5b4bd8aebc9226559a4fd5d81c339', '[\"*\"]', '2023-09-20 16:36:54', NULL, '2023-09-20 16:36:41', '2023-09-20 16:36:54'),
(370, 'App\\Models\\User', 5, 'API Token', '7b7ece2e8dffe40d24c6cc91a2d1a6cf3ade6781794ecbd36729e88218a50fcf', '[\"*\"]', '2023-09-20 21:03:06', NULL, '2023-09-20 20:59:53', '2023-09-20 21:03:06'),
(371, 'App\\Models\\User', 5, 'API Token', '6199f547a60d0a7c229a1425704cbaceabef9a34fe37e806ca23dfb4d9755397', '[\"*\"]', '2023-09-21 15:46:40', NULL, '2023-09-21 15:44:55', '2023-09-21 15:46:40'),
(372, 'App\\Models\\User', 48, 'myToken', '83ae84869917a828ceddab8717f60b50f964b870344545126cad202296476a4b', '[\"*\"]', NULL, NULL, '2023-09-22 00:17:41', '2023-09-22 00:17:41'),
(373, 'App\\Models\\User', 48, 'API Token', '7783e1589bf93c9ed056228b42df40186508e7c9a318b3a7dbf76e75f72adbb3', '[\"*\"]', '2023-09-22 00:20:10', NULL, '2023-09-22 00:18:06', '2023-09-22 00:20:10'),
(374, 'App\\Models\\User', 32, 'API Token', 'de49abd0c96ac10e7f532dbca5ca5e4af511a38a3f01945c26256f48ac7f46f4', '[\"*\"]', '2023-09-22 16:50:29', NULL, '2023-09-22 16:50:23', '2023-09-22 16:50:29'),
(375, 'App\\Models\\User', 32, 'API Token', 'ae363915dc98a6dc88ba21346283652f8403da94e402125c2722896d41722d3d', '[\"*\"]', '2023-09-22 19:01:57', NULL, '2023-09-22 19:01:51', '2023-09-22 19:01:57'),
(376, 'App\\Models\\User', 32, 'API Token', '993d6d8f8b1a775249bca74698ed222cef6ecbf6a6b21c0ec337d1b4efc43a1f', '[\"*\"]', NULL, NULL, '2023-09-22 19:14:57', '2023-09-22 19:14:57'),
(377, 'App\\Models\\User', 32, 'API Token', '5b46304f37e5253bf356152af7b899a4dc016d14a0e325eda282cdbda4ddf099', '[\"*\"]', NULL, NULL, '2023-09-22 19:16:25', '2023-09-22 19:16:25'),
(378, 'App\\Models\\User', 32, 'API Token', 'cd6f7f88bf912dc7bde04d8ffbf6371fd314f5d71e65274a2020b5ac2c9f949a', '[\"*\"]', NULL, NULL, '2023-09-22 19:19:23', '2023-09-22 19:19:23'),
(379, 'App\\Models\\User', 32, 'API Token', 'b21ea6adbc8d725785cf4e3920c7e6a81748949fc67516de16127fe24e54b27b', '[\"*\"]', '2023-09-22 19:32:41', NULL, '2023-09-22 19:32:35', '2023-09-22 19:32:41'),
(380, 'App\\Models\\User', 32, 'API Token', '649573233acbe4d4c5c5f16a381f07626751178db12e8b9110fb49033eb52510', '[\"*\"]', '2023-09-22 19:35:45', NULL, '2023-09-22 19:35:34', '2023-09-22 19:35:45'),
(381, 'App\\Models\\User', 32, 'API Token', '0f4d602afd74f84b2c68eeee56d0aad7078977d846b81f0891d6633f0307857e', '[\"*\"]', '2023-09-22 19:38:48', NULL, '2023-09-22 19:38:15', '2023-09-22 19:38:48'),
(382, 'App\\Models\\User', 32, 'API Token', '98e01aa0a719b55b129b0f28b4016ce066b2726c584d899dbe66be69d496c673', '[\"*\"]', '2023-09-22 19:43:17', NULL, '2023-09-22 19:43:00', '2023-09-22 19:43:17'),
(383, 'App\\Models\\User', 32, 'API Token', '2746ceafe5c84b15d82edf31fb1fea24e2f59db4d5c0ca82bc95085d091da846', '[\"*\"]', '2023-09-22 19:46:07', NULL, '2023-09-22 19:46:00', '2023-09-22 19:46:07'),
(384, 'App\\Models\\User', 32, 'API Token', '52e05778795c205e31de84548109322d3bb8f050deda825463b7eaca1fef290d', '[\"*\"]', '2023-09-23 01:50:20', NULL, '2023-09-23 01:49:56', '2023-09-23 01:50:20'),
(385, 'App\\Models\\User', 32, 'API Token', '18c390de0ec89fccf77113c5643dc9457004bad1e6ea0a9a187a91f4229f1e3e', '[\"*\"]', NULL, NULL, '2023-09-23 01:53:54', '2023-09-23 01:53:54'),
(386, 'App\\Models\\User', 32, 'API Token', 'b085fa0c396cd7f5038de07bff2b47e00683dbce3b78ac205172215bfbe40108', '[\"*\"]', NULL, NULL, '2023-09-23 01:57:11', '2023-09-23 01:57:11'),
(387, 'App\\Models\\User', 49, 'myToken', '42f487b9af16fa1e5f43cffd2e6ee37562306286fc1bae85c197fc0d3c129b0f', '[\"*\"]', NULL, NULL, '2023-09-25 15:29:19', '2023-09-25 15:29:19'),
(388, 'App\\Models\\User', 32, 'API Token', 'eca73a754fd401cbce7d8604650648144fe02582a051d423af6c75d198b24f35', '[\"*\"]', '2023-09-25 15:29:56', NULL, '2023-09-25 15:29:35', '2023-09-25 15:29:56'),
(389, 'App\\Models\\User', 32, 'API Token', '99ae896e965abc6d4dd424b3c0f85ac4d3c16354f69969608e692b49b34b7903', '[\"*\"]', NULL, NULL, '2023-09-25 15:36:22', '2023-09-25 15:36:22'),
(390, 'App\\Models\\User', 31, 'API Token', '24a163cfa8dc2ac4cdaab76aac35fafa927d3f673e7a4fe16ab0eb7d32ad3581', '[\"*\"]', '2023-09-25 15:37:31', NULL, '2023-09-25 15:37:27', '2023-09-25 15:37:31'),
(391, 'App\\Models\\User', 32, 'API Token', '565f34ba38b2c3c829349a354b0d9b41669a2bb9eb5b5a0cd2b49fc33c7dcc56', '[\"*\"]', NULL, NULL, '2023-09-25 15:43:34', '2023-09-25 15:43:34'),
(392, 'App\\Models\\User', 32, 'API Token', '9cde832431f9bc70ca423cf9a0aef1793a1feb90b7a6ff64e6772b3d7a669981', '[\"*\"]', '2023-09-25 15:53:30', NULL, '2023-09-25 15:52:47', '2023-09-25 15:53:30'),
(393, 'App\\Models\\User', 5, 'API Token', '10f04b10ecf0fe15b3fd78acd48c71612f852e48972b1df355c3a304f6c35260', '[\"*\"]', '2023-09-25 16:25:11', NULL, '2023-09-25 16:22:44', '2023-09-25 16:25:11'),
(394, 'App\\Models\\User', 5, 'API Token', 'b16e9fccf91ded599ac2ec9f04e1a5317b5c7ad4bb2be410dddb49699056f76f', '[\"*\"]', '2023-09-25 16:26:23', NULL, '2023-09-25 16:23:25', '2023-09-25 16:26:23'),
(395, 'App\\Models\\User', 32, 'API Token', 'df498d994c2d0be9f6031853129bc32a6b37270d6ebc6f7e459ef97a53ceeb75', '[\"*\"]', '2023-09-25 18:48:10', NULL, '2023-09-25 18:48:01', '2023-09-25 18:48:10'),
(396, 'App\\Models\\User', 32, 'API Token', 'fcbf4acc575e86c3322ee51f3842eb4c007cc80d01081207b077886323e9a0db', '[\"*\"]', '2023-09-25 23:16:05', NULL, '2023-09-25 23:15:53', '2023-09-25 23:16:05'),
(397, 'App\\Models\\User', 5, 'API Token', '4ea83d1b8017bd9559b02cd3720bcf71b93297cfd36c94764be602f3d4cb391b', '[\"*\"]', '2023-09-27 15:40:52', NULL, '2023-09-27 15:38:41', '2023-09-27 15:40:52'),
(398, 'App\\Models\\User', 5, 'API Token', '7f853d02af4fb8c83f93ad06b8c19768c5a82ffe4169d3053ce114274ad42a00', '[\"*\"]', '2023-09-27 21:22:10', NULL, '2023-09-27 21:18:58', '2023-09-27 21:22:10');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(399, 'App\\Models\\User', 5, 'API Token', 'fa1f5b7426a99c89c4ad3eedd9e5bdb8cb473a8a5bc082ee54be4235dc9b4d31', '[\"*\"]', '2023-09-28 16:16:47', NULL, '2023-09-28 16:14:27', '2023-09-28 16:16:47'),
(400, 'App\\Models\\User', 5, 'API Token', '881f39797bcd9c19c20108f7bc3d724712d89c205e6c8a7121eae90980934649', '[\"*\"]', NULL, NULL, '2023-09-30 21:33:19', '2023-09-30 21:33:19'),
(401, 'App\\Models\\User', 5, 'API Token', '768e2db50c13fbb25d984611add1c6d5b026ba2093b2b195b9c842897db51e7d', '[\"*\"]', NULL, NULL, '2023-09-30 21:33:40', '2023-09-30 21:33:40'),
(402, 'App\\Models\\User', 5, 'API Token', '60c023e5995ce137d6eeb1c12c3ec04cbb4cfdf045df6074510d98411b19a1b4', '[\"*\"]', NULL, NULL, '2023-09-30 21:35:32', '2023-09-30 21:35:32'),
(403, 'App\\Models\\User', 32, 'API Token', '78d5c2c1642dc86a6ea6569f6dad87e3fdf30bea14fa4949ac8b6ea860e991b8', '[\"*\"]', '2023-10-05 17:24:51', NULL, '2023-10-05 17:22:37', '2023-10-05 17:24:51'),
(404, 'App\\Models\\User', 5, 'API Token', '5f426bb396f081ec2b029a2c8469af2d611ca87b8e9d090d77de567fcb8cf662', '[\"*\"]', '2023-10-06 21:32:20', NULL, '2023-10-06 21:31:05', '2023-10-06 21:32:20'),
(405, 'App\\Models\\User', 5, 'API Token', '1fc30a842d30747c1b14965e907360b5210043de9b72151a35383f7535101aaf', '[\"*\"]', '2023-10-07 21:36:16', NULL, '2023-10-07 21:32:58', '2023-10-07 21:36:16'),
(406, 'App\\Models\\User', 5, 'API Token', '25d46973f6bcdf51fb3ddb926f97b24418b916e8ccb312a54d01629f6df9a4ab', '[\"*\"]', '2023-10-08 21:36:24', NULL, '2023-10-08 21:35:10', '2023-10-08 21:36:24'),
(407, 'App\\Models\\User', 50, 'myToken', '4c563c7f22ecc18cfee0a3fee68bd8ced47a92734a7e840ff9146b737f03e0c7', '[\"*\"]', NULL, NULL, '2023-10-16 23:12:52', '2023-10-16 23:12:52'),
(408, 'App\\Models\\User', 50, 'API Token', '9434544acca4a0054982357bab73aca1ace57376dff2f784f47f6fb946c0043d', '[\"*\"]', '2023-10-18 23:59:06', NULL, '2023-10-18 23:58:19', '2023-10-18 23:59:06'),
(409, 'App\\Models\\User', 50, 'API Token', 'be2c666c8f31c27ece5e0b8f6518d99d6dd0ac8365707ab9491821231ed80891', '[\"*\"]', '2023-10-19 12:02:59', NULL, '2023-10-19 11:59:05', '2023-10-19 12:02:59'),
(410, 'App\\Models\\User', 51, 'myToken', 'fc99279fe2e976e573580932311d9dc21e6950c5b3325bf8c37f0c73ea6d6bbb', '[\"*\"]', NULL, NULL, '2023-10-22 09:34:24', '2023-10-22 09:34:24'),
(411, 'App\\Models\\User', 51, 'API Token', '9e2563883733be6cdc6ba1d01f1fe3dae350b5089d6ec7de2571fb2c8f0b0047', '[\"*\"]', '2023-10-22 09:36:52', NULL, '2023-10-22 09:36:43', '2023-10-22 09:36:52'),
(412, 'App\\Models\\User', 32, 'API Token', 'f99d1c277615b9d2174f0b89cdd18ec5e2b0ab77e7d0378674662a66f5d015db', '[\"*\"]', '2023-11-05 22:01:26', NULL, '2023-11-05 22:00:21', '2023-11-05 22:01:26'),
(413, 'App\\Models\\User', 45, 'API Token', 'ef808c51ac2d5529e3d4c88cf604040e828ce95ea836b87e740cc692bfcb78c8', '[\"*\"]', NULL, NULL, '2023-11-25 10:36:49', '2023-11-25 10:36:49'),
(414, 'App\\Models\\User', 45, 'API Token', '288a9d5d701d85c0469dd8b7efe75c5c9316e05c2ec43db43381ce75ee558638', '[\"*\"]', NULL, NULL, '2023-11-25 10:36:55', '2023-11-25 10:36:55'),
(415, 'App\\Models\\User', 45, 'API Token', 'c1c05799b0c0e371328aff0a04bf1eacb3b36cc04a57028cb2954936ac510a2b', '[\"*\"]', NULL, NULL, '2023-11-25 10:37:00', '2023-11-25 10:37:00'),
(416, 'App\\Models\\User', 5, 'API Token', '897a31f0d92afde004bc2798e8da088dd859f864602c4609975a857fb5ad9e5b', '[\"*\"]', '2023-12-04 12:22:43', NULL, '2023-12-04 12:19:43', '2023-12-04 12:22:43'),
(417, 'App\\Models\\User', 56, 'myToken', 'cb48cdd4bdb13ba3ce0b49d191963845690b7e33812c602ec104a4a64f7510bc', '[\"*\"]', NULL, NULL, '2023-12-08 19:31:09', '2023-12-08 19:31:09'),
(418, 'App\\Models\\User', 56, 'API Token', '18a986956be138314f78a1f68ffd08b3965ca4d7bc229eadd700554895f7070f', '[\"*\"]', '2023-12-08 19:32:00', NULL, '2023-12-08 19:31:37', '2023-12-08 19:32:00'),
(419, 'App\\Models\\User', 58, 'myToken', '481d51f3c2adb7c4badb997c6f7b54ace24f71ff6d924ff165b028e5619fb60a', '[\"*\"]', NULL, NULL, '2024-01-06 14:31:53', '2024-01-06 14:31:53'),
(420, 'App\\Models\\User', 58, 'API Token', '0e3006139859d2b2d06b19cdc1f9636fd38db8d03b6a440d8bcaca2f19649c59', '[\"*\"]', '2024-01-06 14:33:01', NULL, '2024-01-06 14:32:20', '2024-01-06 14:33:01'),
(421, 'App\\Models\\User', 59, 'API Token', 'e02f4e6d0579ef7442eb676cd32ac3038b37dc2a6baf9e0fafee2e9bccdf1f16', '[\"*\"]', '2024-01-10 19:17:27', NULL, '2024-01-10 19:17:26', '2024-01-10 19:17:27'),
(422, 'App\\Models\\User', 60, 'myToken', '6badb22071d4c14f1c8f74982183fd885c90b31cbe747760f3cf74531543e8f2', '[\"*\"]', NULL, NULL, '2024-01-10 19:23:58', '2024-01-10 19:23:58'),
(423, 'App\\Models\\User', 60, 'API Token', '1736f904769614e36f5a22c971cbd7c5d75c6dc862bca06e573e54e15f55bb59', '[\"*\"]', '2024-01-10 19:30:47', NULL, '2024-01-10 19:24:38', '2024-01-10 19:30:47'),
(424, 'App\\Models\\User', 59, 'API Token', 'dc0973db0575449de1ae8f0387f649417bf9ea2142f7183ab4d36acd22d283d4', '[\"*\"]', '2024-02-08 08:25:41', NULL, '2024-01-10 19:30:17', '2024-02-08 08:25:41'),
(425, 'App\\Models\\User', 60, 'API Token', '900d798484313f843ce1ad388a36293df3657545fff75f0e0460581bbe18c37b', '[\"*\"]', '2024-01-10 19:46:39', NULL, '2024-01-10 19:44:32', '2024-01-10 19:46:39'),
(429, 'App\\Models\\User', 60, 'API Token', '3efc212ee4ac74d455ed929d8f2eb626a8c9add0299b322ed88a4c2953e62e9f', '[\"*\"]', '2024-01-12 09:15:21', NULL, '2024-01-12 09:13:01', '2024-01-12 09:15:21'),
(430, 'App\\Models\\User', 62, 'myToken', 'ddf788897addf69ea413037b247312c3b6c55bf36e41f5ad8e85a51366f0be0c', '[\"*\"]', NULL, NULL, '2024-01-12 11:47:47', '2024-01-12 11:47:47'),
(431, 'App\\Models\\User', 63, 'myToken', 'faa0062ba43b8aec7daa8e0c7c032804b17f539fc545fb8edc34094110cd5a44', '[\"*\"]', NULL, NULL, '2024-01-12 16:26:16', '2024-01-12 16:26:16'),
(432, 'App\\Models\\User', 63, 'API Token', '497459bbe0b0475ff97dc3a4912233a12ff535ee576656009547738032c1c2a3', '[\"*\"]', '2024-01-12 16:27:20', NULL, '2024-01-12 16:26:57', '2024-01-12 16:27:20'),
(433, 'App\\Models\\User', 64, 'myToken', 'baa1e1f50049877ba829323d3997f5709f7bac81cc5a8f2060337a199172372b', '[\"*\"]', NULL, NULL, '2024-01-12 20:34:50', '2024-01-12 20:34:50'),
(434, 'App\\Models\\User', 64, 'API Token', '6151be4afa801d4a3e055a82c807880750591ecbeb70804effb1b3cf251e7cbb', '[\"*\"]', '2024-01-12 20:36:32', NULL, '2024-01-12 20:35:10', '2024-01-12 20:36:32'),
(437, 'App\\Models\\User', 65, 'myToken', '83d4ed2f8cc900ac4b14143012f6364f2283b7f15ec523fcccf842b48f7322e7', '[\"*\"]', NULL, NULL, '2024-01-24 13:08:50', '2024-01-24 13:08:50'),
(438, 'App\\Models\\User', 65, 'API Token', 'cc54564244812e19b8629a6f34071afd88c543a5817c9a1c891661964db604d9', '[\"*\"]', '2024-01-24 13:32:23', NULL, '2024-01-24 13:09:18', '2024-01-24 13:32:23'),
(439, 'App\\Models\\User', 65, 'API Token', '7bbb75d85ed0e94bffeeda38dc818b8c4fbcf3c11dfdedbeb6f26b2d2aa2f432', '[\"*\"]', NULL, NULL, '2024-01-24 13:12:19', '2024-01-24 13:12:19'),
(440, 'App\\Models\\User', 65, 'API Token', 'cf10c054f48f0afbb4c18c8585b6726ae130144c10545952709dd715239307f7', '[\"*\"]', NULL, NULL, '2024-01-24 13:14:34', '2024-01-24 13:14:34'),
(513, 'App\\Models\\User', 63, 'API Token', '663a2209a64e46a7b57ce128e4b6dac3d0a9ac3646ce94712a06609c673d388a', '[\"*\"]', '2024-01-30 15:24:44', NULL, '2024-01-30 15:22:38', '2024-01-30 15:24:44'),
(518, 'App\\Models\\User', 63, 'API Token', '6bc37be9f1ee4fe09410888d9584f412a59934be0f57b54357eb272a8fc2e4cf', '[\"*\"]', '2024-02-07 14:53:00', NULL, '2024-02-07 14:49:28', '2024-02-07 14:53:00'),
(535, 'App\\Models\\User', 67, 'myToken', 'a61e632861ba4cd88dc180bbccf0ca4ce1d577c4fa4228bc1e9f3e6a1c10a9c6', '[\"*\"]', NULL, NULL, '2024-02-08 08:00:06', '2024-02-08 08:00:06'),
(536, 'App\\Models\\User', 67, 'API Token', '291607c127b0cd4801460873069fe393da42d0f951d83cd7af24f5ac54663e59', '[\"*\"]', '2024-02-08 08:00:57', NULL, '2024-02-08 08:00:18', '2024-02-08 08:00:57'),
(537, 'App\\Models\\User', 63, 'API Token', '2060586cd85e081ac5cc75253045e44bdf06922e5d4f84761c9400d0ca5c05b9', '[\"*\"]', '2024-02-08 08:25:17', NULL, '2024-02-08 08:12:59', '2024-02-08 08:25:17'),
(538, 'App\\Models\\User', 60, 'API Token', '2b16bf8bc8797b66fef83052993a9b848fafdb963c1be5022ad292f5e37f6679', '[\"*\"]', '2024-02-08 08:33:46', NULL, '2024-02-08 08:33:35', '2024-02-08 08:33:46'),
(539, 'App\\Models\\User', 60, 'API Token', 'd083da6f53d7d2311d1d08578eb934b0d027fea59031c563b9fa46a5700e9ff5', '[\"*\"]', '2024-02-08 08:35:43', NULL, '2024-02-08 08:35:09', '2024-02-08 08:35:43'),
(540, 'App\\Models\\User', 60, 'API Token', '909ad2066b2130d2a666c010af9c356204d813b4fc382d55a1e110b5dd11a092', '[\"*\"]', '2024-02-08 08:37:16', NULL, '2024-02-08 08:37:00', '2024-02-08 08:37:16'),
(542, 'App\\Models\\User', 68, 'myToken', '6d15f0d98f9eb460b7aa575fd922bfd48c415ba70b5493c2ad7aa235d9762f00', '[\"*\"]', NULL, NULL, '2024-02-09 17:35:17', '2024-02-09 17:35:17'),
(543, 'App\\Models\\User', 68, 'API Token', '1a06607cd1d0a6cd498d21b96d63834aa3704c1b6805ce8cbd26b9ca77e19ae9', '[\"*\"]', '2024-02-09 17:36:51', NULL, '2024-02-09 17:36:01', '2024-02-09 17:36:51'),
(544, 'App\\Models\\User', 68, 'API Token', '1c220407b34be02970dcd9f452ebd18fb46f4234e54c90084e352ec3c2876aa7', '[\"*\"]', '2024-04-25 16:28:49', NULL, '2024-02-09 18:38:34', '2024-04-25 16:28:49'),
(546, 'App\\Models\\User', 60, 'API Token', '4abb66b489532ed8b5645fb65faf1082fe21eaee83cecfbb5738fb0cf2e2c295', '[\"*\"]', '2024-02-15 02:48:27', NULL, '2024-02-15 02:40:53', '2024-02-15 02:48:27'),
(547, 'App\\Models\\User', 59, 'API Token', '82b2bf3b66edf9a4fceac69de53caeee1c2ee600a52c41f26962ec29fbf53472', '[\"*\"]', NULL, NULL, '2024-02-16 05:17:52', '2024-02-16 05:17:52'),
(549, 'App\\Models\\User', 59, 'API Token', 'ad3af251e2655a3d509e860c3236537428660467771c0626535d355cdd5a09fc', '[\"*\"]', '2024-02-16 05:21:57', NULL, '2024-02-16 05:21:55', '2024-02-16 05:21:57'),
(550, 'App\\Models\\User', 59, 'API Token', 'a886b6dec221e9c027dfe5c9cf3a25384ca8ab6275075d8130ac5f7a07927c2b', '[\"*\"]', '2024-02-16 05:25:42', NULL, '2024-02-16 05:25:40', '2024-02-16 05:25:42'),
(551, 'App\\Models\\User', 59, 'API Token', '2ed45fac742e1e4a46ab06224a32a08e42c665d1c5748bea2da640425a47cc10', '[\"*\"]', '2024-02-16 05:29:13', NULL, '2024-02-16 05:29:12', '2024-02-16 05:29:13'),
(552, 'App\\Models\\User', 59, 'API Token', 'ffdfd453ad95786977e6283834577cefffadde7bc229a695b5a93e64b9aa79a2', '[\"*\"]', '2024-02-16 05:30:46', NULL, '2024-02-16 05:30:35', '2024-02-16 05:30:46'),
(556, 'App\\Models\\User', 59, 'API Token', 'f69bf72dd67a38078b3cf8e1c6c04b663377a1f96c51aac00bd80760d484683c', '[\"*\"]', NULL, NULL, '2024-02-19 07:28:55', '2024-02-19 07:28:55'),
(557, 'App\\Models\\User', 59, 'API Token', '6e0c8ff8d0fa6e23962cad9888407b09b2d6250092309e8b1f95519e21f43abd', '[\"*\"]', NULL, NULL, '2024-02-19 07:28:58', '2024-02-19 07:28:58'),
(558, 'App\\Models\\User', 69, 'myToken', '8f2b4324707b15f1635d7455c39fe29af1815a09adcb8b67b3b6685683a495d4', '[\"*\"]', NULL, NULL, '2024-02-22 05:01:44', '2024-02-22 05:01:44'),
(559, 'App\\Models\\User', 69, 'API Token', '85109ff9e9f61cb076b83ef743a02a976394dda5c218b32859530d6cb3d061dd', '[\"*\"]', '2024-02-22 05:02:39', NULL, '2024-02-22 05:02:09', '2024-02-22 05:02:39'),
(560, 'App\\Models\\User', 69, 'API Token', '03006394852aa451b7685ad83382be615596b5abae9519ae6f59b5016082fde1', '[\"*\"]', '2024-02-22 18:24:05', NULL, '2024-02-22 18:23:26', '2024-02-22 18:24:05'),
(561, 'App\\Models\\User', 70, 'myToken', '8d571c7de7579a54774564e08dbca5ae65dfc9b74e14c11a1057d0130730dffc', '[\"*\"]', NULL, NULL, '2024-02-25 06:48:41', '2024-02-25 06:48:41'),
(564, 'App\\Models\\User', 71, 'myToken', '868a8774396408848421136d41ef9770f248ce0c7bb81fd9c2244399d47d3b88', '[\"*\"]', NULL, NULL, '2024-02-27 14:56:28', '2024-02-27 14:56:28'),
(565, 'App\\Models\\User', 71, 'API Token', '7166ba60ef9af5ebd2a3e4ad8f98265e962450bc8a21c5519f7a01d4ed448c81', '[\"*\"]', '2024-02-27 14:59:06', NULL, '2024-02-27 14:56:58', '2024-02-27 14:59:06'),
(566, 'App\\Models\\User', 72, 'myToken', 'c04e30fc5dffd7334a16ddd69d4d5e28c8b3a75641ee5130355bbefa2bdf3c75', '[\"*\"]', NULL, NULL, '2024-02-28 06:37:06', '2024-02-28 06:37:06'),
(569, 'App\\Models\\User', 59, 'API Token', '1b0f4c8715771b054fa25bc61f345a8e65f0bc94106bc1b5318eb026a0055bd3', '[\"*\"]', '2024-03-01 05:30:04', NULL, '2024-03-01 05:29:38', '2024-03-01 05:30:04'),
(598, 'App\\Models\\User', 73, 'myToken', '37f9a68d02aa22c3819164d3dc9f9ad0b7ede5a288f8ec78d1a7ac400feebff9', '[\"*\"]', NULL, NULL, '2024-03-15 11:01:29', '2024-03-15 11:01:29'),
(605, 'App\\Models\\User', 71, 'API Token', '6f143f33667be35bfe4eb2d440fcbe762fd82c66a43a7065d9594c3457c6bb39', '[\"*\"]', '2024-03-17 19:13:55', NULL, '2024-03-17 19:12:56', '2024-03-17 19:13:55'),
(609, 'App\\Models\\User', 74, 'myToken', '03d58ca0abce6e23bb78d1696ac8b58c6bf1b916fa5f90277bf1d1f31b675f51', '[\"*\"]', NULL, NULL, '2024-03-19 09:25:43', '2024-03-19 09:25:43'),
(610, 'App\\Models\\User', 74, 'API Token', '731bc2673fb899f327503755fb84eef8ec99f85d612c5634165e9921d6ad15c4', '[\"*\"]', '2024-03-19 09:26:42', NULL, '2024-03-19 09:26:16', '2024-03-19 09:26:42'),
(619, 'App\\Models\\User', 75, 'myToken', '45a79eb08a274df7a7dc11b8c7bd39e4128a3fa78295fa1437bc8d64cb1ac62f', '[\"*\"]', NULL, NULL, '2024-03-20 06:10:55', '2024-03-20 06:10:55'),
(620, 'App\\Models\\User', 75, 'API Token', '0711d2c68b989dcf19018a4e122b1ba7fa98c1bd4b9b3c88596ea53a7c7f8c93', '[\"*\"]', NULL, NULL, '2024-03-20 06:11:13', '2024-03-20 06:11:13'),
(622, 'App\\Models\\User', 76, 'myToken', 'ac16c67032ef8867d05202e0dd3fdadc5cb71cf9860d55fdd4cc05f73209609c', '[\"*\"]', NULL, NULL, '2024-03-20 12:33:46', '2024-03-20 12:33:46'),
(623, 'App\\Models\\User', 76, 'API Token', 'd27ec2c3f27e585a227d4faa6d0aa0a8a3088730f15683d652b27a1a3e4d1cf5', '[\"*\"]', '2024-03-20 12:35:03', NULL, '2024-03-20 12:34:02', '2024-03-20 12:35:03'),
(627, 'App\\Models\\User', 77, 'API Token', '04643c9b6eeaf331558543cd549180439a8390cd5b934558f6c87c1a6129b399', '[\"*\"]', '2024-03-20 13:19:12', NULL, '2024-03-20 13:19:09', '2024-03-20 13:19:12'),
(632, 'App\\Models\\User', 79, 'myToken', '2ab5f24ad07f7ae2be3778f289c01dc3ff2183b803baa7bc97a8468e72c07f3a', '[\"*\"]', NULL, NULL, '2024-03-21 04:29:58', '2024-03-21 04:29:58'),
(633, 'App\\Models\\User', 79, 'API Token', 'd41557591dd49af7e6a662fd228e4c085830a2a3b00f77c33b9f7b952346caf5', '[\"*\"]', '2024-03-21 04:31:53', NULL, '2024-03-21 04:30:10', '2024-03-21 04:31:53'),
(635, 'App\\Models\\User', 79, 'API Token', '77484550f87f4a84aed8a164eb6f9b34bde03355b5c4b445805b1d463e4210e8', '[\"*\"]', '2024-03-21 05:31:24', NULL, '2024-03-21 05:30:52', '2024-03-21 05:31:24'),
(640, 'App\\Models\\User', 77, 'API Token', 'be72192fdf302061647c36797c73ebe8b95285ebbb845ae7503a8d824b833723', '[\"*\"]', '2024-03-21 06:20:58', NULL, '2024-03-21 06:20:56', '2024-03-21 06:20:58'),
(641, 'App\\Models\\User', 59, 'API Token', 'a00cfd0405469d4ee85d35498225651318d0fc71f82bfeef2b57d8edb4ff2592', '[\"*\"]', '2024-03-21 06:23:05', NULL, '2024-03-21 06:22:56', '2024-03-21 06:23:05'),
(642, 'App\\Models\\User', 59, 'API Token', 'beab5aeb053c0cfb2a47d1120930d494fc20c28764da591dc76ab1087092c988', '[\"*\"]', '2024-03-21 06:39:15', NULL, '2024-03-21 06:39:12', '2024-03-21 06:39:15'),
(646, 'App\\Models\\User', 59, 'API Token', 'e30548d1ad972f1933eb5c70c431fe60cf51646b2daff8da8333ac7892d39da8', '[\"*\"]', '2024-03-21 06:51:19', NULL, '2024-03-21 06:49:38', '2024-03-21 06:51:19'),
(648, 'App\\Models\\User', 59, 'API Token', '29b8686abf8dba43b04e088d704f51a250986f0989a939ecd6d1d76cce4c3725', '[\"*\"]', '2024-03-21 07:22:26', NULL, '2024-03-21 07:22:06', '2024-03-21 07:22:26'),
(650, 'App\\Models\\User', 59, 'API Token', '334ac02c465ad23262e4f056526913c467469ddfd2933947d69999da3604a4c7', '[\"*\"]', '2024-03-21 07:24:41', NULL, '2024-03-21 07:24:04', '2024-03-21 07:24:41'),
(653, 'App\\Models\\User', 59, 'API Token', '7f4356f6206bec2d99dd6874744efcc4a9a1fb3b45b24ad750ced35319f2c443', '[\"*\"]', '2024-03-21 07:56:47', NULL, '2024-03-21 07:56:17', '2024-03-21 07:56:47'),
(655, 'App\\Models\\User', 59, 'API Token', 'f4c8efa9a567302b52bd0ded6fd9d7a3911454201f6489afa00c0dd0e830b3cb', '[\"*\"]', '2024-03-21 08:03:59', NULL, '2024-03-21 08:01:30', '2024-03-21 08:03:59'),
(658, 'App\\Models\\User', 59, 'API Token', 'e4b68e85b185acce0e10e8bcbf396fe88a17f159da613f19ba9bbc3fdcf0f3c5', '[\"*\"]', '2024-03-21 08:20:59', NULL, '2024-03-21 08:20:05', '2024-03-21 08:20:59'),
(664, 'App\\Models\\User', 59, 'API Token', '43ccda7e40a4331827e086b2902ea328838ad4ed53c8c566a41d1149524bf374', '[\"*\"]', '2024-03-21 10:06:12', NULL, '2024-03-21 10:06:01', '2024-03-21 10:06:12'),
(668, 'App\\Models\\User', 59, 'API Token', '6d20f52a69de9726a45c2fbb81cbb0f09721f81025e638c40d22489a371cf11b', '[\"*\"]', NULL, NULL, '2024-03-21 10:38:57', '2024-03-21 10:38:57'),
(669, 'App\\Models\\User', 77, 'API Token', 'da9e4d7c0deac8f34929767d737b8083755894e21f8b32580f62f3117784c0f7', '[\"*\"]', NULL, NULL, '2024-03-21 10:39:38', '2024-03-21 10:39:38'),
(670, 'App\\Models\\User', 59, 'API Token', '01d28ed2207f55768993a62ccf11d53f80f92c2a2c2b619d2685c93a30420501', '[\"*\"]', NULL, NULL, '2024-03-21 10:40:04', '2024-03-21 10:40:04'),
(671, 'App\\Models\\User', 77, 'API Token', '4321d6abf5a703860a890a53c08430007b1bf686d096c97fe55de5af7db0848a', '[\"*\"]', NULL, NULL, '2024-03-21 10:42:03', '2024-03-21 10:42:03'),
(678, 'App\\Models\\User', 77, 'API Token', '5613226796e01a3a76bcdadf4ea102d181733cce8c2942727c918e6f77b870ce', '[\"*\"]', NULL, NULL, '2024-03-21 11:12:54', '2024-03-21 11:12:54'),
(680, 'App\\Models\\User', 59, 'API Token', '3b916eead60d2faee08f8b58b9c20dfafae38f483eeb57328da2f909d2937b88', '[\"*\"]', NULL, NULL, '2024-03-21 11:21:12', '2024-03-21 11:21:12'),
(685, 'App\\Models\\User', 57, 'API Token', 'daa376d59e12c9e737d5c062f3cca410f3ef4214ceb660664ff5bd65f7ba8657', '[\"*\"]', NULL, NULL, '2024-03-21 12:35:34', '2024-03-21 12:35:34'),
(687, 'App\\Models\\User', 59, 'API Token', '549e9715bccdfb8157e9a1166985e35de341958d52584496dd1a24d5b9c09150', '[\"*\"]', '2024-03-21 12:55:15', NULL, '2024-03-21 12:54:20', '2024-03-21 12:55:15'),
(688, 'App\\Models\\User', 59, 'API Token', 'bdcffa6627e692a0e06c2bfc7613ec6557378a7f737fc5fc086f429663381e4a', '[\"*\"]', '2024-03-21 12:55:39', NULL, '2024-03-21 12:55:36', '2024-03-21 12:55:39'),
(690, 'App\\Models\\User', 80, 'myToken', '9bd72703ea4dbd6d78046d6f31c1f94b7242bc72d8c44ff6b5a409c002ba81cb', '[\"*\"]', NULL, NULL, '2024-03-21 20:20:04', '2024-03-21 20:20:04'),
(691, 'App\\Models\\User', 80, 'API Token', 'ef86bcf011be299fe35161d85106a7fad6a9366b62c61f11512032a5cd04ce54', '[\"*\"]', '2024-03-21 20:21:01', NULL, '2024-03-21 20:20:14', '2024-03-21 20:21:01'),
(692, 'App\\Models\\User', 80, 'API Token', '5c8b2c1ec2be5fedf1ea9b92a41157e7d49a620a73f4d519d058d50a58a007db', '[\"*\"]', '2024-03-21 20:21:44', NULL, '2024-03-21 20:21:26', '2024-03-21 20:21:44'),
(694, 'App\\Models\\User', 59, 'API Token', 'a99f48b4923cbf6a4443d35cd8849ede363956f9179e74438789c5ea0706186e', '[\"*\"]', '2024-03-22 06:06:27', NULL, '2024-03-22 06:01:00', '2024-03-22 06:06:27'),
(697, 'App\\Models\\User', 80, 'API Token', 'd3e80c6091cf986a7ac7375bc84dc9cb2124958e3a108a4726c1b1ec07111c73', '[\"*\"]', '2024-03-22 07:14:27', NULL, '2024-03-22 07:14:24', '2024-03-22 07:14:27'),
(705, 'App\\Models\\User', 59, 'API Token', 'a8421e66b9aebd7c1eb2731d96dbb0dd0dd0cc0b3cc472ed33837234721b9ad2', '[\"*\"]', NULL, NULL, '2024-03-22 10:52:42', '2024-03-22 10:52:42'),
(727, 'App\\Models\\User', 81, 'myToken', 'dc27c6cec6113fd2ffc59879229e68ffcf4855a9cc5de3557dc20453e3f89ff8', '[\"*\"]', NULL, NULL, '2024-03-24 03:30:28', '2024-03-24 03:30:28'),
(728, 'App\\Models\\User', 81, 'API Token', '600094e617641847dd839422b541c992d58517f13237cb993b32885a74f4559a', '[\"*\"]', '2024-03-24 03:31:39', NULL, '2024-03-24 03:31:22', '2024-03-24 03:31:39'),
(731, 'App\\Models\\User', 59, 'API Token', '69fbd7d5022f34789a3e9e1a0af1f26b79daa01cbf365dcafdf0e3dd26ffcbfc', '[\"*\"]', '2024-03-25 06:41:55', NULL, '2024-03-25 06:37:01', '2024-03-25 06:41:55'),
(733, 'App\\Models\\User', 82, 'myToken', '18b3ab9aaad0180832cb4d24c5c16563e701433fba840f0700be0a042ba53b9a', '[\"*\"]', NULL, NULL, '2024-03-25 07:11:40', '2024-03-25 07:11:40'),
(734, 'App\\Models\\User', 82, 'API Token', 'd995f6f3d54c462ba3a743361eab2a6352fe4f759cb148d870dc6f90990adf2e', '[\"*\"]', '2024-03-25 07:12:37', NULL, '2024-03-25 07:12:00', '2024-03-25 07:12:37'),
(745, 'App\\Models\\User', 59, 'API Token', '0e6c0df416c923a09124b4f27763e316bd552d3bab5885f2d5bdf14d5a21b569', '[\"*\"]', '2024-03-26 06:45:13', NULL, '2024-03-26 06:43:16', '2024-03-26 06:45:13'),
(746, 'App\\Models\\User', 59, 'API Token', '21a2a0887b2a4c4df3266af92dd3cd73a3eb2d997e700d4f0c02b6ded4ccf660', '[\"*\"]', '2024-03-26 06:45:40', NULL, '2024-03-26 06:45:38', '2024-03-26 06:45:40'),
(747, 'App\\Models\\User', 59, 'API Token', '21a2cdcd478ae0a1800a8d349055faed3e76b1b4db8a9ccf0a2fde4aca14c9f4', '[\"*\"]', '2024-03-26 06:45:56', NULL, '2024-03-26 06:45:55', '2024-03-26 06:45:56'),
(753, 'App\\Models\\User', 59, 'API Token', 'eb874eeb22834581536af39ece449c505b5bf08d48d8613e321c462810143b7e', '[\"*\"]', NULL, NULL, '2024-03-26 07:35:03', '2024-03-26 07:35:03'),
(754, 'App\\Models\\User', 59, 'API Token', 'af6ace1d7e5b6ef3d704e151644471b16afa63c05f08ce578883a925f2f887f4', '[\"*\"]', '2024-03-26 09:37:55', NULL, '2024-03-26 09:36:29', '2024-03-26 09:37:55'),
(759, 'App\\Models\\User', 82, 'API Token', '98babdb3e41d4ec1883a00acc5ae052bacbb49f05f1b425f6d7d991d90807507', '[\"*\"]', '2024-03-28 08:17:48', NULL, '2024-03-28 08:17:33', '2024-03-28 08:17:48'),
(764, 'App\\Models\\User', 83, 'myToken', '712f1927c22eb02f0cbe2089b824e4ffc695c4a3f380fba645bb7915a9f268e7', '[\"*\"]', NULL, NULL, '2024-04-06 14:39:09', '2024-04-06 14:39:09'),
(765, 'App\\Models\\User', 83, 'API Token', '2fa9a6117e36fc3ef31bb7c393ef10a62506273df76eeb01ad4d1215f7c1a9c7', '[\"*\"]', '2024-04-06 14:39:42', NULL, '2024-04-06 14:39:38', '2024-04-06 14:39:42'),
(767, 'App\\Models\\User', 84, 'myToken', 'f04e4fcd06696a4a58996946059678e9f72a4ad481a35de1a70fb835a508f52b', '[\"*\"]', NULL, NULL, '2024-04-09 11:25:28', '2024-04-09 11:25:28'),
(768, 'App\\Models\\User', 84, 'API Token', '77be45fb97cd0742dd90d7b3e6e105ebe5daefade26a1299d12b94b67f45d0f5', '[\"*\"]', '2024-04-09 11:33:33', NULL, '2024-04-09 11:26:03', '2024-04-09 11:33:33'),
(769, 'App\\Models\\User', 84, 'API Token', 'f334d295656b163ca42201ec020082b01ad42b3cb8a2ada0ee2a678d9c6ee4e8', '[\"*\"]', '2024-04-09 14:39:40', NULL, '2024-04-09 14:39:10', '2024-04-09 14:39:40'),
(770, 'App\\Models\\User', 84, 'API Token', '63e7fc0e7908d2a34eadecffd8390213c74f812e69700c9657b84c79183cc0c1', '[\"*\"]', '2024-04-09 18:51:21', NULL, '2024-04-09 18:50:54', '2024-04-09 18:51:21'),
(771, 'App\\Models\\User', 84, 'API Token', 'e23a9f06e828501f49c8293625ac386d1c6a81b61a40c0b8d40f650bd9a93134', '[\"*\"]', '2024-04-13 12:48:31', NULL, '2024-04-10 07:04:40', '2024-04-13 12:48:31'),
(775, 'App\\Models\\User', 85, 'myToken', 'deeed2f4e4e25a508e3f44307b52bc306bd6be8f54489a6a16a3176abffbf671', '[\"*\"]', NULL, NULL, '2024-04-14 06:48:36', '2024-04-14 06:48:36'),
(776, 'App\\Models\\User', 85, 'API Token', '61ead041a8ebbf9649baad0e07643dc7cb0cb1d069918322cd79e57e60204c73', '[\"*\"]', '2024-05-06 05:41:51', NULL, '2024-04-14 06:50:32', '2024-05-06 05:41:51'),
(777, 'App\\Models\\User', 86, 'myToken', 'cf91fe6380990ccf81074e978af0da927ded4262bfc3a343b2e2bdb65e83dc7d', '[\"*\"]', NULL, NULL, '2024-04-14 10:04:59', '2024-04-14 10:04:59'),
(778, 'App\\Models\\User', 86, 'API Token', 'f68fef4afecfb3eb3604b047e466e6e3a74c4c28c295152b86a1d0a0db0cfb93', '[\"*\"]', '2024-04-15 06:18:01', NULL, '2024-04-14 10:05:14', '2024-04-15 06:18:01'),
(779, 'App\\Models\\User', 86, 'API Token', '15cfe55ede4baf4b7e0c4c8a5de6e51920b0c79e0fa68cb65d91c8b17ebc197d', '[\"*\"]', '2024-04-15 06:24:33', NULL, '2024-04-15 06:18:29', '2024-04-15 06:24:33'),
(782, 'App\\Models\\User', 87, 'myToken', 'b212eb3f034856892345c24c714069f6b23cfc98d37af03581be00aa1d503b7c', '[\"*\"]', NULL, NULL, '2024-04-17 05:24:41', '2024-04-17 05:24:41'),
(786, 'App\\Models\\User', 88, 'myToken', 'e7afe785c3240bd4fdd2095a05767c2d0e6726bc874b9c00550a2d0596062aae', '[\"*\"]', NULL, NULL, '2024-04-17 06:06:32', '2024-04-17 06:06:32'),
(787, 'App\\Models\\User', 88, 'API Token', '72615163e07f44bd511235aa83a85f42cd040980f175e1eb5a446cd38c0de472', '[\"*\"]', NULL, NULL, '2024-04-17 06:07:18', '2024-04-17 06:07:18'),
(788, 'App\\Models\\User', 88, 'API Token', 'dcf789d54629f64a7068d17b605de8ac6d9a63fbdebdfcbb68594188e3ad3e60', '[\"*\"]', NULL, NULL, '2024-04-17 06:08:23', '2024-04-17 06:08:23'),
(789, 'App\\Models\\User', 88, 'API Token', '0f2a693c6d81649e783e73d14cb5aa280b1ba24938026d99da2c7d593c9c8626', '[\"*\"]', NULL, NULL, '2024-04-17 06:09:13', '2024-04-17 06:09:13'),
(791, 'App\\Models\\User', 89, 'myToken', '082cf41097f844a1e57613e3af1ab753259d5dc99189b64fa97f2cd1e277740f', '[\"*\"]', NULL, NULL, '2024-04-17 06:25:56', '2024-04-17 06:25:56'),
(792, 'App\\Models\\User', 89, 'API Token', '004bd0ff4eb78fbf5e24ac8bba033bb9f33682f7f6c31ecc88954d78c1687605', '[\"*\"]', NULL, NULL, '2024-04-17 06:26:43', '2024-04-17 06:26:43'),
(793, 'App\\Models\\User', 89, 'API Token', '3008e18d32f3de355068a8c5abc833c24aa29483f1a63a2d2307d692040de273', '[\"*\"]', NULL, NULL, '2024-04-17 06:44:57', '2024-04-17 06:44:57'),
(794, 'App\\Models\\User', 89, 'API Token', '5298c9c83d0e35af7bab9f9ac1e8474ed403d54f793ad8d963b3660a161efac2', '[\"*\"]', NULL, NULL, '2024-04-17 06:46:07', '2024-04-17 06:46:07'),
(796, 'App\\Models\\User', 89, 'API Token', 'a839dddcd784e15caf7a72ff9094e9d89a38b20f6c82eac4060c7efe1127da26', '[\"*\"]', NULL, NULL, '2024-04-17 06:51:23', '2024-04-17 06:51:23'),
(798, 'App\\Models\\User', 89, 'API Token', 'f83505a64cb4d62ee1f7e14673b38d507208d990111bf1d2dad9681a38cf1937', '[\"*\"]', '2024-04-17 07:04:43', NULL, '2024-04-17 07:00:22', '2024-04-17 07:04:43'),
(799, 'App\\Models\\User', 89, 'API Token', '0e2dffd5803d554d927968466f5e042c2cdaf9daf1ee6c1d7692e76a74a73246', '[\"*\"]', '2024-04-17 07:12:22', NULL, '2024-04-17 07:11:34', '2024-04-17 07:12:22'),
(804, 'App\\Models\\User', 89, 'API Token', 'b6fe2baec3abfe7054acce44d324d910790821997edafda07f5adaa35cbdd2cd', '[\"*\"]', '2024-04-17 07:49:16', NULL, '2024-04-17 07:46:24', '2024-04-17 07:49:16'),
(805, 'App\\Models\\User', 89, 'API Token', '78d6c6315253e1f811252aacaa95321085105107b550907b4d59feebea55e4df', '[\"*\"]', '2024-04-17 09:35:22', NULL, '2024-04-17 09:33:19', '2024-04-17 09:35:22'),
(812, 'App\\Models\\User', 89, 'API Token', '3e424aa35be3d7fc40fae8fa87ca51c2b0f712f7f4ec670342b5ffc5a6901321', '[\"*\"]', NULL, NULL, '2024-04-17 11:57:31', '2024-04-17 11:57:31'),
(820, 'App\\Models\\User', 59, 'API Token', '98e7d2fda3a32785dab22caf685fb966d2132440425ae81793998742ed66affc', '[\"*\"]', '2024-04-19 11:51:37', NULL, '2024-04-19 11:51:36', '2024-04-19 11:51:37'),
(822, 'App\\Models\\User', 59, 'API Token', 'f0232b6d7840d82f26794cc00acc39bbf95e7f976f4a1ce56c5cd252d1a35fbd', '[\"*\"]', '2024-04-19 11:53:34', NULL, '2024-04-19 11:53:33', '2024-04-19 11:53:34'),
(824, 'App\\Models\\User', 91, 'myToken', '5300f06edf006b37e075dbbc4ad53656c3fe5d711e50c5a81450e7a7738be7f9', '[\"*\"]', NULL, NULL, '2024-04-21 16:47:53', '2024-04-21 16:47:53'),
(825, 'App\\Models\\User', 91, 'API Token', '72b2658b9237bf8bb0c5d21321ebbef92c6be1b1ef9ea6f46a3cdbbc40641593', '[\"*\"]', NULL, NULL, '2024-04-21 16:48:09', '2024-04-21 16:48:09'),
(826, 'App\\Models\\User', 92, 'myToken', '18eb7a5403ab07e5d47bb432cd6a1d5db64457a7d0f4251d1dd87863912aef97', '[\"*\"]', NULL, NULL, '2024-04-21 17:02:24', '2024-04-21 17:02:24'),
(827, 'App\\Models\\User', 92, 'API Token', 'b5c4f07b7cdf2c0024e1d7f5c51c354f5bdd6c7ef71c7445f0feb6a72404085c', '[\"*\"]', '2024-04-21 17:03:13', NULL, '2024-04-21 17:02:48', '2024-04-21 17:03:13'),
(831, 'App\\Models\\User', 95, 'myToken', '6468c2ab815b34a00db6bd21c4547943833aa446ea8efb4bceb038e75b9ce8f6', '[\"*\"]', NULL, NULL, '2024-04-23 10:51:31', '2024-04-23 10:51:31'),
(832, 'App\\Models\\User', 95, 'API Token', '7cdc5a223bfe7770f018990d31112e610f86107685564d6f76500934d11ca389', '[\"*\"]', NULL, NULL, '2024-04-23 10:51:48', '2024-04-23 10:51:48'),
(833, 'App\\Models\\User', 96, 'myToken', 'e01cf4f89ccc1e10c3c04daf668525f095e7d9a0804de0eac525869c47610a60', '[\"*\"]', NULL, NULL, '2024-04-23 10:52:13', '2024-04-23 10:52:13'),
(834, 'App\\Models\\User', 96, 'API Token', '68810fed43a427ddf8c6ccdfab0c2b9b6bb9a3af6de76421c0571eb34b16ad2b', '[\"*\"]', '2024-04-23 10:53:19', NULL, '2024-04-23 10:52:46', '2024-04-23 10:53:19'),
(841, 'App\\Models\\User', 97, 'myToken', 'e3a2b52430f90f444b7547c6659013cef3860c89262cae5d2dcf032236e56999', '[\"*\"]', NULL, NULL, '2024-04-24 07:03:35', '2024-04-24 07:03:35'),
(842, 'App\\Models\\User', 98, 'myToken', '44a1951dc6213ef5c873b5dff4814a5497d942b5b61a3562d0e582638c3557a9', '[\"*\"]', NULL, NULL, '2024-04-24 07:10:45', '2024-04-24 07:10:45'),
(843, 'App\\Models\\User', 98, 'API Token', '3597f21ef8b9e7944907ad5173103ba57a9ad98d6030af6f334973ec35c00a05', '[\"*\"]', NULL, NULL, '2024-04-24 07:11:28', '2024-04-24 07:11:28'),
(845, 'App\\Models\\User', 100, 'API Token', '4f331bffe10663b848ad39449438ee606b8d975c0c177428edf90f925e773d6a', '[\"*\"]', '2024-04-24 14:08:17', NULL, '2024-04-24 13:50:51', '2024-04-24 14:08:17'),
(846, 'App\\Models\\User', 100, 'API Token', 'ab7fc9e90c9c5a4121ac054327d0500fbda74b1ff1f18ef68644ad9c17082eb9', '[\"*\"]', '2024-04-28 07:30:12', NULL, '2024-04-24 14:09:06', '2024-04-28 07:30:12'),
(847, 'App\\Models\\User', 99, 'API Token', 'f5d367604e54d9dd93bcada84dbbeb8bbb2fd08ee7423231763676db37710d0c', '[\"*\"]', '2024-04-25 03:54:22', NULL, '2024-04-25 03:53:24', '2024-04-25 03:54:22'),
(848, 'App\\Models\\User', 99, 'API Token', '56f3e3c30a3587be107fb3fa5e978630b32f9b1a5266e2b411f1f73af2bc73c0', '[\"*\"]', '2024-04-26 02:48:25', NULL, '2024-04-25 03:54:48', '2024-04-26 02:48:25'),
(849, 'App\\Models\\User', 89, 'API Token', '1512f343591a46e8aca85c84bebe63ce55c388e27804c2f91132e578547ca4d1', '[\"*\"]', NULL, NULL, '2024-04-25 11:48:48', '2024-04-25 11:48:48'),
(850, 'App\\Models\\User', 99, 'API Token', 'd6026ae1b2fd09da8507d4162f226747c5919dc663001d587dbb062c46c1ccba', '[\"*\"]', '2024-04-27 04:26:45', NULL, '2024-04-26 02:49:04', '2024-04-27 04:26:45'),
(851, 'App\\Models\\User', 99, 'API Token', '8e0a082db216e2ae3984d1363ca19b8e273dadc01dc8f48545e1d8fc89ec7fc6', '[\"*\"]', '2024-04-27 04:27:19', NULL, '2024-04-27 04:27:16', '2024-04-27 04:27:19'),
(852, 'App\\Models\\User', 99, 'API Token', '831ffb070227572715413eb2eb2007aacd68a801a70a3f84f936a1b02d0af14c', '[\"*\"]', '2024-04-29 04:25:12', NULL, '2024-04-27 04:28:12', '2024-04-29 04:25:12'),
(854, 'App\\Models\\User', 99, 'API Token', '4d4ca0dc121700e9dc186ff67e0cf5145e8a1ef2ce6d9bd72f39f8a877ccf8b9', '[\"*\"]', '2024-04-29 12:10:06', NULL, '2024-04-29 12:10:00', '2024-04-29 12:10:06'),
(855, 'App\\Models\\User', 99, 'API Token', '44f86088f8f7b4f618ca56baa13f7df79494657cf5689245ac5e822e31384380', '[\"*\"]', '2024-04-30 13:21:07', NULL, '2024-04-30 13:21:05', '2024-04-30 13:21:07'),
(857, 'App\\Models\\User', 59, 'API Token', 'a83d8569768b4f3049ed219cf30b0498df26a348e61077091d5f27b1104df227', '[\"*\"]', NULL, NULL, '2024-05-01 07:02:35', '2024-05-01 07:02:35'),
(860, 'App\\Models\\User', 99, 'API Token', '8155e127011b5f9db41e228d04afba082505ad26a733f030237cb13cdb29c781', '[\"*\"]', '2024-05-01 07:09:34', NULL, '2024-05-01 07:09:30', '2024-05-01 07:09:34'),
(869, 'App\\Models\\User', 101, 'myToken', '65f2d2306a0b9cfe43468d1512957a5e1208d1f72fce77ce95efb3cba8777d18', '[\"*\"]', NULL, NULL, '2024-05-02 09:40:34', '2024-05-02 09:40:34'),
(881, 'App\\Models\\User', 105, 'myToken', '713faac46278e1495171689b8d89c6f53a96a4e7827d00f9e3d7a1084be35add', '[\"*\"]', NULL, NULL, '2024-05-02 11:11:24', '2024-05-02 11:11:24'),
(882, 'App\\Models\\User', 105, 'API Token', '99adad2d4c8174e04cfdab52279d3252d223920cdadf572eeb933d4e046ab5a3', '[\"*\"]', '2024-05-02 11:12:17', NULL, '2024-05-02 11:11:28', '2024-05-02 11:12:17'),
(883, 'App\\Models\\User', 105, 'API Token', 'be0027c0d0599ec2810b12e841997c2913113427aefa59dd8d42bf88428e5d82', '[\"*\"]', '2024-05-02 11:29:08', NULL, '2024-05-02 11:28:25', '2024-05-02 11:29:08'),
(884, 'App\\Models\\User', 106, 'myToken', '04675bdee5a83c418a7693e0a3a49483c573775ba53b1d1fa35649d839200f8d', '[\"*\"]', NULL, NULL, '2024-05-02 11:49:46', '2024-05-02 11:49:46'),
(885, 'App\\Models\\User', 106, 'API Token', '77fbccdcbe5e30fb6fc461f31569333660f9ddd266ebe0887bda8eba8e650d3f', '[\"*\"]', NULL, NULL, '2024-05-02 11:50:11', '2024-05-02 11:50:11'),
(886, 'App\\Models\\User', 99, 'API Token', '566068499a0729c4196762bc54be4c1d5b4cebe89a90d67d0fa8b97e4b6e29eb', '[\"*\"]', '2024-05-03 03:43:15', NULL, '2024-05-02 11:50:57', '2024-05-03 03:43:15'),
(887, 'App\\Models\\User', 106, 'API Token', '9ed88736b4fc11f7c7f9bd6c3ed977de48067912f8fb675ff04e245caebf6551', '[\"*\"]', NULL, NULL, '2024-05-02 11:51:50', '2024-05-02 11:51:50'),
(888, 'App\\Models\\User', 106, 'API Token', 'eed8039d8e400a5b128698ea0e95b255c46872abb90827c45822424962ce5f71', '[\"*\"]', '2024-05-02 11:58:44', NULL, '2024-05-02 11:58:32', '2024-05-02 11:58:44'),
(889, 'App\\Models\\User', 100, 'API Token', '89d7b04c426175604241b2d785e57818ab266e6582f4b4b7f079239a300871b7', '[\"*\"]', '2024-05-17 06:41:31', NULL, '2024-05-02 12:37:30', '2024-05-17 06:41:31'),
(890, 'App\\Models\\User', 106, 'API Token', '9e23870a0ed93d4e7ab071c518bfaeec241054feaf21377dd8ab5998b67af7d5', '[\"*\"]', '2024-05-03 06:04:12', NULL, '2024-05-02 13:22:57', '2024-05-03 06:04:12'),
(891, 'App\\Models\\User', 105, 'API Token', 'b1c8bdf2090c1c3d07245866cf99e16f351d3c821d0bc1b7746e8a38e8a88085', '[\"*\"]', '2024-05-03 07:05:08', NULL, '2024-05-02 14:17:53', '2024-05-03 07:05:08'),
(892, 'App\\Models\\User', 99, 'API Token', '2985667899567c31936975a0ff307ac1ad9c26128fbe09d1cd3ca21e8aaaee41', '[\"*\"]', '2024-05-03 10:30:16', NULL, '2024-05-03 03:43:31', '2024-05-03 10:30:16'),
(893, 'App\\Models\\User', 105, 'API Token', '0c3c890ac919450db5af41421282c06083a5561f7387eeac8b12c75206b490af', '[\"*\"]', NULL, NULL, '2024-05-03 06:49:28', '2024-05-03 06:49:28'),
(894, 'App\\Models\\User', 105, 'API Token', '2529c599f66c43d36bc858cc321ed7a1cd7db22064c9244414345965284dc0b6', '[\"*\"]', NULL, NULL, '2024-05-03 06:50:25', '2024-05-03 06:50:25'),
(895, 'App\\Models\\User', 105, 'API Token', '0e96db9de1e8a526bca0f2898837d6a6981ed3d1a3ff25604122dc7c60ee48ca', '[\"*\"]', '2024-05-03 06:53:51', NULL, '2024-05-03 06:53:30', '2024-05-03 06:53:51'),
(896, 'App\\Models\\User', 105, 'API Token', '33f97883da68893c903fdbe58b59d9389f716712a736e3f8c79b6e91bc3dc46e', '[\"*\"]', '2024-05-03 07:19:08', NULL, '2024-05-03 07:15:49', '2024-05-03 07:19:08'),
(897, 'App\\Models\\User', 105, 'API Token', '697b59dfbe6444a0c09a09bddcdf4bdbf25ac13d691b1492edaff898b2af18cb', '[\"*\"]', '2024-05-03 08:12:39', NULL, '2024-05-03 08:11:53', '2024-05-03 08:12:39'),
(898, 'App\\Models\\User', 105, 'API Token', 'a70165724cc6019af52be263ed6d70f72b29d0ff2014fe189894c541d22cb88f', '[\"*\"]', NULL, NULL, '2024-05-03 08:18:18', '2024-05-03 08:18:18'),
(899, 'App\\Models\\User', 105, 'API Token', '66b0314e0f3030f260d776197030eb91220f4aa58e3aad8f25969415cbf94f87', '[\"*\"]', NULL, NULL, '2024-05-03 10:54:44', '2024-05-03 10:54:44'),
(900, 'App\\Models\\User', 105, 'API Token', 'da918d83030c3bf3abb4d9cbd8aebbfd78d150350186060c44ff7b35a2f07ca4', '[\"*\"]', NULL, NULL, '2024-05-03 10:59:05', '2024-05-03 10:59:05'),
(901, 'App\\Models\\User', 105, 'API Token', '759be4ad81734039aea258c534466f2913fa045a3bbef3dfb93721d30c51da3c', '[\"*\"]', NULL, NULL, '2024-05-03 11:04:52', '2024-05-03 11:04:52'),
(902, 'App\\Models\\User', 105, 'API Token', 'd308a4f37be20109034e26b3777709dfbfa49d43c06b46641402e005bc722add', '[\"*\"]', NULL, NULL, '2024-05-03 11:13:45', '2024-05-03 11:13:45'),
(903, 'App\\Models\\User', 105, 'API Token', '1d3323d06a4bd5b68f158d749c305dcf232056a0c13dde2bad53b8c0cb4c07e8', '[\"*\"]', NULL, NULL, '2024-05-03 11:18:02', '2024-05-03 11:18:02'),
(904, 'App\\Models\\User', 105, 'API Token', 'de7e653e787a79516fcdba5c486c94ce721e6b3e824025d4e037c017be385c68', '[\"*\"]', NULL, NULL, '2024-05-03 11:23:55', '2024-05-03 11:23:55'),
(905, 'App\\Models\\User', 105, 'API Token', 'b234e07fed73b2df97a1184b501f601c7bea16d72c9662f8582752f7664297cf', '[\"*\"]', NULL, NULL, '2024-05-03 15:50:35', '2024-05-03 15:50:35'),
(906, 'App\\Models\\User', 99, 'API Token', 'd2ad15e2f21d8d86ad70e4d4fc1f54001029d0f77f0f5e10f6410c869e46eb66', '[\"*\"]', '2024-05-09 02:00:46', NULL, '2024-05-04 12:18:23', '2024-05-09 02:00:46'),
(907, 'App\\Models\\User', 105, 'API Token', 'f09f72d7445b7070fa83a01986681197cbc8a68593ea3bcf3cc8bfef85d9a66d', '[\"*\"]', NULL, NULL, '2024-05-04 17:04:13', '2024-05-04 17:04:13'),
(908, 'App\\Models\\User', 105, 'API Token', '59f5e77ad14d8e96adc22ea679be8054949b12eb363be081d8a8511b47366414', '[\"*\"]', NULL, NULL, '2024-05-05 02:38:16', '2024-05-05 02:38:16'),
(909, 'App\\Models\\User', 101, 'API Token', 'dc1e5b57527743a0aa3a71c5750dd52361942186a7864476e22c07d840bcbe64', '[\"*\"]', NULL, NULL, '2024-05-05 02:42:38', '2024-05-05 02:42:38'),
(910, 'App\\Models\\User', 105, 'API Token', '53effbc9c46f285571d088c7433cbeb197143c8cb7eb3dcddbf7531ef567e9fc', '[\"*\"]', NULL, NULL, '2024-05-05 03:17:01', '2024-05-05 03:17:01'),
(911, 'App\\Models\\User', 105, 'API Token', '922524376230454e93ddfd740a29f4e329fb0b18bd211c2c34bb8c7a1cf991fc', '[\"*\"]', NULL, NULL, '2024-05-05 03:25:37', '2024-05-05 03:25:37'),
(912, 'App\\Models\\User', 105, 'API Token', 'd1ed1f260699313772502382085d0e62496b6bbdbf72c2939e575a1d4dd7e412', '[\"*\"]', NULL, NULL, '2024-05-05 03:32:09', '2024-05-05 03:32:09'),
(913, 'App\\Models\\User', 105, 'API Token', '8b921f4fc663770e532f85427f486fb6bd5ab7a65e9c8522f322d6a0fecb683c', '[\"*\"]', NULL, NULL, '2024-05-05 03:39:48', '2024-05-05 03:39:48'),
(914, 'App\\Models\\User', 105, 'API Token', '17c2e969b72f5615848c464d2671784c626031aa4b86919c53f2bac398d7a4bb', '[\"*\"]', '2024-05-05 05:03:29', NULL, '2024-05-05 05:00:57', '2024-05-05 05:03:29'),
(915, 'App\\Models\\User', 107, 'myToken', '9864089e90833875ad66d25bf3cde0a1de888ee3ec1cc2cb780b7db57f20bcbf', '[\"*\"]', NULL, NULL, '2024-05-06 07:14:40', '2024-05-06 07:14:40'),
(916, 'App\\Models\\User', 107, 'API Token', '59b1c54866b5516853344f7169ff2a7b6df0a182a310a85db8a6636f0b13222c', '[\"*\"]', '2024-05-06 07:15:25', NULL, '2024-05-06 07:15:11', '2024-05-06 07:15:25'),
(917, 'App\\Models\\User', 108, 'myToken', 'bc4e5d6d140294857a7e5f1989371060e1240736da51008b524cc73ff4e6c6d7', '[\"*\"]', NULL, NULL, '2024-05-06 17:02:15', '2024-05-06 17:02:15'),
(918, 'App\\Models\\User', 108, 'API Token', '119b699712cecac0d305fb0e51ed8b42933c01cd51fe0bda7a7c1065044caef8', '[\"*\"]', '2024-05-06 17:02:59', NULL, '2024-05-06 17:02:43', '2024-05-06 17:02:59'),
(919, 'App\\Models\\User', 109, 'API Token', '47509344c6c63fd44dd0013f231b89e61b190bc9fa7ae5d8cbe48aa1c405bcde', '[\"*\"]', '2024-05-07 11:02:54', NULL, '2024-05-07 11:02:53', '2024-05-07 11:02:54'),
(920, 'App\\Models\\User', 109, 'API Token', '74244c6250c5c4978d6fa2702829d34feb8ec1914b96811fa30e6b0723fce3f8', '[\"*\"]', '2024-05-07 11:27:02', NULL, '2024-05-07 11:23:51', '2024-05-07 11:27:02'),
(921, 'App\\Models\\User', 109, 'API Token', '65b7e3d6d8014fcdbc0d38f1804f5bd6eb5237f783d47b13d27c5b8907ea6a11', '[\"*\"]', '2024-05-07 11:45:41', NULL, '2024-05-07 11:30:17', '2024-05-07 11:45:41'),
(922, 'App\\Models\\User', 109, 'API Token', '212c94c2909b44e312f9df4daf05140f73d4f9f765e123d03a1e6f4e6a992e3e', '[\"*\"]', '2024-05-07 11:39:05', NULL, '2024-05-07 11:39:03', '2024-05-07 11:39:05'),
(923, 'App\\Models\\User', 110, 'myToken', 'cefc6423fbcecde25c50097281baf4929141f556b785f0e9ec70604035673058', '[\"*\"]', NULL, NULL, '2024-05-07 11:41:11', '2024-05-07 11:41:11'),
(924, 'App\\Models\\User', 110, 'API Token', '014dd3d525a7c8b7c3ea6cedfb7d99d6663a49fbf04a005d542f6dd5be99c60e', '[\"*\"]', '2024-05-07 11:46:35', NULL, '2024-05-07 11:41:48', '2024-05-07 11:46:35'),
(925, 'App\\Models\\User', 101, 'API Token', 'ff743d8ecdeced7ed139c780209d73550d7988e77e0a81e604bed3f107f693fc', '[\"*\"]', NULL, NULL, '2024-05-08 05:52:14', '2024-05-08 05:52:14'),
(926, 'App\\Models\\User', 105, 'API Token', '529486a8533581309db2f71abf9dc4576a3b77c7ed50e00b498e7a12c99b6947', '[\"*\"]', '2024-05-08 06:07:00', NULL, '2024-05-08 05:53:32', '2024-05-08 06:07:00'),
(927, 'App\\Models\\User', 105, 'API Token', '239098ecdd1eebcd8769026d82501a57b0d121b0257a2e02198b1a273c66dce5', '[\"*\"]', '2024-05-08 06:16:29', NULL, '2024-05-08 06:12:46', '2024-05-08 06:16:29'),
(928, 'App\\Models\\User', 105, 'API Token', '58715f2a128dcf5a0554536b21175eb41894e350defe3c466114182f132ecb60', '[\"*\"]', '2024-05-08 06:19:37', NULL, '2024-05-08 06:19:18', '2024-05-08 06:19:37'),
(929, 'App\\Models\\User', 105, 'API Token', 'b87c662818ecd51af9663bd3f014ff8e3d873cbeec1394b30deae7c124790208', '[\"*\"]', '2024-05-08 06:23:26', NULL, '2024-05-08 06:23:12', '2024-05-08 06:23:26'),
(930, 'App\\Models\\User', 105, 'API Token', 'cdf3c8523060450348b2b250c4ea9af7ecfd1d9d62fa1eaa253472a8356557d5', '[\"*\"]', '2024-05-08 18:20:38', NULL, '2024-05-08 10:19:11', '2024-05-08 18:20:38'),
(931, 'App\\Models\\User', 99, 'API Token', '9f0547f7b0cdfd9658c6b880d5ebeb2a0ad0840cd2a63d97a09733ef6760a7ed', '[\"*\"]', '2024-05-09 13:24:27', NULL, '2024-05-09 02:01:10', '2024-05-09 13:24:27'),
(932, 'App\\Models\\User', 99, 'API Token', '45e0dc41a5386c63ddb965848774d48f2b7e58d0fd0715010c5dfa161e69dd05', '[\"*\"]', '2024-05-10 03:52:26', NULL, '2024-05-09 13:25:28', '2024-05-10 03:52:26'),
(933, 'App\\Models\\User', 111, 'myToken', 'fd2f31d0499b87c1d31589ddbe4e578abc6938afefa2fd0cafa30567a245e19c', '[\"*\"]', NULL, NULL, '2024-05-10 08:38:30', '2024-05-10 08:38:30'),
(934, 'App\\Models\\User', 109, 'API Token', '7fb774d3e9e397b9b70d4b6ecd8ec57a603ae45fb4f72b2d436fd90745f7f522', '[\"*\"]', '2024-05-22 16:48:36', NULL, '2024-05-10 14:05:35', '2024-05-22 16:48:36'),
(935, 'App\\Models\\User', 99, 'API Token', '08798afabef09e0051518d1cec1abb4b18a3c80ea3287f16b0240ff9de4d4584', '[\"*\"]', '2024-05-14 01:30:45', NULL, '2024-05-10 18:03:27', '2024-05-14 01:30:45'),
(936, 'App\\Models\\User', 112, 'myToken', '429c28f56925a7928cd2a5fc278eef3f425efebf27e6bc2c64d2f72e19bd7034', '[\"*\"]', NULL, NULL, '2024-05-11 07:31:16', '2024-05-11 07:31:16'),
(937, 'App\\Models\\User', 112, 'API Token', '290b4ca5c10e9adb9d8f76a90249e9e3c2a3489abf0e443228b74b2bd8813589', '[\"*\"]', '2024-05-11 07:31:50', NULL, '2024-05-11 07:31:33', '2024-05-11 07:31:50'),
(938, 'App\\Models\\User', 105, 'API Token', 'f24592628f77c264db24d16a3fc485ba3f5f02905d45371e68eca31805de9833', '[\"*\"]', '2024-05-16 11:00:12', NULL, '2024-05-16 10:59:03', '2024-05-16 11:00:12'),
(939, 'App\\Models\\User', 99, 'API Token', 'ac7e42819650022118a03667edaef8d693c68c53e7748874fb89cadf7103af4e', '[\"*\"]', '2024-05-16 11:29:11', NULL, '2024-05-16 11:29:09', '2024-05-16 11:29:11'),
(940, 'App\\Models\\User', 99, 'API Token', '695c93a76ea3d3fa08cbd4b6e2cfa82f5e474f36f732c05d7845a5e818e79a94', '[\"*\"]', '2024-05-18 11:19:23', NULL, '2024-05-18 11:19:21', '2024-05-18 11:19:23'),
(941, 'App\\Models\\User', 100, 'API Token', 'bf578cfa3d3bce657963aa79774fc4c8bc97ad562b13895b79c729536f685664', '[\"*\"]', '2024-05-22 03:55:47', NULL, '2024-05-22 03:55:46', '2024-05-22 03:55:47'),
(942, 'App\\Models\\User', 109, 'API Token', '257a00003c1fb2af96b9b5d22d85db373fe7a8466c0e6a1d8429357e230610b8', '[\"*\"]', '2024-06-20 14:26:23', NULL, '2024-05-22 16:49:29', '2024-06-20 14:26:23'),
(943, 'App\\Models\\User', 113, 'myToken', '55750ab15d344ea0ebb24a89d7a1cc4466efde7bbd23824094b268b0c3ffc5e2', '[\"*\"]', NULL, NULL, '2024-05-23 10:38:21', '2024-05-23 10:38:21'),
(945, 'App\\Models\\User', 105, 'API Token', '703c8b225a48f89b154d94110b0403000c81d23edbcfff00a15547aea8fbd18d', '[\"*\"]', '2024-05-27 11:31:46', NULL, '2024-05-24 05:03:16', '2024-05-27 11:31:46'),
(946, 'App\\Models\\User', 105, 'API Token', 'cb2dc678c2b4524879d9ca3e4c644de7b773cc5764990b12e410cc20757a7792', '[\"*\"]', '2024-05-27 11:34:23', NULL, '2024-05-27 11:32:12', '2024-05-27 11:34:23'),
(947, 'App\\Models\\User', 105, 'API Token', 'dc663b370839f79fb070e66b6c7d9cddd862c0f8b049f2bb1dee82950bae6674', '[\"*\"]', '2024-05-29 06:56:35', NULL, '2024-05-29 06:56:17', '2024-05-29 06:56:35'),
(951, 'App\\Models\\User', 115, 'myToken', '43a5cb4a5efb219e31c0ad462f6d4ecfc888d3995a19dd648d9e1aac734b44e9', '[\"*\"]', NULL, NULL, '2024-05-29 10:04:33', '2024-05-29 10:04:33'),
(952, 'App\\Models\\User', 116, 'myToken', '8ba8d1b4fd778ce5a0c33d43a139786e9600ee100f4774a54280be8e174e6bc2', '[\"*\"]', NULL, NULL, '2024-05-29 10:08:59', '2024-05-29 10:08:59'),
(956, 'App\\Models\\User', 105, 'API Token', 'b4f9e13ae2c8dd2c0cb02514721424619d737cd67d43ff26b4d48edc5e34d3c9', '[\"*\"]', NULL, NULL, '2024-05-29 11:44:02', '2024-05-29 11:44:02'),
(960, 'App\\Models\\User', 119, 'myToken', '27fbfaacfd7331bdb67e159205d14dc9af877a5fe7d63e2b15bc7ce2d194a189', '[\"*\"]', NULL, NULL, '2024-05-29 12:56:50', '2024-05-29 12:56:50'),
(961, 'App\\Models\\User', 120, 'myToken', '7183125697bd4c4c611d8260f7949f9787e9b1b7c85d5196f71b2ab9d4318939', '[\"*\"]', NULL, NULL, '2024-05-29 13:02:55', '2024-05-29 13:02:55'),
(962, 'App\\Models\\User', 121, 'myToken', '83d40e84ab45faaf95ed56889a820cf8383cd8dec1d4eea5d6957c8bd4957a2e', '[\"*\"]', NULL, NULL, '2024-05-29 13:03:25', '2024-05-29 13:03:25'),
(963, 'App\\Models\\User', 119, 'API Token', '510e23b0f64e3fff7a880ae499f45ef5af9f373ef78109b95cbd62fcc2e41d4a', '[\"*\"]', NULL, NULL, '2024-05-29 13:19:29', '2024-05-29 13:19:29'),
(964, 'App\\Models\\User', 119, 'API Token', '4c3bae281253bd15e853cd4062951691a4a62a734e1cb9d55fb496b8ba2fce12', '[\"*\"]', NULL, NULL, '2024-05-30 05:08:38', '2024-05-30 05:08:38'),
(965, 'App\\Models\\User', 122, 'myToken', '2011750046e301d25ff47bd4738b214c1423eab64c21e4401701e0d5e67ccd70', '[\"*\"]', NULL, NULL, '2024-05-30 05:09:20', '2024-05-30 05:09:20'),
(966, 'App\\Models\\User', 123, 'myToken', '87012e82fa7ecf1b5ac048cf089bfc946f764f2469618f1fc92d3aa97610987a', '[\"*\"]', NULL, NULL, '2024-05-30 05:09:37', '2024-05-30 05:09:37'),
(967, 'App\\Models\\User', 105, 'API Token', '35c42f4a321d0ed3c88d8f88ed45afeb2252e8adf7a8e1a454479da66466cd26', '[\"*\"]', NULL, NULL, '2024-05-30 07:50:05', '2024-05-30 07:50:05'),
(968, 'App\\Models\\User', 117, 'API Token', '2d60b86296398632e6b36f754ded3e3543e9f6cede3d8f1176c573722d144e63', '[\"*\"]', NULL, NULL, '2024-05-30 07:57:40', '2024-05-30 07:57:40'),
(969, 'App\\Models\\User', 117, 'API Token', '6efcdace6040a38bc8024f46dd3b5207e7c781e133b4ed392070971828d169ca', '[\"*\"]', NULL, NULL, '2024-05-30 07:57:42', '2024-05-30 07:57:42'),
(970, 'App\\Models\\User', 117, 'API Token', '979c7d2c7b6faed06839e427c94549cfcbc7c6c4d628fc1cb2fead820072912e', '[\"*\"]', NULL, NULL, '2024-05-30 07:59:25', '2024-05-30 07:59:25'),
(971, 'App\\Models\\User', 119, 'API Token', '47a5f4916af75898ee5430599fdb9eae44d7f1cb6495c4ffff26e4afa63a8ed1', '[\"*\"]', NULL, NULL, '2024-05-30 08:15:27', '2024-05-30 08:15:27'),
(972, 'App\\Models\\User', 119, 'API Token', '8ad1dca7b96f6a24ebaaef9705081b734fe94bbbcaa5899b9643b1ad917b3654', '[\"*\"]', NULL, NULL, '2024-05-30 08:15:44', '2024-05-30 08:15:44'),
(973, 'App\\Models\\User', 119, 'API Token', '6b8989c2b1e80112d5bea3ab7b1fbb19f829befe72cf06fa49035cd6bea2c320', '[\"*\"]', NULL, NULL, '2024-05-30 10:24:25', '2024-05-30 10:24:25'),
(974, 'App\\Models\\User', 119, 'API Token', 'eb3dfd4a6209a21011a2c9fe5f047f80eb7ce1cfafdb3f7e171df589688aa9d7', '[\"*\"]', NULL, NULL, '2024-05-30 10:26:09', '2024-05-30 10:26:09'),
(975, 'App\\Models\\User', 119, 'API Token', '2638112eac432e3c4de7f80f893a93a305f3eefebf842aaff928297c49e10731', '[\"*\"]', NULL, NULL, '2024-05-30 10:43:36', '2024-05-30 10:43:36'),
(976, 'App\\Models\\User', 119, 'API Token', 'cae680747ee54fed2ddf0f3d151c29052bdcb2a9b03da421d058c6885a06f6a6', '[\"*\"]', NULL, NULL, '2024-05-30 10:50:28', '2024-05-30 10:50:28'),
(977, 'App\\Models\\User', 119, 'API Token', 'f909c6fc8b53a9b0a9b1db5ad193a770350f2f30d12d425845a67503f7dab7ef', '[\"*\"]', NULL, NULL, '2024-05-30 10:56:48', '2024-05-30 10:56:48'),
(978, 'App\\Models\\User', 119, 'API Token', '88bcc220314bec0e33751efe46f3047da0bc92a384fb1641cb5cf6f8636bcf2e', '[\"*\"]', NULL, NULL, '2024-05-30 10:58:53', '2024-05-30 10:58:53'),
(979, 'App\\Models\\User', 119, 'API Token', '0d10ecda0d35a6f92ce1c1ebfd3e8067e3cb63f6e9e80951c93d503d8d32a8c1', '[\"*\"]', NULL, NULL, '2024-05-30 10:58:56', '2024-05-30 10:58:56'),
(980, 'App\\Models\\User', 119, 'API Token', 'f4883819a8de4f5f316998ab79f916aa787afb13cc82845f39338b66b1459ec7', '[\"*\"]', NULL, NULL, '2024-05-30 10:59:01', '2024-05-30 10:59:01'),
(981, 'App\\Models\\User', 119, 'API Token', 'b53278f6e0c451fdd3f5e1226e2255bccbf0fd5f9a93572b6b7bfd03cd716268', '[\"*\"]', NULL, NULL, '2024-05-30 11:25:35', '2024-05-30 11:25:35'),
(982, 'App\\Models\\User', 119, 'API Token', '863d04af50602967a41d061641874f22b87bc84075f2c86b67e415eabbe90bf1', '[\"*\"]', NULL, NULL, '2024-05-30 11:35:04', '2024-05-30 11:35:04'),
(983, 'App\\Models\\User', 119, 'API Token', 'b62a5d6da0a5ec11fe05281be206ba9f63c65dbccde1b573544776026d077966', '[\"*\"]', NULL, NULL, '2024-05-30 11:58:54', '2024-05-30 11:58:54'),
(984, 'App\\Models\\User', 119, 'API Token', '467989554dcc26fb50d77f0072484155e1cdf667ab0577bfe4de0451378f3099', '[\"*\"]', NULL, NULL, '2024-05-30 11:58:58', '2024-05-30 11:58:58'),
(985, 'App\\Models\\User', 119, 'API Token', 'add9371beeb64c712c98a5fc69d74e6c3964145dbfb32a2c987bd172c351bd43', '[\"*\"]', NULL, NULL, '2024-05-30 12:20:33', '2024-05-30 12:20:33'),
(986, 'App\\Models\\User', 119, 'API Token', 'bc36d5d5b8ce7e759979a722b49dd2f1f9b8bae805b788ef5e0125de3c63e965', '[\"*\"]', NULL, NULL, '2024-05-30 12:34:08', '2024-05-30 12:34:08'),
(987, 'App\\Models\\User', 119, 'API Token', '9a2803bc663de2603f3fe26c7991569c0620d945ce7d0a5d0b2d74f51e6daf6e', '[\"*\"]', NULL, NULL, '2024-05-30 12:35:56', '2024-05-30 12:35:56'),
(988, 'App\\Models\\User', 117, 'API Token', '6afc92cbff96eb42be510b5d39f5a0d9131d090b6e9f558164f2d874b8563c56', '[\"*\"]', NULL, NULL, '2024-05-30 12:55:53', '2024-05-30 12:55:53'),
(989, 'App\\Models\\User', 117, 'API Token', '49a36061e60a2cc4a64fb64334227f2aa6f5f7f2bc1dc9f7e4264fd012d57a36', '[\"*\"]', NULL, NULL, '2024-05-30 12:55:55', '2024-05-30 12:55:55');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(990, 'App\\Models\\User', 117, 'API Token', 'cceeaded4d100bc8cc9ddcc573175e73b6648ad55c17c4cc30bd07c330cde3dc', '[\"*\"]', NULL, NULL, '2024-05-30 13:02:23', '2024-05-30 13:02:23'),
(991, 'App\\Models\\User', 117, 'API Token', '28a0eea41260a603c8121c8988ca7f2b3cc5fc307f13c8fc2d83420584a794aa', '[\"*\"]', NULL, NULL, '2024-05-30 13:22:27', '2024-05-30 13:22:27'),
(992, 'App\\Models\\User', 99, 'API Token', 'e4789bd497ac40495c46fa7131467d31624fd19988cde767f7d8e4c6e7b391df', '[\"*\"]', '2024-05-31 04:31:53', NULL, '2024-05-31 04:31:47', '2024-05-31 04:31:53'),
(996, 'App\\Models\\User', 117, 'API Token', '5d48bacfb1937fd9f8269d6e362b749d4bd2fdcf621b6f35dabef8f8ccbf29c0', '[\"*\"]', NULL, NULL, '2024-05-31 07:02:10', '2024-05-31 07:02:10'),
(997, 'App\\Models\\User', 117, 'API Token', '7f689488cc4e17ecdb94b12431e32ceaeab946ad0238628b9f37d785a2ff2fa5', '[\"*\"]', NULL, NULL, '2024-05-31 07:28:14', '2024-05-31 07:28:14'),
(1000, 'App\\Models\\User', 117, 'API Token', 'b01e9093685c402930646005f6e98881dbb68573f91444f5ee144ea3adbad234', '[\"*\"]', NULL, NULL, '2024-05-31 08:38:26', '2024-05-31 08:38:26'),
(1001, 'App\\Models\\User', 117, 'API Token', '5f245c38bc5a358252e4b312b99cd07677dfdecf0ecbcb2ffb33be16da15910e', '[\"*\"]', NULL, NULL, '2024-05-31 12:25:48', '2024-05-31 12:25:48'),
(1002, 'App\\Models\\User', 119, 'API Token', '25034ebf20f93686577ee6cbde52c7b8180f8d29b4fd87ab7fa10fae0962c0cc', '[\"*\"]', NULL, NULL, '2024-05-31 12:32:23', '2024-05-31 12:32:23'),
(1003, 'App\\Models\\User', 117, 'API Token', 'f4a6421358da54c808cc90f5d04a8187ac1e866b890f6bf80e79af32b22cd07a', '[\"*\"]', NULL, NULL, '2024-05-31 12:50:38', '2024-05-31 12:50:38'),
(1004, 'App\\Models\\User', 117, 'API Token', 'db95e9ac38db9321e42aecb170400321d4902b09774bd5d85bc391bec0504117', '[\"*\"]', NULL, NULL, '2024-05-31 12:53:55', '2024-05-31 12:53:55'),
(1005, 'App\\Models\\User', 117, 'API Token', '526e2f71f7837db234e547ae1da5421eb4be6a0a3b194f3ea8e177b1dcac81a6', '[\"*\"]', '2024-06-17 10:43:58', NULL, '2024-05-31 13:26:57', '2024-06-17 10:43:58'),
(1008, 'App\\Models\\User', 105, 'API Token', '1a8ebf74b65cdcd46ab5eefb5d17dcb75b5f910972ca481ac124b86872fe1a38', '[\"*\"]', NULL, NULL, '2024-06-06 15:14:18', '2024-06-06 15:14:18'),
(1010, 'App\\Models\\User', 99, 'API Token', '2e5f45e8e4650c56dbaf9d3728b201f0d88a35bf8084251e52ea7bb128fad039', '[\"*\"]', '2024-06-07 04:01:23', NULL, '2024-06-07 04:01:21', '2024-06-07 04:01:23'),
(1029, 'App\\Models\\User', 124, 'myToken', '0d072f916b90b9162b54fd67249eb3bb25e21f1a0bd74455a48f169705b91dc6', '[\"*\"]', NULL, NULL, '2024-06-14 18:54:25', '2024-06-14 18:54:25'),
(1030, 'App\\Models\\User', 124, 'API Token', 'c074dc1d8a54c99c48e91d03ba5714e2b1e2b67488bbf4c1fd5856a6fec8deaf', '[\"*\"]', '2024-06-14 18:54:51', NULL, '2024-06-14 18:54:36', '2024-06-14 18:54:51'),
(1031, 'App\\Models\\User', 125, 'myToken', '0bc722c31c25ea574e61e0adf10e90a9ead9720d4f048d689dbdc6f233d4e012', '[\"*\"]', NULL, NULL, '2024-06-16 12:37:24', '2024-06-16 12:37:24'),
(1032, 'App\\Models\\User', 125, 'API Token', '1390eaaea3bd7736f6ee9de0e3d80469dc56dfd79de5a54c233ade91321720ee', '[\"*\"]', '2024-06-16 12:44:56', NULL, '2024-06-16 12:37:54', '2024-06-16 12:44:56'),
(1037, 'App\\Models\\User', 119, 'API Token', '5c6f4c47dc36341c8e72532e700c23d8fb1d97b86534e7259f14d5438a741f15', '[\"*\"]', '2024-06-17 10:49:32', NULL, '2024-06-17 10:49:30', '2024-06-17 10:49:32'),
(1038, 'App\\Models\\User', 118, 'API Token', '429f4a51165b4f923656ee4b1be8b76df7fb7873f8c5a90591f95567e16a514c', '[\"*\"]', '2024-06-17 11:32:31', NULL, '2024-06-17 10:50:20', '2024-06-17 11:32:31'),
(1040, 'App\\Models\\User', 118, 'API Token', '7f496b1ed62668caf797c7a123639d1c1721f842ea7b589137b6eb843a3fbb92', '[\"*\"]', NULL, NULL, '2024-06-17 11:38:28', '2024-06-17 11:38:28'),
(1041, 'App\\Models\\User', 118, 'API Token', 'd7c46de4b8c4474e1fc9d672afcf3143abfb4ce27841ba34bc1108317fb66581', '[\"*\"]', '2024-06-17 11:40:17', NULL, '2024-06-17 11:39:14', '2024-06-17 11:40:17'),
(1042, 'App\\Models\\User', 118, 'API Token', '3dabefe32e1d9d2a72a9a959ceb9f4eb2c7ae750ef1a2d18dc71777aa669a3c8', '[\"*\"]', '2024-06-17 11:46:22', NULL, '2024-06-17 11:46:20', '2024-06-17 11:46:22'),
(1043, 'App\\Models\\User', 118, 'API Token', 'c607db8c2a2bd86a94c420ef61b2a1c857d84e2416f68caa31255bff5e5361f9', '[\"*\"]', '2024-06-17 17:25:38', NULL, '2024-06-17 12:10:15', '2024-06-17 17:25:38'),
(1045, 'App\\Models\\User', 118, 'API Token', '31ad51791186ad73d60733f893842b6e7d72e3bdab2cfeacc9fcf1b3e483d99f', '[\"*\"]', '2024-06-17 12:13:17', NULL, '2024-06-17 12:11:35', '2024-06-17 12:13:17'),
(1046, 'App\\Models\\User', 118, 'API Token', '1f14e31367ec38d79ee39bd41802ff4023aa9ba789b2c63601c74e8e664ae65b', '[\"*\"]', '2024-06-17 12:31:26', NULL, '2024-06-17 12:21:01', '2024-06-17 12:31:26'),
(1047, 'App\\Models\\User', 117, 'API Token', '53858b8be9605ccf088eeabc4658bca53a20e0605a52e9cb7ba3cf7d5658d2bf', '[\"*\"]', '2024-06-17 17:26:59', NULL, '2024-06-17 17:26:47', '2024-06-17 17:26:59'),
(1048, 'App\\Models\\User', 119, 'API Token', 'dba781e326ae77c7c9ef5b40103fc59b96e82c77fae576e30214ecab7954bef3', '[\"*\"]', NULL, NULL, '2024-06-17 17:27:19', '2024-06-17 17:27:19'),
(1049, 'App\\Models\\User', 119, 'API Token', '1f458e6216971a687721f77e74b25ae8bfc36df3c595a78c3ae14994259d6251', '[\"*\"]', '2024-06-17 18:01:34', NULL, '2024-06-17 17:27:19', '2024-06-17 18:01:34'),
(1050, 'App\\Models\\User', 93, 'API Token', '1f640d05c8a3856b1c0621372e1aad575d7c409fa8ce3338ae5c15da863b0bb7', '[\"*\"]', '2024-06-17 17:43:40', NULL, '2024-06-17 17:27:59', '2024-06-17 17:43:40'),
(1051, 'App\\Models\\User', 117, 'API Token', '44c0664d5c9aab14fa19b39f658945659400808ea99e95b1b70373d6d36dd834', '[\"*\"]', '2024-06-17 18:26:43', NULL, '2024-06-17 18:24:55', '2024-06-17 18:26:43'),
(1052, 'App\\Models\\User', 93, 'API Token', 'c7891781140e733d60f8a60df1a182855ef9ab20be9d764e0325c8fe83ebade4', '[\"*\"]', '2024-06-17 18:31:57', NULL, '2024-06-17 18:29:41', '2024-06-17 18:31:57'),
(1053, 'App\\Models\\User', 126, 'myToken', 'dd74ea8731850d5bed7907ee5f426bf09f6654ca8aa544f643a2f1ec145f4cde', '[\"*\"]', NULL, NULL, '2024-06-17 18:29:51', '2024-06-17 18:29:51'),
(1054, 'App\\Models\\User', 126, 'API Token', '86f46447d2e7fd2dfbdb30203cfb830eba42ed8216a65e9cc5bf5a473f179c86', '[\"*\"]', '2024-06-17 18:45:16', NULL, '2024-06-17 18:34:39', '2024-06-17 18:45:16'),
(1055, 'App\\Models\\User', 126, 'API Token', '60de1656c64ca4203592558f0b423aba9512d286d6236f52c6ba4382e3d11f42', '[\"*\"]', '2024-06-17 19:00:41', NULL, '2024-06-17 18:50:12', '2024-06-17 19:00:41'),
(1056, 'App\\Models\\User', 126, 'API Token', '2d60b19c5240c64e58dd361ce50e45588618b2a2b13f9aa706de06e1570a9c44', '[\"*\"]', '2024-06-17 19:06:04', NULL, '2024-06-17 19:01:13', '2024-06-17 19:06:04'),
(1057, 'App\\Models\\User', 126, 'API Token', '8cc08c38d899047a3ebc59eed85a76901e8656d6ecf002fa4a6cdd1c2177d124', '[\"*\"]', '2024-06-18 12:40:39', NULL, '2024-06-18 10:57:15', '2024-06-18 12:40:39'),
(1058, 'App\\Models\\User', 118, 'API Token', '1603f748f8088c05cc1171c591f1ce077589e3120420745b35e1e054c211fb99', '[\"*\"]', '2024-06-18 12:42:43', NULL, '2024-06-18 12:25:12', '2024-06-18 12:42:43'),
(1059, 'App\\Models\\User', 118, 'API Token', '2bf98e6ad0ccf52e5fbc57d45f2b29375866c88f1e85d4207c8b0823b0b29729', '[\"*\"]', '2024-06-18 12:43:32', NULL, '2024-06-18 12:43:16', '2024-06-18 12:43:32'),
(1060, 'App\\Models\\User', 126, 'API Token', '456dbc29ca819e21ed9a303765a188a733f55389dcbda5ce665d11ca174d73fe', '[\"*\"]', '2024-06-18 12:54:09', NULL, '2024-06-18 12:45:09', '2024-06-18 12:54:09'),
(1061, 'App\\Models\\User', 126, 'API Token', 'ba5eaef635bc38de61d112b8c6121efc38293d9267f123280c0e6a4cae985ce6', '[\"*\"]', '2024-06-18 15:17:45', NULL, '2024-06-18 12:54:54', '2024-06-18 15:17:45'),
(1062, 'App\\Models\\User', 118, 'API Token', '4615a845706e7b1588b6ad7cee46b6c06212b9367dfaa969f9d14be10a20d31f', '[\"*\"]', '2024-06-18 12:56:14', NULL, '2024-06-18 12:55:59', '2024-06-18 12:56:14'),
(1063, 'App\\Models\\User', 118, 'API Token', '6d4881af0517a57bea9f125d0bdd07a9a61f50516133111571fd31b3a36f846d', '[\"*\"]', NULL, NULL, '2024-06-18 12:58:29', '2024-06-18 12:58:29'),
(1064, 'App\\Models\\User', 118, 'API Token', '568a29edea4413fe23b5719d094de9ad9b8f0fbd6e137916a1f080f5bfd54ebf', '[\"*\"]', '2024-06-18 13:00:37', NULL, '2024-06-18 12:59:32', '2024-06-18 13:00:37'),
(1065, 'App\\Models\\User', 126, 'API Token', '767ad812ca07da3fcf49ff60431d82891edc95107c28f7bdb246edd51a7f5a10', '[\"*\"]', '2024-06-18 15:11:56', NULL, '2024-06-18 15:10:55', '2024-06-18 15:11:56'),
(1066, 'App\\Models\\User', 126, 'API Token', '594532897643d797e9067f1b57e87e05d62a0f2179748fd5fa364babeaca1025', '[\"*\"]', '2024-06-18 15:54:36', NULL, '2024-06-18 15:31:52', '2024-06-18 15:54:36'),
(1067, 'App\\Models\\User', 126, 'API Token', '121dce528b2822707bc3513b098ae82fe4f8c04bad19a295f6a8be189154db78', '[\"*\"]', '2024-06-18 16:12:15', NULL, '2024-06-18 16:12:11', '2024-06-18 16:12:15'),
(1068, 'App\\Models\\User', 126, 'API Token', '96ffe6a1e6b1f45d9a8570a574112eb75d350dd66efa6a8db3bc2e30d2d8852c', '[\"*\"]', '2024-06-18 16:39:53', NULL, '2024-06-18 16:39:52', '2024-06-18 16:39:53'),
(1069, 'App\\Models\\User', 126, 'API Token', '7e6e125b29583b1b4c9941c78f23b57c5885ecf437a04cb35f09fe5de9137a0f', '[\"*\"]', '2024-06-18 17:18:06', NULL, '2024-06-18 17:17:24', '2024-06-18 17:18:06'),
(1070, 'App\\Models\\User', 126, 'API Token', '5e56819438a5e8899408495c14f2ddbc0a3fd0b8426d579daa015a0452b33efd', '[\"*\"]', '2024-06-18 17:42:45', NULL, '2024-06-18 17:39:52', '2024-06-18 17:42:45'),
(1071, 'App\\Models\\User', 126, 'API Token', 'dd2701e1d44dd7ff8eebfe74954d7a34e0522ae0e671bf4d10b95dffcc578535', '[\"*\"]', '2024-06-18 18:55:30', NULL, '2024-06-18 17:46:59', '2024-06-18 18:55:30'),
(1072, 'App\\Models\\User', 126, 'API Token', '5bb719815a65fbb91fca868a6ad849e1fd144062c0d7a1c0a6eb3b4a3c4a994c', '[\"*\"]', '2024-06-18 18:41:43', NULL, '2024-06-18 18:40:23', '2024-06-18 18:41:43'),
(1073, 'App\\Models\\User', 118, 'API Token', 'b5917f899bc8a4a2f0767d8c6d36196ca59402137b0a1bbc718040912650951f', '[\"*\"]', NULL, NULL, '2024-06-18 18:54:02', '2024-06-18 18:54:02'),
(1074, 'App\\Models\\User', 126, 'API Token', '0dee0c185c2bdec1f7966f57a61de7b7cfc6e04a4169f84561babfd87e871328', '[\"*\"]', NULL, NULL, '2024-06-18 18:54:20', '2024-06-18 18:54:20'),
(1075, 'App\\Models\\User', 93, 'API Token', '234e08e22fe608fbb0dd8b26e6e4c05dd81988bfcb8ee798052d354d0d5ead11', '[\"*\"]', '2024-06-18 18:57:39', NULL, '2024-06-18 18:54:51', '2024-06-18 18:57:39'),
(1076, 'App\\Models\\User', 126, 'API Token', '7529920866b03d9a5541d04992cd2e2bffce24de2bb55956cfa8afde8bdac494', '[\"*\"]', '2024-06-18 19:02:26', NULL, '2024-06-18 19:01:39', '2024-06-18 19:02:26'),
(1077, 'App\\Models\\User', 126, 'API Token', '8c7be7c4c417e990f85281f243721918b9f0c55807d47c347ef3c4a69b4992e4', '[\"*\"]', '2024-06-18 20:32:21', NULL, '2024-06-18 20:32:18', '2024-06-18 20:32:21'),
(1078, 'App\\Models\\User', 126, 'API Token', '7143b6b961c2123fc84600560fdac642f6196e8ec578089069497338716f68c1', '[\"*\"]', '2024-06-19 11:58:33', NULL, '2024-06-19 11:08:42', '2024-06-19 11:58:33'),
(1079, 'App\\Models\\User', 126, 'API Token', '80bbc1df721d9f550b8461380882e67786f9081943fdd7bcb18cd626630f5243', '[\"*\"]', '2024-06-19 12:04:23', NULL, '2024-06-19 11:23:53', '2024-06-19 12:04:23'),
(1080, 'App\\Models\\User', 126, 'API Token', '05f621b8ea275a33e2cd2bfb2e7d49798c96cbdfa299b5dd7cb4281447b8c338', '[\"*\"]', '2024-06-19 11:52:42', NULL, '2024-06-19 11:52:40', '2024-06-19 11:52:42'),
(1081, 'App\\Models\\User', 126, 'API Token', 'e5db75d4bfb228868d700f70b60fbb1186e2db5d4a18dc4be657a461fb7e7d7e', '[\"*\"]', '2024-06-19 12:03:27', NULL, '2024-06-19 12:03:26', '2024-06-19 12:03:27'),
(1082, 'App\\Models\\User', 126, 'API Token', '8b6b877248dd211a230ccc688600f54aaa0eae6f84f776659526fdaded92b6d2', '[\"*\"]', '2024-06-19 18:27:16', NULL, '2024-06-19 12:06:22', '2024-06-19 18:27:16'),
(1083, 'App\\Models\\User', 126, 'API Token', 'a85dcae0bb62413e2f5c70f6609ef5b3394e6d0075b5b2500de1f09287b17e95', '[\"*\"]', '2024-06-19 18:28:17', NULL, '2024-06-19 18:28:02', '2024-06-19 18:28:17'),
(1084, 'App\\Models\\User', 126, 'API Token', '9830190c73edf890f078994bc1d5e4730115021414fa0338f28638c296952de5', '[\"*\"]', '2024-06-20 15:22:14', NULL, '2024-06-20 15:22:13', '2024-06-20 15:22:14'),
(1085, 'App\\Models\\User', 126, 'API Token', '4b545dce96b7019da6ac0c09ade4b0d96c5cbca7e054c9d6b0e8c94a007a5492', '[\"*\"]', '2024-06-20 15:24:26', NULL, '2024-06-20 15:24:25', '2024-06-20 15:24:26'),
(1086, 'App\\Models\\User', 126, 'API Token', '905b76f740488ffdfa63b52f7a1c6e23aa26b2a5540538c877ef095f84fd43d4', '[\"*\"]', '2024-06-20 15:57:36', NULL, '2024-06-20 15:44:14', '2024-06-20 15:57:36'),
(1087, 'App\\Models\\User', 126, 'API Token', '7811560157c6299e62ba25b02f3d2de31291fea87940ea63f61eceb55f4589ab', '[\"*\"]', '2024-06-20 15:58:52', NULL, '2024-06-20 15:58:50', '2024-06-20 15:58:52'),
(1088, 'App\\Models\\User', 126, 'API Token', 'c90df379eb62c1ef5456ebd0a96d85438d50473a0b839151c6ea893d84b77e75', '[\"*\"]', '2024-06-20 16:03:15', NULL, '2024-06-20 16:03:13', '2024-06-20 16:03:15'),
(1089, 'App\\Models\\User', 126, 'API Token', '8e4ed70d3b662cf077f17aadf2f3dbebf02313d3f40835ae50546bb498062858', '[\"*\"]', '2024-06-20 16:46:34', NULL, '2024-06-20 16:21:52', '2024-06-20 16:46:34'),
(1090, 'App\\Models\\User', 126, 'API Token', 'c63ac262c1cdd67f213c02c3689b04e7f49bdc0d7c882da53f522684bcaeeff1', '[\"*\"]', '2024-06-20 16:52:53', NULL, '2024-06-20 16:48:34', '2024-06-20 16:52:53'),
(1091, 'App\\Models\\User', 126, 'API Token', '540297456c34b0b129108aa325c1fd2c089cb2e553cad57d873124cc2193c8d7', '[\"*\"]', '2024-06-20 16:57:16', NULL, '2024-06-20 16:57:15', '2024-06-20 16:57:16'),
(1092, 'App\\Models\\User', 93, 'API Token', '3448cfc2bd33573449fe6342527078f0fe9c1e4df04d5c5f99d8b3c3362e5424', '[\"*\"]', '2024-06-20 16:58:43', NULL, '2024-06-20 16:58:40', '2024-06-20 16:58:43'),
(1093, 'App\\Models\\User', 93, 'API Token', '95d9df372b1f18410cf58e07780dbebf1be9c65949034b3cb87409fa504dea05', '[\"*\"]', '2024-06-20 16:59:31', NULL, '2024-06-20 16:59:30', '2024-06-20 16:59:31'),
(1094, 'App\\Models\\User', 127, 'myToken', '6b04d5b6a92ac72c155c88acd49ec6c48617545d8939449a842d8633291e0cf4', '[\"*\"]', NULL, NULL, '2024-06-21 10:04:58', '2024-06-21 10:04:58'),
(1095, 'App\\Models\\User', 127, 'API Token', 'dc8a586010d61ccfe0c60c09e28a1fc4a89af8353a49697e6f6c685a051643aa', '[\"*\"]', NULL, NULL, '2024-06-21 10:08:11', '2024-06-21 10:08:11'),
(1096, 'App\\Models\\User', 126, 'API Token', '4a284fe458ba0344b188ba087b0284dbeb8eadcfacf6b489af84965c0e12c2a7', '[\"*\"]', NULL, NULL, '2024-06-21 12:39:17', '2024-06-21 12:39:17'),
(1097, 'App\\Models\\User', 126, 'API Token', '773eda471bfc9bd265924e016da107db12d0305467b085ab573d618145409d62', '[\"*\"]', NULL, NULL, '2024-06-21 12:42:48', '2024-06-21 12:42:48'),
(1098, 'App\\Models\\User', 126, 'API Token', '384eb35dfcf1a5eed62bed3f7cdb1789bb827e45782a6d0fe81a5fcaed3da339', '[\"*\"]', NULL, NULL, '2024-06-21 12:47:48', '2024-06-21 12:47:48'),
(1099, 'App\\Models\\User', 117, 'API Token', '8b4ef0c7309447049d44ce75f7d109b45acd08739cd2a21c88dbaee5c263ecff', '[\"*\"]', NULL, NULL, '2024-06-21 12:48:04', '2024-06-21 12:48:04'),
(1100, 'App\\Models\\User', 126, 'API Token', '6538a4ebfffaadb18b6885838e9276438072a63f0e8c59f4bd649f2684aa4010', '[\"*\"]', NULL, NULL, '2024-06-21 12:49:10', '2024-06-21 12:49:10'),
(1101, 'App\\Models\\User', 118, 'API Token', '36f61bc01304d0d099d83c345974de82daa990fcf329140792e9bf65ed95e4f4', '[\"*\"]', NULL, NULL, '2024-06-21 12:59:29', '2024-06-21 12:59:29'),
(1102, 'App\\Models\\User', 118, 'API Token', 'b9ca3bebcc19b2ad611600361d71217f597943bd909a60b9a7bf2b9fd69dc1ca', '[\"*\"]', NULL, NULL, '2024-06-21 13:12:51', '2024-06-21 13:12:51'),
(1103, 'App\\Models\\User', 93, 'API Token', '24de0fdee75fbfc19901a023a979f55643aadcff132ee666872b841196903d46', '[\"*\"]', NULL, NULL, '2024-06-21 13:19:43', '2024-06-21 13:19:43'),
(1104, 'App\\Models\\User', 93, 'API Token', '571ba84c4b69ddbc1efe99622adf3a4e1a41e3fbfe4c8d5999dba4b1b8b97a17', '[\"*\"]', NULL, NULL, '2024-06-21 13:31:21', '2024-06-21 13:31:21'),
(1105, 'App\\Models\\User', 93, 'API Token', 'e6c73d2da57dea0f07cb7ff41d22a85a9d6aa9f2973b1a4319ec534d570272e3', '[\"*\"]', NULL, NULL, '2024-06-21 13:45:13', '2024-06-21 13:45:13');

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `pincode` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `pincode`, `created_at`, `updated_at`) VALUES
(1, 700001, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(2, 700002, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(3, 700003, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(4, 700004, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(5, 700005, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(6, 700006, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(7, 700007, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(8, 700008, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(9, 700009, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(10, 700010, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(11, 700009, '2023-08-28 12:25:53', '2023-08-28 12:28:40'),
(12, 700059, '2023-08-28 12:49:17', '2023-08-28 12:49:17'),
(13, 700150, '2023-08-31 12:52:24', '2024-05-23 11:06:50'),
(14, 700054, '2023-12-04 19:45:02', '2023-12-04 19:45:02'),
(15, 700067, '2023-12-04 19:45:41', '2023-12-04 19:45:41'),
(16, 700050, '2024-01-10 19:11:40', '2024-01-10 19:11:40'),
(17, 700036, '2024-04-23 10:34:59', '2024-04-23 10:34:59'),
(18, 700074, '2024-04-23 10:35:14', '2024-04-23 10:35:14'),
(19, 700020, '2024-04-24 11:14:34', '2024-04-24 11:14:34'),
(20, 700071, '2024-04-24 11:14:46', '2024-04-24 11:14:46'),
(21, 700016, '2024-04-24 11:14:56', '2024-04-24 11:14:56'),
(22, 700058, '2024-05-07 10:50:57', '2024-05-07 10:50:57'),
(23, 700056, '2024-05-07 10:51:10', '2024-05-07 10:51:10'),
(24, 700108, '2024-05-07 10:51:24', '2024-05-07 10:51:24'),
(25, 700109, '2024-05-07 10:51:38', '2024-05-07 10:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `pincode_user`
--

CREATE TABLE `pincode_user` (
  `id` int(11) NOT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pincode_user`
--

INSERT INTO `pincode_user` (`id`, `pincode_id`, `user_id`, `created_at`, `updated_at`) VALUES
(37, 12, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(48, 14, 59, '2024-02-16 05:16:25', '2024-02-16 05:16:25'),
(51, 14, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(52, 6, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(53, 5, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(54, 4, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(55, 3, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(56, 2, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(57, 1, 77, '2024-03-20 13:22:03', '2024-03-20 13:22:03'),
(60, 16, 59, '2024-03-21 11:26:30', '2024-03-21 11:26:30'),
(61, 10, 78, '2024-03-21 12:48:42', '2024-03-21 12:48:42'),
(62, 16, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(63, 2, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(64, 18, 93, '2024-04-23 10:37:08', '2024-04-23 10:37:08'),
(65, 17, 93, '2024-04-23 10:37:08', '2024-04-23 10:37:08'),
(66, 16, 94, '2024-04-23 10:49:47', '2024-04-23 10:49:47'),
(67, 14, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(68, 21, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(69, 20, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(70, 19, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(71, 25, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(72, 24, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(73, 23, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(74, 22, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'BUSINESS_USER'),
(3, 'PROVIDER'),
(4, 'WASHERMAN');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) NOT NULL,
  `price` double DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(2083) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `price`, `category_id`, `name`, `description`, `img`, `created_at`, `updated_at`) VALUES
(1, 300, 1, 'Sedan / Muv cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice3.png?alt=media&token=7495e65a-789e-49c5-9e9d-cc65369215ec', '2023-08-09 07:21:31', '2024-02-07 07:05:25'),
(2, 350, 1, 'SUV / Premium Category', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2023-08-09 07:21:31', '2024-02-07 07:05:10'),
(3, 250, 1, 'Hachback Cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice3.png?alt=media&token=7495e65a-789e-49c5-9e9d-cc65369215ec', '2023-08-09 07:21:31', '2024-02-07 07:04:47'),
(4, 400, 1, 'Luxury Cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2024-02-07 12:33:27', '2024-02-07 12:33:27'),
(5, 250, 2, 'Hachback Cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice3.png?alt=media&token=7495e65a-789e-49c5-9e9d-cc65369215ec', '2024-02-07 07:08:44', '2024-02-07 07:08:44'),
(6, 300, 2, 'Sedan / Muv cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice3.png?alt=media&token=7495e65a-789e-49c5-9e9d-cc65369215ec', '2024-02-07 07:09:44', '2024-02-07 07:09:44'),
(7, 350, 2, 'SUV / Premium Category', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2024-02-07 07:10:37', '2024-02-07 07:10:37'),
(8, 400, 2, 'Luxury Cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2024-02-07 07:11:38', '2024-02-07 07:11:38'),
(9, 500, 3, 'Hachback Cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice3.png?alt=media&token=7495e65a-789e-49c5-9e9d-cc65369215ec', '2024-02-07 07:14:56', '2024-02-07 07:14:56'),
(10, 600, 3, 'Sedan / Muv cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice3.png?alt=media&token=7495e65a-789e-49c5-9e9d-cc65369215ec', '2024-02-07 07:14:56', '2024-02-07 07:14:56'),
(11, 700, 3, 'SUV / Premium Category', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2024-02-07 07:14:56', '2024-02-07 07:14:56'),
(12, 800, 3, 'Luxury Cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2024-02-07 07:14:56', '2024-02-07 07:14:56'),
(13, 300, 5, 'Sedan / Muv cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice3.png?alt=media&token=7495e65a-789e-49c5-9e9d-cc65369215ec', '2024-02-08 04:42:45', '2024-02-08 04:42:45'),
(14, 350, 5, 'SUV / Premium Category', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2024-02-08 04:42:45', '2024-02-08 04:42:45'),
(15, 250, 5, 'Hachback Cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice3.png?alt=media&token=7495e65a-789e-49c5-9e9d-cc65369215ec', '2024-02-08 04:42:45', '2024-02-08 04:42:45'),
(16, 400, 5, 'Luxury Cars', NULL, 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2024-02-08 04:42:45', '2024-02-08 04:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `service_user`
--

CREATE TABLE `service_user` (
  `id` bigint(20) NOT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_user`
--

INSERT INTO `service_user` (`id`, `service_id`, `user_id`, `created_at`, `updated_at`) VALUES
(27, 4, 59, '2024-02-07 13:09:33', '2024-02-07 07:39:33'),
(36, 4, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(37, 9, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(38, 10, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(39, 11, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(40, 12, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(41, 8, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(42, 7, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(43, 6, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(44, 5, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(45, 1, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(46, 2, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(47, 3, 57, '2024-02-07 13:21:00', '2024-02-07 07:51:00'),
(48, 15, 77, '2024-03-20 13:18:45', '2024-03-20 13:18:45'),
(64, 13, 78, '2024-03-21 04:08:13', '2024-03-21 04:08:13'),
(65, 14, 78, '2024-03-21 04:08:13', '2024-03-21 04:08:13'),
(66, 15, 78, '2024-03-21 04:08:13', '2024-03-21 04:08:13'),
(67, 9, 78, '2024-03-21 04:08:13', '2024-03-21 04:08:13'),
(68, 10, 78, '2024-03-21 04:08:13', '2024-03-21 04:08:13'),
(69, 11, 78, '2024-03-21 04:08:13', '2024-03-21 04:08:13'),
(70, 13, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(71, 14, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(72, 15, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(73, 16, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(74, 9, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(75, 10, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(76, 11, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(77, 12, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(78, 8, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(79, 7, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(80, 6, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(81, 5, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(82, 1, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(83, 2, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(84, 3, 59, '2024-03-22 05:10:46', '2024-03-22 05:10:46'),
(85, 13, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(86, 14, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(87, 15, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(88, 16, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(89, 4, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(90, 9, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(91, 10, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(92, 11, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(93, 12, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(94, 8, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(95, 7, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(96, 6, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(97, 5, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(98, 1, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(99, 2, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(100, 3, 93, '2024-04-23 10:36:48', '2024-04-23 10:36:48'),
(101, 13, 94, '2024-04-23 10:49:47', '2024-04-23 10:49:47'),
(102, 14, 94, '2024-04-23 10:49:47', '2024-04-23 10:49:47'),
(103, 15, 94, '2024-04-23 10:49:47', '2024-04-23 10:49:47'),
(104, 16, 94, '2024-04-23 10:49:47', '2024-04-23 10:49:47'),
(105, 13, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(106, 14, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(107, 15, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(108, 16, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(109, 4, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(110, 9, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(111, 10, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(112, 11, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(113, 7, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(114, 6, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(115, 5, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(116, 1, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(117, 2, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(118, 3, 99, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(119, 13, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(120, 14, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(121, 15, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(122, 16, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(123, 4, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(124, 9, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(125, 10, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(126, 11, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(127, 12, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(128, 8, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(129, 7, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(130, 6, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(131, 5, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(132, 1, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(133, 2, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(134, 3, 100, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(135, 13, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(136, 14, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(137, 15, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(138, 16, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(139, 4, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(140, 9, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(141, 10, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(142, 11, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(143, 12, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(144, 8, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(145, 7, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(146, 6, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(147, 5, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(148, 1, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(149, 2, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(150, 3, 109, '2024-05-07 10:56:10', '2024-05-07 10:56:10'),
(151, 1, 115, '2024-05-29 10:04:31', '2024-05-29 10:04:31'),
(152, 3, 115, '2024-05-29 10:04:31', '2024-05-29 10:04:31'),
(153, 4, 115, '2024-05-29 10:04:31', '2024-05-29 10:04:31'),
(154, 6, 115, '2024-05-29 10:04:31', '2024-05-29 10:04:31'),
(155, 12, 115, '2024-05-29 10:04:31', '2024-05-29 10:04:31'),
(156, 1, 116, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(157, 3, 116, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(158, 4, 116, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(159, 6, 116, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(160, 12, 116, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(161, 1, 117, '2024-05-29 10:32:43', '2024-05-29 10:32:43'),
(162, 1, 118, '2024-05-29 10:33:58', '2024-05-29 10:33:58'),
(163, 1, 119, '2024-05-29 12:56:50', '2024-05-29 12:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `light_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(200) DEFAULT NULL,
  `footer_text` varchar(200) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_keyword` varchar(250) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_phone` char(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_name`, `site_logo`, `light_logo`, `favicon`, `copyright_text`, `footer_text`, `meta_title`, `meta_keyword`, `site_email`, `site_phone`, `created_at`, `updated_at`) VALUES
(1, 'Caremint', 'public/siteSetting/qyOcgvYJuu2htv3pKXt2bI2uGEBY7pajiUwl4wrC.webp', NULL, 'public/siteSetting/eXN5zTwp1ECyvxodW1WjeL6OZf56OHUykkpiFzvg.webp', 'vxcvxv', 'dfgdfgdfgdf', NULL, NULL, NULL, NULL, NULL, '2023-08-18 10:23:21');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `task_date` datetime DEFAULT NULL,
  `provider_id` bigint(20) DEFAULT NULL,
  `washer_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `image1` text DEFAULT NULL,
  `image2` text DEFAULT NULL,
  `image3` text DEFAULT NULL,
  `image4` text DEFAULT NULL,
  `image5` text DEFAULT NULL,
  `vehicle_brand` varchar(255) DEFAULT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(255) DEFAULT NULL,
  `status` enum('pending','in_progress','done') NOT NULL DEFAULT 'pending',
  `order_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `task_date`, `provider_id`, `washer_id`, `customer_id`, `image`, `image1`, `image2`, `image3`, `image4`, `image5`, `vehicle_brand`, `vehicle_model`, `vehicle_no`, `status`, `order_id`, `created_at`, `updated_at`) VALUES
(8, 'Car Wash', 'Dry Wash', NULL, 93, 116, 58, 'https://admindashboard.caremint.in/public/storage/task/WcCi6CJ6GraAPgjY4QFJ3N3Nsc7SkwoySYw2UbN3.jpg', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-05-31 07:35:20', '2024-05-31 07:35:20'),
(9, 'Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 118, 58, 'https://admindashboard.caremint.in/public/storage/taskImage/siroLNUIARl2PgY38M4QU9fbQEY2ffkXlgPdZjWj.png', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-12 11:14:51', '2024-06-17 10:33:31'),
(10, 'Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 118, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-12 15:07:05', '2024-06-12 15:07:05'),
(11, 'Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 118, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-12 15:11:44', '2024-06-18 13:00:37'),
(12, 'Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 118, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-12 15:12:02', '2024-06-12 15:12:02'),
(13, 'Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 118, 58, 'https://admindashboard.caremint.in/public/storage/taskImage/qiF0mHu0FU1QPf8839qAhkSgCmZxvDMMvP7VdvPc.jpg', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-12 15:12:18', '2024-06-17 15:11:14'),
(14, 'Car Wasgg', 'Dry Wash', '2024-07-01 00:00:00', 93, 118, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-12 15:18:34', '2024-06-17 12:42:18'),
(15, 'SUV', 'Good Car', '2024-06-12 00:00:00', 93, 118, 58, '', NULL, NULL, NULL, NULL, NULL, 'Goos', 'Dohhh', 'WB893939djdj', 'done', NULL, '2024-06-12 15:23:58', '2024-06-17 12:38:52'),
(16, 'dhdhhd', 'rhrhrhr', '2024-06-12 00:00:00', 93, 119, 58, 'https://admindashboard.caremint.in/public/storage/taskImage/ikP0V3ryjLCNQ6fmRIPVrlOeI8geYLrQ0J4gcMLb.jpg', NULL, NULL, NULL, NULL, NULL, 'rjrhrh', '374747', '7337733', 'done', NULL, '2024-06-12 16:08:15', '2024-06-17 17:47:28'),
(17, 'hrhrhrrh', 'urhrhrr', '2024-06-12 00:00:00', 93, 118, 58, '', NULL, NULL, NULL, NULL, NULL, 'rhrhrh', 'rhrhhrhr747447', '64644lllllll4848', 'done', NULL, '2024-06-12 16:08:36', '2024-06-17 12:21:45'),
(18, 'SUV', 'badjon', '2024-06-12 00:00:00', 93, 117, 58, 'https://admindashboard.caremint.in/public/storage/taskImage/cG8UnkaGX51qfhDIcE7tZbdnlmYlklBf7PaA8OCc.jpg', NULL, NULL, NULL, NULL, NULL, '1112D', '1121m', '73737337', 'done', NULL, '2024-06-12 16:10:16', '2024-06-17 18:26:07'),
(19, 'dhhddhh', 'fiduduud', '2024-06-12 00:00:00', 93, 123, 58, '', NULL, NULL, NULL, NULL, NULL, 'ydhddhyd', '373737', '37373', 'pending', NULL, '2024-06-12 16:14:19', '2024-06-12 16:14:19'),
(20, 'Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 119, 58, 'https://admindashboard.caremint.in/public/storage/taskImage/XCYEHXKVJTlWAnTwux2pHxNvvT8XmeceMNQzYe9f.jpg', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 17:28:21', '2024-06-17 17:35:53'),
(21, 'Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 119, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-17 17:43:40', '2024-06-17 17:43:40'),
(22, 'Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-17 18:30:19', '2024-06-17 18:30:19'),
(23, 'Test Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', 'public/storage/taskImage/G8tKxJa7AekG68URPZ1Fe5DjiQ5h8z5uWcMbw0SV.jpg', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:30:25', '2024-06-18 18:52:49'),
(24, 'Dry Car Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', 'public/storage/taskImage/6Tqj57RVCSz7Di3N8c3tdCcCTRTBxw1ngRnddVYa.jpg', 'public/storage/taskImage/ZNwPPPpnug8S7miQhHxYZXU9QEf1o7hyxPFcDARH.jpg', 'public/storage/taskImage/W9tkPDtPam3XZV7iuD7trW8Apsx1XlUX5HVUyJq4.jpg', 'public/storage/taskImage/nkgjqajwc3WheIplk8m5S3YDzeKotmr0KnkBNd0C.jpg', 'public/storage/taskImage/mXi51SPmFtirgvsqfSKE6f7hlUHRDsgGskR839r4.jpg', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:30:36', '2024-06-18 18:47:21'),
(25, 'ACar Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:30:56', '2024-06-18 18:41:43'),
(26, 'BCar Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:30:59', '2024-06-18 18:40:52'),
(27, 'CCar Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:05', '2024-06-18 18:31:42'),
(28, 'DCar Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:09', '2024-06-18 18:28:13'),
(29, 'ECar Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:14', '2024-06-18 18:21:36'),
(30, 'FCar Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:19', '2024-06-18 17:41:52'),
(31, 'GCar Wash', 'Dry Wash', '2024-12-12 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:34', '2024-06-18 15:11:40'),
(32, 'HCar Wash', 'Dry Wash', '2024-12-12 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:37', '2024-06-18 13:11:40'),
(33, 'HCar Wash', 'Dry Wash', '2024-12-01 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:40', '2024-06-18 13:00:55'),
(34, 'ICar Wash', 'Dry Wash', '2024-01-01 00:00:00', 93, 126, 58, 'https://admindashboard.caremint.in/public/storage/taskImage/PrC1dTdNnNLiBViN7WyXmtf5PDmeZncRhai955ov.jpg', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:51', '2024-06-18 12:14:10'),
(35, 'JCar Wash', 'Dry Wash', '2024-01-01 00:00:00', 93, 126, 58, 'https://admindashboard.caremint.in/public/storage/taskImage/sKDtwLPJBIdxHhl5xQEubljwqEf3jyiYboDASsWw.jpg', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-17 18:31:57', '2024-06-17 18:36:24'),
(36, 'Dry Wash', 'Dry Wash', '2024-07-01 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:55:11', '2024-06-18 18:55:11'),
(37, 'ACar Wash', 'Dry Wash', '2024-06-01 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:56:03', '2024-06-18 18:56:03'),
(38, 'BCar Wash', 'Dry Wash', '2024-06-02 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:56:12', '2024-06-18 18:56:12'),
(39, 'CCar Wash', 'Dry Wash', '2024-06-03 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:56:22', '2024-06-18 18:56:22'),
(40, 'DCar Wash', 'Dry Wash', '2024-06-04 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:56:31', '2024-06-18 18:56:31'),
(41, 'ECar Wash', 'Dry Wash', '2024-06-05 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:56:44', '2024-06-18 18:56:44'),
(42, 'FCar Wash', 'Dry Wash', '2024-06-06 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:56:58', '2024-06-18 18:56:58'),
(43, 'GCar Wash', 'Dry Wash', '2024-06-07 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:57:11', '2024-06-18 18:57:11'),
(44, 'HCar Wash', 'Dry Wash', '2024-06-08 00:00:00', 93, 126, 58, '', NULL, NULL, NULL, NULL, NULL, 'ABC', 'ABC', 'WB04A8890', 'pending', NULL, '2024-06-18 18:57:19', '2024-06-18 18:57:19'),
(45, 'ICar Wash', 'Dry Wash', '2024-06-09 00:00:00', 93, 126, 58, '', '', '', '', '', '', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-18 18:57:29', '2024-06-19 12:06:36'),
(46, 'JCar Wash', 'Dry Wash', '2024-06-10 00:00:00', 93, 126, 58, '', 'public/storage/taskImage/X4UZhJ56HgH4ObpX3XRpURq1eVo1oQS3lgSac5kA.png', 'public/storage/taskImage/3pUsscO3NqRFr5XlzRRUTDoXbHE4IrLxveNK3UZc.jpg', 'public/storage/taskImage/AF7ie8eFtezPxCyjy9jXtBgTOfbhBj8dBYredpap.jpg', 'public/storage/taskImage/4ozsvl2ft7m86Ir2GmtftbLT3ilrFwEHKz3KGMM9.jpg', 'public/storage/taskImage/efMoKqbrYHcU4NQ4lpaaROlEOFJZ9tYUOgeXVCRK.jpg', 'ABC', 'ABC', 'WB04A8890', 'done', NULL, '2024-06-18 18:57:39', '2024-06-18 19:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `des` varchar(225) DEFAULT NULL,
  `img` varchar(2083) DEFAULT NULL,
  `video` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `des`, `img`, `video`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Abhishek Jaiswal', '<p>New experience to clean my car without water. Very innovative product. Keep up the good work CAREMINT</p>', 'https://admindashboard.caremint.in/public/storage/testimonial/FewwPbxicJTKAH1a48CQRJU86AKbAvee0X1iJKzC.png', NULL, '2023-08-11 11:12:50', '2024-03-20 11:13:44'),
(2, 'Mr. Durgesh Sharda', '<p>I have taken interior and exterior waterless cleaning service from CAREMINT. Service was superb. I will surely recommend CAREMINT WATERLESS CAR CLEANING SERVICES</p>', 'https://admindashboard.caremint.in/public/storage/testimonial/78n5gc9WvOhKRbHdWyxF3QJp2lrVSaRYRQPlEfi5.png', NULL, '2023-08-11 11:14:06', '2024-03-20 11:12:46'),
(3, 'Mr. Abhishek Jaiswal', '<p>New experience to clean my car without water. Very innovative product. Keep up the good work CAREMINT</p>', 'https://admindashboard.caremint.in/public/storage/testimonial/1vvtIJM4SJBuYUuyFI7oOoVllMp94vMhp7KNd0Te.png', NULL, '2023-08-11 11:14:06', '2024-03-20 11:13:27'),
(6, 'Video Testimonial 1', '<p>lorem ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/C7NWmy91c8WzYwCVtgWk9wqSN0ybcfw9voZkaxHa.mp4', '2024-03-27 07:09:12', '2024-03-27 09:42:27'),
(8, 'Video Testimonial 2', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/q7D9a1LpqnpNv0XxYentJiOgaAHQYW8Y1gpDY1dY.mp4', '2024-03-27 08:57:13', '2024-03-27 08:57:13'),
(9, 'Video Testimonial 3', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/fxRhJKleBSqTbpAC1lPmIBIO8qvTU1jV40HEpYvn.mp4', '2024-03-27 09:42:06', '2024-03-27 09:42:06'),
(10, 'Video Testimonial 4', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/aqx9FdG1yoKvyeTPD3D7qsukz5OHQ6DbRUpbyx1E.mp4', '2024-03-27 09:43:24', '2024-03-27 09:43:24'),
(11, 'Video Testimonial 5', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/rpnv9hPRbz7BY8gQP01c0liCWfXBxgXVElK231AT.mp4', '2024-03-27 09:54:40', '2024-03-27 09:54:40'),
(12, 'Video Testimonial 6', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/XfY8tMZVt20av7k226LgnKUR7la0yZto66igwHi7.mp4', '2024-03-27 10:00:36', '2024-03-27 10:00:36'),
(13, 'Video Testimonial 7', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/IaQwqCuFoH9QKHbBEkgLTBcJCfGqTva1Z0MxCyes.mp4', '2024-03-27 10:01:40', '2024-03-27 10:01:40'),
(14, 'Video Testimonial 8', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/a3azcQiMe9eVCe0ZWZtCmHPryJjFqY36juOHrCBr.mp4', '2024-03-27 10:02:35', '2024-03-27 10:02:35'),
(15, 'Video Testimonial 9', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/6I7NqCVVD5rlQeNwEy1TJzVSXPTvlKF4U2qivGAP.mp4', '2024-03-27 10:07:13', '2024-03-27 10:07:13'),
(16, 'Video Testimonial 10', '<p>Lorem Ipsum</p>', NULL, 'https://admindashboard.caremint.in/public/storage/vdo_testimonial/QMIG9s7HAghbrN9ZHt6THQUIY6c0zvunXoH5F67z.mp4', '2024-03-27 10:09:16', '2024-03-27 10:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `timeslots`
--

CREATE TABLE `timeslots` (
  `id` bigint(20) NOT NULL,
  `slots` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `timeslots`
--

INSERT INTO `timeslots` (`id`, `slots`, `created_at`, `updated_at`) VALUES
(1, '8:00 - 9:00 AM', '2023-09-12 16:08:01', '2023-09-13 17:01:50'),
(2, '7:00 - 8:00 AM', '2023-09-12 06:39:39', '2024-03-27 09:51:41'),
(3, '6:00  - 7:00 AM', '2023-09-12 06:39:37', '2023-09-13 17:01:25'),
(4, '9:00 - 10:00 AM', '2023-09-12 19:16:52', '2023-09-13 17:02:02'),
(5, '10:00 - 11:00 AM', '2023-09-13 16:57:56', '2023-09-13 16:57:56'),
(6, '11:00 - 12:00 AM', '2023-09-13 17:03:38', '2023-09-13 17:03:38'),
(7, '12:00 - 1:00 PM', '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(8, '1:00 - 2:00 PM', '2023-09-13 17:04:14', '2023-09-13 17:04:14'),
(9, '2:00 - 3:00 PM', '2023-09-13 17:13:48', '2023-09-13 17:13:48'),
(10, '3:00 - 4:00 PM', '2023-09-13 17:14:04', '2023-09-13 17:14:04'),
(11, '4:00 - 5:00 PM', '2023-09-13 17:14:22', '2023-09-13 17:14:22'),
(12, '5:00 - 6:00 PM', '2023-09-13 17:14:38', '2023-09-13 17:14:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `user_login` varchar(60) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` text DEFAULT NULL,
  `user_registered` datetime NOT NULL DEFAULT current_timestamp(),
  `user_activation_key` varchar(255) DEFAULT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT 1,
  `display_name` varchar(250) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `provider_id` bigint(20) DEFAULT NULL,
  `user_firstname` varchar(75) DEFAULT NULL,
  `user_phonenumber` varchar(10) DEFAULT NULL,
  `user_pincode` int(11) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `user_isloggedin` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_login`, `photo`, `user_pass`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`, `role_id`, `provider_id`, `user_firstname`, `user_phonenumber`, `user_pincode`, `user_address`, `dob`, `user_isloggedin`, `created_at`, `updated_at`) VALUES
(50, NULL, NULL, '$2y$10$b5KVsFmAifaxl9q8Yq4O.OppuJk1frGZm.nWXLFqyh/u7N8MBDxvK', 'ik2713350@gmail.com', NULL, '2023-10-16 17:42:52', NULL, 1, NULL, 2, NULL, 'Ishant singh', '6290962220', 700003, '34B B.T road chiria more', '2025-02-12', NULL, '2023-10-16 23:12:52', '2023-10-16 23:12:52'),
(51, NULL, NULL, '$2y$10$/ev8M5SaLm./.Pgw4SLk/OYtT35q16et7LnqOKDiNr9ZTsTkw3Day', 'guptasubrato1966@gmail.com', NULL, '2023-10-22 04:04:24', NULL, 1, NULL, 2, NULL, 'Subrato Gupta', '9422293834', 700050, 'Flat No X-201,BINAYAK ENCLAVE KALICHARAN GHOSH ROAD', '1966-06-06', NULL, '2023-10-22 09:34:24', '2023-10-22 09:34:24'),
(56, 'Abhishek Singh', 'https://lh3.googleusercontent.com/a-/ALV-UjXTTr9wD3zoTKTxMgX8z9sLAmrlP1V1AoK67hjKnCjLpG0qyf1Y=w60-h60-p-rp-mo-br100', '$2y$10$.9YrGDqqdZt7H9t0FiGmJOOIVTZ1PpJSz846WvgzEK1RXPWAlEg.O', 'kamalladdi89@gmail.com', NULL, '2023-12-08 14:01:09', NULL, 1, NULL, 2, NULL, 'Kamaljeet Singh', '9903564293', 711302, 'Nahar singh dahba', '1999-05-03', NULL, '2023-12-08 19:31:09', '2024-04-15 10:31:56'),
(57, 'Rohit', NULL, '$2y$10$tZXiTgiiDVWlIWc.amA/Wupk7u4SZmroz5vuMr3r1Nw35rGlEXBQe', 'caremintservices@gmail.com', NULL, '2023-12-08 15:04:46', NULL, 1, NULL, 2, NULL, NULL, '9830814392', 700054, 'kankurgachi', NULL, NULL, '2023-12-08 20:34:46', '2024-04-23 10:22:05'),
(58, 'Priyanka Bakshi', 'https://lh3.googleusercontent.com/a-/ALV-UjXezusJzQmkB7OYD8ghmY7ep7Jz8MCAg99sG6Bt0MH3aFINga_kZg=w36-h36-p-rp-mo-br100', '$2y$10$UR8OH.z1NEmNkrLUQH3FlOwh.bN0252VNta0ktP1sX1PytT1aNE6W', 'sougata.chatterjee679@gmail.com', NULL, '2024-01-06 09:01:53', NULL, 1, NULL, 2, NULL, 'Jhilik Chatterjee', '8910550857', 700077, '70, Rabindranath Tagore Road, Bediapara, South Dum Dum, Kolkata-700077, near Med Plus Medical Shop', '1993-06-04', NULL, '2024-01-06 14:31:53', '2024-04-15 10:31:32'),
(59, 'RAJ BENCHMARK', NULL, '$2y$10$O1QvcBn89Hnwp3W.XCdope8jY4.OzkAs3QIqVRykk3EmXgzi5QgK6', 'manishsinghgandhi055@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d', '2024-01-10 13:45:33', NULL, 1, 'RAJ BENCHMARK', 2, NULL, 'Raj Gupta', '9831230163', 700050, 'South Sinthi Road', '1993-06-04', NULL, '2024-01-10 19:15:33', '2024-04-23 10:23:15'),
(60, 'Siddharth Biswas', 'https://lh3.googleusercontent.com/a-/ALV-UjUd2c1ZNTqlB2gHP2ScaptLX7Tdgn1izAjN6hBO0wSkOsIA-zM=w60-h60-p-rp-mo-br100', '$2y$10$NqfmFha0DUCrnkwJozB3EeTGB6NNX5HXcV4W2Dl3nuBBn2ppkTmKC', 'kaursangita980@gmail.com', NULL, '2024-01-10 13:53:58', NULL, 1, NULL, 2, NULL, 'Sangita Kaur', '9674962816', 700050, 'Binayak Enclave Block 2 flat 306', '1965-02-11', NULL, '2024-01-10 19:23:58', '2024-04-15 11:43:01'),
(62, 'Nitesh Sharma', NULL, '$2y$10$uiF8BZh8U0hVmmds5SDDPuON3yWXM/skiOot9qobSQdOlxq54E7tm', 'rajradio.kol@gmail.com', NULL, '2024-01-12 06:17:47', NULL, 1, NULL, 2, NULL, 'Vijay Rajak', '9903138603', 700050, '59 Kali Charan Ghosh Road', '2024-12-01', NULL, '2024-01-12 11:47:47', '2024-04-18 04:45:55'),
(63, 'Jayeeta Biswas', NULL, '$2y$10$AyIxqooYgX5MeF0ZZF8vWeEyAANTXWbOvY.z40jUjqvmN3ZwH4u96', 'apsamaddar@gmail.com', NULL, '2024-01-12 10:56:16', NULL, 1, NULL, 2, NULL, 'Arup Samaddar', '9831611666', 700050, '49 Jogipara road', '1981-02-02', NULL, '2024-01-12 16:26:16', '2024-04-18 04:48:16'),
(64, NULL, NULL, '$2y$10$7CulbFM5bj04/2wGIxsxf.tru60OnADJg6MSV1CltdyUevu247sH6', 'chottobaby22@gmail.com', NULL, '2024-01-12 15:04:50', NULL, 1, NULL, 2, NULL, 'susmriti mitra', '9051583224', 700013, 'harakumar tagore square', '1996-10-09', NULL, '2024-01-12 20:34:50', '2024-01-12 20:34:50'),
(65, NULL, NULL, '$2y$10$jTzshrqfJya9vptTNkWsjOrdxQCq/ZtLt8jQvex6nax3vzcWLN5YS', 'souvik@gmail.com', NULL, '2024-01-24 07:38:50', NULL, 1, NULL, 2, NULL, 'Souvik', '8509607677', 700002, 'Kolkata', '2025-04-01', NULL, '2024-01-24 13:08:50', '2024-01-24 13:08:50'),
(67, NULL, NULL, '$2y$10$m2qWgPCqQbe1WPq7Tr44JulpnYy4bwSQZGRg5U96/9aWcwgD2dm2m', 'mainakmakz@gmail.com', NULL, '2024-02-08 13:30:06', NULL, 1, NULL, 2, NULL, 'Mainak Chowdhury', '7000262662', 700788, 'hshshhs', '2024-08-02', NULL, '2024-02-08 08:00:06', '2024-02-08 08:00:06'),
(68, NULL, NULL, '$2y$10$VFI0FKtjNw3c9Wu221NN2eBkylcxi/.3aKaqorJStJX/.Zj7PwJUq', 'jagjyot85@gmail.com', NULL, '2024-02-09 23:05:17', NULL, 1, NULL, 2, NULL, 'JAGJYOT SINGH', '9831029406', 700052, 'kolkata', '1988-12-01', NULL, '2024-02-09 17:35:17', '2024-02-09 17:35:17'),
(69, NULL, NULL, '$2y$10$hFtJPKUV5J/37ymY3xIATuYIs3DkulHQfNtRRByeag1yR57/MXsuC', 'sharmibasu9@gmail.com', NULL, '2024-02-22 10:31:44', NULL, 1, NULL, 2, NULL, 'Sharmi Basu', '8697943665', 700036, 'Baranagar', '1990-06-12', NULL, '2024-02-22 05:01:44', '2024-02-22 05:01:44'),
(70, NULL, NULL, '$2y$10$0ogFd6IkqE5uMCfSjixeG.aWjNX70.J7uWPpfo8Q7rDlrDnIYtKwq', 'abhijit59@gmail.com', NULL, '2024-02-25 12:18:41', NULL, 1, NULL, 2, NULL, 'Abhijit Das', '9434063577', 700050, 'R/304, Binayak Enclave,  59 Kali Charan Ghosh Road', '1961-11-06', NULL, '2024-02-25 06:48:41', '2024-02-25 06:48:41'),
(71, NULL, NULL, '$2y$10$BE00MvqXZ1cE4eHp/9Mwh.wsIJvTATfFGfDM1T1HEofzrFbSBs9ae', 'ayan.chatterjee92@gmail.com', NULL, '2024-02-27 20:26:28', NULL, 1, NULL, 2, NULL, 'Ayan Chatterjee', '8013447035', 700004, '169/3 A.P.C Road', '1992-03-09', NULL, '2024-02-27 14:56:28', '2024-02-27 14:56:28'),
(72, NULL, NULL, '$2y$10$OXx6sAEJJzenGpabgfyHVug5m.VKskNCm7kO3rkNepupZeOn14uwO', 'abc@gmail.com', NULL, '2024-02-28 12:07:06', NULL, 1, NULL, 2, NULL, 'Yash', '1290348909', 123123, 'Kolkata', '1990-03-21', NULL, '2024-02-28 06:37:06', '2024-02-28 06:37:06'),
(73, NULL, NULL, '$2y$10$NsCco8e8474oky/94Iop6uN4wz2Yzptyln1iw1y31sUC4qvT/hvAW', 'fjfj@gmail.com', NULL, '2024-03-15 16:31:29', NULL, 1, NULL, 2, NULL, 'Yash', '889695325', 743667, 'kinGSOFT', '1999-06-19', NULL, '2024-03-15 11:01:29', '2024-03-15 11:01:29'),
(74, NULL, NULL, '$2y$10$Gdw94WX6uhigVU2Y.KJh.uvV5V5nnAeuGMFVrO6akflfzIc2pGdX2', 'dipshipari143@gmail.com', NULL, '2024-03-19 14:55:43', NULL, 1, NULL, 2, NULL, 'dipak', '7003644992', 700108, '173/1 gopal lal tagore rd', '1981-05-12', NULL, '2024-03-19 09:25:43', '2024-03-19 09:25:43'),
(75, NULL, NULL, '$2y$10$tafRH9x8GsFw2Nj8hK.N..J/cDARF2axBmWwsRGpw5UgCdFqMLC7O', 'example@gmail.com', NULL, '2024-03-20 11:40:55', NULL, 1, NULL, 2, NULL, 'Example', '8509508731', 700004, 'Exampl', '2006-01-03', NULL, '2024-03-20 06:10:55', '2024-03-20 06:10:55'),
(76, NULL, NULL, '$2y$10$6xRw5EocI7O8F7Ea0cA27.LG0lybyMgLVxFZZ1v9Euu3wmrVEryo2', 'rahul.agarwal245@gmail.com', NULL, '2024-03-20 18:03:46', NULL, 1, NULL, 2, NULL, 'Rahul Agarwal', '8444853909', 700050, '59, k c ghosh road', '2002-05-09', NULL, '2024-03-20 12:33:46', '2024-03-20 12:33:46'),
(77, 'TestProvider', NULL, '$2y$10$lNI2pQcnSto3JojvUWigdenF0oe.pX7SzGpM49ft7WCmUU4/NAOSG', 'testprovider@gmail.com', NULL, '2024-03-20 18:48:45', NULL, 0, NULL, 2, NULL, NULL, '8370994407', 700054, 'Kolkata', NULL, NULL, '2024-03-20 13:18:45', '2024-04-23 10:22:36'),
(79, NULL, NULL, '$2y$10$2j7v6RkcbTRYZgN5t1Bgj.NQETiObz0Ey6isMoBYRpnBbfRsQ.iR6', 'surekaaadarsh@gmail.com', NULL, '2024-03-21 09:59:58', NULL, 1, NULL, 2, NULL, 'Aadarsh sureka', '8777010163', 700054, 'prasad exotica, 71/3 canal circular road', '2004-09-05', NULL, '2024-03-21 04:29:58', '2024-03-21 04:29:58'),
(80, NULL, NULL, '$2y$10$7tMxatIfLioC8QvFXsA28O4D5ObvZcKxNQFTQBXvuoU2l8/MEgw7a', 'ishikasingh2459@gmail.com', NULL, '2024-03-22 01:50:04', NULL, 1, NULL, 2, NULL, 'Mamata mondal', '8017252065', 700036, 'uddipa the condoville sinthi more tower 2 room no 202', '1985-02-12', NULL, '2024-03-21 20:20:04', '2024-03-21 20:20:04'),
(81, NULL, NULL, '$2y$10$/vEYaSxWBfoixKDts/.2Ee0nr1ZMNwAeBPlE9yAV096KYuduw3/zq', 'senguptas404@gmail.com', NULL, '2024-03-24 09:00:28', NULL, 1, NULL, 2, NULL, 'sharbani', '7980824409', 700050, 'F 404 Binayak Enclave. 59 Kalicharan Ghosh Road', '1984-04-10', NULL, '2024-03-24 03:30:28', '2024-03-24 03:30:28'),
(82, NULL, NULL, '$2y$10$g8zY.e0C6g.az.NOn2wRyu8AC89hK6JDAaP1dQnQQAainsg618aX6', 'pragyakhiroria4@gmail.com', NULL, '2024-03-25 12:41:40', NULL, 1, NULL, 2, NULL, 'Pragya Khiroria', '8777367892', 700048, '108/1 Amelangshu Sen Road', '1997-01-01', NULL, '2024-03-25 07:11:40', '2024-03-25 07:11:40'),
(83, NULL, NULL, '$2y$10$6x41y3DVI0fJIT5gN6Z54eR8F2rEZbFEY/0.YwTGQPBhVLaz2d6u2', 'anirban_paik@yahoo.com', NULL, '2024-04-06 20:09:09', NULL, 1, NULL, 2, NULL, 'Anirban Paik', '9830310200', 700036, 'Baranagar', '1981-04-08', NULL, '2024-04-06 14:39:09', '2024-04-06 14:39:09'),
(84, NULL, NULL, '$2y$10$Mlh3PTtB.qTbzvC/qqeNx.RODjiO56tB8S2pHDPMNJ1bzeByBQqki', 'hammadhamza01@gmail.com', NULL, '2024-04-09 16:55:28', NULL, 1, NULL, 2, NULL, 'Hammad', '7003439102', 700073, 'Rajmohan street', '1996-04-01', NULL, '2024-04-09 11:25:28', '2024-04-09 11:25:28'),
(85, NULL, NULL, '$2y$10$7bRMt3KGEXHf.T6AdqMQG.ydUlYiGsMKaTDwYglQw5nkA9/TuVRFm', 'sobhroz2137@gmail.com', NULL, '2024-04-14 12:18:36', NULL, 1, NULL, 2, NULL, 'SUBHRANGSHU MUKHERJEE', '9163637666', 700050, 'A 304 BINAYAK ENCLAVE 59 KALICHARAN GHOSH ROAD', '1985-12-12', NULL, '2024-04-14 06:48:36', '2024-04-14 06:48:36'),
(86, NULL, NULL, '$2y$10$qmJ0eVUjt7hhp9h7/m0Zyu1Owow0AqP8FBKpf6NbL1KdUOyfdQTZK', 'rajivghosh1524@gmail.com', NULL, '2024-04-14 15:34:59', NULL, 1, NULL, 2, NULL, 'RAJIV GHOSH', '9836810316', 700054, 'P 11 CIT ROAD SCHEME VI M S NEAR PHOOLBAGAN METRO STATION', '1987-03-12', NULL, '2024-04-14 10:04:59', '2024-04-14 10:04:59'),
(87, NULL, NULL, '$2y$10$YL1YmmdcZfAo.teZM4oq4eY5IOdrMsd4wUbGHV8yVfWG2y7U1mDN.', 'daddd@gmail.com', NULL, '2024-04-17 10:54:41', NULL, 1, NULL, 2, NULL, NULL, '1234567890', 700058, NULL, NULL, NULL, '2024-04-17 05:24:41', '2024-04-17 05:24:41'),
(88, NULL, NULL, '$2y$10$Pfkc2eCdxFWe0rsotHgRzOT5q3OwOqe.yKvQ0pkWwqbTuypgA8tgK', 'ratuldj@gmail.com', NULL, '2024-04-17 11:36:32', NULL, 1, NULL, 2, NULL, NULL, '8370994407', 700050, NULL, NULL, NULL, '2024-04-17 06:06:32', '2024-04-17 06:06:32'),
(89, NULL, NULL, '$2y$10$hj4vFGhXxpaK3hH2Uz0Avu5N6uB0Q/yybR7IpAblPTFRFqZ6tDzmy', 'itratul@gmail.com', NULL, '2024-04-17 11:55:56', NULL, 1, NULL, 2, NULL, NULL, '8370885569', 700050, NULL, NULL, NULL, '2024-04-17 06:25:56', '2024-04-17 06:25:56'),
(91, NULL, NULL, '$2y$10$xQNNV7Oz3yYGI5fgB9nKL.cw9JCsdtzFW.RHNyJGfCimyARfgwKjO', 'androshreyansh@gmail.com', NULL, '2024-04-21 22:17:53', NULL, 1, NULL, 2, NULL, 'Shreyansh S', '8961674958', 700089, 'P249 Lake Town Block A', '2000-04-11', NULL, '2024-04-21 16:47:53', '2024-04-21 16:47:53'),
(92, NULL, NULL, '$2y$10$8mdBTEW6fKfgo0y/TyLJp.OT9ZMMXoTLlvYW2o3Evmp1mKdo2NX1.', 'devyansh1993@gmail.com', NULL, '2024-04-21 22:32:24', NULL, 1, NULL, 2, NULL, 'Devyansh Shyamsukha', '7980745955', 700089, 'P249 Lake Town Block A', '2003-10-09', NULL, '2024-04-21 17:02:24', '2024-04-21 17:02:24'),
(93, 'Agarwal Service & Care', NULL, '$2y$10$tsrZItKA3bmJO/s3w1vUP.D8mVjsmWWC7sORvxckhwwFJGqLvbPkW', 'rowdy.rounak@gmail.com', NULL, '2024-04-23 16:06:48', NULL, 1, 'Agarwal Service', 3, NULL, NULL, '9836898098', 700050, '59, Kali Charan Ghosh Road, Kolkata - 700050', NULL, NULL, '2024-04-23 10:36:48', '2024-05-29 11:49:13'),
(94, 'abc', NULL, '$2y$10$rPLwZjiWGdyL5q6NqM7SPuFuL7vkKjxJO2ie8jBDXAA6C1TUum25C', 'abcdef@gmail.com', NULL, '2024-04-23 16:19:47', NULL, 1, 'abc', 2, NULL, NULL, '8370554569', 700051, '<p>59, Kali Charan Ghosh Road, Kolkata - 700050</p>', NULL, NULL, '2024-04-23 10:49:47', '2024-04-23 11:19:07'),
(95, NULL, NULL, '$2y$10$RIaisJep3LbOeSN9kBaAZ.nalt3U/LK75D4QTWs4plmPcZJop1.4y', 'sudipta09b@gmail.com', NULL, '2024-04-23 16:21:31', NULL, 1, NULL, 2, NULL, 'Sudipta', '6368907659', 700050, NULL, NULL, NULL, '2024-04-23 10:51:31', '2024-04-23 10:51:31'),
(96, NULL, NULL, '$2y$10$1rvV40dw9Qc2BqtrIp8C3uP78ZwWaoPekUsIMkOI5u9Jr.kJM7BPO', 'caremintmanish@gmail.com', NULL, '2024-04-23 16:22:13', NULL, 1, NULL, 2, NULL, 'Vijay', '9903138603', 700050, 'kolkata', '2000-11-04', NULL, '2024-04-23 10:52:13', '2024-04-23 10:52:13'),
(97, NULL, NULL, '$2y$10$Inc3JwOsmlcjtgYtZAg9ieMecRU6J55wyH/YjKqJhatI6Oa9FDoau', 'asdsadasdasd@gmail.com', NULL, '2024-04-24 12:33:34', NULL, 1, NULL, 2, NULL, NULL, '1234567890', 700058, 'ssdasdasasdasd', NULL, NULL, '2024-04-24 07:03:34', '2024-04-24 07:03:34'),
(98, NULL, NULL, '$2y$10$btKBudtzq0Ghe.p49080DO8dzKDdmm26UC8r5PQfDsKHKrFun7.HO', 'hhiv@gmail.com', NULL, '2024-04-24 12:40:45', NULL, 1, NULL, 2, NULL, 'Test Blood', '1097109710', 700059, 'Mukandapur', NULL, NULL, '2024-04-24 07:10:45', '2024-04-24 07:10:45'),
(99, 'R P CLEANING', NULL, '$2y$10$qf8NHKU3IVF0BdOk3bDpIeSC9KZPepnY7C3YhwmCZKNX6zNgEI8m6', 'psunil983@gmail.com', NULL, '2024-04-24 16:18:41', NULL, 1, 'R P CLEANING', 3, NULL, NULL, '9831984952', 700054, '45/1/H/9 BIPLABI BARIN GHOSH SARANI, MANICKTOLLA KOLKATA-700054', NULL, NULL, '2024-04-24 10:48:41', '2024-04-24 10:48:41'),
(100, 'M/S ECO FRIENDLY CAR WASH', NULL, '$2y$10$byEWywbu1b.VoUolLpvs4eKvMiLcq85vHK/ulFmnb3CamraOupPrG', 'santoshbaitha1986@gmail.com', NULL, '2024-04-24 16:48:12', NULL, 1, 'M/S ECO FRIENDLY CAR WASH', 3, NULL, NULL, '9831344411', 700071, '11 HO-CHI-MINH SARANI KOLKATA', NULL, NULL, '2024-04-24 11:18:12', '2024-04-24 11:18:12'),
(101, NULL, NULL, '$2y$10$qCTS/T0fgAB5xHCPzJg1BOXtXp0jNY83Bvc071NQ3W6RmPQL4hlSe', 'pukpak@gmail.com', NULL, '2024-05-02 15:10:34', NULL, 1, NULL, 2, NULL, 'Puk Pak', '7568975678', 700050, 'Kolkata', NULL, NULL, '2024-05-02 09:40:34', '2024-05-02 09:40:34'),
(105, NULL, NULL, '$2y$10$.E./eCRwfXQQcB9biMwE8utNCdnKgK8Nr19BCx1xy/9BStqyOuQUO', 'ratulmondal1@gmail.com', NULL, '2024-05-02 16:41:24', NULL, 1, NULL, 2, NULL, 'Ratul Mondal', '8370994407', 700050, 'Kolkata', NULL, NULL, '2024-05-02 11:11:24', '2024-05-02 11:11:24'),
(106, NULL, NULL, '$2y$10$kkJhomaxsllmsIZWrHEHWeCEBbrkUcX7u1EbT/Yj74OtRTWRcIr3W', 'caremintapp@gmail.com', NULL, '2024-05-02 17:19:46', NULL, 1, NULL, 2, NULL, 'Caremint APP', '8509507080', 700050, 'Kolkata', NULL, NULL, '2024-05-02 11:49:46', '2024-05-02 11:49:46'),
(107, NULL, NULL, '$2y$10$Dr.pb1xiakJcyBjvrbF9oO7P7/FG/7.dtRO4UinmArlZQlSoXPRMK', 'aditya_saraf@rediffmail.com', NULL, '2024-05-06 12:44:40', NULL, 1, NULL, 2, NULL, 'Aditya Saraf', '9830246679', 700054, '96B Moulana Abul Kalam Azad Sarani', NULL, NULL, '2024-05-06 07:14:40', '2024-05-06 07:14:40'),
(108, NULL, NULL, '$2y$10$ilDveh2KkLCbOZ1m/jk.KO96/wM6w62OmXFcGgPXZs2hlp6u50pKG', 'g9831230@gmail.com', NULL, '2024-05-06 22:32:15', NULL, 1, NULL, 2, NULL, 'Gurpreet Kaur', '9831230163', 700050, 'Binayak Enclave Block 2 306', NULL, NULL, '2024-05-06 17:02:15', '2024-05-06 17:02:15'),
(109, 'SHREE SHYAM CARE & SERVICE', NULL, '$2y$10$Rd8a6ZrsMBTQCCA6YOn4aOzQfqVJXqufbfelNcP/htqYtWlkDQC16', 'sunnysharma1474@gmail.com', NULL, '2024-05-07 16:26:10', NULL, 1, 'SHREE SHYAM CARE & SERVICE', 3, NULL, NULL, '8100556648', 700108, '76 ,Ashokgarh Dunlop', NULL, NULL, '2024-05-07 10:56:10', '2024-05-23 11:10:20'),
(110, NULL, NULL, '$2y$10$SDvJ65yBBBvkzM0nkS6xButOVW51rd/OcjXVgba2nyqS5QUIf5P6W', 'dilipsharma123@gmail.com', NULL, '2024-05-07 17:11:11', NULL, 1, NULL, 2, NULL, 'dilip', '9903834711', 700108, '90 rabindra nagar', NULL, NULL, '2024-05-07 11:41:11', '2024-05-07 11:41:11'),
(111, NULL, NULL, '$2y$10$zPM1/4zHiuEw2PdFBznPx.kkoB1pIUWIqj1qpGLGjk3zlki1q3Ene', 'dh46146@gmail.com', NULL, '2024-05-10 14:08:30', NULL, 1, NULL, 2, NULL, 'Daniel Sebastain', '6351038057', 700039, 'A3 10 badia danga lane Picnic Garden near Bain Bari', NULL, NULL, '2024-05-10 08:38:30', '2024-05-10 08:38:30'),
(112, NULL, NULL, '$2y$10$i3JeI5hkyIXRJ0jTJlQzIOkRHFW1dr2jwaerO4bUdovnh8ABV9mOG', 'jatin2meee@gmail.com', NULL, '2024-05-11 13:01:16', NULL, 1, NULL, 2, NULL, 'Jatinder singh', '7980535189', 700108, '1/13r n tagore road', NULL, NULL, '2024-05-11 07:31:16', '2024-05-11 07:31:16'),
(113, NULL, NULL, '$2y$10$GB5HDXBWfnUxYn.cFBHHHuJ789/yLazfuTW3CuhVGX2GKTcfNezu.', 'amunforgettable@gmail.com', NULL, '2024-05-23 16:08:21', NULL, 1, NULL, 2, NULL, 'Rahul', '7003843065', 700056, '4 Nilgaunge Road Starom Millenia Tower 1 10F', NULL, NULL, '2024-05-23 10:38:21', '2024-05-23 10:38:21'),
(116, 'Ratul Washerman', NULL, '$2y$10$tsrZItKA3bmJO/s3w1vUP.D8mVjsmWWC7sORvxckhwwFJGqLvbPkW', 'ratul.mondal@3raredynamics.com', NULL, '2024-05-29 15:38:58', NULL, 1, 'Ratul Washerman', 4, 93, 'Ratul Mondal', '9009001234', NULL, 'Minakha', NULL, NULL, '2024-05-29 10:08:58', '2024-05-29 10:08:58'),
(117, 'SDFDEFF Washerman', NULL, '$2y$10$PHrVChJQrq/e4mV24q6Qi.MTubr2u5WyLZXFR5U495zIz2p69sz1i', 'ratuldzdz@gmail.com', NULL, '2024-05-29 16:02:43', NULL, 1, 'SDFDEFF Washerman', 4, 93, 'Ratul Mondal', '8505967855', NULL, 'Minakha', NULL, NULL, '2024-05-29 10:32:43', '2024-05-29 10:32:43'),
(118, 'SDFDEFF Washerman', NULL, '$2y$10$JS0Ae66NtQIQsKNYcl2IEuhtXOAHl1FQM8X0s3FK4P8.KW5wsrAAy', 'ratulpukpak@gmail.com', NULL, '2024-05-29 16:03:58', NULL, 1, 'SDFDEFF Washerman', 4, 93, 'Ratul Mondal', '8505967855', NULL, 'Minakha', NULL, NULL, '2024-05-29 10:33:58', '2024-05-29 10:33:58'),
(119, NULL, NULL, '$2y$10$KVs30XrRxDaJcTY4ZULkBOFpy6mUfHsf.Bsb5zTYkBuBB0Guse5RC', 'ratuldzdzdz@gmail.com', NULL, '2024-05-29 18:26:50', NULL, 1, NULL, 4, 93, 'Ratul Mondal', '8505967855', NULL, 'Minakha', NULL, NULL, '2024-05-29 12:56:50', '2024-05-29 12:56:50'),
(120, NULL, NULL, '$2y$10$oIxBHeNEpcSOZ4qb5qQutOv3fyBmxMieCMuDUc29f8gRBakhHjIEa', 'ratuldzdzdzdz@gmail.com', NULL, '2024-05-29 18:32:55', NULL, 1, NULL, 4, 93, 'Ratul Mondal', '8505967855', NULL, 'Minakha', NULL, NULL, '2024-05-29 13:02:55', '2024-05-29 13:02:55'),
(121, NULL, NULL, '$2y$10$R1HzQPQ.GsCSZysUrtF6vOejcTRS4ZzzD0KyW1NagDua3DmSGmTXS', 'klasjjsakldlasld@gmail.com', NULL, '2024-05-29 18:33:25', NULL, 1, NULL, 2, NULL, 'Puk Pak', '7568975678', 700050, 'Kolkata', NULL, NULL, '2024-05-29 13:03:25', '2024-05-29 13:03:25'),
(122, NULL, NULL, '$2y$10$PpPLDONJ65Fy9e4sgp/ixusSOmiVgxEK.AjlV1N40PVRXPaK5biXe', 'opauwspdos@gmail.com', NULL, '2024-05-30 10:39:20', NULL, 1, NULL, 2, NULL, 'Puk Pak', '7568975678', 700050, 'Kolkata', NULL, NULL, '2024-05-30 05:09:20', '2024-05-30 05:09:20'),
(123, NULL, NULL, '$2y$10$deUJYBP9BAWk5ZdOUBLaM.LI5Y.bYsMDyuSkcAx1cZS/RdpBVH./S', 'dasdsasadfds@gmail.com', NULL, '2024-05-30 10:39:37', NULL, 1, NULL, 4, 93, 'Ratul Mondal', '8505967855', NULL, 'Minakha', NULL, NULL, '2024-05-30 05:09:37', '2024-05-30 05:09:37'),
(124, NULL, NULL, '$2y$10$BtcDmr.oC6kCRZscWRucDefFwZwMqIq44Q8xTYIpil3etCpWyfplS', 'rbhattacharya969@gmail.com', NULL, '2024-06-14 13:24:25', NULL, 1, NULL, 2, NULL, 'Rajkumar Bhattacharya', '9836372309', 700056, '41/4 nawab Abdul Latif street, Belghoria, Kolkata', NULL, NULL, '2024-06-14 18:54:25', '2024-06-14 18:54:25'),
(125, NULL, NULL, '$2y$10$NIJTsMGzq5CA2aDTFe/BPOCVRQXtjiTiSom/.qGh2F/5DxrPZWv0y', 'vishal.jalan78@gmail.com', NULL, '2024-06-16 07:07:24', NULL, 1, NULL, 2, NULL, 'Vishal Jalan', '9443943200', 700020, '33A, Sarat Bose Road', NULL, NULL, '2024-06-16 12:37:24', '2024-06-16 12:37:24'),
(126, 'Test Washerman', NULL, '$2y$10$0NnWqM5vDyieC7.t8ve8zu.s5pZ12bQWcAfp6.k9nSFJi5F2w8Bcu', 'test@gmail.com', NULL, '2024-06-17 12:59:51', NULL, 1, 'Test Washerman', 4, 93, 'Test Name', '8370994407', NULL, 'Minakha', NULL, NULL, '2024-06-17 18:29:51', '2024-06-17 18:29:51'),
(127, NULL, NULL, '$2y$10$O3fSvzXJaIRisCra0L21Wu9fBM18tGSHFJGdeCZ7EdWPjuSPDoz8a', 'mdsaifkadir@icloud.com', NULL, '2024-06-21 04:34:58', NULL, 1, NULL, 2, NULL, 'MD SAIF KADIR', '8017625392', 700017, 'FAB INDIA, SHAKESPEARE', NULL, NULL, '2024-06-21 10:04:58', '2024-06-21 10:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL,
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  `role_id` int(11) DEFAULT NULL,
  `user_firstname` varchar(75) DEFAULT NULL,
  `user_phonenumber` varchar(10) DEFAULT NULL,
  `user_pincode` int(11) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_isloggedin` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`, `role_id`, `user_firstname`, `user_phonenumber`, `user_pincode`, `user_address`, `user_isloggedin`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$P$BwzVL1YmU7j3iJIxHCM.My.630A86a1', 'vtsphp2021@gmail.com', 'https://vtsinfotech.in/vtsweb/goldenrefrigeration', '2022-06-03 14:07:06', '', 0, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(2, 'admin2', '$P$BwzVL1YmU7j3iJIxHCM.My.630A86a1', 'rd_admin@email.com', '', '2023-08-09 10:33:00', '', 0, 'rd_admin', 1, 'Admin', '9998881234', 700001, '50B, C.R.Avenue, WB, IN', NULL, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(3, 'provider1', '$P$BwzVL1YmU7j3iJIxHCM.My.630A86a1', 'rd_provider1@email.com', '', '2023-08-09 10:33:00', '', 0, 'rd_provider1', 3, 'Provider', '9998781234', 700081, '50C, C.R.Avenue, WB, IN', NULL, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(2, 'admin2', '$P$BwzVL1YmU7j3iJIxHCM.My.630A86a1', 'rd_admin@email.com', '', '2023-08-09 10:33:00', '', 0, 'rd_admin', 1, 'Admin', '9998881234', 700001, '50B, C.R.Avenue, WB, IN', NULL, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(3, 'provider1', '$P$BwzVL1YmU7j3iJIxHCM.My.630A86a1', 'rd_provider1@email.com', '', '2023-08-09 10:33:00', '', 0, 'rd_provider1', 3, 'Provider', '9998781234', 700081, '50C, C.R.Avenue, WB, IN', NULL, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(2, 'admin2', '$P$BwzVL1YmU7j3iJIxHCM.My.630A86a1', 'rd_admin@email.com', '', '2023-08-09 10:33:00', '', 0, 'rd_admin', 1, 'Admin', '9998881234', 700001, '50B, C.R.Avenue, WB, IN', NULL, '2023-08-09 07:21:31', '2023-08-09 07:21:31'),
(3, 'provider1', '$P$BwzVL1YmU7j3iJIxHCM.My.630A86a1', 'rd_provider1@email.com', '', '2023-08-09 10:33:00', '', 0, 'rd_provider1', 3, 'Provider', '9998781234', 700081, '50C, C.R.Avenue, WB, IN', NULL, '2023-08-09 07:21:31', '2023-08-09 07:21:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_unique` (`email`),
  ADD UNIQUE KEY `admin_users_mobile_unique` (`mobile`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_user`
--
ALTER TABLE `category_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `timeslot_id` (`timeslot_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pincode_user`
--
ALTER TABLE `pincode_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pincode_id` (`pincode_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `service_user`
--
ALTER TABLE `service_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_task_foreign` (`order_id`),
  ADD KEY `task_provider_foreign` (`provider_id`),
  ADD KEY `task_washer_foreign` (`washer_id`),
  ADD KEY `task_customer_foreign` (`customer_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeslots`
--
ALTER TABLE `timeslots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `user_provider_foreign` (`provider_id`);

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_user`
--
ALTER TABLE `category_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1106;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pincode_user`
--
ALTER TABLE `pincode_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `service_user`
--
ALTER TABLE `service_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `timeslots`
--
ALTER TABLE `timeslots`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `category_user`
--
ALTER TABLE `category_user`
  ADD CONSTRAINT `category_user_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_user_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_user_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_user_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_user_ibfk_5` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`timeslot_id`) REFERENCES `timeslots` (`id`);

--
-- Constraints for table `pincode_user`
--
ALTER TABLE `pincode_user`
  ADD CONSTRAINT `pincode_user_ibfk_1` FOREIGN KEY (`pincode_id`) REFERENCES `pincodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `service_user`
--
ALTER TABLE `service_user`
  ADD CONSTRAINT `service_user_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `order_task_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_customer_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_provider_foreign` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_washer_foreign` FOREIGN KEY (`washer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_provider_foreign` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD CONSTRAINT `wp_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `wp_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `wp_users_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `wp_users_ibfk_4` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
