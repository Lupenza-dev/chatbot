-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 24, 2025 at 05:58 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wcf_chat_bot`
--

-- --------------------------------------------------------

--
-- Table structure for table `bot_logs`
--

CREATE TABLE `bot_logs` (
  `id` int NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `reply_id` int DEFAULT NULL,
  `step` varchar(20) DEFAULT NULL,
  `thread_id` int DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'OPEN',
  `uuid` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
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
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `id` int NOT NULL,
  `thread_response_id` int NOT NULL,
  `thread_id` int NOT NULL,
  `created_by` int NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int NOT NULL,
  `title_eng` varchar(255) NOT NULL,
  `title_sw` varchar(255) NOT NULL,
  `step` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `label` text NOT NULL,
  `label_sw` text NOT NULL,
  `thread_type` varchar(100) NOT NULL,
  `back_status` varchar(20) NOT NULL DEFAULT 'No',
  `created_by` int NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `thread_links`
--

CREATE TABLE `thread_links` (
  `id` int NOT NULL,
  `thread_id` int NOT NULL,
  `linked_thread_id` int NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `thread_responses`
--

CREATE TABLE `thread_responses` (
  `id` int NOT NULL,
  `name_eng` varchar(255) NOT NULL,
  `name_sw` varchar(255) NOT NULL,
  `order_no` varchar(10) NOT NULL,
  `thread_id` int NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `thread_types`
--

CREATE TABLE `thread_types` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `response_thread_links`
--
ALTER TABLE `response_thread_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thread_links`
--
ALTER TABLE `thread_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thread_responses`
--
ALTER TABLE `thread_responses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thread_types`
--
ALTER TABLE `thread_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
