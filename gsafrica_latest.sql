-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 31, 2023 at 06:15 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsafrica`
--

-- --------------------------------------------------------

--
-- Table structure for table `bot_logs`
--

CREATE TABLE `bot_logs` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `step` varchar(20) DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'OPEN',
  `uuid` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `response_thread_links`
--

CREATE TABLE `response_thread_links` (
  `id` int(11) NOT NULL,
  `thread_response_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `response_thread_links`
--

INSERT INTO `response_thread_links` (`id`, `thread_response_id`, `thread_id`, `created_by`, `uuid`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 1, '99b94c70-f1f0-4623-9afc-c362cd751b0a', '2023-07-24 15:08:24', '2023-07-24 15:08:24'),
(3, 6, 3, 1, '99b94c9d-bfec-4b0a-a909-c3f25be4644e', '2023-07-24 15:08:54', '2023-07-24 15:08:54'),
(4, 9, 4, 1, '99b94e12-a480-4fca-8bcd-46f4173e7164', '2023-07-24 15:12:58', '2023-07-24 15:12:58'),
(5, 10, 5, 1, '99b94e25-a540-4a5b-a914-3f9e964efea0', '2023-07-24 15:13:10', '2023-07-24 15:13:10'),
(6, 11, 6, 1, '99b94e35-6b56-4a26-9ef9-9857b7de2ef4', '2023-07-24 15:13:21', '2023-07-24 15:13:21'),
(7, 12, 7, 1, '99b94e45-c038-48e4-89c1-ff59b7749635', '2023-07-24 15:13:31', '2023-07-24 15:13:31'),
(8, 13, 8, 1, '99b94ead-00d5-42c1-9d13-9795d0d886af', '2023-07-24 15:14:39', '2023-07-24 15:14:39'),
(9, 8, 9, 1, '99b94ed1-aa39-443d-be0c-04d3f58070e6', '2023-07-24 15:15:03', '2023-07-24 15:15:03'),
(10, 14, 10, 1, '99b94fb7-af3c-4d09-a7cc-95990754ec71', '2023-07-24 15:17:34', '2023-07-24 15:17:34'),
(11, 15, 10, 1, '99b94fdf-0136-4a42-a0b9-363f4ae3e84f', '2023-07-24 15:18:00', '2023-07-24 15:18:00'),
(25, 16, 10, 1, '99b9672e-e8f5-43e8-9c35-f4dd2b5d3b32', '2023-07-24 16:23:11', '2023-07-24 16:23:11'),
(26, 17, 10, 1, '99b9673e-d88c-49b1-a0ea-56e8fd17a763', '2023-07-24 16:23:21', '2023-07-24 16:23:21'),
(27, 18, 10, 1, '99b9674e-cf33-480b-b138-74474ec0b4f2', '2023-07-24 16:23:32', '2023-07-24 16:23:32'),
(28, 19, 10, 1, '99b96765-6939-4698-859a-64408ab9e47b', '2023-07-24 16:23:46', '2023-07-24 16:23:46'),
(29, 20, 10, 1, '99b96772-7439-4cce-912c-0fbca2f8a07d', '2023-07-24 16:23:55', '2023-07-24 16:23:55'),
(30, 21, 10, 1, '99b96780-d3cb-41f6-8bea-6ad55f88993c', '2023-07-24 16:24:04', '2023-07-24 16:24:04'),
(31, 22, 10, 1, '99b96790-4af2-4eff-8f68-64a472615bff', '2023-07-24 16:24:15', '2023-07-24 16:24:15'),
(32, 23, 10, 1, '99b9679f-5f57-4dc3-9ffb-295ee6d41217', '2023-07-24 16:24:24', '2023-07-24 16:24:24'),
(33, 24, 10, 1, '99b967b0-545f-4720-9197-b9420cf463b8', '2023-07-24 16:24:36', '2023-07-24 16:24:36'),
(34, 25, 10, 1, '99b967bf-e215-4091-ad10-416e7c114935', '2023-07-24 16:24:46', '2023-07-24 16:24:46'),
(35, 26, 10, 1, '99b967d0-60a9-4477-b7dc-886fd98a967f', '2023-07-24 16:24:57', '2023-07-24 16:24:57'),
(36, 27, 10, 1, '99b967e1-0b5f-43c1-b2db-bfec6a85b3c4', '2023-07-24 16:25:08', '2023-07-24 16:25:08'),
(37, 28, 10, 1, '99b967f2-4777-49ed-93fc-33174e69bd5f', '2023-07-24 16:25:19', '2023-07-24 16:25:19'),
(38, 29, 10, 1, '99b967ff-fbd6-44c1-bddf-67997fa6b0b9', '2023-07-24 16:25:28', '2023-07-24 16:25:28'),
(39, 30, 10, 1, '99b96815-d856-4a13-9a87-efd4da508e05', '2023-07-24 16:25:42', '2023-07-24 16:25:42'),
(40, 31, 10, 1, '99b9684c-0db0-4364-bbb0-387f2bf47cef', '2023-07-24 16:26:18', '2023-07-24 16:26:18'),
(41, 32, 10, 1, '99b9685a-064a-4c43-acd9-c5a7d10eae42', '2023-07-24 16:26:27', '2023-07-24 16:26:27'),
(42, 33, 10, 1, '99b96880-a844-4746-9ee3-db955118415b', '2023-07-24 16:26:52', '2023-07-24 16:26:52'),
(43, 34, 11, 1, '99b968ab-c205-4816-a3a9-93dea011618b', '2023-07-24 16:27:20', '2023-07-24 16:27:20'),
(44, 35, 11, 1, '99b968ba-e6aa-47a4-9da0-f9e9407227d0', '2023-07-24 16:27:30', '2023-07-24 16:27:30'),
(46, 36, 14, 1, '99b9a3a4-7857-4a6b-9bea-33f120fff6e1', '2023-07-24 19:12:14', '2023-07-24 19:12:14'),
(47, 37, 14, 1, '99b9a3cb-ac69-4792-a340-4aa627c7f1fe', '2023-07-24 19:12:40', '2023-07-24 19:12:40'),
(48, 38, 14, 1, '99b9a3e6-dd94-46c8-b80f-77fa04fefe28', '2023-07-24 19:12:58', '2023-07-24 19:12:58'),
(49, 39, 14, 1, '99b9a3f9-1516-4dea-9f71-c8e356a72aeb', '2023-07-24 19:13:10', '2023-07-24 19:13:10'),
(50, 40, 14, 1, '99b9a40a-ece7-421f-b0b6-91533cb99401', '2023-07-24 19:13:21', '2023-07-24 19:13:21'),
(51, 41, 14, 1, '99b9a41c-4d74-45aa-949d-c566d773b9d5', '2023-07-24 19:13:33', '2023-07-24 19:13:33'),
(52, 2, 13, 1, '99b9a701-b397-4c53-b484-29e3f29541a9', '2023-07-24 19:21:39', '2023-07-24 19:21:39'),
(53, 3, 17, 1, '99b9adf2-3aba-41e4-abe7-d1f6155b7759', '2023-07-24 19:41:03', '2023-07-24 19:41:03'),
(54, 42, 18, 1, '99b9ae2f-faba-4763-9bfe-74b6f53ec9fe', '2023-07-24 19:41:43', '2023-07-24 19:41:43'),
(55, 43, 18, 1, '99b9ae43-1b52-45a9-98b9-e6ddb9ac33ed', '2023-07-24 19:41:56', '2023-07-24 19:41:56'),
(56, 44, 18, 1, '99b9ae54-bee8-4503-bf8c-0a6a0d015a63', '2023-07-24 19:42:07', '2023-07-24 19:42:07'),
(57, 45, 18, 1, '99b9ae6c-e328-4848-862d-384d48183b02', '2023-07-24 19:42:23', '2023-07-24 19:42:23'),
(58, 46, 18, 1, '99b9ae7f-4304-41ba-96d4-4ddf590da030', '2023-07-24 19:42:35', '2023-07-24 19:42:35'),
(59, 47, 18, 1, '99b9aea8-e904-449d-b311-d9a52c0802f5', '2023-07-24 19:43:03', '2023-07-24 19:43:03'),
(60, 48, 22, 1, '99b9af77-96c4-4101-b0d1-e63b1e6fcd18', '2023-07-24 19:45:18', '2023-07-24 19:45:18'),
(61, 49, 22, 1, '99b9af8f-e03e-4178-b2f7-1034438e9610', '2023-07-24 19:45:34', '2023-07-24 19:45:34'),
(62, 50, 22, 1, '99b9afaa-6f88-4663-9791-197209d7b859', '2023-07-24 19:45:51', '2023-07-24 19:45:51'),
(63, 51, 22, 1, '99b9afbb-4282-4f57-9177-7c5349e8ab2f', '2023-07-24 19:46:02', '2023-07-24 19:46:02'),
(64, 52, 22, 1, '99b9afcf-bece-4970-9f41-e37372f82a8b', '2023-07-24 19:46:16', '2023-07-24 19:46:16'),
(65, 53, 16, 1, '99b9aff9-63bc-42e3-98db-62648f96f6cb', '2023-07-24 19:46:43', '2023-07-24 19:46:43'),
(66, 54, 16, 1, '99b9b020-5ec9-4ce2-b5be-0db3bd72992c', '2023-07-24 19:47:09', '2023-07-24 19:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(11) NOT NULL,
  `title_eng` varchar(255) NOT NULL,
  `title_sw` varchar(255) NOT NULL,
  `step` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `label` text NOT NULL,
  `label_sw` text NOT NULL,
  `thread_type` varchar(100) NOT NULL,
  `back_status` varchar(20) NOT NULL DEFAULT 'No',
  `created_by` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `title_eng`, `title_sw`, `step`, `flag`, `label`, `label_sw`, `thread_type`, `back_status`, `created_by`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'Welcome GsAfrica', 'Welcome GsAfrica', '1', 'Welcome', 'Welcome GsAfrica ✈️\r\n Embrace the freedom of the skies and explore the wonders of the world', 'Welcome GsAfrica ✈️\r\n Embrace the freedom of the skies and explore the wonders of the world', 'LIST MESSAGE', 'No', 1, '99b93251-ca5c-439b-ada6-79b70f42a998', '2023-07-24 13:55:22', '2023-07-24 13:55:22'),
(2, 'Travel Destination', 'Travel Destination', '2', 'Travel_destination', 'Please choose travel destination', 'Please choose travel destination', 'LIST MESSAGE', 'Yes', 1, '99b934a7-c194-4596-82c9-239765ae85e2', '2023-07-24 14:01:54', '2023-07-24 14:01:54'),
(3, 'Destination Zone', 'Destination Zone', '2.1', 'Destination_zone', 'Please choose travel destination zone in Tanzania', 'Please choose travel destination zone in Tanzania', 'LIST MESSAGE', 'No', 1, '99b93596-21eb-49cc-a67e-7d3a826997f6', '2023-07-24 14:04:30', '2023-07-24 14:04:30'),
(4, 'Central Zone', 'Central Zone', '2.1.1', 'Central_zone', 'Please choose Flight', 'Please choose Flight', 'LIST MESSAGE', 'No', 1, '99b93794-2594-435a-aa8d-8948793117f8', '2023-07-24 14:10:04', '2023-07-24 14:10:04'),
(5, 'Cost Zone', 'Cost Zone', '2.1.2', 'Cost_zone', 'Please choose Flight', 'Please choose Flight', 'LIST MESSAGE', 'Yes', 1, '99b93831-8386-4568-adf3-eca924f5f5dd', '2023-07-24 14:11:47', '2023-07-24 14:11:47'),
(6, 'Lake Zone', 'Lake Zone', '2.1.3', 'Lake_zone', 'Please choose Flight', 'Please choose Flight', 'LIST MESSAGE', 'Yes', 1, '99b93885-cf98-4f17-8ed6-f63376ea9462', '2023-07-24 14:12:42', '2023-07-24 14:12:42'),
(7, 'North Zone', 'North Zone', '2.1.4', 'North_zone', 'Please choose Flight', 'Please choose Flight', 'LIST MESSAGE', 'Yes', 1, '99b938d4-c49f-4407-8cf4-722aa046997f', '2023-07-24 14:13:34', '2023-07-24 14:13:34'),
(8, 'South Zone', 'South Zone', '2.1.5', 'South_Zone', 'Please choose Flight', 'Please choose Flight', 'LIST MESSAGE', 'Yes', 1, '99b93912-12dc-481f-968a-dbf8c940960c', '2023-07-24 14:14:14', '2023-07-24 14:14:14'),
(9, 'Zanzibar', 'Zanzibar', '2.1.6', 'Zanzibar', 'Please choose Flight', 'Please choose Flight', 'LIST MESSAGE', 'Yes', 1, '99b9395b-297d-4257-9d8f-9cbfda10f863', '2023-07-24 14:15:02', '2023-07-24 14:15:02'),
(10, 'Travel Date', 'Travel Date', '2.2', 'Travel_date', 'Please Write travel Date\r\nEg 2023-01-31', 'Please Write travel Date\r\nEg 2023-01-31', 'TEXT', 'Yes', 1, '99b94948-f4c3-479b-819a-caba41af9d3f', '2023-07-24 14:59:35', '2023-07-24 14:59:35'),
(11, 'Travel Time', 'Travel Time', '2.3', 'Travel_time', 'Please choose preferred travel time', 'Please choose preferred travel time', 'LIST MESSAGE', 'Yes', 1, '99b94a0d-a61f-402c-9a28-ac5c715cacbf', '2023-07-24 15:01:44', '2023-07-24 15:01:44'),
(12, 'ID Attachment', 'ID Attachment', '2.4', 'ID', 'Please attach you ID.\r\nID Type required (NIDA,Driving license or Passport)', 'Please attach you ID.\r\nID Type required (NIDA,Driving license or Passport)', 'TEXT', 'Yes', 1, '99b94aec-76ff-4025-93c5-845b283751ea', '2023-07-24 15:04:10', '2023-07-24 15:04:10'),
(13, 'Travel insurance', 'Travel insurance', '3', 'travel_insurance', 'Please choose where you expect to travel', 'Please choose where you expect to travel', 'LIST MESSAGE', 'Yes', 1, '99b9a044-358a-4788-9b0c-338af1df2eb5', '2023-07-24 19:02:48', '2023-07-24 19:02:48'),
(14, 'Expectation Travel Date', 'Expectation Travel Date', '3.1', 'E_X_T', 'Please write expected date of travel (go date)\r\neg 2023-01-31', 'Please write expected date of travel (go date)\r\neg 2023-01-31', 'TEXT', 'Yes', 1, '99b9a1cf-a1f1-4d31-b796-8ced4b6eaee4', '2023-07-24 19:07:07', '2023-07-24 19:09:03'),
(15, 'Expected Return Date', 'Expected Return Date', '3.2', 'E_R_T', 'Please write expected return travel date\r\neg 2023-01-31', 'Please write expected return travel date\r\neg 2023-01-31', 'TEXT', 'Yes', 1, '99b9a251-24ce-4d42-8c3f-d9eb90f8f455', '2023-07-24 19:08:32', '2023-07-24 19:08:32'),
(16, 'Passport attachment', 'Passport attachment', '3.3', 'P_A_T', 'Please attach your passport copy', 'Please attach your passport copy', 'TEXT', 'Yes', 1, '99b9a311-b7fe-4c21-9fa9-bcee42e9ed95', '2023-07-24 19:10:38', '2023-07-24 19:10:38'),
(17, 'Visa Processing', 'Visa Processing', '4', 'Visa', 'Please choose the destination place yo want to go', 'Please choose the destination place yo want to go', 'LIST MESSAGE', 'No', 1, '99b9a931-8d8b-4247-9d97-ce3092a41614', '2023-07-24 19:27:45', '2023-07-24 19:27:45'),
(18, 'To go Country', 'To go Country', '4.1', 'T_Country', 'Please country you plan to visit', 'Please country you plan to visit', 'TEXT', 'Yes', 1, '99b9aaa1-43aa-4e20-8efc-c126389e25ef', '2023-07-24 19:31:46', '2023-07-24 19:31:46'),
(19, 'Visa expect go date', 'Visa expect go date', '4.2', 'E_Date', 'Please write expected date of travel (go date) \r\neg 2023-01-31', 'Please write expected date of travel (go date) \r\neg 2023-01-31', 'TEXT', 'Yes', 1, '99b9ab86-c4bb-4476-8bab-e4eebdd0fabe', '2023-07-24 19:34:17', '2023-07-24 19:34:17'),
(20, 'Visa expected return date', 'Visa expected return date', '4.3', 'EX', 'Please write expected return travel date\r\n eg 2023-01-31', 'Please write expected return travel date\r\n eg 2023-01-31', 'TEXT', 'Yes', 1, '99b9abdc-bc0f-415b-989c-420dfa57da3f', '2023-07-24 19:35:13', '2023-07-24 19:35:13'),
(21, 'type of visa', 'type of visa', '4.4', 'Visa_type', 'Please choose type of visa you apply', 'Please choose type of visa you apply', 'LIST MESSAGE', 'Yes', 1, '99b9ac77-5448-44a7-a901-73fbd17510ea', '2023-07-24 19:36:55', '2023-07-24 19:36:55'),
(22, 'Visa entry type', 'Visa entry type', '4.5', 'V_Entry', 'Please choose type of visa entry you apply', 'Please choose type of visa entry you apply', 'LIST MESSAGE', 'Yes', 1, '99b9ad69-9467-4701-a496-ccd9a83bf7b4', '2023-07-24 19:39:33', '2023-07-24 19:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `thread_links`
--

CREATE TABLE `thread_links` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `linked_thread_id` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thread_links`
--

INSERT INTO `thread_links` (`id`, `thread_id`, `linked_thread_id`, `uuid`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 10, 11, '99b968ff-ba34-46f2-b800-5b32c9922084', 1, '2023-07-24 16:28:15', '2023-07-24 16:28:15'),
(2, 11, 12, '99b9691c-c251-408c-ad75-9389bc4456cd', 1, '2023-07-24 16:28:34', '2023-07-24 16:28:34'),
(3, 14, 15, '99b9a461-44ae-48cb-9818-e00299f214e5', 1, '2023-07-24 19:14:18', '2023-07-24 19:14:18'),
(4, 15, 16, '99b9a48e-4806-4db4-b6af-ccb90d29432c', 1, '2023-07-24 19:14:47', '2023-07-24 19:14:47'),
(5, 18, 19, '99b9aef7-8491-4215-aba6-819a708f8f4d', 1, '2023-07-24 19:43:54', '2023-07-24 19:43:54'),
(6, 19, 20, '99b9af14-eb0a-4b44-be10-68d8855722c9', 1, '2023-07-24 19:44:13', '2023-07-24 19:44:13'),
(7, 20, 21, '99b9af39-9e83-4dde-95f8-30b7b71982eb', 1, '2023-07-24 19:44:37', '2023-07-24 19:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `thread_responses`
--

CREATE TABLE `thread_responses` (
  `id` int(11) NOT NULL,
  `name_eng` varchar(255) NOT NULL,
  `name_sw` varchar(255) NOT NULL,
  `order_no` varchar(10) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thread_responses`
--

INSERT INTO `thread_responses` (`id`, `name_eng`, `name_sw`, `order_no`, `thread_id`, `uuid`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Air Ticketing', 'Air Ticketing', '1', 1, '99b9328a-8452-4d69-8efb-5d1ea9386bb8', 1, '2023-07-24 13:55:59', '2023-07-24 13:55:59'),
(2, 'Travel Insurance', 'Travel Insurance', '2', 1, '99b932a5-60c0-4f55-94b9-6e33703e284f', 1, '2023-07-24 13:56:16', '2023-07-24 13:56:16'),
(3, 'Visa Processing', 'Visa Processing', '3', 1, '99b93303-42f8-4fad-b0d3-afd2fcb5d93c', 1, '2023-07-24 13:57:18', '2023-07-24 13:57:18'),
(4, 'Accommodation', 'Accommodation', '4', 1, '99b9332f-a81c-43fb-88bf-8a89d17ea407', 1, '2023-07-24 13:57:47', '2023-07-24 13:57:47'),
(5, 'Transportation', 'Transportation', '5', 1, '99b93359-a36b-41c7-a59d-ca9c102a242d', 1, '2023-07-24 13:58:15', '2023-07-24 13:58:15'),
(6, 'Domestic', 'Domestic', '1', 2, '99b934d1-a710-4b55-8e81-a58efd969d03', 1, '2023-07-24 14:02:21', '2023-07-24 14:02:21'),
(7, 'International', 'International', '2', 2, '99b934e9-410e-40f3-9d40-e030421c4083', 1, '2023-07-24 14:02:37', '2023-07-24 14:02:37'),
(8, 'Zanzibar', 'Zanzibar', '1', 3, '99b935c5-7359-49aa-b031-e058a4a3fe3c', 1, '2023-07-24 14:05:01', '2023-07-24 14:05:01'),
(9, 'Central Zone', 'Central Zone', '2', 3, '99b935dc-603b-4c31-bfeb-7087e1213405', 1, '2023-07-24 14:05:16', '2023-07-24 14:05:16'),
(10, 'Cost Zone', 'Cost Zone', '3', 3, '99b935f4-3d5c-44a1-a4da-92fba04e8e99', 1, '2023-07-24 14:05:31', '2023-07-24 14:05:31'),
(11, 'Lake Zone', 'Lake Zone', '4', 3, '99b9360f-92d2-4077-882a-1f652724c3c7', 1, '2023-07-24 14:05:49', '2023-07-24 14:05:49'),
(12, 'North Zone', 'North Zone', '5', 3, '99b93631-31fb-4778-8ced-9f79baf11097', 1, '2023-07-24 14:06:11', '2023-07-24 14:06:11'),
(13, 'South Zone', 'South Zone', '6', 3, '99b93644-b5af-47b8-bee9-bb4ed524088d', 1, '2023-07-24 14:06:24', '2023-07-24 14:06:24'),
(14, 'ATCL (CEZ)', 'ATCL(CEZ)', '1', 4, '99b937b4-e3a2-4558-8777-6bf5ed94e620', 1, '2023-07-24 14:10:26', '2023-07-24 14:19:08'),
(15, 'Precision Air (CEZ)', 'Precision Air (CEZ)', '2', 4, '99b937cb-9ddd-409d-8dd0-293d0e735019', 1, '2023-07-24 14:10:40', '2023-07-24 14:19:18'),
(16, 'Flight Link (CEZ)', 'Flight Link (CEZ)', '3', 4, '99b937e0-f2fb-4933-bab7-a342c26ccd1e', 1, '2023-07-24 14:10:54', '2023-07-24 14:19:32'),
(17, 'ATCL(CZ)', 'ATCL(CZ)', '1', 5, '99b93a01-a9be-48a1-b8ce-c797b9c13b55', 1, '2023-07-24 14:16:51', '2023-07-24 14:16:51'),
(18, 'Precision Air(CZ)', 'Precision Air(CZ)', '2', 5, '99b93a20-5232-4228-9368-41802f603ac3', 1, '2023-07-24 14:17:11', '2023-07-24 14:17:11'),
(19, 'Any (CZ)', 'Any (CZ)', '3', 5, '99b93aae-aff2-4375-bb78-e49a8345e7e9', 1, '2023-07-24 14:18:45', '2023-07-24 14:18:45'),
(20, 'Any (CEZ)', 'Any (CEZ)', '4', 4, '99b93b0e-e5a7-4db8-8a7e-944682b3700d', 1, '2023-07-24 14:19:48', '2023-07-24 14:19:48'),
(21, 'Precision Air (LZ)', 'Precision Air (LZ)', '1', 6, '99b9469c-01de-4007-832e-7ecb63cb743c', 1, '2023-07-24 14:52:06', '2023-07-24 14:52:06'),
(22, 'ATCL (LZ)', 'ATCL (LZ)', '2', 6, '99b946b7-1a04-4558-acab-fbd3da979c62', 1, '2023-07-24 14:52:24', '2023-07-24 14:52:24'),
(23, 'Any (LZ)', 'Any (LZ)', '3', 6, '99b946ce-3508-4521-9c3e-d2eb88cc9026', 1, '2023-07-24 14:52:39', '2023-07-24 14:52:39'),
(24, 'ATCL (NZ)', 'ATCL (NZ)', '1', 7, '99b946fd-122c-4b3d-81e7-0f31de27a0dd', 1, '2023-07-24 14:53:09', '2023-07-24 14:53:09'),
(25, 'Precision Air (NZ)', 'Precision Air (NZ)', '2', 7, '99b9472a-3a01-40c4-ad1e-197926f07c45', 1, '2023-07-24 14:53:39', '2023-07-24 14:53:39'),
(26, 'Any (NZ)', 'Any (NZ)', '3', 7, '99b94746-245f-43ce-af6b-935b7657ec99', 1, '2023-07-24 14:53:57', '2023-07-24 14:53:57'),
(27, 'ATCL (SZ)', 'ATCL (SZ)', '1', 8, '99b94766-d196-4655-9ec6-699fe94abb87', 1, '2023-07-24 14:54:19', '2023-07-24 14:54:19'),
(28, 'Precision Air (SZ)', 'Precision Air (SZ)', '2', 8, '99b94784-6d0b-4f9f-a692-eb69c8aa8095', 1, '2023-07-24 14:54:38', '2023-07-24 14:54:38'),
(29, 'Any (SZ)', 'Any (SZ)', '3', 8, '99b94797-a971-4a12-93f3-4845f2f3d19c', 1, '2023-07-24 14:54:51', '2023-07-24 14:54:51'),
(30, 'ATCL (ZNZ)', 'ATCL (ZNZ)', '1', 9, '99b9481b-6f87-4d3c-96db-78b9c7851c9a', 1, '2023-07-24 14:56:17', '2023-07-24 14:56:17'),
(31, 'Precision Air (ZNZ)', 'Precision Air (ZNZ)', '2', 9, '99b94832-3c85-4d2d-b823-ced25b0bb3c2', 1, '2023-07-24 14:56:32', '2023-07-24 14:56:32'),
(32, 'Auric Air (ZNZ)', 'Auric Air (ZNZ)', '3', 9, '99b9484b-2764-45e6-822a-686aa066776c', 1, '2023-07-24 14:56:48', '2023-07-24 14:56:48'),
(33, 'Any (ZNZ)', 'Any (ZNZ)', '4', 9, '99b9485d-62a3-4d99-83b7-c47abd97dbc3', 1, '2023-07-24 14:57:00', '2023-07-24 14:57:00'),
(34, 'Morning', 'Morning', '1', 11, '99b94a28-27a0-4797-874c-56469aca44a7', 1, '2023-07-24 15:02:01', '2023-07-24 15:02:01'),
(35, 'Evening', 'Evening', '2', 11, '99b94a36-55d8-4b60-b8ae-799d710cfe88', 1, '2023-07-24 15:02:10', '2023-07-24 15:02:10'),
(36, 'Africa', 'Africa', '1', 13, '99b9a066-4285-453e-9001-561a1b65fd15', 1, '2023-07-24 19:03:10', '2023-07-24 19:03:10'),
(37, 'Europe', 'Europe', '2', 13, '99b9a09c-3f9c-4281-b0a4-8a4f2cd3cc6e', 1, '2023-07-24 19:03:45', '2023-07-24 19:03:45'),
(38, 'Middle East', 'Middle East', '3', 13, '99b9a0b8-769e-4645-99c9-75863921a1cd', 1, '2023-07-24 19:04:04', '2023-07-24 19:04:04'),
(39, 'America', 'America', '4', 13, '99b9a0cb-4895-4ad3-8d53-1c2283e4f0a5', 1, '2023-07-24 19:04:16', '2023-07-24 19:04:16'),
(40, 'Australia', 'Australia', '5', 13, '99b9a10b-e510-4072-b838-6a807fe38cdd', 1, '2023-07-24 19:04:59', '2023-07-24 19:04:59'),
(41, 'Asia', 'Asia', '6', 13, '99b9a11d-777c-4c10-8c8b-df8cf4635e7a', 1, '2023-07-24 19:05:10', '2023-07-24 19:05:10'),
(42, 'Africa', 'Africa', '1', 17, '99b9a95c-382a-4e1e-bf0e-7c8812fcdbcb', 1, '2023-07-24 19:28:13', '2023-07-24 19:28:13'),
(43, 'Middle East', 'Middle East', '2', 17, '99b9a97a-aeae-4d23-a3ad-43c48eb45a51', 1, '2023-07-24 19:28:33', '2023-07-24 19:28:33'),
(44, 'Europe schengen visa', 'Europe schengen visa', '3', 17, '99b9a9d6-f1c4-4ae8-8b5c-0aad6f54214c', 1, '2023-07-24 19:29:34', '2023-07-24 19:29:34'),
(45, 'America', 'America', '4', 17, '99b9a9f2-1e47-4878-9bee-ed049b9c5215', 1, '2023-07-24 19:29:52', '2023-07-24 19:29:52'),
(46, 'Asia', 'Asia', '5', 17, '99b9aa01-7fa8-4485-ab24-f563f00d3bf6', 1, '2023-07-24 19:30:02', '2023-07-24 19:30:02'),
(47, 'Other', 'Other', '6', 17, '99b9aa10-003f-4af3-9dba-b16713a93ae9', 1, '2023-07-24 19:30:11', '2023-07-24 19:30:11'),
(48, 'Tourism Visa', 'Tourism Visa', '1', 21, '99b9ac98-4f14-4867-8ba4-565d6e7b6e68', 1, '2023-07-24 19:37:16', '2023-07-24 19:37:16'),
(49, 'Business Visa', 'Business Visa', '2', 21, '99b9acac-d284-419b-97a8-d6faa668049b', 1, '2023-07-24 19:37:30', '2023-07-24 19:37:30'),
(50, 'Student Visa', 'Student Visa', '3', 21, '99b9acc0-3c51-4c5b-b2c7-2d3b72008bb1', 1, '2023-07-24 19:37:42', '2023-07-24 19:37:42'),
(51, 'Diplomat Visa', 'Diplomat Visa', '4', 21, '99b9ace2-8c31-48ef-a639-5724b151da1c', 1, '2023-07-24 19:38:05', '2023-07-24 19:38:05'),
(52, 'Medical Visa', 'Medical Visa', '5', 21, '99b9acf9-c323-4fc9-9549-d96de42f2d2e', 1, '2023-07-24 19:38:20', '2023-07-24 19:38:20'),
(53, 'Single Entry', 'Single Entry', '1', 22, '99b9ad90-ddc7-4795-ab98-987bbd98c2e4', 1, '2023-07-24 19:39:59', '2023-07-24 19:39:59'),
(54, 'Multiple Entries', 'Multiple Entries', '2', 22, '99b9ada8-bb6c-4451-879d-99683c1fe4ef', 1, '2023-07-24 19:40:15', '2023-07-24 19:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `thread_types`
--

CREATE TABLE `thread_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thread_types`
--

INSERT INTO `thread_types` (`id`, `name`) VALUES
(1, 'TEXT'),
(2, 'DOCUMENT'),
(3, 'IMAGE'),
(4, 'VIDEO'),
(5, 'CONTACT'),
(6, 'LOCATION'),
(7, 'REPLY BUTTON'),
(8, 'LIST MESSAGE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone_number`, `email`, `email_verified_at`, `password`, `uuid`, `active`, `remember_token`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin admin', '', 'admin@gmail.com', '2023-05-23 20:27:53', '$2y$10$ZKaaMIG2COWhvCGPz/uvy.CTaINHXC62K1IXWmZqmEhxFpNbNe9Hy', 'dggdgdgd', 1, NULL, NULL, '2023-05-23 20:27:53', '2023-05-23 20:27:53'),
(2, 'luhangano erasto lupenza', '', 'lupenza10@gmail.com', NULL, '$2y$10$AOSiCTJva9L305lB42WVxumaDV3uJqZWm1M0dhrlndP8ANAUaddkq', '993d07ad-5606-40bf-812c-44ec49abb872', 1, NULL, NULL, '2023-05-23 17:33:28', '2023-05-23 17:33:28'),
(3, 'Admin Dizerity', '255653190260', 'admin@dizer.com', NULL, '$2y$10$PlFH3k4lJa/qOdBCirNNDessRafEARP0M8Y5iW7DtFzO5jkHbZMIS', '993d088a-2061-462d-a2b4-edbf7adad6c8', 1, NULL, NULL, '2023-05-23 17:35:53', '2023-05-23 17:35:53'),
(4, 'Luhangano Erasto Lupenza', '255713640551', 'agent@gmail.com', NULL, '$2y$10$vAsa7vWFuqn9..hXkVLrsuPyx0UrIAsSuEcRoSNfIuGJx7HCV1NP2', '99565b56-df03-4b38-becf-ce588b2c9beb', 1, NULL, NULL, '2023-06-05 07:43:06', '2023-06-05 07:43:06'),
(5, 'Khaleed Ofsa Frank', '255683130185', 'luhaboy@gmail.com', NULL, '$2y$10$xID.LVjkpzKXBPTj74sJ7ecUejzj40HvwFDNfJL493vZvqngbz8yW', '995697b8-cf79-441d-b1ef-51fa710f0bd5', 1, NULL, 3, '2023-06-05 10:31:57', '2023-06-05 10:31:57'),
(6, 'Khaleed Ofsa Frank', '255683130186', 'luhaboy@gmail.com1', NULL, '$2y$10$C41vZy4HjfVjejRGDc8PfuAEj9EhlR3bnmSJRd/cBEPcygp4/ywAq', '99569831-d4ee-45b6-83b6-b5fc768b7676', 1, NULL, 4, '2023-06-05 10:33:16', '2023-06-05 10:33:16'),
(7, 'Khaleed Ofsa Frank', '255683130183', 'luhaboy@gmail.com2', NULL, '$2y$10$MntZJ87doYrOVYi9OQHLwelQui7IXfKcjR./Xf8HRvd5q2DgVTrjK', '9956988e-2254-4c43-8758-f77fa327ee10', 1, NULL, 5, '2023-06-05 10:34:16', '2023-06-05 10:34:16'),
(8, 'Khaleed Ofsa Frank', '255683130181', 'luhaboy@gmail.com3', NULL, '$2y$10$PTTOPfULjk/hkxcY1Gaioe7TmxZx8Io1LWyz97aNpyj/dLlJ76vN2', '995698cb-b5a8-42ff-b357-aba06542622d', 1, NULL, 6, '2023-06-05 10:34:57', '2023-06-05 10:34:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bot_logs`
--
ALTER TABLE `bot_logs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `response_thread_links`
--
ALTER TABLE `response_thread_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread_links`
--
ALTER TABLE `thread_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread_responses`
--
ALTER TABLE `thread_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread_types`
--
ALTER TABLE `thread_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bot_logs`
--
ALTER TABLE `bot_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `response_thread_links`
--
ALTER TABLE `response_thread_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `thread_links`
--
ALTER TABLE `thread_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `thread_responses`
--
ALTER TABLE `thread_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `thread_types`
--
ALTER TABLE `thread_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
