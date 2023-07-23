-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 13, 2023 at 08:26 AM
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
  `step` varchar(20) DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'OPEN',
  `uuid` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bot_logs`
--

INSERT INTO `bot_logs` (`id`, `phone_number`, `message_id`, `text`, `step`, `thread_id`, `type`, `status`, `uuid`, `created_at`, `updated_at`) VALUES
(1, '16315551181', 'ABGGFlA5Fpa', 'this is a text message', '0', NULL, 'text', 'CLOSED', '999ee32d-8ec0-4078-9e51-71361a575225', '2023-07-11 09:02:32', '2023-07-12 17:00:25'),
(2, '16315551181', 'ABGGFlA5Fpa', 'this is a text message', '0', NULL, 'text', 'CLOSED', '999ee36c-789a-4c95-b677-1056ebb9f261', '2023-07-11 09:03:14', '2023-07-12 17:00:25'),
(3, '16315551181', 'ABGGFlA5Fpa', 'this is a text message', '0', NULL, 'text', 'CLOSED', '999ee37e-6c1a-4d66-af0e-d84a13af4486', '2023-07-11 09:03:25', '2023-07-12 17:00:25'),
(4, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '1.1', NULL, 'LIST MESSAGE', 'CLOSED', '99a19111-1781-4353-be4e-817f73ba677d', '2023-07-12 17:00:26', '2023-07-12 17:04:55'),
(5, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '1', NULL, 'LIST MESSAGE', 'CLOSED', '99a192ab-afee-4c08-8b38-cc3bbb710b73', '2023-07-12 17:04:55', '2023-07-12 17:07:06'),
(6, '16315551181', 'ABGGFlA5Fpa', 'Domestic', '1.1', NULL, 'LIST MESSAGE', 'CLOSED', '99a19374-ed39-499e-b221-ced110d46e46', '2023-07-12 17:07:06', '2023-07-12 17:13:21'),
(7, '16315551181', 'ABGGFlA5Fpa', 'Central Zone', '1.1.1', NULL, 'LIST MESSAGE', 'CLOSED', '99a195b0-be2b-4f06-85c9-54c547d10288', '2023-07-12 17:13:21', '2023-07-12 17:36:28'),
(8, '16315551181', 'ABGGFlA5Fpa', 'Zanzibar', '1.1.6', NULL, 'LIST MESSAGE', 'CLOSED', '99a19df4-aa22-4e0a-8627-ae872a610a0f', '2023-07-12 17:36:28', '2023-07-12 17:47:04'),
(9, '16315551181', 'ABGGFlA5Fpa', 'North Zone', '1.1.4', NULL, 'LIST MESSAGE', 'CLOSED', '99a1a1bf-6fc2-4648-92d6-9aefea0a1d83', '2023-07-12 17:47:04', '2023-07-12 18:16:04'),
(10, '16315551181', 'ABGGFlA5Fpa', 'South Zone', '1.1.5', NULL, 'LIST MESSAGE', 'CLOSED', '99a1ac1d-ea58-4e10-ba7f-00f532aaeedb', '2023-07-12 18:16:04', '2023-07-12 18:45:58'),
(11, '16315551181', 'ABGGFlA5Fpa', 'Zanzibar', '1.1.6', 10, 'LIST MESSAGE', 'CLOSED', '99a1b6d0-6660-4dc1-bf88-80a31edb971e', '2023-07-12 18:45:58', '2023-07-12 18:54:34'),
(12, '16315551181', 'ABGGFlA5Fpa', 'North Zone', '1.1.4', 8, 'LIST MESSAGE', 'CLOSED', '99a1b9e3-3c13-4532-9810-517c4b5ab2b1', '2023-07-12 18:54:34', '2023-07-12 19:13:08'),
(13, '16315551181', 'ABGGFlA5Fpa', 'Precision Air', '6.1', 15, 'TEXT', 'CLOSED', '99a1c087-28ee-40ff-98ea-c98a0d662f6e', '2023-07-12 19:13:08', '2023-07-12 19:18:42'),
(14, '16315551181', 'ABGGFlA5Fpa', '2023-08-09', '6.2', 16, 'TEXT', 'CLOSED', '99a1c284-7d36-4e66-ac5f-f663e7e8db7c', '2023-07-12 19:18:42', '2023-07-12 19:30:25'),
(15, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c6eb-8d5e-422d-8a7f-edd5c6e50af7', '2023-07-12 19:31:01', '2023-07-12 19:32:35'),
(16, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c788-f746-45f8-bf9d-18e7ef47607b', '2023-07-12 19:32:44', '2023-07-12 19:33:27'),
(17, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c7ce-a0b8-4ba6-b0d7-56537a157915', '2023-07-12 19:33:29', '2023-07-12 19:34:42'),
(18, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c883-a55e-431d-88fa-3721ce33eec5', '2023-07-12 19:35:28', '2023-07-12 19:35:28'),
(19, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c888-ac45-45ae-a9f5-27116b546a44', '2023-07-12 19:35:31', '2023-07-12 19:35:31'),
(20, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c88a-688e-4b9c-8779-513c57dfd9ac', '2023-07-12 19:35:32', '2023-07-12 19:35:32'),
(21, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c88b-fa6e-40ba-8a37-87e48640ccda', '2023-07-12 19:35:34', '2023-07-12 19:35:34'),
(22, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c88d-7d98-4149-a209-deee9b72b578', '2023-07-12 19:35:35', '2023-07-12 19:35:35'),
(23, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c88e-f58a-4dee-b634-6d91b689befc', '2023-07-12 19:35:35', '2023-07-12 19:35:35'),
(24, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c890-4370-41ae-8bdb-ca230198a1fd', '2023-07-12 19:35:36', '2023-07-12 19:35:36'),
(25, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c891-6328-4551-bb43-055c8b5c81af', '2023-07-12 19:35:37', '2023-07-12 19:35:37'),
(26, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c892-8589-4463-a702-f60fd1f541e3', '2023-07-12 19:35:38', '2023-07-12 19:35:38'),
(27, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c895-e60d-489b-aa8b-53ed1834ae7c', '2023-07-12 19:35:40', '2023-07-12 19:35:40'),
(28, '16315551181', 'ABGGFlA5Fpa', '66464664664', '0', 1, 'text', 'CLOSED', '99a1c897-2325-4109-958c-5282ca30bf9b', '2023-07-12 19:35:41', '2023-07-12 19:35:41'),
(29, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '0', 1, 'text', 'CLOSED', '99a1c8b0-b0ff-4085-9ea2-69153e830421', '2023-07-12 19:35:58', '2023-07-12 19:35:58'),
(30, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '0', 1, 'text', 'CLOSED', '99a1c8cf-7de4-4e20-ad71-7ed65aeea588', '2023-07-12 19:36:18', '2023-07-12 19:36:18'),
(31, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '0', 1, 'text', 'CLOSED', '99a1c904-f843-40d7-b835-dfd8b201c576', '2023-07-12 19:36:53', '2023-07-12 19:36:53'),
(32, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '0', 1, 'text', 'CLOSED', '99a1c922-fd72-47c8-af2c-2c73431d7277', '2023-07-12 19:37:12', '2023-07-12 19:37:12'),
(33, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '0', 1, 'text', 'CLOSED', '99a1c938-1a15-4d4f-9651-ec1e967fa48c', '2023-07-12 19:37:26', '2023-07-12 19:37:26'),
(34, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '0', 1, 'text', 'CLOSED', '99a1c967-6382-4458-b998-8d1cdf4836e2', '2023-07-12 19:37:57', '2023-07-12 19:37:57'),
(35, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '0', 1, 'text', 'CLOSED', '99a1cbdd-f3d2-4f4f-9146-09d1e764828b', '2023-07-12 19:44:51', '2023-07-12 19:44:51'),
(36, '16315551181', 'ABGGFlA5Fpa', 'Air Ticketing', '1', 3, 'LIST MESSAGE', 'CLOSED', '99a1cbdd-f9bb-4e05-8cf4-091003f899e6', '2023-07-12 19:44:51', '2023-07-12 19:45:11'),
(37, '16315551181', 'ABGGFlA5Fpa', 'Domestic', '1.1', 4, 'LIST MESSAGE', 'CLOSED', '99a1cbfc-c5da-4bc9-880c-3c413d73873c', '2023-07-12 19:45:11', '2023-07-12 19:45:24'),
(38, '16315551181', 'ABGGFlA5Fpa', 'South Zone', '1.1.5', 9, 'LIST MESSAGE', 'CLOSED', '99a1cc11-bb9a-4401-b05a-1b0580c5dbf6', '2023-07-12 19:45:24', '2023-07-12 19:45:40'),
(39, '16315551181', 'ABGGFlA5Fpa', 'Flight Link', '6.1', 15, 'TEXT', 'CLOSED', '99a1cc29-f592-4432-a87a-0c0d85a9137d', '2023-07-12 19:45:40', '2023-07-12 19:45:55'),
(40, '16315551181', 'ABGGFlA5Fpa', '2023-09-09', '6.2', 16, 'TEXT', 'CLOSED', '99a1cc3f-bca1-436a-9db9-52d91cc0873a', '2023-07-12 19:45:55', '2023-07-12 19:46:08'),
(41, '16315551181', 'ABGGFlA5Fpa', '202333333333', '0', 1, 'text', 'CLOSED', '99a1cc64-1d7c-459a-ba20-957afdc50ae6', '2023-07-12 19:46:18', '2023-07-12 19:47:47'),
(42, '16315551181', 'ABGGFlA5Fpa', 'Matako', '0', 1, 'text', 'CLOSED', '99a1ccf5-f416-40e9-badc-2a7b68f8387b', '2023-07-12 19:47:54', '2023-07-12 19:47:54'),
(43, '16315551181', 'ABGGFlA5Fpa', 'Air ticketing', '0', 1, 'text', 'CLOSED', '99a1cd0e-5cce-4c86-a89e-5278920776c1', '2023-07-12 19:48:10', '2023-07-12 19:48:10'),
(44, '16315551181', 'ABGGFlA5Fpa', 'Air ticketing', '1', 3, 'LIST MESSAGE', 'OPEN', '99a1cd0e-60d7-4273-81ee-f5c46a9a15c6', '2023-07-12 19:48:10', '2023-07-12 19:48:10');

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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title_eng` varchar(255) NOT NULL,
  `title_sw` varchar(255) NOT NULL,
  `step` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `message_type` varchar(100) NOT NULL,
  `back_status` varchar(20) NOT NULL DEFAULT 'No',
  `created_by` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `title_eng`, `title_sw`, `step`, `flag`, `label`, `message_type`, `back_status`, `created_by`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'Welcome GsAfrica ✈️  \r\nEmbrace the freedom of the skies and explore the wonders of the world', 'Welcome GsAfrica', '0', 'welcome', 'welcome', 'LIST MESSAGE', 'No', 1, '999d8c10-cafb-4896-877e-a4bc5d8df28f', '2023-07-10 17:03:08', '2023-07-12 18:32:42'),
(3, 'Air Ticketing', 'Chagua kituo cha safari', '1', 'AT', 'Please Select travel destination', 'LIST MESSAGE', 'Yes', 1, '999edb09-1c10-4847-9de4-71f573fe63f0', '2023-07-11 08:39:46', '2023-07-12 17:04:35'),
(4, 'Domestic', 'Ndani', '1.1', 'DF', 'Please choose zone', 'LIST MESSAGE', 'Yes', 1, '999edcbf-b887-40d6-9af6-d4352391e828', '2023-07-11 08:44:34', '2023-07-12 17:06:21'),
(5, 'Central Zone', 'Kanda ya Kati', '1.1.1', 'c_f', 'Please Choose Flight', 'LIST MESSAGE', 'Yes', 1, '999ee087-6e35-41eb-9945-7e77e10fb780', '2023-07-11 08:55:08', '2023-07-12 17:12:55'),
(6, 'Coast Zone', 'Kanda ya pwani', '1.1.2', 'C_Z', 'Please Choose Flight', 'LIST MESSAGE', 'Yes', 1, '99a1986a-e092-4be1-9a25-89f05b695b06', '2023-07-12 17:20:59', '2023-07-12 17:21:12'),
(7, 'Lake Zone', 'Kanda ya Ziwa', '1.1.3', 'L_Z', 'Please Choose Flight', 'LIST MESSAGE', 'Yes', 1, '99a1996e-95d0-4730-a550-bff05f3cba6a', '2023-07-12 17:23:49', '2023-07-12 17:24:00'),
(8, 'North Zone', 'kanda ya kasakazini', '1.1.4', 'N_Z', 'Please Choose Flight', 'LIST MESSAGE', 'No', 1, '99a19a64-ca2c-422a-a6d1-e04243b8d4b9', '2023-07-12 17:26:30', '2023-07-12 17:26:30'),
(9, 'South Zone', 'Kanda ya Kusini', '1.1.5', 'S_Z', 'Please Choose Flight', 'LIST MESSAGE', 'Yes', 1, '99a19bc9-b05f-4b3b-acae-378c11fc448e', '2023-07-12 17:30:24', '2023-07-12 17:30:24'),
(10, 'Zanzibar', 'Zanzibar', '1.1.6', 'Znz', 'Please Choose Flight', 'LIST MESSAGE', 'Yes', 1, '99a19c9c-3bde-466b-ad3b-feab6d596f3e', '2023-07-12 17:32:42', '2023-07-12 17:32:42'),
(11, 'ATCL', 'ATCL', '5', 'ATCL', 'Please Write Travel date \r\nEg (2023-01-31)', 'TEXT', 'No', 1, '99a1a522-db50-4929-a831-101cff20f139', '2023-07-12 17:56:33', '2023-07-12 17:56:33'),
(12, 'Precision Air', 'Precision Air', '5.1', 'P_A', 'Please Write Travel date\r\n Eg (2023-01-31)', 'TEXT', 'Yes', 1, '99a1a57f-215a-46db-8867-5fea15e30451', '2023-07-12 17:57:33', '2023-07-12 17:57:33'),
(13, 'Flight Link', 'Flight Link', '5.2', 'F_L', 'Please Write Travel date\r\n Eg (2023-01-31)', 'TEXT', 'Yes', 1, '99a1a5c1-5647-4bc6-a769-88e271401623', '2023-07-12 17:58:16', '2023-07-12 17:58:16'),
(14, 'Auric Air', 'Auric Air', '5.3', 'F_L', 'Please Write Travel date\r\n Eg (2023-01-31)', 'TEXT', 'No', 1, '99a1a5f7-8120-4faa-95f3-564a3985f9a5', '2023-07-12 17:58:52', '2023-07-12 17:58:52'),
(15, 'Please Write Travel date \r\nEg 2023-01-31', 'Tafadhali andika tarehe ya kusafiri\r\nMfano 2023-01-31', '6.1', 'T_D', 'Please Write Travel date \r\nEg 2023-01-31', 'TEXT', 'No', 1, '99a1ae7b-144a-4e5f-a202-dab08183e1a9', '2023-07-12 18:22:40', '2023-07-12 18:22:40'),
(16, 'Please Attach You ID \r\nID Type (NIDA,Driving Licence or Passport)', 'Please Attach You ID \r\nID Type (NIDA,Driving Licence or Passport)', '6.2', 'ID', 'Please Attach You ID \r\nID Type (NIDA,Driving Licence or Passport)', 'TEXT', 'No', 1, '99a1aff1-2995-47d5-b772-0d42e2d38162', '2023-07-12 18:26:46', '2023-07-12 18:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `message_responses`
--

CREATE TABLE `message_responses` (
  `id` int(11) NOT NULL,
  `name_eng` varchar(255) NOT NULL,
  `name_sw` varchar(255) NOT NULL,
  `order_no` varchar(10) NOT NULL,
  `message_id` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message_responses`
--

INSERT INTO `message_responses` (`id`, `name_eng`, `name_sw`, `order_no`, `message_id`, `uuid`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'Air Ticketing', 'Tiketi za ndege', '1', 1, '999eb8a8-9896-4a7e-97b8-296de2597fe8', 1, '2023-07-11 07:03:39', '2023-07-11 07:03:39'),
(5, 'Travel Insurance', 'Bima za Safari', '2', 1, '999eb8c9-1a43-4f6c-9572-395e38f86162', 1, '2023-07-11 07:04:00', '2023-07-11 07:04:00'),
(6, 'Visa', 'Viza', '3', 1, '999eb8dc-5e1e-4beb-8c50-9502e6a4da43', 1, '2023-07-11 07:04:13', '2023-07-11 07:04:13'),
(7, 'Accomodation Booking', 'Malazi', '4', 1, '999eb901-bd78-45a9-8fec-8dbf8b423c45', 1, '2023-07-11 07:04:37', '2023-07-11 07:04:37'),
(8, 'Transfer Airport', 'Usafiri', '5', 1, '999eb92d-21e4-46f4-9902-293d8fd73920', 1, '2023-07-11 07:05:06', '2023-07-11 07:05:06'),
(9, 'Domestic', 'Ndani', '1', 3, '999edb73-30d7-4e3e-9758-17be4c991156', 1, '2023-07-11 08:40:56', '2023-07-11 08:40:56'),
(10, 'International', 'Kimataifa', '2', 3, '999edb8e-fbea-4d08-9506-5d25b2d7f8b1', 1, '2023-07-11 08:41:14', '2023-07-11 08:41:14'),
(11, 'Central Zone', 'Kanda ya Kati', '1', 4, '999edded-7049-436d-a6fd-f15ccfa41304', 1, '2023-07-11 08:47:52', '2023-07-11 08:47:52'),
(12, 'Coast Zone', 'Kanda ya Pwani', '2', 4, '999ede0c-4b3a-4dc0-be46-8ce03983959b', 1, '2023-07-11 08:48:12', '2023-07-11 08:48:12'),
(13, 'Lake Zone', 'Kanda ya Ziwa', '3', 4, '999ede23-c9b4-4fb4-ba44-fedf205e9ba3', 1, '2023-07-11 08:48:27', '2023-07-11 08:48:27'),
(14, 'North Zone', 'Kanda ya Kaskazini', '4', 4, '999ede43-f026-481f-8ed2-3176a237f574', 1, '2023-07-11 08:48:48', '2023-07-11 08:48:48'),
(15, 'South Zone', 'Kanda ya Kusini', '5', 4, '999ede63-a4b4-4079-9c9c-e88c199bbc64', 1, '2023-07-11 08:49:09', '2023-07-11 08:49:09'),
(16, 'Zanzibar', 'Zanzibar', '6', 4, '999ede7d-ac90-4e18-9013-9d412346b4a8', 1, '2023-07-11 08:49:26', '2023-07-11 08:49:26'),
(17, 'ATCL', 'ATCL', '1', 5, '999ee10e-a314-42a3-8102-37fa1f130626', 1, '2023-07-11 08:56:37', '2023-07-12 17:46:19'),
(18, 'Precision Air', 'Precision Air', '2', 5, '999ee129-c458-464e-a13a-2cb0cbd539a5', 1, '2023-07-11 08:56:54', '2023-07-11 08:56:54'),
(19, 'Flight Link', 'Flight Link', '3', 5, '999ee140-02f4-49bf-868d-421f9fb33690', 1, '2023-07-11 08:57:09', '2023-07-11 08:57:09'),
(20, 'ATCL', 'ATCL', '1', 6, '99a198a6-06f3-4b6a-9360-c35373e343fe', 1, '2023-07-12 17:21:38', '2023-07-12 17:21:38'),
(21, 'Precision Air', 'Precision Air', '2', 6, '99a198cc-be72-42da-aacb-d8cd2bb49a7a', 1, '2023-07-12 17:22:03', '2023-07-12 17:22:03'),
(22, 'Flight Link', 'Flight Link', '3', 6, '99a198e1-b422-49c5-9362-487631e13efd', 1, '2023-07-12 17:22:17', '2023-07-12 17:22:17'),
(23, 'ATCL', 'ATCL', '1', 7, '99a19998-4947-45c8-841b-b53acc218c9e', 1, '2023-07-12 17:24:16', '2023-07-12 17:24:16'),
(24, 'Precision Air', 'Precision Air', '2', 7, '99a199b1-5f4c-4d13-893a-00b246f5b930', 1, '2023-07-12 17:24:33', '2023-07-12 17:24:33'),
(25, 'Flight Link', 'Flight Link', '3', 7, '99a199c5-d0c6-4b92-84db-a1ce29a4b621', 1, '2023-07-12 17:24:46', '2023-07-12 17:24:46'),
(26, 'ATCL', 'ATCL', '1', 8, '99a19a9c-9204-4a77-935d-a1ff48688909', 1, '2023-07-12 17:27:07', '2023-07-12 17:27:07'),
(27, 'precision Air', 'precision Air', '2', 8, '99a19ab8-fcef-44d2-b1c7-afec6e0ebdda', 1, '2023-07-12 17:27:25', '2023-07-12 17:27:25'),
(28, 'Flight Link', 'Flight Link', '3', 8, '99a19ace-b731-4df9-be2d-cedda8e3bf3d', 1, '2023-07-12 17:27:40', '2023-07-12 17:27:40'),
(29, 'ATCL', 'ATCL', '1', 9, '99a19be5-464c-48eb-b8ea-2bca1a9e0202', 1, '2023-07-12 17:30:42', '2023-07-12 17:30:42'),
(30, 'Precision Air', 'precision Air', '2', 9, '99a19c41-08ca-4a4e-be0c-6a6cdb020563', 1, '2023-07-12 17:31:42', '2023-07-12 17:31:42'),
(31, 'Flight Link', 'Flight Link', '3', 9, '99a19c53-b8ea-4353-9dd4-72fb1debed4d', 1, '2023-07-12 17:31:55', '2023-07-12 17:31:55'),
(32, 'ATCL', 'ATCL', '1', 10, '99a19cc3-ba58-4f93-84e2-c26e40f25d20', 1, '2023-07-12 17:33:08', '2023-07-12 17:33:08'),
(33, 'Precision Air', 'Precision Air', '1', 10, '99a19cde-1615-4f7b-9247-b3774b98cbba', 1, '2023-07-12 17:33:25', '2023-07-12 17:33:25'),
(34, 'Flight Link', 'Flight Link', '3', 10, '99a19d68-5acc-4c84-b201-8cee93d8989e', 1, '2023-07-12 17:34:56', '2023-07-12 17:34:56'),
(35, 'Auric Air', 'Auric Air', '4', 10, '99a19d7d-4318-4d91-b7c0-62ba290b4348', 1, '2023-07-12 17:35:10', '2023-07-12 17:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `message_types`
--

CREATE TABLE `message_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message_types`
--

INSERT INTO `message_types` (`id`, `name`) VALUES
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
-- Table structure for table `thread_links`
--

CREATE TABLE `thread_links` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `linked_message_id` int(11) NOT NULL,
  `message_type` varchar(100) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thread_links`
--

INSERT INTO `thread_links` (`id`, `message_id`, `linked_message_id`, `message_type`, `uuid`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 11, 15, 'TEXT', '99a1b390-a5f3-43af-a2e8-371565955de4', 1, '2023-07-12 18:36:53', '2023-07-12 18:36:53'),
(2, 12, 15, 'TEXT', '99a1b40b-aa6c-4cff-8b5a-7526a66de68c', 1, '2023-07-12 18:38:14', '2023-07-12 18:38:14'),
(3, 13, 15, 'TEXT', '99a1b426-f753-4432-856d-91cb66ab2971', 1, '2023-07-12 18:38:32', '2023-07-12 18:38:32'),
(4, 14, 15, 'TEXT', '99a1b455-64e5-4736-8a56-b9e523b019fe', 1, '2023-07-12 18:39:02', '2023-07-12 18:39:02'),
(5, 15, 16, 'TEXT', '99a1b47b-3b0f-45f2-8cbc-132bcc1d7f7a', 1, '2023-07-12 18:39:27', '2023-07-12 18:39:27');

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
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_responses`
--
ALTER TABLE `message_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_types`
--
ALTER TABLE `message_types`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `thread_links`
--
ALTER TABLE `thread_links`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `message_responses`
--
ALTER TABLE `message_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `message_types`
--
ALTER TABLE `message_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT for table `thread_links`
--
ALTER TABLE `thread_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
