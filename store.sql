-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2023 at 12:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `password`, `phone_number`, `super_admin`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jamison Rowe', 'ankunding.jodie@mraz.com', 'krunolfsdottir', '$2y$10$3c5RO.rUN91c5ThO19f4Tu22tI9bAZ1D6ugIG.ntND7jv6i3DBkkS', '541.296.7579', 1, 'active', '2023-08-06 10:35:20', '2023-08-06 10:35:20'),
(2, 'Juvenal Botsford', 'clair.kozey@crist.org', 'koss.jaden', '$2y$10$ZF5LOMOEY.bs9r4oKHw93ef6VLyFcNfQz3XrEq82cVrZ0GUMGcHOS', '731-593-6364', 0, 'active', '2023-08-06 10:35:20', '2023-08-06 10:35:20'),
(3, 'Keith Stanton Jr.', 'kuvalis.robin@gmail.com', 'lorenz80', '$2y$10$XqQNpfLtF7UilydKtJBnXORX3s4ZbtMJx4g9gtAtOlDmcTTseyqVG', '+1-680-510-0122', 1, 'active', '2023-08-06 10:35:20', '2023-08-06 10:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` char(36) NOT NULL,
  `cookie_id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `cookie_id`, `user_id`, `product_id`, `quantity`, `options`, `created_at`, `updated_at`) VALUES
('0e01870d-6af5-4018-a492-4073b532399f', '0501476d-d8be-4abb-b8f6-8ffea7b2993f', NULL, 128, 1, NULL, '2023-08-05 10:35:28', '2023-08-05 10:35:28'),
('2f839ca0-d5d3-491a-acd5-2b82e21310df', '6695627b-022f-4760-a00f-6a845422ee12', NULL, 126, 1, NULL, '2023-08-04 12:16:57', '2023-08-04 12:16:57'),
('81739be8-6467-4330-af55-bf2e4c9ef7af', 'b3321c54-8135-48e9-8bb0-b65c06631008', NULL, 126, 1, NULL, '2023-08-05 10:28:54', '2023-08-05 10:28:54'),
('a3c14f50-7c4f-4be4-8469-c233ac60c735', '60da4c48-8537-4796-808d-fc33f5c66b52', NULL, 128, 1, NULL, '2023-08-05 12:02:58', '2023-08-05 12:02:58'),
('a490cae9-0be4-409b-924c-ad672f046875', '6695627b-022f-4760-a00f-6a845422ee12', NULL, 128, 1, NULL, '2023-08-04 12:13:06', '2023-08-04 12:13:06'),
('a8955582-2830-4b6c-8e3b-8a30a864c7b4', 'd2c27263-e526-409e-bac8-0b3762e00faa', NULL, 128, 1, NULL, '2023-08-05 11:08:13', '2023-08-05 11:08:13'),
('f239d2d5-5673-4e05-95dc-26eb424f117c', '6c88326e-15d1-4cb5-8b54-85a36c2ac10e', NULL, 128, 1, NULL, '2023-08-04 16:07:02', '2023-08-04 16:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','archived') NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `description`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(32, NULL, 'et harum', 'et-harum', 'Voluptatibus et facere debitis eum quasi asperiores sunt voluptates et iste qui magni facere amet.', 'active', 'https://via.placeholder.com/640x480.png/0044ff?text=ex', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(33, NULL, 'ut quidem', 'ut-quidem', 'Aliquid qui quam voluptatem non laboriosam omnis in dicta ut.', 'active', 'https://via.placeholder.com/640x480.png/001100?text=vitae', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(34, NULL, 'est asperiores', 'est-asperiores', 'Nesciunt distinctio laboriosam recusandae et nisi exercitationem veritatis molestiae et ipsum amet possimus qui et qui.', 'active', 'https://via.placeholder.com/640x480.png/0099dd?text=rem', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(35, NULL, 'adipisci et', 'adipisci-et', 'Laborum maiores esse quia earum perferendis voluptas voluptatem cum et omnis sed quidem eligendi distinctio nam dolorum non hic neque.', 'active', 'https://via.placeholder.com/640x480.png/003366?text=commodi', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(36, NULL, 'culpa sapiente', 'culpa-sapiente', 'Dolorem perferendis nostrum commodi occaecati quis voluptatem aut eos quaerat earum itaque veniam fugit et debitis.', 'active', 'https://via.placeholder.com/640x480.png/00cc44?text=laboriosam', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(37, NULL, 'molestiae voluptate', 'molestiae-voluptate', 'Laborum soluta fuga earum ut rerum ratione repudiandae est quis nisi alias a unde eveniet fuga quia.', 'active', 'https://via.placeholder.com/640x480.png/001144?text=suscipit', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(38, NULL, 'aut voluptas', 'aut-voluptas', 'A non at ea consequuntur alias et ab inventore quas voluptatibus vel distinctio perspiciatis molestiae neque quia.', 'active', 'https://via.placeholder.com/640x480.png/0033ee?text=qui', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(39, NULL, 'adipisci ipsam', 'adipisci-ipsam', 'Et quia voluptatibus quo omnis eos pariatur nobis eligendi dolore sed aspernatur voluptas delectus corporis quaerat molestiae minus id.', 'active', 'https://via.placeholder.com/640x480.png/00dd99?text=blanditiis', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(40, NULL, 'illum repellat', 'illum-repellat', 'Voluptatem laborum neque sed autem beatae sunt laudantium atque voluptas ab voluptate debitis.', 'active', 'https://via.placeholder.com/640x480.png/00dd00?text=et', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(41, NULL, 'repudiandae accusamus', 'repudiandae-accusamus', 'Consequatur est laborum laboriosam aliquam quia maxime assumenda labore distinctio est reiciendis vel aut nihil autem omnis soluta consequatur nihil voluptate.', 'active', 'https://via.placeholder.com/640x480.png/00ff77?text=qui', '2023-07-23 05:46:15', '2023-07-23 05:46:15', NULL),
(42, NULL, 'Home & Music', 'home-music', 'Delectus magni quo itaque dicta qui et laboriosam ex dolorem incidunt tempora vel et possimus ad qui.', 'active', 'https://via.placeholder.com/640x480.png/009966?text=vel', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(43, NULL, 'Shoes', 'shoes', 'Vitae et et eius ullam sunt necessitatibus excepturi distinctio voluptatem maiores enim fuga rerum deleniti minima soluta.', 'active', 'https://via.placeholder.com/640x480.png/00ccbb?text=natus', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(44, NULL, 'Electronics & Books', 'electronics-books', 'Ab facere et sed rem aliquid veniam perspiciatis quia suscipit enim assumenda.', 'active', 'https://via.placeholder.com/640x480.png/00ddff?text=a', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(45, NULL, 'Outdoors, Health & Computers', 'outdoors-health-computers', 'Et quos ipsa facilis magnam sed porro quia unde a est voluptates quasi facere.', 'active', 'https://via.placeholder.com/640x480.png/00dd44?text=est', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(46, NULL, 'Toys, Baby & Movies', 'toys-baby-movies', 'Dolor rerum dolores totam tenetur ut qui eligendi possimus quibusdam quibusdam.', 'active', 'https://via.placeholder.com/640x480.png/005533?text=magni', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(47, NULL, 'Tools, Garden & Outdoors', 'tools-garden-outdoors', 'Dignissimos qui in veritatis eius animi impedit aliquam voluptatem aliquid possimus et nihil inventore consequuntur quasi cumque.', 'active', 'https://via.placeholder.com/640x480.png/0022aa?text=nihil', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(48, NULL, 'Computers', 'computers', 'Non voluptas pariatur reprehenderit eius id sequi ut mollitia at enim dicta deserunt facere velit recusandae eligendi nisi quis neque perspiciatis libero.', 'active', 'https://via.placeholder.com/640x480.png/004433?text=qui', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(49, NULL, 'Home, Music & Electronics', 'home-music-electronics', 'Non veniam dolorum architecto minus labore illum molestiae placeat eum ipsam magnam ipsa quibusdam molestiae placeat dolorem.', 'active', 'https://via.placeholder.com/640x480.png/004422?text=earum', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(50, NULL, 'Grocery, Home & Electronics', 'grocery-home-electronics', 'Sint necessitatibus dolorem ut est velit et ut repellendus adipisci rerum autem explicabo illum error.', 'active', 'https://via.placeholder.com/640x480.png/0077dd?text=soluta', '2023-07-23 07:01:01', '2023-07-23 07:01:01', NULL),
(51, NULL, 'Tools & Grocery', 'tools-grocery', 'Voluptatem iure provident voluptatibus est labore nemo velit dignissimos minima non sit modi odio enim minima at repellat.', 'active', 'https://via.placeholder.com/640x480.png/00bbff?text=et', '2023-07-23 07:01:02', '2023-07-23 07:01:02', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_16_092845_create_categories_table', 1),
(6, '2023_07_22_101007_add_soft_deletes_to_categories_table', 2),
(7, '2023_07_23_075145_create_stores_table', 3),
(8, '2023_07_23_081255_create_products_table', 4),
(9, '2023_07_23_084451_create_products_table', 5),
(10, '2023_07_23_085214_add_store_id_to_users_table', 6),
(11, '2023_07_24_144927_create_profiles_table', 7),
(12, '2023_07_25_135818_create_tags_table', 8),
(13, '2023_07_25_140052_create_product_tag_table', 8),
(14, '2023_07_29_183505_add_type_column_to_users_table', 9),
(15, '2023_07_29_193040_add_last_activ_at_column_to_users_table', 10),
(17, '2023_07_30_102912_create_carts_table', 11),
(18, '2023_08_01_141357_create_orders_table', 12),
(19, '2023_08_01_142400_create_order_items_table', 12),
(20, '2023_08_01_143737_create_order_addresses_table', 12),
(21, '2023_08_03_095333_add_quantity_column_to_products_table', 13),
(22, '2023_08_04_185429_create_notifications_table', 14),
(23, '2014_10_12_200000_add_two_factor_columns_to_users_table', 15),
(24, '2023_08_06_131123_create_admins_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0dc6f5e3-f742-452b-b98a-6274bce64c8e', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 1, '{\"body\":\"a new order 20230081<br\\/>created by-mostafaismail<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":88}', NULL, '2023-08-05 10:31:55', '2023-08-05 10:31:55'),
('0eab59d7-cbdc-415b-8f10-ecfacfe21db3', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230063<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":70}', NULL, '2023-08-04 21:25:07', '2023-08-04 21:25:07'),
('388a30a5-2814-4f9e-83c8-aba5ec70cdb5', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230067<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":74}', NULL, '2023-08-04 21:34:28', '2023-08-04 21:34:28'),
('3a8c30c4-548a-4051-89bc-d0493df8639b', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230043<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":50}', NULL, '2023-08-04 20:13:54', '2023-08-04 20:13:54'),
('4535e23d-bf78-4884-b052-16a23d68d24b', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230045<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":52}', NULL, '2023-08-04 20:19:51', '2023-08-04 20:19:51'),
('480f5954-6563-4729-8dae-544c5aa15731', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230085<br\\/>created by-mostafaismail<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":92}', NULL, '2023-08-05 10:41:36', '2023-08-05 10:41:36'),
('48b3d95c-3365-4cf9-b49f-d92c03daaec1', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230087<br\\/>created by-mostafaismail<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":94}', NULL, '2023-08-05 11:09:10', '2023-08-05 11:09:10'),
('4bf63cd4-8020-4f38-a413-b65fef8d6459', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230086<br\\/>created by-mostafaismail<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":93}', NULL, '2023-08-05 10:41:41', '2023-08-05 10:41:41'),
('574dfbfb-b6bd-4a03-9297-55f07ebe8757', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230037<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":44}', NULL, '2023-08-04 20:01:56', '2023-08-04 20:01:56'),
('6f5850e2-d6f6-4667-be7b-78d29de112d5', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230077<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":84}', NULL, '2023-08-04 21:49:07', '2023-08-04 21:49:07'),
('747388a1-0718-453d-a5c5-498bda4fb308', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230061<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":68}', NULL, '2023-08-04 20:57:05', '2023-08-04 20:57:05'),
('77e13b92-d34c-4d87-b393-b14d4daf0a4f', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230084<br\\/>created by-mostafaismail<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":91}', NULL, '2023-08-05 10:41:32', '2023-08-05 10:41:32'),
('845e32ad-ed0a-4cac-94ad-27fb35d2da41', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230055<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":62}', NULL, '2023-08-04 20:44:25', '2023-08-04 20:44:25'),
('89501f0f-1176-463a-9a80-461f73dfca98', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230051<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":58}', NULL, '2023-08-04 20:26:30', '2023-08-04 20:26:30'),
('9c7434ef-d3ad-43f3-836c-a2e45a1f7686', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230082<br\\/>created by-mostafaismail<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":89}', NULL, '2023-08-05 10:35:51', '2023-08-05 10:35:51'),
('9cf00f69-d8ea-41a9-96e5-4f6e0b93bca7', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230073<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":80}', NULL, '2023-08-04 21:44:38', '2023-08-04 21:44:38'),
('b7f4b921-ef75-4b55-8d04-786e9912dec4', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230039<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":46}', NULL, '2023-08-04 20:03:11', '2023-08-04 20:03:11'),
('bc339745-0363-4d34-95b0-c225985500f3', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230088<br\\/>created by-mostafaismail<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":95}', NULL, '2023-08-05 12:04:04', '2023-08-05 12:04:04'),
('c1744bd9-cc08-4e71-8d4a-86bc9e41f9e7', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230075<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":82}', NULL, '2023-08-04 21:46:43', '2023-08-04 21:46:43'),
('cac914c2-9330-423d-99be-f9e45c846aed', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230035<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":42}', '2023-08-04 19:29:23', '2023-08-04 16:08:29', '2023-08-04 19:29:23'),
('ccfe9acf-bc31-4835-b47b-7e251644e4c0', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230065<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":72}', NULL, '2023-08-04 21:29:30', '2023-08-04 21:29:30'),
('d15036c6-c1b5-4b08-882f-db9b05377c69', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230041<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":48}', NULL, '2023-08-04 20:08:26', '2023-08-04 20:08:26'),
('d903b0a9-0f76-4627-822a-c9a37c35e271', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230053<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":60}', NULL, '2023-08-04 20:30:38', '2023-08-04 20:30:38'),
('daadd945-28e7-47e5-a84a-695467c2b7c8', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230071<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":78}', NULL, '2023-08-04 21:38:59', '2023-08-04 21:38:59'),
('de4706d5-9b47-4c2a-a17f-bb2bdcbb16d9', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230057<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":64}', NULL, '2023-08-04 20:53:02', '2023-08-04 20:53:02'),
('e82da6cb-2f4a-4202-af64-362b773599eb', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230083<br\\/>created by-mostafaismail<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":90}', NULL, '2023-08-05 10:41:27', '2023-08-05 10:41:27'),
('f44caf76-2c58-4e8a-9dcc-4965c032757d', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 3, '{\"body\":\"a new order 20230079<br\\/>created by-mostafaeltawel<br \\/>from-\\u0645\\u0635\\u0631\",\"url\":\"http:\\/\\/localhost:8000\\/category\",\"icon\":\"fas fa-file\",\"order_id\":86}', NULL, '2023-08-05 09:52:59', '2023-08-05 09:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `status` enum('pending','processing','delivering','completed','cancelled','refunded') NOT NULL DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `store_id`, `user_id`, `number`, `payment_method`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(8, 13, NULL, '20230001', 'cod', 'pending', 'pending', '2023-08-01 16:25:12', '2023-08-01 16:25:12'),
(9, 11, NULL, '20230002', 'cod', 'pending', 'pending', '2023-08-01 16:26:18', '2023-08-01 16:26:18'),
(10, 10, NULL, '20230003', 'cod', 'pending', 'pending', '2023-08-03 07:32:47', '2023-08-03 07:32:47'),
(11, 10, NULL, '20230004', 'cod', 'pending', 'pending', '2023-08-03 07:34:55', '2023-08-03 07:34:55'),
(12, 10, NULL, '20230005', 'cod', 'pending', 'pending', '2023-08-03 07:37:17', '2023-08-03 07:37:17'),
(13, 10, NULL, '20230006', 'cod', 'pending', 'pending', '2023-08-03 07:42:24', '2023-08-03 07:42:24'),
(14, 10, NULL, '20230007', 'cod', 'pending', 'pending', '2023-08-03 07:45:55', '2023-08-03 07:45:55'),
(15, 10, NULL, '20230008', 'cod', 'pending', 'pending', '2023-08-03 07:46:20', '2023-08-03 07:46:20'),
(16, 10, NULL, '20230009', 'cod', 'pending', 'pending', '2023-08-03 07:46:58', '2023-08-03 07:46:58'),
(17, 10, NULL, '20230010', 'cod', 'pending', 'pending', '2023-08-03 08:06:40', '2023-08-03 08:06:40'),
(18, 10, NULL, '20230011', 'cod', 'pending', 'pending', '2023-08-04 11:22:21', '2023-08-04 11:22:21'),
(19, 10, NULL, '20230012', 'cod', 'pending', 'pending', '2023-08-04 11:23:05', '2023-08-04 11:23:05'),
(20, 10, NULL, '20230013', 'cod', 'pending', 'pending', '2023-08-04 11:24:13', '2023-08-04 11:24:13'),
(21, 10, NULL, '20230014', 'cod', 'pending', 'pending', '2023-08-04 11:25:39', '2023-08-04 11:25:39'),
(22, 10, NULL, '20230015', 'cod', 'pending', 'pending', '2023-08-04 11:31:19', '2023-08-04 11:31:19'),
(23, 10, NULL, '20230016', 'cod', 'pending', 'pending', '2023-08-04 11:35:03', '2023-08-04 11:35:03'),
(24, 10, NULL, '20230017', 'cod', 'pending', 'pending', '2023-08-04 11:35:58', '2023-08-04 11:35:58'),
(25, 10, NULL, '20230018', 'cod', 'pending', 'pending', '2023-08-04 11:37:29', '2023-08-04 11:37:29'),
(26, 10, NULL, '20230019', 'cod', 'pending', 'pending', '2023-08-04 11:39:42', '2023-08-04 11:39:42'),
(27, 10, NULL, '20230020', 'cod', 'pending', 'pending', '2023-08-04 11:41:20', '2023-08-04 11:41:20'),
(28, 10, NULL, '20230021', 'cod', 'pending', 'pending', '2023-08-04 11:49:45', '2023-08-04 11:49:45'),
(29, 10, NULL, '20230022', 'cod', 'pending', 'pending', '2023-08-04 11:51:06', '2023-08-04 11:51:06'),
(30, 12, NULL, '20230023', 'cod', 'pending', 'pending', '2023-08-04 12:10:04', '2023-08-04 12:10:04'),
(31, 10, NULL, '20230024', 'cod', 'pending', 'pending', '2023-08-04 12:10:05', '2023-08-04 12:10:05'),
(32, 10, NULL, '20230025', 'cod', 'pending', 'pending', '2023-08-04 12:14:13', '2023-08-04 12:14:13'),
(33, 12, NULL, '20230026', 'cod', 'pending', 'pending', '2023-08-04 12:14:13', '2023-08-04 12:14:13'),
(34, 11, NULL, '20230027', 'cod', 'pending', 'pending', '2023-08-04 12:18:36', '2023-08-04 12:18:36'),
(35, 10, NULL, '20230028', 'cod', 'pending', 'pending', '2023-08-04 12:18:37', '2023-08-04 12:18:37'),
(36, 11, NULL, '20230029', 'cod', 'pending', 'pending', '2023-08-04 12:20:08', '2023-08-04 12:20:08'),
(37, 10, NULL, '20230030', 'cod', 'pending', 'pending', '2023-08-04 12:20:08', '2023-08-04 12:20:08'),
(38, 11, NULL, '20230031', 'cod', 'pending', 'pending', '2023-08-04 12:23:10', '2023-08-04 12:23:10'),
(39, 10, NULL, '20230032', 'cod', 'pending', 'pending', '2023-08-04 12:23:10', '2023-08-04 12:23:10'),
(40, 11, NULL, '20230033', 'cod', 'pending', 'pending', '2023-08-04 12:24:24', '2023-08-04 12:24:24'),
(41, 10, NULL, '20230034', 'cod', 'pending', 'pending', '2023-08-04 12:24:24', '2023-08-04 12:24:24'),
(42, 10, NULL, '20230035', 'cod', 'pending', 'pending', '2023-08-04 16:07:42', '2023-08-04 16:07:42'),
(43, 11, NULL, '20230036', 'cod', 'pending', 'pending', '2023-08-04 20:01:51', '2023-08-04 20:01:51'),
(44, 10, NULL, '20230037', 'cod', 'pending', 'pending', '2023-08-04 20:01:52', '2023-08-04 20:01:52'),
(45, 11, NULL, '20230038', 'cod', 'pending', 'pending', '2023-08-04 20:03:08', '2023-08-04 20:03:08'),
(46, 10, NULL, '20230039', 'cod', 'pending', 'pending', '2023-08-04 20:03:08', '2023-08-04 20:03:08'),
(47, 11, NULL, '20230040', 'cod', 'pending', 'pending', '2023-08-04 20:08:01', '2023-08-04 20:08:01'),
(48, 10, NULL, '20230041', 'cod', 'pending', 'pending', '2023-08-04 20:08:01', '2023-08-04 20:08:01'),
(49, 11, NULL, '20230042', 'cod', 'pending', 'pending', '2023-08-04 20:13:21', '2023-08-04 20:13:21'),
(50, 10, NULL, '20230043', 'cod', 'pending', 'pending', '2023-08-04 20:13:22', '2023-08-04 20:13:22'),
(51, 11, NULL, '20230044', 'cod', 'pending', 'pending', '2023-08-04 20:19:23', '2023-08-04 20:19:23'),
(52, 10, NULL, '20230045', 'cod', 'pending', 'pending', '2023-08-04 20:19:23', '2023-08-04 20:19:23'),
(53, 11, NULL, '20230046', 'cod', 'pending', 'pending', '2023-08-04 20:22:50', '2023-08-04 20:22:50'),
(54, 10, NULL, '20230047', 'cod', 'pending', 'pending', '2023-08-04 20:22:50', '2023-08-04 20:22:50'),
(55, 11, NULL, '20230048', 'cod', 'pending', 'pending', '2023-08-04 20:23:59', '2023-08-04 20:23:59'),
(56, 10, NULL, '20230049', 'cod', 'pending', 'pending', '2023-08-04 20:23:59', '2023-08-04 20:23:59'),
(57, 11, NULL, '20230050', 'cod', 'pending', 'pending', '2023-08-04 20:25:42', '2023-08-04 20:25:42'),
(58, 10, NULL, '20230051', 'cod', 'pending', 'pending', '2023-08-04 20:25:42', '2023-08-04 20:25:42'),
(59, 11, NULL, '20230052', 'cod', 'pending', 'pending', '2023-08-04 20:30:11', '2023-08-04 20:30:11'),
(60, 10, NULL, '20230053', 'cod', 'pending', 'pending', '2023-08-04 20:30:11', '2023-08-04 20:30:11'),
(61, 11, NULL, '20230054', 'cod', 'pending', 'pending', '2023-08-04 20:43:51', '2023-08-04 20:43:51'),
(62, 10, NULL, '20230055', 'cod', 'pending', 'pending', '2023-08-04 20:43:51', '2023-08-04 20:43:51'),
(63, 11, NULL, '20230056', 'cod', 'pending', 'pending', '2023-08-04 20:52:59', '2023-08-04 20:52:59'),
(64, 10, NULL, '20230057', 'cod', 'pending', 'pending', '2023-08-04 20:52:59', '2023-08-04 20:52:59'),
(65, 11, NULL, '20230058', 'cod', 'pending', 'pending', '2023-08-04 20:53:15', '2023-08-04 20:53:15'),
(66, 10, NULL, '20230059', 'cod', 'pending', 'pending', '2023-08-04 20:53:15', '2023-08-04 20:53:15'),
(67, 11, NULL, '20230060', 'cod', 'pending', 'pending', '2023-08-04 20:56:39', '2023-08-04 20:56:39'),
(68, 10, NULL, '20230061', 'cod', 'pending', 'pending', '2023-08-04 20:56:41', '2023-08-04 20:56:41'),
(69, 11, NULL, '20230062', 'cod', 'pending', 'pending', '2023-08-04 21:25:04', '2023-08-04 21:25:04'),
(70, 10, NULL, '20230063', 'cod', 'pending', 'pending', '2023-08-04 21:25:04', '2023-08-04 21:25:04'),
(71, 11, NULL, '20230064', 'cod', 'pending', 'pending', '2023-08-04 21:29:06', '2023-08-04 21:29:06'),
(72, 10, NULL, '20230065', 'cod', 'pending', 'pending', '2023-08-04 21:29:06', '2023-08-04 21:29:06'),
(73, 11, NULL, '20230066', 'cod', 'pending', 'pending', '2023-08-04 21:34:25', '2023-08-04 21:34:25'),
(74, 10, NULL, '20230067', 'cod', 'pending', 'pending', '2023-08-04 21:34:25', '2023-08-04 21:34:25'),
(75, 11, NULL, '20230068', 'cod', 'pending', 'pending', '2023-08-04 21:36:52', '2023-08-04 21:36:52'),
(76, 10, NULL, '20230069', 'cod', 'pending', 'pending', '2023-08-04 21:36:52', '2023-08-04 21:36:52'),
(77, 11, NULL, '20230070', 'cod', 'pending', 'pending', '2023-08-04 21:38:14', '2023-08-04 21:38:14'),
(78, 10, NULL, '20230071', 'cod', 'pending', 'pending', '2023-08-04 21:38:14', '2023-08-04 21:38:14'),
(79, 11, NULL, '20230072', 'cod', 'pending', 'pending', '2023-08-04 21:44:35', '2023-08-04 21:44:35'),
(80, 10, NULL, '20230073', 'cod', 'pending', 'pending', '2023-08-04 21:44:35', '2023-08-04 21:44:35'),
(81, 11, NULL, '20230074', 'cod', 'pending', 'pending', '2023-08-04 21:46:40', '2023-08-04 21:46:40'),
(82, 10, NULL, '20230075', 'cod', 'pending', 'pending', '2023-08-04 21:46:41', '2023-08-04 21:46:41'),
(83, 11, NULL, '20230076', 'cod', 'pending', 'pending', '2023-08-04 21:48:43', '2023-08-04 21:48:43'),
(84, 10, NULL, '20230077', 'cod', 'pending', 'pending', '2023-08-04 21:48:43', '2023-08-04 21:48:43'),
(85, 11, NULL, '20230078', 'cod', 'pending', 'pending', '2023-08-05 09:52:05', '2023-08-05 09:52:05'),
(86, 10, NULL, '20230079', 'cod', 'pending', 'pending', '2023-08-05 09:52:06', '2023-08-05 09:52:06'),
(87, 11, NULL, '20230080', 'cod', 'pending', 'pending', '2023-08-05 10:30:38', '2023-08-05 10:30:38'),
(88, 11, NULL, '20230081', 'cod', 'pending', 'pending', '2023-08-05 10:31:51', '2023-08-05 10:31:51'),
(89, 10, NULL, '20230082', 'cod', 'pending', 'pending', '2023-08-05 10:35:48', '2023-08-05 10:35:48'),
(90, 10, NULL, '20230083', 'cod', 'pending', 'pending', '2023-08-05 10:40:43', '2023-08-05 10:40:43'),
(91, 10, NULL, '20230084', 'cod', 'pending', 'pending', '2023-08-05 10:41:29', '2023-08-05 10:41:29'),
(92, 10, NULL, '20230085', 'cod', 'pending', 'pending', '2023-08-05 10:41:34', '2023-08-05 10:41:34'),
(93, 10, NULL, '20230086', 'cod', 'pending', 'pending', '2023-08-05 10:41:38', '2023-08-05 10:41:38'),
(94, 10, NULL, '20230087', 'cod', 'pending', 'pending', '2023-08-05 11:09:06', '2023-08-05 11:09:06'),
(95, 10, NULL, '20230088', 'cod', 'pending', 'pending', '2023-08-05 12:03:39', '2023-08-05 12:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('billing','shipping') NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` char(2) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_addresses`
--

INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `email`, `phone_number`, `street_address`, `city`, `country`, `state`, `postal_code`) VALUES
(17, 13, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(18, 13, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(19, 14, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(20, 14, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(21, 15, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(22, 15, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(23, 16, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(24, 16, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(25, 17, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(26, 17, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(27, 18, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(28, 18, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(29, 19, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(30, 19, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(31, 20, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(32, 20, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(33, 21, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(34, 21, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(35, 22, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(36, 22, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(37, 23, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(38, 23, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(39, 24, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(40, 24, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(41, 25, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(42, 25, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(43, 26, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(44, 26, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(45, 27, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(46, 27, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(47, 28, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(48, 28, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(49, 29, 'billing', 'mostafa', 'ismai', NULL, '01066235786', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(50, 29, 'shipping', 'mostafa', 'ismai', NULL, '01066235786', 'minia egypt', 'minia', 'EG', 'aboqurqas', '086'),
(51, 30, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(52, 30, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(53, 31, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(54, 31, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(55, 32, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(56, 32, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(57, 33, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(58, 33, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(59, 34, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(60, 34, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(61, 35, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(62, 35, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(63, 36, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(64, 36, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(65, 37, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(66, 37, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(67, 38, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(68, 38, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(69, 39, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(70, 39, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(71, 40, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(72, 40, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(73, 41, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(74, 41, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(75, 42, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(76, 42, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(77, 43, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(78, 43, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(79, 44, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(80, 44, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(81, 45, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(82, 45, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(83, 46, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(84, 46, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(85, 47, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(86, 47, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(87, 48, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(88, 48, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(89, 49, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(90, 49, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(91, 50, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(92, 50, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(93, 51, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(94, 51, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(95, 52, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(96, 52, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(97, 53, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(98, 53, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(99, 54, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(100, 54, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(101, 55, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(102, 55, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(103, 56, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(104, 56, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(105, 57, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(106, 57, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(107, 58, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(108, 58, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(109, 59, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(110, 59, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(111, 60, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(112, 60, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(113, 61, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(114, 61, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(115, 62, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(116, 62, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(117, 63, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(118, 63, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(119, 64, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(120, 64, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(121, 65, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(122, 65, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(123, 66, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(124, 66, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(125, 67, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(126, 67, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(127, 68, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(128, 68, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(129, 69, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(130, 69, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(131, 70, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(132, 70, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(133, 71, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(134, 71, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(135, 72, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(136, 72, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(137, 73, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(138, 73, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(139, 74, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(140, 74, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(141, 75, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(142, 75, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(143, 76, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(144, 76, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(145, 77, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(146, 77, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(147, 78, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(148, 78, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(149, 79, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(150, 79, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(151, 80, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(152, 80, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(153, 81, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(154, 81, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(155, 82, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(156, 82, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(157, 83, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(158, 83, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(159, 84, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(160, 84, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'IS', 'aboqurqas', '086'),
(161, 85, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(162, 85, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(163, 86, 'billing', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(164, 86, 'shipping', 'mostafa', 'eltawel', NULL, '01553086476', 'eltawel', 'minia', 'EG', 'aboqurqas', '086'),
(165, 87, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(166, 87, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(167, 88, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(168, 88, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(169, 89, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(170, 89, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(171, 90, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(172, 90, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(173, 91, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(174, 91, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(175, 92, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(176, 92, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(177, 93, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(178, 93, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(179, 94, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(180, 94, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(181, 95, 'billing', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086'),
(182, 95, 'shipping', 'mostafa', 'ismail', NULL, '123456789', 'eltawel', 'minia', 'EG', 'minia', '086');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`, `options`) VALUES
(7, 8, 132, 'Small Steel Shirt', 87.50, 1, NULL),
(8, 9, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(9, 10, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(10, 11, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(11, 12, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(12, 13, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(13, 14, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(14, 15, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(15, 16, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(16, 17, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(17, 18, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(18, 19, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(19, 20, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(20, 21, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(21, 22, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(22, 23, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(23, 24, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(24, 25, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(25, 26, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(26, 27, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(27, 28, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(28, 29, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(29, 30, 127, 'Gorgeous Wool Shirt', 109.80, 1, NULL),
(30, 31, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(31, 32, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(32, 33, 127, 'Gorgeous Wool Shirt', 109.80, 1, NULL),
(33, 34, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(34, 35, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(35, 36, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(36, 37, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(37, 38, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(38, 39, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(39, 40, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(40, 41, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(41, 42, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(42, 43, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(43, 44, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(44, 45, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(45, 46, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(46, 47, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(47, 48, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(48, 49, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(49, 50, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(50, 51, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(51, 52, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(52, 53, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(53, 54, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(54, 55, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(55, 56, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(56, 57, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(57, 58, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(58, 59, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(59, 60, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(60, 61, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(61, 62, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(62, 63, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(63, 64, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(64, 65, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(65, 66, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(66, 67, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(67, 68, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(68, 69, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(69, 70, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(70, 71, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(71, 72, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(72, 73, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(73, 74, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(74, 75, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(75, 76, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(76, 77, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(77, 78, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(78, 79, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(79, 80, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(80, 81, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(81, 82, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(82, 83, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(83, 84, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(84, 85, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(85, 86, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(86, 87, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(87, 88, 126, 'Ergonomic Wooden Clock', 187.70, 1, NULL),
(88, 89, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(89, 90, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(90, 91, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(91, 92, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(92, 93, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(93, 94, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL),
(94, 95, 128, 'Mediocre Copper Lamp', 55.40, 1, NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'PostmanRuntime/7.32.3', '4ba2ea45873e2338e73b5a3942535fc1e36a7c962743914e46d2e0a5fb2f3abf', '[\"*\"]', NULL, '2023-08-09 19:49:20', '2023-08-09 19:49:20'),
(5, 'App\\Models\\User', 4, 'PostmanRuntime/7.32.3', 'cafd4453a18efe014c0eaa38346e9e552467d114ea8a02521667132104a1a1d8', '[\"product.delete\",\"product.update\"]', '2023-08-09 20:52:34', '2023-08-09 20:33:25', '2023-08-09 20:52:34'),
(6, 'App\\Models\\User', 4, 'PostmanRuntime/7.32.3', '39ba25d1eeae6ff3eb9d7106f10e4863fa3856f126d36284b72780198ef322ee', '[\"product.delete\",\"product.update\",\"product.update\"]', NULL, '2023-08-09 20:41:15', '2023-08-09 20:41:15'),
(7, 'App\\Models\\User', 4, 'PostmanRuntime/7.32.3', '7267ee6034429e09c0f996943726dc0a876e2c7010aa0f64a10c23d83929f44f', '[\"product.delete\",\"product.update\",\"product.create\"]', '2023-08-09 20:54:34', '2023-08-09 20:41:34', '2023-08-09 20:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `compare_price` double(8,2) DEFAULT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','draft','archived') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `store_id`, `category_id`, `name`, `slug`, `description`, `image`, `price`, `compare_price`, `quantity`, `options`, `rating`, `featured`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 9, 36, 'quis dolore nam vel repellendus', 'quis-dolore-nam-vel-repellendus', 'Voluptatem fugiat id consequatur qui ab animi unde harum soluta dolorem quis.', 'https://via.placeholder.com/600x600.png/0011ee?text=doloribus', 113.90, 587.10, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(3, 10, 41, 'eaque assumenda veniam occaecati unde', 'eaque-assumenda-veniam-occaecati-unde', 'Dolorum non qui repellendus cumque omnis ullam vitae beatae voluptas illo deleniti labore inventore provident et esse iusto voluptatem reprehenderit.', 'https://via.placeholder.com/600x600.png/004433?text=atque', 301.90, 886.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(4, 10, 35, 'quos delectus tempore quia accusantium', 'quos-delectus-tempore-quia-accusantium', 'Et esse voluptatem voluptas magnam ipsum quasi asperiores eius dolor quis eveniet eos.', 'https://via.placeholder.com/600x600.png/000077?text=dolores', 159.90, 525.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(5, 9, 32, 'voluptatem laudantium et provident molestiae', 'voluptatem-laudantium-et-provident-molestiae', 'Sequi cumque asperiores et illo veritatis est fuga in accusamus tempora reiciendis et.', 'https://via.placeholder.com/600x600.png/00dd00?text=dolores', 155.30, 954.70, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(6, 10, 38, 'eos mollitia expedita vero similique', 'eos-mollitia-expedita-vero-similique', 'Unde possimus quasi ipsum repudiandae ea harum impedit ut rerum consequatur fugit sit aut nostrum voluptatibus dolorem ut.', 'https://via.placeholder.com/600x600.png/00aa88?text=ratione', 287.90, 897.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(7, 6, 37, 'accusamus quasi quis ut et', 'accusamus-quasi-quis-ut-et', 'Harum possimus adipisci asperiores aut fugiat veniam odio unde quo recusandae quo esse corporis alias porro perferendis.', 'https://via.placeholder.com/600x600.png/007799?text=assumenda', 135.90, 976.70, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(8, 6, 38, 'cupiditate ut dolorem quis repudiandae', 'cupiditate-ut-dolorem-quis-repudiandae', 'Voluptatem vitae aperiam maxime expedita quo dolorum voluptatum qui est ratione recusandae unde libero dolores ullam inventore rerum labore.', 'https://via.placeholder.com/600x600.png/004466?text=aperiam', 273.50, 516.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(9, 6, 33, 'et nisi quis aut odit', 'et-nisi-quis-aut-odit', 'Omnis alias cupiditate sapiente tempore sequi aliquid eius quibusdam et similique qui ut ea quia magnam recusandae itaque perferendis.', 'https://via.placeholder.com/600x600.png/0055dd?text=quia', 434.20, 529.50, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(10, 10, 40, 'delectus sit ut corrupti nostrum', 'delectus-sit-ut-corrupti-nostrum', 'Odio laboriosam eveniet aperiam quas dolor vitae et velit et non mollitia commodi beatae soluta iusto suscipit.', 'https://via.placeholder.com/600x600.png/003377?text=porro', 467.10, 527.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(11, 9, 32, 'aut maxime ipsa dolores aut', 'aut-maxime-ipsa-dolores-aut', 'Reiciendis aspernatur doloremque neque vel assumenda est ipsum inventore occaecati sequi esse et debitis mollitia inventore aut quia.', 'https://via.placeholder.com/600x600.png/006666?text=eligendi', 418.80, 967.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(12, 7, 38, 'omnis id quos nam deleniti', 'omnis-id-quos-nam-deleniti', 'Inventore quo nemo sint natus commodi rerum eum itaque culpa alias modi dolor explicabo officiis culpa recusandae aut quam.', 'https://via.placeholder.com/600x600.png/009933?text=vitae', 297.50, 930.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(13, 10, 37, 'reprehenderit est minima deserunt quod', 'reprehenderit-est-minima-deserunt-quod', 'Rerum a libero natus aut inventore minima et omnis reprehenderit alias dolorem.', 'https://via.placeholder.com/600x600.png/00ff88?text=maxime', 218.70, 580.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(14, 9, 40, 'culpa aspernatur libero iusto maiores', 'culpa-aspernatur-libero-iusto-maiores', 'Dignissimos iste ratione consequatur eos debitis dolores consequuntur omnis consequatur neque.', 'https://via.placeholder.com/600x600.png/005599?text=corrupti', 307.60, 759.60, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(15, 9, 38, 'repudiandae facere quia corporis voluptatem', 'repudiandae-facere-quia-corporis-voluptatem', 'Distinctio rerum sunt unde aut rem minus quasi est facere dolor sint dolorem blanditiis ex adipisci consequuntur nisi.', 'https://via.placeholder.com/600x600.png/0088ff?text=praesentium', 423.90, 754.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(16, 7, 34, 'dolorum quidem magnam sapiente qui', 'dolorum-quidem-magnam-sapiente-qui', 'Iusto facere laudantium beatae excepturi fugit omnis consequatur cupiditate ipsam dolorem voluptatem eligendi commodi atque quas aut et illo quos.', 'https://via.placeholder.com/600x600.png/0055aa?text=sunt', 142.20, 745.60, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(17, 7, 34, 'et consectetur eos nostrum aut', 'et-consectetur-eos-nostrum-aut', 'Et molestiae autem voluptatem atque omnis corrupti ea tempora deleniti voluptatem.', 'https://via.placeholder.com/600x600.png/00dddd?text=tempore', 476.90, 708.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(18, 8, 32, 'minima quia aut veritatis animi', 'minima-quia-aut-veritatis-animi', 'Vitae illo rerum iusto et nihil dolorum natus eum laboriosam reiciendis aut natus ut sapiente placeat molestiae cum unde sunt.', 'https://via.placeholder.com/600x600.png/00ffdd?text=corrupti', 290.20, 626.10, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(19, 9, 37, 'id nobis numquam maxime pariatur', 'id-nobis-numquam-maxime-pariatur', 'Vel nisi enim rerum eveniet cum ut impedit quia occaecati eum quod ipsum nihil sequi porro eos eos nostrum iusto eum eligendi.', 'https://via.placeholder.com/600x600.png/004488?text=voluptatem', 450.80, 970.50, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(21, 8, 36, 'et est occaecati et quis', 'et-est-occaecati-et-quis', 'Itaque voluptatem quos et natus ratione excepturi officiis iusto eaque.', 'https://via.placeholder.com/600x600.png/00ffaa?text=ad', 49.90, 880.20, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:17', '2023-07-23 05:46:17', NULL),
(22, 6, 41, 'vero maxime vitae officiis eos', 'vero-maxime-vitae-officiis-eos', 'Reprehenderit quos voluptatibus tenetur occaecati consequatur molestiae rerum odit nulla aut quia neque molestiae ratione illum quis.', 'https://via.placeholder.com/600x600.png/0033dd?text=alias', 342.50, 722.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(23, 6, 34, 'omnis sequi nam nulla neque', 'omnis-sequi-nam-nulla-neque', 'Repudiandae ratione saepe eum sequi optio enim quisquam aut eum rerum ut a ut repudiandae eos.', 'https://via.placeholder.com/600x600.png/003333?text=molestiae', 134.60, 632.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(24, 9, 38, 'modi ducimus culpa in temporibus', 'modi-ducimus-culpa-in-temporibus', 'Ut consequatur maxime accusantium et consequatur voluptatem sint possimus cumque modi error consequatur vero at vero sunt magnam a sit dolorem.', 'https://via.placeholder.com/600x600.png/00ccdd?text=vel', 242.90, 694.60, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(25, 9, 34, 'magni voluptatem nisi expedita accusantium', 'magni-voluptatem-nisi-expedita-accusantium', 'Nihil quia impedit blanditiis eum omnis autem nesciunt quia voluptas dolore autem beatae odit ipsum ut excepturi eligendi perferendis.', 'https://via.placeholder.com/600x600.png/000088?text=aliquam', 371.10, 943.50, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(26, 7, 41, 'error nemo itaque fugit dolores', 'error-nemo-itaque-fugit-dolores', 'Quas exercitationem asperiores aut vero beatae nihil laborum aperiam inventore.', 'https://via.placeholder.com/600x600.png/007766?text=at', 451.20, 536.90, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(27, 9, 39, 'aut modi tempore quaerat fugiat', 'aut-modi-tempore-quaerat-fugiat', 'Sit laborum laboriosam necessitatibus rerum vel quia fugiat accusamus in ut iste qui dignissimos voluptatem quisquam quidem.', 'https://via.placeholder.com/600x600.png/00ccbb?text=temporibus', 220.90, 935.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(28, 6, 41, 'ea qui recusandae fugiat voluptatum', 'ea-qui-recusandae-fugiat-voluptatum', 'Officiis tempore quos dolores corporis dolor itaque aspernatur deserunt natus.', 'https://via.placeholder.com/600x600.png/009966?text=exercitationem', 276.50, 731.20, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(29, 10, 33, 'facilis quas consequatur eos expedita', 'facilis-quas-consequatur-eos-expedita', 'Vel mollitia magnam est odio aut enim atque ut maxime non voluptas animi commodi aut laboriosam vel corporis.', 'https://via.placeholder.com/600x600.png/006688?text=autem', 147.90, 851.10, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(30, 8, 40, 'neque sapiente sed rerum odit', 'neque-sapiente-sed-rerum-odit', 'Facilis occaecati est voluptas error voluptas sunt officiis illo et incidunt.', 'https://via.placeholder.com/600x600.png/00ff88?text=quibusdam', 35.00, 611.80, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(31, 7, 40, 'ut quibusdam neque asperiores ut', 'ut-quibusdam-neque-asperiores-ut', 'Expedita similique aspernatur ratione minus quo mollitia autem neque dolorem id ipsum earum nulla omnis sequi pariatur asperiores perferendis voluptas.', 'https://via.placeholder.com/600x600.png/00dd11?text=ut', 79.10, 877.60, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(32, 8, 35, 'sit fuga accusantium est reiciendis', 'sit-fuga-accusantium-est-reiciendis', 'Dolorum minus impedit repellat necessitatibus quis qui est cumque hic accusantium ea.', 'https://via.placeholder.com/600x600.png/00bbbb?text=facere', 413.50, 923.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(33, 10, 37, 'alias modi unde repellat praesentium', 'alias-modi-unde-repellat-praesentium', 'Non et iusto ut dicta ratione atque quos laudantium eaque eaque beatae aut itaque ea aut.', 'https://via.placeholder.com/600x600.png/00cc77?text=aliquam', 25.90, 955.60, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(34, 8, 32, 'nostrum alias et et possimus', 'nostrum-alias-et-et-possimus', 'Est quo velit tempore et nostrum possimus nam vero consectetur maxime similique voluptate molestias unde molestias autem et.', 'https://via.placeholder.com/600x600.png/009944?text=sapiente', 346.00, 806.70, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(35, 10, 34, 'ducimus et aut voluptatum qui', 'ducimus-et-aut-voluptatum-qui', 'Eum quod quas veritatis temporibus nam ut repudiandae voluptatibus qui incidunt dolor rem quam et nobis.', 'https://via.placeholder.com/600x600.png/0033ff?text=sit', 200.00, 937.90, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-08-07 22:57:51', NULL),
(36, 9, 35, 'qui cumque non id et', 'qui-cumque-non-id-et', 'Voluptatem dolorum aliquid possimus et consequatur quam iure beatae aut pariatur ea qui eos qui tempora animi nesciunt deleniti ad quis et.', 'https://via.placeholder.com/600x600.png/00cc88?text=ratione', 16.40, 966.70, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(37, 9, 34, 'ex quasi maxime ea ullam', 'ex-quasi-maxime-ea-ullam', 'Saepe cum quos sequi fugit possimus ut expedita numquam rem sit.', 'https://via.placeholder.com/600x600.png/006622?text=ipsa', 437.30, 590.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(38, 8, 40, 'omnis asperiores vitae suscipit molestias', 'omnis-asperiores-vitae-suscipit-molestias', 'Quam adipisci alias voluptas asperiores est quasi deleniti non id ut et laudantium dolorum animi in dolorem atque consequatur.', 'https://via.placeholder.com/600x600.png/00cc44?text=tempore', 88.80, 694.30, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(39, 9, 33, 'quibusdam omnis deserunt ratione dolores', 'quibusdam-omnis-deserunt-ratione-dolores', 'Vero dolorem dicta dolorum deleniti qui quae maiores eius non provident.', 'https://via.placeholder.com/600x600.png/00ee55?text=molestiae', 175.40, 785.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(40, 6, 37, 'aut consequatur recusandae fugit voluptas', 'aut-consequatur-recusandae-fugit-voluptas', 'Molestiae veniam esse doloremque ut dolor dicta dolor maxime repellat maxime quasi autem illo autem.', 'https://via.placeholder.com/600x600.png/007711?text=recusandae', 409.20, 861.70, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(41, 9, 39, 'eligendi consequatur ipsum officia aut', 'eligendi-consequatur-ipsum-officia-aut', 'Nihil quae et dolor non architecto repellat beatae et aliquid distinctio aut non quo facilis doloremque neque.', 'https://via.placeholder.com/600x600.png/008866?text=porro', 370.40, 916.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(42, 8, 34, 'eveniet et ab ut consequatur', 'eveniet-et-ab-ut-consequatur', 'Pariatur veniam vitae fugit fugiat hic corporis facere dolor et debitis debitis sunt ipsa laboriosam aperiam labore omnis.', 'https://via.placeholder.com/600x600.png/0000bb?text=dolor', 417.90, 654.60, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(43, 6, 35, 'aut aut consequatur repudiandae rerum', 'aut-aut-consequatur-repudiandae-rerum', 'Dolores aut expedita eos accusantium dolorem fuga sed dolorem quos quos.', 'https://via.placeholder.com/600x600.png/007700?text=aspernatur', 51.30, 833.30, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(44, 10, 39, 'aperiam quasi dolores dolores deleniti', 'aperiam-quasi-dolores-dolores-deleniti', 'Amet consequatur architecto eum consequatur dolorem laboriosam repellendus quis quos id ad facere.', 'https://via.placeholder.com/600x600.png/00ffee?text=perferendis', 187.20, 662.20, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(45, 6, 36, 'laborum deserunt quae illum quam', 'laborum-deserunt-quae-illum-quam', 'Ut quos rerum ab quo officia aut qui veniam vel dolor molestias aut.', 'https://via.placeholder.com/600x600.png/00aa77?text=aut', 263.40, 877.90, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(46, 9, 41, 'laboriosam non dolorem reiciendis hic', 'laboriosam-non-dolorem-reiciendis-hic', 'Neque nobis in rerum iusto exercitationem reprehenderit consectetur quia soluta voluptatem nihil laudantium nulla optio.', 'https://via.placeholder.com/600x600.png/00ff99?text=eum', 341.50, 760.20, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(47, 8, 41, 'libero sed praesentium laboriosam eos', 'libero-sed-praesentium-laboriosam-eos', 'Tenetur alias saepe quo nihil voluptas et qui quia omnis maiores ut quam vero minus.', 'https://via.placeholder.com/600x600.png/0077ee?text=asperiores', 324.90, 598.90, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(48, 8, 40, 'commodi et et dolorum dolorum', 'commodi-et-et-dolorum-dolorum', 'Dolorum et ullam voluptates et officiis saepe eius perferendis quisquam et quaerat quisquam dolorem et sed aperiam quam.', 'https://via.placeholder.com/600x600.png/001155?text=velit', 343.50, 684.20, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(49, 10, 41, 'quo deserunt perferendis beatae quia', 'quo-deserunt-perferendis-beatae-quia', 'Porro odit aut eos quos dolores exercitationem est non ea sed voluptate quasi quisquam animi impedit aut.', 'https://via.placeholder.com/600x600.png/008800?text=omnis', 325.50, 583.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(50, 9, 41, 'odit beatae cupiditate quia qui', 'odit-beatae-cupiditate-quia-qui', 'Laboriosam distinctio aut voluptatibus fugit amet architecto molestiae dolorem in et culpa sit qui nemo aut quia id soluta qui sed.', 'https://via.placeholder.com/600x600.png/009922?text=earum', 496.10, 703.60, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(51, 6, 38, 'et quia deleniti debitis pariatur', 'et-quia-deleniti-debitis-pariatur', 'Incidunt nihil qui repudiandae ea molestias deserunt cum reiciendis iure placeat repellendus laborum nesciunt fugiat vero quas doloremque.', 'https://via.placeholder.com/600x600.png/003355?text=ea', 132.60, 923.60, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(52, 9, 34, 'et quia non voluptatem repellendus', 'et-quia-non-voluptatem-repellendus', 'Voluptates cum possimus iusto placeat qui nostrum necessitatibus dolore facilis cupiditate doloribus adipisci est vero voluptas aut veritatis sit et nihil.', 'https://via.placeholder.com/600x600.png/00dd44?text=fuga', 39.30, 906.30, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(53, 8, 35, 'dolorem delectus ullam quo exercitationem', 'dolorem-delectus-ullam-quo-exercitationem', 'Reprehenderit aliquid quam vel ab quibusdam sed vel ea et totam necessitatibus.', 'https://via.placeholder.com/600x600.png/004411?text=voluptatem', 275.90, 555.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(54, 9, 37, 'at labore modi odit odit', 'at-labore-modi-odit-odit', 'Reiciendis autem sunt sequi laboriosam dolor asperiores corrupti tempora voluptatem voluptas.', 'https://via.placeholder.com/600x600.png/0066ff?text=labore', 370.80, 872.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(55, 9, 40, 'recusandae sunt quo et aliquam', 'recusandae-sunt-quo-et-aliquam', 'Ratione praesentium recusandae molestiae non odit qui beatae fuga omnis nemo earum quos.', 'https://via.placeholder.com/600x600.png/0088bb?text=a', 21.10, 729.00, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(56, 10, 33, 'sapiente excepturi mollitia sed eum', 'sapiente-excepturi-mollitia-sed-eum', 'Ea laudantium voluptatem sit aut et tenetur et architecto sit cum et omnis dolore et eos aut quasi.', 'https://via.placeholder.com/600x600.png/0022ee?text=dolores', 7.50, 506.90, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(57, 8, 38, 'tempora quis placeat blanditiis minima', 'tempora-quis-placeat-blanditiis-minima', 'Dicta voluptatem recusandae iusto quo aut aut ducimus enim quod.', 'https://via.placeholder.com/600x600.png/009966?text=ad', 42.90, 524.10, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(58, 8, 34, 'illo debitis et omnis inventore', 'illo-debitis-et-omnis-inventore', 'Qui libero corporis consectetur quidem sit neque et consectetur rerum est sit.', 'https://via.placeholder.com/600x600.png/007700?text=repellendus', 349.40, 662.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(59, 6, 34, 'accusantium expedita consequatur et quis', 'accusantium-expedita-consequatur-et-quis', 'Nobis ex vero non voluptatum non qui numquam perspiciatis aut porro nesciunt soluta ducimus.', 'https://via.placeholder.com/600x600.png/00ccbb?text=sed', 259.30, 560.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(60, 6, 38, 'itaque iste facere asperiores qui', 'itaque-iste-facere-asperiores-qui', 'Et nulla assumenda quasi maxime vel at in modi ducimus illum et cum molestiae.', 'https://via.placeholder.com/600x600.png/00bb88?text=nisi', 462.70, 535.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(61, 9, 41, 'est dicta temporibus quasi aliquid', 'est-dicta-temporibus-quasi-aliquid', 'Voluptatem adipisci accusantium eum quo ab unde illo dolores expedita qui et dolorem qui nobis.', 'https://via.placeholder.com/600x600.png/002288?text=est', 194.20, 541.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:18', '2023-07-23 05:46:18', NULL),
(62, 9, 41, 'dolores minima natus molestiae at', 'dolores-minima-natus-molestiae-at', 'Minus est atque quisquam quia cumque mollitia perferendis harum illo repudiandae voluptate.', 'https://via.placeholder.com/600x600.png/0022ee?text=exercitationem', 131.30, 561.80, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(63, 9, 40, 'rerum aut sapiente qui et', 'rerum-aut-sapiente-qui-et', 'Qui error itaque quis molestiae odio blanditiis nobis iusto est harum esse omnis ipsam ut dolor aut vero.', 'https://via.placeholder.com/600x600.png/004444?text=optio', 351.50, 736.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(64, 10, 41, 'necessitatibus deserunt rerum aliquid molestiae', 'necessitatibus-deserunt-rerum-aliquid-molestiae', 'Voluptatem distinctio quis qui at voluptas vel ea ut vitae explicabo soluta voluptatem.', 'https://via.placeholder.com/600x600.png/00aa55?text=adipisci', 345.80, 656.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(65, 10, 40, 'id voluptates dicta voluptates explicabo', 'id-voluptates-dicta-voluptates-explicabo', 'Sit dolore suscipit quibusdam et illo porro ut cupiditate facere quia veritatis necessitatibus nemo aperiam dolorum temporibus.', 'https://via.placeholder.com/600x600.png/00ee66?text=commodi', 413.70, 875.90, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(66, 10, 33, 'in et at at quis', 'in-et-at-at-quis', 'Incidunt rerum labore animi quia dicta veniam pariatur excepturi ut totam dolore aut voluptatem quod autem voluptatem et non quidem dolor.', 'https://via.placeholder.com/600x600.png/00ddee?text=accusantium', 351.30, 890.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(67, 6, 36, 'ipsam odit voluptatem voluptatem tempora', 'ipsam-odit-voluptatem-voluptatem-tempora', 'Velit eos deleniti atque consequatur provident eum consectetur consectetur debitis incidunt accusantium quaerat iure quod qui id aut excepturi neque molestias.', 'https://via.placeholder.com/600x600.png/005522?text=ea', 325.10, 645.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(68, 8, 41, 'perferendis culpa laborum earum facilis', 'perferendis-culpa-laborum-earum-facilis', 'Ipsam ut ipsam placeat adipisci omnis ea natus repellat saepe et aperiam.', 'https://via.placeholder.com/600x600.png/00aa99?text=sed', 7.80, 651.20, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(69, 6, 32, 'nihil est asperiores hic repudiandae', 'nihil-est-asperiores-hic-repudiandae', 'Perferendis quas debitis delectus inventore incidunt blanditiis doloremque odio quia fugit sed est praesentium deserunt officia ut vel dolorem laborum.', 'https://via.placeholder.com/600x600.png/003355?text=aspernatur', 369.00, 504.10, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(70, 7, 41, 'in officia quam ex nihil', 'in-officia-quam-ex-nihil', 'Asperiores reprehenderit porro nobis et inventore corrupti nesciunt officia sed provident illum eum dignissimos.', 'https://via.placeholder.com/600x600.png/00cc99?text=praesentium', 253.40, 705.80, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(71, 6, 32, 'consectetur reprehenderit nam sed error', 'consectetur-reprehenderit-nam-sed-error', 'Aut sunt accusantium repudiandae tenetur et iusto suscipit minima ea et repudiandae molestiae.', 'https://via.placeholder.com/600x600.png/007777?text=laborum', 94.40, 810.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(72, 9, 37, 'autem excepturi beatae ut maiores', 'autem-excepturi-beatae-ut-maiores', 'Voluptatem maiores ut nisi perferendis molestias fugit sapiente et sunt eius beatae reprehenderit at ea.', 'https://via.placeholder.com/600x600.png/002222?text=fugiat', 328.20, 872.50, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(73, 7, 35, 'consectetur velit voluptatum consectetur corrupti', 'consectetur-velit-voluptatum-consectetur-corrupti', 'A exercitationem molestiae asperiores voluptas maxime et itaque enim incidunt et.', 'https://via.placeholder.com/600x600.png/00bbdd?text=rerum', 266.80, 555.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(74, 10, 37, 'facilis enim quo eos alias', 'facilis-enim-quo-eos-alias', 'Velit nobis et enim voluptates aut aut dolorem in sunt ut vitae cumque quia.', 'https://via.placeholder.com/600x600.png/00cc33?text=et', 423.80, 564.80, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(75, 10, 39, 'est vel quis saepe dignissimos', 'est-vel-quis-saepe-dignissimos', 'Voluptatem eaque voluptatum omnis quo saepe velit similique voluptas expedita vero earum quibusdam autem aut.', 'https://via.placeholder.com/600x600.png/0033cc?text=velit', 376.40, 589.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(76, 8, 36, 'voluptates dolores dolorum ut quae', 'voluptates-dolores-dolorum-ut-quae', 'Tempore aspernatur et dolore eum perferendis in explicabo dolorem nemo recusandae officia et eligendi molestiae voluptate excepturi.', 'https://via.placeholder.com/600x600.png/0055ee?text=non', 382.10, 545.20, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(77, 6, 34, 'ut optio magnam velit et', 'ut-optio-magnam-velit-et', 'Officiis praesentium sapiente sapiente culpa minus aut dolor quasi repellendus molestias et libero beatae libero vel voluptatem.', 'https://via.placeholder.com/600x600.png/00ff66?text=cum', 394.60, 699.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(78, 10, 33, 'qui voluptas est sit sunt', 'qui-voluptas-est-sit-sunt', 'Voluptates et animi velit qui quis quia quia et dolores.', 'https://via.placeholder.com/600x600.png/0022cc?text=aut', 47.20, 727.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(79, 10, 36, 'id magni libero vel suscipit', 'id-magni-libero-vel-suscipit', 'Enim unde blanditiis suscipit et accusamus earum veniam odit quis reiciendis maiores quas corrupti cumque.', 'https://via.placeholder.com/600x600.png/003333?text=officia', 361.50, 887.10, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(80, 7, 34, 'error et unde voluptatem incidunt', 'error-et-unde-voluptatem-incidunt', 'Omnis unde rerum explicabo tempora velit blanditiis sed totam dolores eligendi sunt et quasi eum iste aspernatur rerum dolorum et recusandae.', 'https://via.placeholder.com/600x600.png/001155?text=ut', 319.40, 546.90, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(81, 10, 33, 'eum aut est consequatur voluptatum', 'eum-aut-est-consequatur-voluptatum', 'Asperiores dolor dolor deleniti quas dolores tenetur asperiores aperiam sed.', 'https://via.placeholder.com/600x600.png/0088cc?text=rerum', 293.00, 776.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(82, 10, 40, 'sint repellat quia qui tempora', 'sint-repellat-quia-qui-tempora', 'Eos pariatur ipsa optio facere ipsam numquam ullam aperiam dolor quod veniam.', 'https://via.placeholder.com/600x600.png/0022ff?text=ipsa', 328.10, 770.10, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(83, 6, 37, 'culpa aut quo reprehenderit qui', 'culpa-aut-quo-reprehenderit-qui', 'Aut explicabo iste et animi ipsa nemo sunt quia est rerum sunt cum iusto sunt.', 'https://via.placeholder.com/600x600.png/00cc22?text=consequatur', 2.20, 759.10, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(84, 9, 41, 'dolores sit ut dicta nihil', 'dolores-sit-ut-dicta-nihil', 'Aperiam nemo assumenda hic molestiae voluptatibus voluptatem atque aliquam laudantium aliquid voluptatibus itaque qui ex quasi aut eum beatae amet suscipit.', 'https://via.placeholder.com/600x600.png/004477?text=quia', 402.60, 637.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(85, 6, 34, 'modi porro officiis doloribus soluta', 'modi-porro-officiis-doloribus-soluta', 'Labore recusandae molestias facere ratione ratione ducimus quas voluptatem qui inventore accusantium non et illo voluptatum vitae.', 'https://via.placeholder.com/600x600.png/0077dd?text=possimus', 98.30, 786.60, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(86, 10, 38, 'aspernatur eaque voluptas saepe sint', 'aspernatur-eaque-voluptas-saepe-sint', 'Eligendi velit veniam dolorum provident eum voluptatem ab qui est commodi omnis repudiandae tenetur quasi.', 'https://via.placeholder.com/600x600.png/00ffee?text=est', 376.90, 875.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(87, 7, 35, 'non neque magni possimus ea', 'non-neque-magni-possimus-ea', 'Laborum rerum maxime enim sed vel asperiores dolores qui et porro occaecati quo voluptatem possimus ullam.', 'https://via.placeholder.com/600x600.png/003300?text=suscipit', 130.30, 522.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:19', '2023-07-23 05:46:19', NULL),
(88, 7, 40, 'et omnis saepe reiciendis nostrum', 'et-omnis-saepe-reiciendis-nostrum', 'Id maiores quod neque ut quibusdam ad et ratione consequatur saepe laudantium ipsum placeat molestiae autem magnam.', 'https://via.placeholder.com/600x600.png/001199?text=ratione', 377.70, 870.70, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(89, 6, 39, 'dolor sit consequuntur sed ea', 'dolor-sit-consequuntur-sed-ea', 'Ut sunt repellat sit et expedita fuga et nihil voluptatibus vel fuga modi quia.', 'https://via.placeholder.com/600x600.png/00bb22?text=ea', 343.20, 563.10, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(90, 6, 35, 'autem a labore dicta voluptas', 'autem-a-labore-dicta-voluptas', 'Ea voluptatem quasi porro neque autem in sapiente repellat sapiente quis consequuntur.', 'https://via.placeholder.com/600x600.png/002299?text=aliquam', 403.10, 658.70, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(91, 8, 34, 'rerum et est facilis exercitationem', 'rerum-et-est-facilis-exercitationem', 'Occaecati soluta in sit non nihil nam porro alias porro quis.', 'https://via.placeholder.com/600x600.png/009900?text=nostrum', 426.50, 968.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(92, 7, 41, 'nihil harum aspernatur maiores aut', 'nihil-harum-aspernatur-maiores-aut', 'Tempore ea nisi sint illo cupiditate et voluptate ut dolores accusantium ea nostrum sed quasi qui quos omnis rerum est sequi.', 'https://via.placeholder.com/600x600.png/0044ff?text=vel', 234.60, 898.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(93, 9, 33, 'voluptatibus incidunt excepturi consequatur voluptate', 'voluptatibus-incidunt-excepturi-consequatur-voluptate', 'Dolor consequuntur quod provident delectus aut aut alias aut facilis illo vero velit.', 'https://via.placeholder.com/600x600.png/005522?text=quo', 199.70, 577.70, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(94, 8, 35, 'ex soluta at labore cum', 'ex-soluta-at-labore-cum', 'Voluptates asperiores exercitationem et molestias minus velit eaque quia impedit suscipit rerum adipisci.', 'https://via.placeholder.com/600x600.png/005588?text=sed', 297.20, 589.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(95, 8, 33, 'quo alias modi sint earum', 'quo-alias-modi-sint-earum', 'Natus facilis sapiente corrupti aut fugiat ea perferendis quibusdam repellendus rem.', 'https://via.placeholder.com/600x600.png/0000aa?text=aut', 488.00, 921.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(96, 9, 39, 'iste velit eos illum aspernatur', 'iste-velit-eos-illum-aspernatur', 'Pariatur sint id unde ratione quia molestiae accusantium itaque et ullam quam commodi et beatae tempore qui sunt eum.', 'https://via.placeholder.com/600x600.png/00ddff?text=ipsa', 275.20, 923.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(97, 10, 39, 'a ex provident voluptatem error', 'a-ex-provident-voluptatem-error', 'Distinctio minus voluptatem nostrum error consequatur hic odit doloribus ut.', 'https://via.placeholder.com/600x600.png/00bb99?text=impedit', 453.00, 907.60, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(98, 10, 36, 'molestiae a debitis voluptas nesciunt', 'molestiae-a-debitis-voluptas-nesciunt', 'Possimus molestias sapiente enim impedit inventore deleniti et corrupti aliquam beatae provident porro enim.', 'https://via.placeholder.com/600x600.png/006688?text=rerum', 242.80, 759.60, 0, NULL, 0.00, 0, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(99, 7, 32, 'esse officiis at sunt ut', 'esse-officiis-at-sunt-ut', 'Eligendi incidunt laborum dolore deserunt vel pariatur quisquam veniam id vitae error qui eveniet aliquid.', 'https://via.placeholder.com/600x600.png/00aabb?text=molestiae', 113.60, 642.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(100, 10, 39, 'consequatur libero commodi quibusdam ut', 'consequatur-libero-commodi-quibusdam-ut', 'Nihil corrupti sit inventore occaecati minus est aut ab aut ea quaerat rem et pariatur quam molestias tempora quos est dolorum.', 'https://via.placeholder.com/600x600.png/0055cc?text=fugiat', 107.40, 812.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 05:46:20', '2023-07-23 05:46:20', NULL),
(101, 6, 37, 'Rustic Wool Hat', 'rustic-wool-hat', 'Soluta aliquam ratione mollitia illo itaque consequatur vitae veniam non sed omnis quisquam reprehenderit rerum eos corporis.', 'https://via.placeholder.com/600x600.png/001166?text=sed', 43.70, 727.50, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(102, 8, 48, 'Sleek Aluminum Shirt', 'sleek-aluminum-shirt', 'Qui qui ut fugit ex dolores aut vel aliquam sit nobis voluptatum ad.', 'https://via.placeholder.com/600x600.png/002299?text=eveniet', 449.40, 821.10, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(103, 14, 39, 'Aerodynamic Concrete Lamp', 'aerodynamic-concrete-lamp', 'Nobis velit aliquam voluptatem aperiam mollitia vel nesciunt ipsa sed impedit sed asperiores quisquam aperiam necessitatibus.', 'https://via.placeholder.com/600x600.png/00aa11?text=temporibus', 363.20, 920.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(104, 11, 43, 'Gorgeous Copper Plate', 'gorgeous-copper-plate', 'Deleniti ut et nihil facilis dolor ex molestiae ipsam quia est corporis vel et delectus cum eum odit corporis.', 'https://via.placeholder.com/600x600.png/0099bb?text=cum', 395.10, 904.60, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(105, 8, 50, 'Synergistic Silk Plate', 'synergistic-silk-plate', 'Voluptas ut libero nostrum quo sunt non ab eum porro voluptates sit veritatis ea tenetur consectetur qui maxime incidunt alias exercitationem.', 'https://via.placeholder.com/600x600.png/009999?text=ea', 14.80, 538.20, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(106, 9, 43, 'Enormous Wooden Bag', 'enormous-wooden-bag', 'Nulla iste vel molestiae voluptas est in ipsa voluptatem magnam quaerat doloremque repudiandae sit voluptatum quasi libero.', 'https://via.placeholder.com/600x600.png/00ee44?text=dignissimos', 101.70, 993.10, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(107, 15, 44, 'Small Aluminum Gloves', 'small-aluminum-gloves', 'Ea dolorem minus quos repellat earum aspernatur sunt blanditiis nam esse assumenda sunt quia itaque vel.', 'https://via.placeholder.com/600x600.png/003311?text=occaecati', 481.30, 739.80, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(108, 10, 32, 'Incredible Iron Lamp', 'incredible-iron-lamp', 'Molestias rerum dolorem voluptatem molestias ut dolorum repudiandae animi voluptate rerum omnis aut.', 'https://via.placeholder.com/600x600.png/008899?text=et', 239.20, 770.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(109, 9, 45, 'Rustic Wooden Lamp', 'rustic-wooden-lamp', 'Nulla cum eaque qui quos maiores est impedit modi ratione natus atque ut nisi minima iure.', 'https://via.placeholder.com/600x600.png/0066aa?text=quod', 160.10, 712.20, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(110, 14, 48, 'Mediocre Linen Pants', 'mediocre-linen-pants', 'Dolore et expedita vitae illo repudiandae omnis consequatur temporibus voluptate cum repudiandae repellendus.', 'https://via.placeholder.com/600x600.png/00ee44?text=iure', 243.30, 647.20, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(111, 8, 44, 'Synergistic Iron Gloves', 'synergistic-iron-gloves', 'Maiores itaque enim voluptas laudantium at possimus magnam temporibus dignissimos iusto dignissimos dolores vero aliquid eaque quibusdam atque omnis rerum.', 'https://via.placeholder.com/600x600.png/003388?text=blanditiis', 459.30, 775.50, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(112, 9, 38, 'Lightweight Linen Bag', 'lightweight-linen-bag', 'Dolorem alias amet dolor aut ut adipisci facere dolorum eum qui voluptas voluptates dolorem sit temporibus et et.', 'https://via.placeholder.com/600x600.png/00cc88?text=neque', 356.90, 634.90, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(113, 11, 39, 'Incredible Copper Computer', 'incredible-copper-computer', 'Ad ad architecto asperiores suscipit qui ab atque odit et repellat ut quasi.', 'https://via.placeholder.com/600x600.png/003388?text=et', 225.20, 632.30, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(114, 6, 45, 'Incredible Wooden Lamp', 'incredible-wooden-lamp', 'Quo autem aut cumque sed hic nostrum est architecto esse non ut accusamus maiores vero impedit ducimus.', 'https://via.placeholder.com/600x600.png/007700?text=et', 58.20, 994.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(115, 15, 36, 'Sleek Wool Pants', 'sleek-wool-pants', 'Distinctio dolorum ut omnis earum quia quia ab et dolor rerum.', 'https://via.placeholder.com/600x600.png/00cc11?text=architecto', 496.50, 513.10, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(116, 11, 36, 'Heavy Duty Linen Pants', 'heavy-duty-linen-pants', 'Non corporis et ut non et voluptatem similique sint deleniti velit provident at neque praesentium sit minima vel vel.', 'https://via.placeholder.com/600x600.png/0088cc?text=ad', 448.60, 712.50, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(117, 15, 51, 'Gorgeous Wool Car', 'gorgeous-wool-car', 'Repellat minima laudantium ab autem tenetur fugiat quisquam repellendus harum.', 'https://via.placeholder.com/600x600.png/000055?text=at', 361.70, 527.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(118, 9, 41, 'Durable Leather Hat', 'durable-leather-hat', 'Quos et ducimus pariatur in fuga maxime qui ut et aperiam quo fugit aliquam ut consequatur quas.', 'https://via.placeholder.com/600x600.png/009955?text=omnis', 143.20, 887.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(119, 9, 33, 'Durable Wooden Keyboard', 'durable-wooden-keyboard', 'Est aut sed et qui ex consequatur sunt dolorem quis molestiae.', 'https://via.placeholder.com/600x600.png/005511?text=aspernatur', 481.40, 760.10, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(120, 15, 43, 'Incredible Copper Knife', 'incredible-copper-knife', 'Architecto velit eum quo nostrum cupiditate assumenda voluptatem molestias assumenda voluptatem ducimus sequi.', 'https://via.placeholder.com/600x600.png/001133?text=facere', 416.30, 586.00, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(121, 14, 47, 'Awesome Bronze Computer', 'awesome-bronze-computer', 'Quidem et quam incidunt cumque et ut repellat saepe neque expedita quia autem porro autem sequi.', 'https://via.placeholder.com/600x600.png/006633?text=molestiae', 43.60, 551.70, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(122, 12, 38, 'Synergistic Cotton Bottle', 'synergistic-cotton-bottle', 'Qui aut labore unde libero ipsam nam aut consequatur ex.', 'https://via.placeholder.com/600x600.png/001144?text=aperiam', 220.20, 963.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(123, 15, 51, 'Incredible Aluminum Bench', 'incredible-aluminum-bench', 'Sed cum quam aut cumque perferendis eum rerum temporibus veritatis non quia id ab provident eum vel placeat.', 'https://via.placeholder.com/600x600.png/006644?text=accusamus', 108.40, 709.00, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(124, 6, 33, 'Synergistic Wooden Pants', 'synergistic-wooden-pants', 'Voluptatem perspiciatis quod vel fuga omnis quas quia amet ut quam molestiae est necessitatibus et ut.', 'https://via.placeholder.com/600x600.png/0099dd?text=ratione', 291.10, 592.80, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:03', '2023-07-23 07:01:03', NULL),
(125, 15, 34, 'Practical Leather Pants', 'practical-leather-pants', 'Consequuntur nihil et ut vel voluptas autem quos molestiae architecto distinctio laborum error occaecati quae odit voluptatem eos esse aut.', 'https://via.placeholder.com/600x600.png/003399?text=maxime', 131.70, 773.90, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(126, 11, 33, 'Ergonomic Wooden Clock', 'ergonomic-wooden-clock', 'Nobis perspiciatis aut ut porro odit voluptates totam velit aut corrupti et iure eum vel id eius nihil provident omnis qui.', 'https://via.placeholder.com/600x600.png/00aa88?text=nulla', 187.70, 644.00, 8, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-08-05 10:31:51', NULL),
(127, 12, 33, 'Gorgeous Wool Shirt', 'gorgeous-wool-shirt', 'Velit quaerat sed aut minus facilis dolorem sint vel cupiditate ut omnis harum.', 'https://via.placeholder.com/600x600.png/0066ff?text=ratione', 109.80, 704.80, 5, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(128, 10, 45, 'Mediocre Copper Lamp', 'mediocre-copper-lamp', 'Earum odio et voluptatem sapiente quia et quae est illo odio veritatis sit et quaerat voluptatem sint enim nam voluptatem.', 'https://via.placeholder.com/600x600.png/00dd33?text=facilis', 55.40, 861.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-08-04 20:19:24', NULL),
(129, 14, 47, 'Practical Plastic Bench', 'practical-plastic-bench', 'At voluptatem et suscipit dolores repellat in repellat in ratione voluptatum praesentium nisi illum perferendis magnam.', 'https://via.placeholder.com/600x600.png/006677?text=assumenda', 419.40, 658.80, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(130, 10, 38, 'Lightweight Copper Plate', 'lightweight-copper-plate', 'Facilis nesciunt nulla eum molestiae accusamus similique officia quis earum in et.', 'https://via.placeholder.com/600x600.png/0055bb?text=est', 463.70, 524.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(131, 9, 47, 'Gorgeous Copper Knife', 'gorgeous-copper-knife', 'Nesciunt repellendus debitis sequi rem voluptas nulla voluptatem quasi ea placeat quas quo ea dolores sed.', 'https://via.placeholder.com/600x600.png/00ff11?text=enim', 188.40, 773.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(132, 13, 32, 'Small Steel Shirt', 'small-steel-shirt', 'Dignissimos est cumque delectus quis pariatur inventore et et tempore nam aperiam tempore perspiciatis ipsam in pariatur quia qui.', 'https://via.placeholder.com/600x600.png/005533?text=dolorem', 87.50, 656.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(133, 11, 41, 'Fantastic Leather Shoes', 'fantastic-leather-shoes', 'Illo excepturi est praesentium laudantium quidem et fugiat quo possimus consequatur accusantium ut est et magni voluptas vitae occaecati voluptas.', 'https://via.placeholder.com/600x600.png/008888?text=sapiente', 380.80, 578.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(134, 9, 49, 'Enormous Plastic Computer', 'enormous-plastic-computer', 'Blanditiis voluptas est quo aut deserunt dicta recusandae magni facere ea sed optio dolorum laborum quis rerum.', 'https://via.placeholder.com/600x600.png/00dd44?text=qui', 148.30, 858.90, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(135, 10, 38, 'Intelligent Granite Bottle', 'intelligent-granite-bottle', 'Alias nulla et sed quia accusamus modi dolor nam rem deserunt.', 'https://via.placeholder.com/600x600.png/003300?text=reprehenderit', 303.60, 807.90, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(136, 12, 32, 'Incredible Rubber Bag', 'incredible-rubber-bag', 'Quam omnis quidem assumenda ab aut veniam aut dicta dolor et magni recusandae eos architecto molestias velit dolorem totam aut at.', 'https://via.placeholder.com/600x600.png/00cc99?text=illo', 113.20, 700.00, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(137, 15, 35, 'Synergistic Steel Bag', 'synergistic-steel-bag', 'Enim velit et quisquam odio eius et eaque blanditiis accusantium id fuga.', 'https://via.placeholder.com/600x600.png/00eeee?text=consequatur', 181.00, 525.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(138, 9, 43, 'Intelligent Wool Watch', 'intelligent-wool-watch', 'Recusandae velit ut soluta consequatur et asperiores cupiditate tempore expedita praesentium.', 'https://via.placeholder.com/600x600.png/00ee33?text=commodi', 132.10, 853.20, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(139, 9, 44, 'Synergistic Paper Knife', 'synergistic-paper-knife', 'Vel debitis id necessitatibus natus ut molestiae aspernatur dolorem earum similique.', 'https://via.placeholder.com/600x600.png/00aadd?text=est', 155.90, 725.40, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(140, 6, 39, 'Ergonomic Bronze Car', 'ergonomic-bronze-car', 'Sit autem eveniet dolore quis necessitatibus velit odit et illum consequatur illum earum dignissimos quas quo amet provident deserunt.', 'https://via.placeholder.com/600x600.png/001166?text=consequatur', 326.30, 938.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(141, 14, 50, 'Lightweight Marble Chair', 'lightweight-marble-chair', 'Esse laborum deserunt suscipit tenetur doloribus et molestiae fugit voluptatum deserunt soluta recusandae perferendis laboriosam.', 'https://via.placeholder.com/600x600.png/009933?text=officiis', 181.00, 901.00, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(142, 9, 37, 'Aerodynamic Concrete Coat', 'aerodynamic-concrete-coat', 'Nesciunt eius suscipit culpa iure itaque ab quos corporis molestias.', 'https://via.placeholder.com/600x600.png/00cc77?text=assumenda', 190.20, 607.10, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(143, 14, 46, 'Synergistic Rubber Hat', 'synergistic-rubber-hat', 'Rerum et in veniam eos voluptatibus perferendis quibusdam quo est enim veritatis ut labore similique rem voluptatem quo voluptas error.', 'https://via.placeholder.com/600x600.png/007700?text=distinctio', 139.60, 717.20, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(144, 10, 48, 'Practical Steel Bag', 'practical-steel-bag', 'Tenetur et vel minima magni est voluptatibus omnis explicabo dolores a earum omnis.', 'https://via.placeholder.com/600x600.png/00ff55?text=dolor', 371.90, 736.90, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(145, 8, 45, 'Mediocre Aluminum Knife', 'mediocre-aluminum-knife', 'Cumque temporibus provident qui illum dolorum numquam ipsa ea inventore.', 'https://via.placeholder.com/600x600.png/008888?text=optio', 419.90, 589.30, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(146, 8, 39, 'Lightweight Rubber Bag', 'lightweight-rubber-bag', 'Et vel quam voluptas et illo et ut eius debitis.', 'https://via.placeholder.com/600x600.png/00cc55?text=quod', 209.70, 771.60, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL);
INSERT INTO `products` (`id`, `store_id`, `category_id`, `name`, `slug`, `description`, `image`, `price`, `compare_price`, `quantity`, `options`, `rating`, `featured`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(147, 7, 47, 'Durable Marble Bottle', 'durable-marble-bottle', 'Reprehenderit iste inventore culpa blanditiis vel odio dolorem iure aut omnis occaecati quaerat tempora asperiores unde beatae.', 'https://via.placeholder.com/600x600.png/007733?text=voluptatum', 39.20, 833.80, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(148, 12, 45, 'Incredible Rubber Lamp', 'incredible-rubber-lamp', 'Sit earum minus dolores dolorem voluptas velit sit necessitatibus eius quia in quo sapiente quo nemo.', 'https://via.placeholder.com/600x600.png/0044cc?text=qui', 331.30, 751.70, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(149, 7, 41, 'Gorgeous Steel Clock', 'gorgeous-steel-clock', 'Est expedita nulla eligendi ipsam vitae officiis culpa numquam et beatae eaque recusandae vero voluptates eveniet quis suscipit qui.', 'https://via.placeholder.com/600x600.png/00ccff?text=a', 192.90, 839.70, 0, NULL, 0.00, 1, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(150, 15, 37, 'Enormous Wooden Lamp', 'enormous-wooden-lamp', 'Dolorum non sed mollitia sed dolorem id quo est sint nobis aut deleniti nihil voluptatem asperiores.', 'https://via.placeholder.com/600x600.png/009911?text=quibusdam', 137.70, 574.40, 0, NULL, 0.00, 0, 'active', '2023-07-23 07:01:04', '2023-07-23 07:01:04', NULL),
(156, 12, 35, 'api_test', 'api-test', NULL, NULL, 52.00, NULL, 0, NULL, 0.00, 0, 'active', '2023-08-07 22:41:25', '2023-08-07 22:41:25', NULL),
(158, 12, 35, 'api_test2', 'api-test2', NULL, NULL, 52.00, NULL, 0, NULL, 0.00, 0, 'active', '2023-08-07 23:03:50', '2023-08-07 23:03:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` char(2) NOT NULL,
  `locale` char(2) NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`user_id`, `first_name`, `last_name`, `birthday`, `gender`, `street_address`, `city`, `state`, `postal_code`, `country`, `locale`, `created_at`, `updated_at`) VALUES
(1, 'mostafa', 'isnail', '1998-03-16', 'male', 'eltawel', 'aboqurqas', 'minia', '086', 'EG', 'ar', '2023-07-25 05:46:40', '2023-07-25 06:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `logo_image` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `slug`, `description`, `logo_image`, `cover_image`, `status`, `created_at`, `updated_at`) VALUES
(6, 'occaecati quia', 'occaecati-quia', 'Magnam doloremque exercitationem natus porro praesentium occaecati aliquam rerum molestiae modi saepe accusamus blanditiis cum quod facere sunt.', 'https://via.placeholder.com/300x300.png/004488?text=et', 'https://via.placeholder.com/800x600.png/006600?text=ratione', 'active', '2023-07-23 05:46:14', '2023-07-23 05:46:14'),
(7, 'ea minima', 'ea-minima', 'Architecto alias quam perferendis esse delectus voluptas facilis totam voluptas commodi consequatur iure nulla corrupti impedit exercitationem esse assumenda.', 'https://via.placeholder.com/300x300.png/0055cc?text=ex', 'https://via.placeholder.com/800x600.png/00dd66?text=ducimus', 'active', '2023-07-23 05:46:14', '2023-07-23 05:46:14'),
(8, 'id facere', 'id-facere', 'Nulla est ducimus quod ea aut omnis sed aperiam vel odit aspernatur voluptatem.', 'https://via.placeholder.com/300x300.png/0044ff?text=expedita', 'https://via.placeholder.com/800x600.png/000022?text=omnis', 'active', '2023-07-23 05:46:14', '2023-07-23 05:46:14'),
(9, 'quia veritatis', 'quia-veritatis', 'Distinctio rem labore et quidem excepturi voluptas recusandae aut laboriosam.', 'https://via.placeholder.com/300x300.png/0000ee?text=sit', 'https://via.placeholder.com/800x600.png/00bb88?text=vel', 'active', '2023-07-23 05:46:14', '2023-07-23 05:46:14'),
(10, 'quia dolore', 'quia-dolore', 'Quo praesentium architecto maxime ea incidunt cum asperiores itaque corrupti.', 'https://via.placeholder.com/300x300.png/007744?text=in', 'https://via.placeholder.com/800x600.png/00ee99?text=rem', 'active', '2023-07-23 05:46:15', '2023-07-23 05:46:15'),
(11, 'dolor debitis', 'dolor-debitis', 'Non unde quia quia aspernatur aspernatur dicta nihil mollitia quia voluptas ab tempore laudantium voluptate ex rerum ex.', 'https://via.placeholder.com/300x300.png/00eeee?text=cupiditate', 'https://via.placeholder.com/800x600.png/0077dd?text=magnam', 'active', '2023-07-23 07:01:01', '2023-07-23 07:01:01'),
(12, 'illo alias', 'illo-alias', 'Fuga unde amet qui accusantium voluptate dolorem dolor praesentium voluptates praesentium et ab eius facilis quas rerum.', 'https://via.placeholder.com/300x300.png/0044ff?text=atque', 'https://via.placeholder.com/800x600.png/00ff00?text=quis', 'active', '2023-07-23 07:01:01', '2023-07-23 07:01:01'),
(13, 'fuga officiis', 'fuga-officiis', 'Ea sint cumque ut est sit a vero maxime eveniet accusantium quis ut natus alias est non vel similique.', 'https://via.placeholder.com/300x300.png/00ccdd?text=voluptate', 'https://via.placeholder.com/800x600.png/006655?text=qui', 'active', '2023-07-23 07:01:01', '2023-07-23 07:01:01'),
(14, 'laboriosam qui', 'laboriosam-qui', 'Velit distinctio accusamus quo nemo eos id labore et doloribus.', 'https://via.placeholder.com/300x300.png/00ff77?text=et', 'https://via.placeholder.com/800x600.png/0022bb?text=quibusdam', 'active', '2023-07-23 07:01:01', '2023-07-23 07:01:01'),
(15, 'mollitia et', 'mollitia-et', 'Voluptatem sed recusandae quis consequatur harum qui quasi voluptatum voluptas.', 'https://via.placeholder.com/300x300.png/00bb55?text=mollitia', 'https://via.placeholder.com/800x600.png/000000?text=est', 'active', '2023-07-23 07:01:01', '2023-07-23 07:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`) VALUES
(7, 'cotton', 'cotton'),
(8, 'striped', 'striped'),
(9, 'long selve', 'long-selve');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` enum('user','admin','super-admin') NOT NULL DEFAULT 'user',
  `last_active_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `type`, `last_active_at`, `store_id`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'mostafa', 'mostafaismail260@yahoo.com', 'super-admin', '2023-08-04 18:53:05', 11, NULL, '$2y$10$IOa6tlm4tUvBO0YVf649jOkefobzFYFmQDusqurdqomTDxlJVubku', NULL, NULL, NULL, NULL, '2023-07-16 18:10:01', '2023-08-04 18:53:05'),
(2, 'ali', 'mostafaismail26@yahoo.com', 'admin', '2023-08-05 11:23:31', 12, NULL, '$2y$10$DOfQOP2oqeMYl7jtZpcjg.6n78zQ75zwf4PQocngr9tEM.JkjRlKi', NULL, NULL, NULL, NULL, '2023-07-17 13:44:12', '2023-08-05 11:23:31'),
(3, 'ali2', 'mostafaismail2@yahoo.com', 'admin', '2023-08-06 11:22:37', 10, NULL, '$2y$10$n/tTdFWK1XnwmE72DNcvV.cEjYKT1CrdqCt6OI4LZq5A5H0tChymu', NULL, NULL, NULL, NULL, '2023-07-17 13:46:20', '2023-08-06 11:22:37'),
(4, 'mostafa', 'mostafaeltawel163@gmail.com', 'user', '2023-08-07 18:22:32', NULL, NULL, '$2y$10$dNZnliCHotV4mL0rsT9f0uK5krg54nY/O3Qss/sGQXf3Isx7T1e9W', 'eyJpdiI6IjRoVmdIamxtU21rRS9xNTY5NGQ4Y0E9PSIsInZhbHVlIjoiNXlNT0ZmSC9pUUtFcHZYdlc2c1A2MkZuQ2wveW9PNFU3U1hLL2lkRWYxMD0iLCJtYWMiOiI2ZTllMjk3MGY5Y2ExNzZmODNlNDc4NTczNWIzM2RkYWVhM2Q3M2MzZDU1NzQ5MjVkYTdmODk3M2VkNmQ1OGZmIiwidGFnIjoiIn0=', 'eyJpdiI6ImpadFRJTUlLMVpzOFlNbUZ0Mk9YMFE9PSIsInZhbHVlIjoiV0tpbjlzV2ZScGhJT0FNeGM1Y2p2ZUMxa3p2Rk1DaG94NmJnaDNDbFlncmNSaEE2RTl4TWN6TVNFQkM5UDI5bTg1bWFaMUpPVHdOU0ljUGROc1NTSHNHWklpSnNVVEdwTFY4YVNPOXdaczlrdys5cXNnQ0cxblFkVmMwbFZFQWJlTU1XTVhmcmhqN3gyTTBLNm82L1B2bzh6cnR5dDZqRzF4YjZPRjRVWGNqdHIvZjJ2c0NFa3pjeTBEYnc3SGFocjVRekdJTkw0SHFuUUd0ZjUyYUQwNld2WHN3VFpXcWdYcUp1dUlhdlhxcStMQ0dpeDlwMkUyckdPdGhMUU1uSnUvTTdUa2h6ckwzUCs1d0hiSjlaTkE9PSIsIm1hYyI6ImFmNzE0MDBjYzY2MGNiMTQxZTgzOGQxZmFiOGZmZDU4OWRkMjdmMGEwYjg4M2MxZTg2MDM1MTVjY2RiNjliM2QiLCJ0YWciOiIifQ==', NULL, 'ZWUJKt2bntj34p1lRTrAuYwbbB0TnjyA9HHGPSqtGwZy3vLHtuzpa9nPJr5n', '2023-07-17 13:48:32', '2023-08-07 18:22:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_phone_number_unique` (`phone_number`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_store_id_foreign` (`store_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_items_order_id_product_id_unique` (`order_id`,`product_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_store_id_foreign` (`store_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stores_slug_unique` (`slug`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_store_id_foreign` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
