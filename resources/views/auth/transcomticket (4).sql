-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 07, 2018 at 11:06 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transcomticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Logistics (Invoice Call)', NULL, 1, 1, NULL, NULL, '2018-07-19 05:49:26', '2018-07-19 06:27:38'),
(2, 'fgfgfdg', NULL, 1, NULL, NULL, NULL, '2018-07-21 01:07:26', '2018-07-21 01:07:26'),
(3, 'new divi', NULL, 1, NULL, NULL, NULL, '2018-07-21 01:34:06', '2018-07-21 01:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `division_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `division_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Barguna', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:37:51', '2018-04-25 10:36:43'),
(2, 'Barishal', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:38:21', '2018-04-25 09:38:21'),
(3, 'Bhola', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:38:59', '2018-04-25 09:38:59'),
(4, 'Jhalokati', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:39:10', '2018-04-25 09:39:10'),
(5, 'Patuakhali', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:39:23', '2018-04-25 09:39:23'),
(6, 'Pirojpur', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:39:36', '2018-04-25 09:39:36'),
(7, 'Bandarban', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:40:48', '2018-04-25 09:40:48'),
(8, 'Brahmanbaria', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:41:02', '2018-04-25 09:41:02'),
(9, 'Chandpur', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:41:13', '2018-04-25 09:41:13'),
(10, 'Chittagong', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:41:34', '2018-04-25 09:41:34'),
(11, 'Comilla', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:42:32', '2018-04-25 09:42:32'),
(12, 'Cox\'s Bazar', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:42:55', '2018-04-25 09:42:55'),
(13, 'Feni', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:43:06', '2018-04-25 09:43:06'),
(14, 'Khagrachari', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:43:17', '2018-04-25 09:43:17'),
(15, 'Lakshmipur', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:43:44', '2018-04-25 09:43:44'),
(16, 'Noakhali', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:43:53', '2018-04-25 09:43:53'),
(17, 'Rangamati', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:44:08', '2018-04-25 09:44:08'),
(18, 'Dhaka', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:05:32', '2018-04-25 10:05:32'),
(19, 'Faridpur', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:05:47', '2018-04-25 10:05:47'),
(20, 'Gazipur', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:05:59', '2018-04-25 10:05:59'),
(21, 'Gopalganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:06:56', '2018-04-25 10:06:56'),
(22, 'Kishoreganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:12', '2018-04-25 10:07:12'),
(23, 'Madaripur', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:22', '2018-04-25 10:07:22'),
(24, 'Manikganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:35', '2018-04-25 10:07:35'),
(25, 'Munshiganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:47', '2018-04-25 10:07:47'),
(26, 'Narayanganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:57', '2018-04-25 10:07:57'),
(27, 'Narsingdi', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:08:14', '2018-04-25 10:08:14'),
(28, 'Rajbari', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:08:51', '2018-04-25 10:08:51'),
(29, 'Shariatpur', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:09:01', '2018-04-25 10:09:01'),
(30, 'Tangail', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:09:14', '2018-04-25 10:09:14'),
(31, 'Bagerhat', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:13:06', '2018-04-25 10:13:06'),
(32, 'Chuadanga', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:13:15', '2018-04-25 10:13:15'),
(33, 'Jashore', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:13:23', '2018-04-25 10:13:23'),
(34, 'Jhenaidah', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:13:39', '2018-04-25 10:13:39'),
(35, 'Khulna', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:14:03', '2018-04-25 10:14:03'),
(36, 'Kushtia', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:14:15', '2018-04-25 10:14:15'),
(37, 'Magura', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:14:37', '2018-04-25 10:14:37'),
(38, 'Meherpur', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:14:51', '2018-04-25 10:14:51'),
(39, 'Narail', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:15:08', '2018-04-25 10:15:08'),
(40, 'Satkhira', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:15:25', '2018-04-25 10:15:25'),
(41, 'Jamalpur', 5, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:16:37', '2018-04-25 10:16:37'),
(42, 'Mymensingh', 5, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:17:35', '2018-04-25 10:17:35'),
(43, 'Netrokona', 5, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:17:45', '2018-04-25 10:17:45'),
(44, 'Sherpur', 5, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:17:58', '2018-04-25 10:17:58'),
(45, 'Bagura', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:20:43', '2018-04-25 10:20:43'),
(46, 'Jaipurhat', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:20:56', '2018-04-25 10:20:56'),
(47, 'Naogaon', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:21:07', '2018-04-25 10:21:07'),
(48, 'Natore', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:21:23', '2018-04-25 10:21:23'),
(49, 'Nawabganj', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:21:42', '2018-04-25 10:21:42'),
(50, 'Pabna', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:21:57', '2018-04-25 10:21:57'),
(51, 'Rajshahi', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:22:08', '2018-04-25 10:22:08'),
(52, 'Sirajganj', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:22:32', '2018-04-25 10:22:32'),
(53, 'Dinajpur', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:10', '2018-04-25 10:23:10'),
(54, 'Gaibandha', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:20', '2018-04-25 10:23:20'),
(55, 'Kurigram', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:30', '2018-04-25 10:23:30'),
(56, 'Lalmonirhat', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:40', '2018-04-25 10:23:40'),
(57, 'Nilphamari', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:51', '2018-04-25 10:23:51'),
(58, 'Panchagarh', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:24:00', '2018-04-25 10:24:00'),
(59, 'Rangpur', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:24:10', '2018-04-25 10:24:10'),
(60, 'Thakurgaon', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:24:23', '2018-04-25 10:24:23'),
(61, 'Habiganj', 8, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:24:51', '2018-04-25 10:24:51'),
(62, 'Moulvibazar', 8, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:25:02', '2018-04-25 10:25:02'),
(63, 'Sunamganj', 8, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:25:13', '2018-04-25 10:25:13'),
(64, 'Sylhet', 8, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:25:22', '2018-04-25 10:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `districts_orig`
--

CREATE TABLE `districts_orig` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `division_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `districts_orig`
--

INSERT INTO `districts_orig` (`id`, `name`, `division_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Barguna', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:37:51', '2018-04-25 10:36:43'),
(2, 'Barishal', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:38:21', '2018-04-25 09:38:21'),
(3, 'Bhola', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:38:59', '2018-04-25 09:38:59'),
(4, 'Jhalokati', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:39:10', '2018-04-25 09:39:10'),
(5, 'Patuakhali', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:39:23', '2018-04-25 09:39:23'),
(6, 'Pirojpur', 1, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:39:36', '2018-04-25 09:39:36'),
(7, 'Bandarban', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:40:48', '2018-04-25 09:40:48'),
(8, 'Brahmanbaria', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:41:02', '2018-04-25 09:41:02'),
(9, 'Chandpur', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:41:13', '2018-04-25 09:41:13'),
(10, 'Chittagong', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:41:34', '2018-04-25 09:41:34'),
(11, 'Comilla', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:42:32', '2018-04-25 09:42:32'),
(12, 'Cox\'s Bazar', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:42:55', '2018-04-25 09:42:55'),
(13, 'Feni', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:43:06', '2018-04-25 09:43:06'),
(14, 'Khagrachari', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:43:17', '2018-04-25 09:43:17'),
(15, 'Lakshmipur', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:43:44', '2018-04-25 09:43:44'),
(16, 'Noakhali', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:43:53', '2018-04-25 09:43:53'),
(17, 'Rangamati', 2, NULL, 1, NULL, NULL, NULL, '2018-04-25 09:44:08', '2018-04-25 09:44:08'),
(18, 'Dhaka', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:05:32', '2018-04-25 10:05:32'),
(19, 'Faridpur', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:05:47', '2018-04-25 10:05:47'),
(20, 'Gazipur', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:05:59', '2018-04-25 10:05:59'),
(21, 'Gopalganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:06:56', '2018-04-25 10:06:56'),
(22, 'Kishoreganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:12', '2018-04-25 10:07:12'),
(23, 'Madaripur', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:22', '2018-04-25 10:07:22'),
(24, 'Manikganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:35', '2018-04-25 10:07:35'),
(25, 'Munshiganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:47', '2018-04-25 10:07:47'),
(26, 'Narayanganj', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:07:57', '2018-04-25 10:07:57'),
(27, 'Narsingdi', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:08:14', '2018-04-25 10:08:14'),
(28, 'Rajbari', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:08:51', '2018-04-25 10:08:51'),
(29, 'Shariatpur', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:09:01', '2018-04-25 10:09:01'),
(30, 'Tangail', 3, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:09:14', '2018-04-25 10:09:14'),
(31, 'Bagerhat', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:13:06', '2018-04-25 10:13:06'),
(32, 'Chuadanga', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:13:15', '2018-04-25 10:13:15'),
(33, 'Jashore', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:13:23', '2018-04-25 10:13:23'),
(34, 'Jhenaidah', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:13:39', '2018-04-25 10:13:39'),
(35, 'Khulna', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:14:03', '2018-04-25 10:14:03'),
(36, 'Kushtia', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:14:15', '2018-04-25 10:14:15'),
(37, 'Magura', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:14:37', '2018-04-25 10:14:37'),
(38, 'Meherpur', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:14:51', '2018-04-25 10:14:51'),
(39, 'Narail', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:15:08', '2018-04-25 10:15:08'),
(40, 'Satkhira', 4, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:15:25', '2018-04-25 10:15:25'),
(41, 'Jamalpur', 5, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:16:37', '2018-04-25 10:16:37'),
(42, 'Mymensingh', 5, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:17:35', '2018-04-25 10:17:35'),
(43, 'Netrokona', 5, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:17:45', '2018-04-25 10:17:45'),
(44, 'Sherpur', 5, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:17:58', '2018-04-25 10:17:58'),
(45, 'Bagura', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:20:43', '2018-04-25 10:20:43'),
(46, 'Jaipurhat', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:20:56', '2018-04-25 10:20:56'),
(47, 'Naogaon', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:21:07', '2018-04-25 10:21:07'),
(48, 'Natore', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:21:23', '2018-04-25 10:21:23'),
(49, 'Nawabganj', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:21:42', '2018-04-25 10:21:42'),
(50, 'Pabna', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:21:57', '2018-04-25 10:21:57'),
(51, 'Rajshahi', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:22:08', '2018-04-25 10:22:08'),
(52, 'Sirajganj', 6, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:22:32', '2018-04-25 10:22:32'),
(53, 'Dinajpur', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:10', '2018-04-25 10:23:10'),
(54, 'Gaibandha', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:20', '2018-04-25 10:23:20'),
(55, 'Kurigram', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:30', '2018-04-25 10:23:30'),
(56, 'Lalmonirhat', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:40', '2018-04-25 10:23:40'),
(57, 'Nilphamari', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:23:51', '2018-04-25 10:23:51'),
(58, 'Panchagarh', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:24:00', '2018-04-25 10:24:00'),
(59, 'Rangpur', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:24:10', '2018-04-25 10:24:10'),
(60, 'Thakurgaon', 7, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:24:23', '2018-04-25 10:24:23'),
(61, 'Habiganj', 8, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:24:51', '2018-04-25 10:24:51'),
(62, 'Moulvibazar', 8, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:25:02', '2018-04-25 10:25:02'),
(63, 'Sunamganj', 8, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:25:13', '2018-04-25 10:25:13'),
(64, 'Sylhet', 8, NULL, 1, NULL, NULL, NULL, '2018-04-25 10:25:22', '2018-04-25 10:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Barishal', NULL, 1, NULL, NULL, NULL, '2018-04-25 07:38:32', '2018-04-25 08:28:47'),
(2, 'Chittagong', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:32:34', '2018-04-25 08:32:34'),
(3, 'Dhaka', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:32:46', '2018-04-25 08:32:46'),
(4, 'Khulna', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:32:57', '2018-04-25 08:32:57'),
(5, 'Mymensingh', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:33:07', '2018-04-25 08:33:07'),
(6, 'Rajshahi', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:33:19', '2018-04-25 08:33:19'),
(7, 'Rangpur', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:33:31', '2018-04-25 08:33:31'),
(8, 'Sylhet', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:33:41', '2018-04-25 08:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `divisions_orig`
--

CREATE TABLE `divisions_orig` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `divisions_orig`
--

INSERT INTO `divisions_orig` (`id`, `name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Barishal', NULL, 1, NULL, NULL, NULL, '2018-04-25 07:38:32', '2018-04-25 08:28:47'),
(2, 'Chittagong', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:32:34', '2018-04-25 08:32:34'),
(3, 'Dhaka', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:32:46', '2018-04-25 08:32:46'),
(4, 'Khulna', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:32:57', '2018-04-25 08:32:57'),
(5, 'Mymensingh', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:33:07', '2018-04-25 08:33:07'),
(6, 'Rajshahi', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:33:19', '2018-04-25 08:33:19'),
(7, 'Rangpur', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:33:31', '2018-04-25 08:33:31'),
(8, 'Sylhet', NULL, 1, NULL, NULL, NULL, '2018-04-25 08:33:41', '2018-04-25 08:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2018_07_19_075842_create_departments_table', 2),
('2018_07_19_122042_create_ticket_types_table', 3),
('2018_07_19_122133_create_ticket_statuses_table', 3),
('2018_08_04_091905_create_selects_table', 4),
('2018_08_04_093058_create_options_table', 5),
('2018_08_04_110823_create_tickets_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `select_id` int(10) UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `select_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Invoice Call', 1, 'Active', 1, 1, NULL, NULL, '2018-08-11 12:03:02', '2018-08-11 12:14:27'),
(2, 'Service Call', 1, 'Active', 1, NULL, NULL, NULL, '2018-08-11 12:03:21', '2018-08-11 12:03:21'),
(3, 'Warranty', 2, 'Active', 1, 1, NULL, NULL, '2018-08-11 12:07:14', '2018-08-18 04:56:49'),
(4, 'Paid', 2, 'Active', 1, 1, NULL, NULL, '2018-08-11 12:07:28', '2018-08-18 04:57:10'),
(5, 'MYOL Call', 1, 'Active', 1, NULL, NULL, NULL, '2018-08-13 11:31:49', '2018-08-13 11:31:49'),
(6, 'N/A', 2, 'Active', 8, NULL, NULL, NULL, '2018-09-08 06:47:57', '2018-09-08 06:47:57'),
(7, 'Subject Ticketing', 3, 'Inactive', 1, 11, NULL, NULL, '2018-09-12 05:22:36', '2018-10-03 05:14:21'),
(8, 'Subject Name2', 3, 'Inactive', 1, 11, NULL, NULL, '2018-09-12 05:23:03', '2018-10-03 05:12:44'),
(9, 'Service Delay Issue from Workshop(Serv)', 3, 'Active', 8, 11, NULL, NULL, '2018-10-01 09:45:28', '2018-10-03 13:18:09'),
(10, 'Service Delay Issue(Serv)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:14:39', '2018-10-03 05:14:39'),
(11, 'Not Skilled Technician(Serv)', 3, 'Active', 11, 11, NULL, NULL, '2018-10-03 05:15:03', '2018-10-03 05:16:36'),
(12, 'Repeat Repair Issue(Serv)', 3, 'Active', 11, 11, NULL, NULL, '2018-10-03 05:15:45', '2018-10-03 05:16:22'),
(13, 'Technician Behavior Issue(Serv) ', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:16:12', '2018-10-03 05:16:12'),
(14, 'Technician Schedule Missed(Serv)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:17:31', '2018-10-03 05:17:31'),
(15, 'Technician Supervisor Issue(Serv)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:17:58', '2018-10-03 05:17:58'),
(16, 'Over Service Charge Issue(Serv)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:18:26', '2018-10-03 05:18:26'),
(17, 'Product Delivery Delay from Service(Front)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:19:24', '2018-10-03 05:19:24'),
(18, 'Front Desk Issue(Front)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:19:41', '2018-10-03 05:19:41'),
(19, 'Delivery Man Behavior Issue(Log) ', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:20:45', '2018-10-03 05:20:45'),
(20, 'Did not get Free Delivery(Log)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:21:06', '2018-10-03 05:21:06'),
(21, 'Extra Tips Wanted by Delivery Man(Log)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:23:10', '2018-10-03 05:23:10'),
(22, 'Delay Delivery from Showroom(Log)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:24:09', '2018-10-03 05:24:09'),
(23, 'Discount/Gift Item not Provided(Sales)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:24:31', '2018-10-03 05:24:31'),
(24, 'Did Not Get EMI Facility(Sales)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:25:19', '2018-10-03 05:25:19'),
(25, 'Sales Person Behavior Issue(Sales)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:25:47', '2018-10-03 05:25:47'),
(26, 'Showroom Service Issue(Sales)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-03 05:26:16', '2018-10-03 05:26:16'),
(27, 'Customer Demanding Replace/Refund(Ser)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-04 06:55:46', '2018-10-04 06:55:46'),
(28, 'Not Skilled Salesman(Sales)', 3, 'Active', 11, NULL, NULL, NULL, '2018-10-04 10:53:21', '2018-10-04 10:53:21'),
(29, 'Wrong assign from Call center ', 3, 'Active', 8, NULL, NULL, NULL, '2018-10-06 08:51:38', '2018-10-06 08:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `police_stations`
--

CREATE TABLE `police_stations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `division_id` int(10) UNSIGNED NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `police_stations`
--

INSERT INTO `police_stations` (`id`, `name`, `division_id`, `district_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Amtali Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:49:04', '2018-07-09 02:49:04'),
(2, 'Bamna Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:52:27', '2018-07-09 02:52:27'),
(3, 'Barguna Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:52:50', '2018-07-09 02:52:50'),
(4, 'Betagi Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:53:24', '2018-07-09 02:53:24'),
(5, 'Patharghata Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:53:57', '2018-07-09 02:53:57'),
(6, 'Taltali Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:54:24', '2018-07-09 02:54:24'),
(7, 'Airport Police Station (BMP)', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:05:03', '2018-07-09 03:05:03'),
(8, 'Bandar Police Station (BMP)', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:05:38', '2018-07-09 03:05:38'),
(9, 'Kawnia Police Station (BMP)', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:06:57', '2018-07-09 03:06:57'),
(10, 'Kotwali Police Station (BMP)', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:07:28', '2018-07-09 03:07:28'),
(11, 'Agailihara Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:09:26', '2018-07-09 03:09:26'),
(12, 'Babuganj Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:10:00', '2018-07-09 03:10:00'),
(13, 'Bakerganj Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:10:21', '2018-07-09 03:10:21'),
(14, 'Banaripara Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:12:15', '2018-07-09 03:12:15'),
(15, 'Gouranadi Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:13:08', '2018-07-09 03:13:08'),
(16, 'Hizla Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:13:44', '2018-07-09 03:13:44'),
(17, 'Kazirhat Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:14:20', '2018-07-09 03:14:20'),
(18, 'Mehediganj Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:14:41', '2018-07-09 03:14:41'),
(19, 'Muladi Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:15:03', '2018-07-09 03:15:03'),
(20, 'Uzirpur Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:15:25', '2018-07-09 03:15:25'),
(21, 'Bhola Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:21:05', '2018-07-09 03:21:05'),
(22, 'Burhanuddin Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:21:30', '2018-07-09 03:21:30'),
(23, 'Charfassion Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:21:48', '2018-07-09 03:21:48'),
(24, 'Daulatkhan Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:22:23', '2018-07-09 03:22:23'),
(25, 'Lalmohan Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:23:07', '2018-07-09 03:23:07'),
(26, 'Monpura Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:23:24', '2018-07-09 03:23:24'),
(27, 'Shashi Bhushan Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:23:54', '2018-07-09 03:23:54'),
(28, 'South Aaicha Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:24:15', '2018-07-09 03:24:15'),
(29, 'Tazumuddin Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:24:39', '2018-07-09 03:24:39'),
(30, 'Jhalokati Police Station', 1, 4, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:33:35', '2018-07-09 03:33:35'),
(31, 'Kathalia Police Station', 1, 4, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:33:56', '2018-07-09 03:33:56'),
(32, 'Nalchity Police Station', 1, 4, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:34:24', '2018-07-09 03:34:24'),
(33, 'Rajapur Police Station', 1, 4, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:35:01', '2018-07-09 03:35:01'),
(34, 'Bauphal Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:38:11', '2018-07-09 03:38:11'),
(35, 'Dashmina Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:38:38', '2018-07-09 03:38:38'),
(36, 'Dumki Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:39:14', '2018-07-09 03:39:14'),
(37, 'Galachipa  Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:39:47', '2018-07-09 03:39:47'),
(38, 'Kalapara Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:40:21', '2018-07-09 03:40:21'),
(39, 'Mirzaganj Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:40:59', '2018-07-09 03:40:59'),
(40, 'Mohipur Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:41:18', '2018-07-09 03:41:18'),
(41, 'Patuakhali Police Station', 1, 5, NULL, 1, 1, NULL, NULL, '2018-07-09 03:41:34', '2018-07-09 03:42:20'),
(42, 'Rangabali Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:42:56', '2018-07-09 03:42:56'),
(43, 'Bhandaria Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:48:31', '2018-07-09 03:48:31'),
(44, 'Indurkandi Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:48:48', '2018-07-09 03:48:48'),
(45, 'Kawkhali Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:49:43', '2018-07-09 03:49:43'),
(46, 'Matbaria Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:50:09', '2018-07-09 03:50:09'),
(47, 'Nazirpur Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:50:32', '2018-07-09 03:50:32'),
(48, 'Nesarabad Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:50:53', '2018-07-09 03:50:53'),
(49, 'Pirojpur Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:51:19', '2018-07-09 03:51:19'),
(50, 'Alikadam Police Station', 2, 7, NULL, 1, 1, NULL, NULL, '2018-07-09 05:53:57', '2018-07-09 05:54:57'),
(51, 'Lama police station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:54:34', '2018-07-09 05:54:34'),
(52, 'Naikhongchhari Police Station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:55:35', '2018-07-09 05:55:35'),
(53, 'Royanchari Police Station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:56:13', '2018-07-09 05:56:13'),
(54, 'Ruma Police Station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:57:07', '2018-07-09 05:57:07'),
(55, 'Sadar Police Station, Bandarban', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:58:07', '2018-07-09 05:58:07'),
(56, 'Thanchi Police Station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:58:58', '2018-07-09 05:58:58'),
(57, 'Akhaura Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:02:30', '2018-07-09 06:02:30'),
(58, 'Ashuganj Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:02:59', '2018-07-09 06:02:59'),
(59, 'Bancharampur Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:03:20', '2018-07-09 06:03:20'),
(60, 'Bijoynagar Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:04:07', '2018-07-09 06:04:07'),
(61, 'Brahmanbaria Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:05:26', '2018-07-09 06:05:26'),
(62, 'Kasba Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:05:53', '2018-07-09 06:05:53'),
(63, 'Nabinagar Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:06:46', '2018-07-09 06:06:46'),
(64, 'Nasirnagar Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:07:13', '2018-07-09 06:07:13'),
(65, 'Sarail Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:07:31', '2018-07-09 06:07:31'),
(66, 'Chandpur Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:12:23', '2018-07-09 06:12:23'),
(67, 'Faridganj Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:12:49', '2018-07-09 06:12:49'),
(68, 'Haimchar Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:13:36', '2018-07-09 06:13:36'),
(69, 'Hajiganj Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:14:00', '2018-07-09 06:14:00'),
(70, 'Kachua Police Station, Chandpur', 2, 9, NULL, 1, 1, NULL, NULL, '2018-07-09 06:14:42', '2018-07-16 04:25:40'),
(71, 'Matlab (North) Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:15:17', '2018-07-09 06:15:17'),
(72, 'Matlab South Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:15:35', '2018-07-09 06:15:35'),
(73, 'Shahrasti Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:16:01', '2018-07-09 06:16:01'),
(74, 'Akbar Shah Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:21:03', '2018-07-09 06:21:03'),
(75, 'Baijid Bostami Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:21:38', '2018-07-09 06:21:38'),
(76, 'Bakuali Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:22:14', '2018-07-09 06:22:14'),
(77, 'Bandar  Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:22:56', '2018-07-09 06:22:56'),
(78, 'Chakbazar Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:23:26', '2018-07-09 06:23:26'),
(79, 'Chandgaon Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:23:55', '2018-07-09 06:23:55'),
(80, 'Double Moorning Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:24:29', '2018-07-09 06:24:29'),
(81, 'EPZ Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:24:54', '2018-07-09 06:24:54'),
(82, 'Halishahar Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:25:31', '2018-07-09 06:25:31'),
(83, 'Karnaphuli Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:26:01', '2018-07-09 06:26:01'),
(84, 'Khulsi Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:26:35', '2018-07-09 06:26:35'),
(85, 'Kotwali Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:27:04', '2018-07-09 06:27:04'),
(86, 'Pahartoli Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:27:24', '2018-07-09 06:27:24'),
(87, 'Panchlaish Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:27:55', '2018-07-09 06:27:55'),
(88, 'Potenga Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:28:30', '2018-07-09 06:28:30'),
(89, 'Sadarghat Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:28:56', '2018-07-09 06:28:56'),
(90, 'Anowara Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:30:53', '2018-07-09 06:30:53'),
(91, 'Banshkhali Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:31:07', '2018-07-09 06:31:07'),
(92, 'Boalkhali Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:31:24', '2018-07-09 06:31:24'),
(93, 'Chandanaish Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:31:37', '2018-07-09 06:31:37'),
(94, 'Fatikchhari Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:32:33', '2018-07-09 06:32:33'),
(95, 'Hathazari Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:32:46', '2018-07-09 06:32:46'),
(96, 'Lohagara Police Station, Chittagong', 2, 10, NULL, 1, 1, NULL, NULL, '2018-07-09 06:33:26', '2018-07-16 06:04:01'),
(97, 'Mirsarai Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:37:13', '2018-07-09 06:37:13'),
(98, 'Patiya Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:37:38', '2018-07-09 06:37:38'),
(99, 'Rangunia Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:38:00', '2018-07-09 06:38:00'),
(100, 'Raujan Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:47:24', '2018-07-09 06:47:24'),
(101, 'Sandwip Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:47:38', '2018-07-09 06:47:38'),
(102, 'Satkania Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:48:11', '2018-07-09 06:48:11'),
(103, 'Sitakunda Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:48:35', '2018-07-09 06:48:35'),
(104, 'Vujpur Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:48:54', '2018-07-09 06:48:54'),
(105, 'Zorargonj Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:49:10', '2018-07-09 06:49:10'),
(106, 'Bangora Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:24:10', '2018-07-15 02:24:10'),
(107, 'Barura Police Station', 2, 11, NULL, 1, 1, NULL, NULL, '2018-07-15 02:25:49', '2018-08-11 14:03:42'),
(108, 'Brahmanpara Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:28:10', '2018-07-15 02:28:10'),
(109, 'Burichong Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:28:53', '2018-07-15 02:28:53'),
(110, 'Chandina Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:29:11', '2018-07-15 02:29:11'),
(111, 'Chouddagram Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:29:49', '2018-07-15 02:29:49'),
(112, 'Daudkandi Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:30:18', '2018-07-15 02:30:18'),
(113, 'Debidwar Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:30:46', '2018-07-15 02:30:46'),
(114, 'Homna Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:31:12', '2018-07-15 02:31:12'),
(115, 'Kotwali Police Station, Comilla', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:31:55', '2018-07-15 02:31:55'),
(116, 'Laksham Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:32:20', '2018-07-15 02:32:20'),
(117, 'Meghna Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:32:38', '2018-07-15 02:32:38'),
(118, 'Mohongonj Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:32:55', '2018-07-15 02:32:55'),
(119, 'Muradnagar Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:33:17', '2018-07-15 02:33:17'),
(120, 'Nangalkot Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:33:42', '2018-07-15 02:33:42'),
(121, 'Sadar South Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:34:06', '2018-07-15 02:34:06'),
(122, 'Titas Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:34:25', '2018-07-15 02:34:25'),
(123, 'Chakoria Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:38:45', '2018-07-15 02:38:45'),
(124, 'Cox\'s Bazar Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:39:30', '2018-07-15 02:39:30'),
(125, 'Kutubdia Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:39:53', '2018-07-15 02:39:53'),
(126, 'Moheskhali Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:40:24', '2018-07-15 02:40:24'),
(127, 'Pekua Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:40:45', '2018-07-15 02:40:45'),
(128, 'Ramu Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:41:15', '2018-07-15 02:41:15'),
(129, 'Teknaf Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:41:33', '2018-07-15 02:41:33'),
(130, 'Ukhiya Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:41:54', '2018-07-15 02:41:54'),
(131, 'Chhagalnaiya Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:45:40', '2018-07-15 02:45:40'),
(132, 'Daganbhuiyan Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:46:04', '2018-07-15 02:46:04'),
(133, 'Feni Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:46:26', '2018-07-15 02:46:26'),
(134, 'Fulgazi Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:46:45', '2018-07-15 02:46:45'),
(135, 'Porshuram Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:49:47', '2018-07-15 02:49:47'),
(136, 'Sonagazi Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:50:12', '2018-07-15 02:50:12'),
(137, 'Dighinala Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:08:07', '2018-07-15 03:08:07'),
(138, 'Gulimara Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:08:45', '2018-07-15 03:08:45'),
(139, 'Khagrachari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:09:07', '2018-07-15 03:09:07'),
(140, 'Laxmichari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:09:42', '2018-07-15 03:09:42'),
(141, 'Mahalchari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:10:05', '2018-07-15 03:10:05'),
(142, 'Manikchari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:10:40', '2018-07-15 03:10:40'),
(143, 'Matiranga Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:11:06', '2018-07-15 03:11:06'),
(144, 'Panchari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:11:37', '2018-07-15 03:11:37'),
(145, 'Ramgarh Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:12:03', '2018-07-15 03:12:03'),
(146, 'Chandraganj Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:21:11', '2018-07-15 03:21:11'),
(147, 'Kamalnagar Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:21:37', '2018-07-15 03:21:37'),
(148, 'Lakshmipur Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:22:05', '2018-07-15 03:22:05'),
(149, 'Raipur Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:24:04', '2018-07-15 03:24:04'),
(150, 'Ramganj Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:24:38', '2018-07-15 03:24:38'),
(151, 'Ramgati Police Station', 2, 15, NULL, 1, 1, NULL, NULL, '2018-07-15 03:25:41', '2018-07-15 03:35:09'),
(152, 'Begumganj Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:36:46', '2018-07-15 03:36:46'),
(153, 'Char Rajibpur Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:37:09', '2018-07-15 03:37:09'),
(154, 'Chatkhil Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:37:35', '2018-07-15 03:37:35'),
(155, 'Companiganj Police Station, Noakhali', 2, 16, NULL, 1, 1, NULL, NULL, '2018-07-15 03:37:59', '2018-07-17 06:07:07'),
(156, 'Hatiya Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:38:19', '2018-07-15 03:38:19'),
(157, 'Kabirhat Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:38:49', '2018-07-15 03:38:49'),
(158, 'Senbagh Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:39:15', '2018-07-15 03:39:15'),
(159, 'Sonaimuri Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:39:39', '2018-07-15 03:39:39'),
(160, 'Subarna Char Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:39:54', '2018-07-15 03:39:54'),
(161, 'Sudharam Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:40:13', '2018-07-15 03:40:13'),
(162, 'Baghaichari Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:43:37', '2018-07-15 03:43:37'),
(163, 'Barkal Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:44:04', '2018-07-15 03:44:04'),
(164, 'Belaichhari Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:44:28', '2018-07-15 03:44:28'),
(165, 'Chandroghona Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:45:00', '2018-07-15 03:45:00'),
(166, 'Juraichari Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:45:20', '2018-07-15 03:45:20'),
(167, 'Kaptai Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:45:43', '2018-07-15 03:45:43'),
(168, 'Kaukhali Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:46:09', '2018-07-15 03:46:09'),
(169, 'Kotwali Police Station, Rangamati', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:46:52', '2018-07-15 03:46:52'),
(170, 'Longadu Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:47:15', '2018-07-15 03:47:15'),
(171, 'Naniarchar Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:47:36', '2018-07-15 03:47:36'),
(172, 'Rajasthali Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:47:58', '2018-07-15 03:47:58'),
(173, 'Sajek Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:48:20', '2018-07-15 03:48:20'),
(174, 'Adabor Police Station (DMP)', 3, 18, NULL, 1, 1, NULL, NULL, '2018-07-15 03:59:30', '2018-07-15 04:00:24'),
(175, 'Airport Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:00:58', '2018-07-15 04:00:58'),
(176, 'Badda Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:01:43', '2018-07-15 04:01:43'),
(177, 'Banani Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:02:12', '2018-07-15 04:02:12'),
(178, 'Bangshal Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:02:50', '2018-07-15 04:02:50'),
(179, 'Cantonment Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:03:25', '2018-07-15 04:03:25'),
(180, 'Chak Bazar Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:03:49', '2018-07-15 04:03:49'),
(181, 'Darus Salam Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:04:28', '2018-07-15 04:04:28'),
(182, 'Daskhinkhan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:05:01', '2018-07-15 04:05:01'),
(183, 'Demra Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:05:28', '2018-07-15 04:05:28'),
(184, 'Dhanmondi  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:05:59', '2018-07-15 04:05:59'),
(185, 'Gendaria Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:06:24', '2018-07-15 04:06:24'),
(186, 'Gulshan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:07:08', '2018-07-15 04:07:08'),
(187, 'Hazaribag  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:07:35', '2018-07-15 04:07:35'),
(188, 'Jatrabari Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:08:00', '2018-07-15 04:08:00'),
(189, 'Kadomtoli Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:08:30', '2018-07-15 04:08:30'),
(190, 'Kafrul Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:08:56', '2018-07-15 04:08:56'),
(191, 'Kalabagan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:09:26', '2018-07-15 04:09:26'),
(192, 'Kamrangirchar Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:10:04', '2018-07-15 04:10:04'),
(193, 'Khilgaon Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:10:28', '2018-07-15 04:10:28'),
(194, 'Khilkhet Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:10:59', '2018-07-15 04:10:59'),
(195, 'Kotwali Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:11:25', '2018-07-15 04:11:25'),
(196, 'Lalbag Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:12:04', '2018-07-15 04:12:04'),
(197, 'Mirpur Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:12:25', '2018-07-15 04:12:25'),
(198, 'Mohammadpur Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:13:03', '2018-07-15 04:13:03'),
(199, 'Motijheel Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:13:36', '2018-07-15 04:13:36'),
(200, 'Mugda Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:13:59', '2018-07-15 04:13:59'),
(201, 'New Market Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:14:26', '2018-07-15 04:14:26'),
(202, 'Pallabi Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:14:48', '2018-07-15 04:14:48'),
(203, 'Paltan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:15:21', '2018-07-15 04:15:21'),
(204, 'Ramna Model Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:15:51', '2018-07-15 04:15:51'),
(205, 'Rampura  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:16:32', '2018-07-15 04:16:32'),
(206, 'Rupnagar Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:17:01', '2018-07-15 04:17:01'),
(207, 'Sabujbag Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:17:39', '2018-07-15 04:17:39'),
(208, 'Shah Ali Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:18:17', '2018-07-15 04:18:17'),
(209, 'Shahbag  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:18:48', '2018-07-15 04:18:48'),
(210, 'Shahjahanpur Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:19:22', '2018-07-15 04:19:22'),
(211, 'Shampur Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:19:46', '2018-07-15 04:19:46'),
(212, 'Sher-e-Bangla Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:20:21', '2018-07-15 04:20:21'),
(213, 'Sutrapur  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:20:51', '2018-07-15 04:20:51'),
(214, 'Tejgaon I/A Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:21:22', '2018-07-15 04:21:22'),
(215, 'Tejgaon Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:21:54', '2018-07-15 04:21:54'),
(216, 'Turag Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:23:02', '2018-07-15 04:23:02'),
(217, 'Uttara (West) Police Station (DMP)', 3, 18, NULL, 1, 1, NULL, NULL, '2018-07-15 04:23:24', '2018-07-15 04:24:08'),
(218, 'Uttara Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:23:50', '2018-07-15 04:23:50'),
(219, 'Uttarkhan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:24:54', '2018-07-15 04:24:54'),
(220, 'Vasantek Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:25:18', '2018-07-15 04:25:18'),
(221, 'Vatara Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:26:12', '2018-07-15 04:26:12'),
(222, 'Wari Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:26:48', '2018-07-15 04:26:48'),
(223, 'Ashulia Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:34:11', '2018-07-15 04:34:11'),
(224, 'Dhamrai Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:34:25', '2018-07-15 04:34:25'),
(225, 'Dohar Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:34:41', '2018-07-15 04:34:41'),
(226, 'Keraniganj Model Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:35:05', '2018-07-15 04:35:05'),
(227, 'Nawabganj Model Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:35:26', '2018-07-15 04:35:26'),
(228, 'Savar Model Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:35:44', '2018-07-15 04:35:44'),
(229, 'South Keraniganj Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:36:01', '2018-07-15 04:36:01'),
(230, 'Alfadanga Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:42:54', '2018-07-15 04:42:54'),
(231, 'Boalmari Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:43:13', '2018-07-15 04:43:13'),
(232, 'Charbhadrasan Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:43:53', '2018-07-15 04:43:53'),
(233, 'Kotwali Police Station, Faridpur', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:44:35', '2018-07-15 04:44:35'),
(234, 'Madhukhali Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:45:04', '2018-07-15 04:45:04'),
(235, 'Nagarkanda Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:45:34', '2018-07-15 04:45:34'),
(236, 'Sadarpur Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:46:01', '2018-07-15 04:46:01'),
(237, 'Saltha Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:46:36', '2018-07-15 04:46:36'),
(238, 'Vanga Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:46:55', '2018-07-15 04:46:55'),
(239, 'Joydebpur Police Station', 3, 20, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:00:21', '2018-07-15 23:00:21'),
(240, 'Kaliakoir Police Station', 3, 20, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:00:44', '2018-07-15 23:00:44'),
(241, 'Kaliganj Police Station, Gazipur', 3, 20, NULL, 1, 1, NULL, NULL, '2018-07-15 23:01:09', '2018-07-16 04:57:52'),
(242, 'Kapasia Police Station', 3, 20, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:01:33', '2018-07-15 23:01:33'),
(243, 'Sreepur Police Station, Gazipur', 3, 20, NULL, 1, 1, NULL, NULL, '2018-07-15 23:01:55', '2018-07-16 05:54:42'),
(244, 'Tongi Police Station', 3, 20, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:02:41', '2018-07-15 23:02:41'),
(245, 'Gopalganj Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:09:03', '2018-07-15 23:09:03'),
(246, 'Kasiani Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:10:29', '2018-07-15 23:10:29'),
(247, 'Kotalipara Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:11:04', '2018-07-15 23:11:04'),
(248, 'Muksudpur Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:11:34', '2018-07-15 23:11:34'),
(249, 'Tungipara Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:12:00', '2018-07-15 23:12:00'),
(250, 'Austagram Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:17:11', '2018-07-15 23:17:11'),
(251, 'Bajitpur Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:17:32', '2018-07-15 23:17:32'),
(252, 'Bhairab Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:18:17', '2018-07-15 23:18:17'),
(253, 'Hosainpur Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:18:38', '2018-07-15 23:18:38'),
(254, 'Itna Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:28:41', '2018-07-15 23:28:41'),
(255, 'Karimganj Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:29:11', '2018-07-15 23:29:11'),
(256, 'Katiadi Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:29:51', '2018-07-15 23:29:51'),
(257, 'Kishoreganj Police Station, Kishoreganj', 3, 22, NULL, 1, 1, NULL, NULL, '2018-07-15 23:30:30', '2018-07-17 04:45:50'),
(258, 'Kuliarchar Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:31:50', '2018-07-15 23:31:50'),
(259, 'Mithamoin Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:32:29', '2018-07-15 23:32:29'),
(260, 'Nikli Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:32:59', '2018-07-15 23:32:59'),
(261, 'Pakundia Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:34:32', '2018-07-15 23:34:32'),
(262, 'Tarail Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:35:16', '2018-07-15 23:35:16'),
(263, 'Dashar Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:39:56', '2018-07-15 23:39:56'),
(264, 'Kalkini Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:40:21', '2018-07-15 23:40:21'),
(265, 'Madaripur Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:40:51', '2018-07-15 23:40:51'),
(266, 'Rajoir Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:41:18', '2018-07-15 23:41:18'),
(267, 'Shibchar Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:41:41', '2018-07-15 23:41:41'),
(268, 'Doulatpur Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:45:27', '2018-07-15 23:45:27'),
(269, 'Ghior Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:46:00', '2018-07-15 23:46:00'),
(270, 'Harirampur  Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:46:39', '2018-07-15 23:46:39'),
(271, 'Manikganj Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:47:06', '2018-07-15 23:47:06'),
(272, 'Saturia Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:47:42', '2018-07-15 23:47:42'),
(273, 'Shibalaya Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:48:11', '2018-07-15 23:48:11'),
(274, 'Singair Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:49:09', '2018-07-15 23:49:09'),
(275, 'Gazaria Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:02:25', '2018-07-16 03:02:25'),
(276, 'Lohajang Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:03:07', '2018-07-16 03:03:07'),
(277, 'Munshiganj Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:04:16', '2018-07-16 03:04:16'),
(278, 'Serajdikhan Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:04:53', '2018-07-16 03:04:53'),
(279, 'Sreenagar Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:05:53', '2018-07-16 03:05:53'),
(280, 'Tongibari Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:06:29', '2018-07-16 03:06:29'),
(281, 'Belabo Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:09:22', '2018-07-16 03:09:22'),
(282, 'Madhabdi Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:09:40', '2018-07-16 03:09:40'),
(283, 'Manohardi Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:09:59', '2018-07-16 03:09:59'),
(284, 'Narsingdi Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:11:10', '2018-07-16 03:11:10'),
(285, 'Palash Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:11:38', '2018-07-16 03:11:38'),
(286, 'Raipura Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:12:13', '2018-07-16 03:12:13'),
(287, 'Shibpur Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:12:39', '2018-07-16 03:12:39'),
(288, 'Baliakandi Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:15:28', '2018-07-16 03:15:28'),
(289, 'Goalanda Ghat Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:15:49', '2018-07-16 03:15:49'),
(290, 'Kalukhali Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:16:19', '2018-07-16 03:16:19'),
(291, 'Pangsha Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:16:50', '2018-07-16 03:16:50'),
(292, 'Rajbari Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:17:10', '2018-07-16 03:17:10'),
(293, 'Bhedarganj Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:22:07', '2018-07-16 03:22:07'),
(294, 'Damudya Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:22:51', '2018-07-16 03:22:51'),
(295, 'Goshairhat Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:23:19', '2018-07-16 03:23:19'),
(296, 'Janjira Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:23:42', '2018-07-16 03:23:42'),
(297, 'Noria Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:24:00', '2018-07-16 03:24:00'),
(298, 'Palong Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:24:26', '2018-07-16 03:24:26'),
(299, 'Sakhipur Police Station, Shariatpur', 3, 29, NULL, 1, 1, NULL, NULL, '2018-07-16 03:24:45', '2018-07-16 03:34:07'),
(300, 'Basail Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:27:03', '2018-07-16 03:27:03'),
(301, 'Bhuapur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:27:26', '2018-07-16 03:27:26'),
(302, 'Delduar Police Staton', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:27:57', '2018-07-16 03:27:57'),
(303, 'Dhanbari Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:28:35', '2018-07-16 03:28:35'),
(304, 'Ghatail Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:28:54', '2018-07-16 03:28:54'),
(305, 'Gopalpur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:29:20', '2018-07-16 03:29:20'),
(306, 'Jamuna Bridge Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:29:39', '2018-07-16 03:29:39'),
(307, 'Kalihati Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:29:57', '2018-07-16 03:29:57'),
(308, 'Madhupur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:30:23', '2018-07-16 03:30:23'),
(309, 'Mirzapur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:30:54', '2018-07-16 03:30:54'),
(310, 'Nagarpur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:32:00', '2018-07-16 03:32:00'),
(311, 'Sakhipur Police Station, Tangail', 3, 30, NULL, 1, 1, NULL, NULL, '2018-07-16 03:35:09', '2018-07-16 03:35:43'),
(312, 'Tangail Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:36:08', '2018-07-16 03:36:08'),
(313, 'Bagerhat Police Station', 4, 31, NULL, 1, 1, NULL, NULL, '2018-07-16 04:22:14', '2018-07-16 04:23:14'),
(314, 'Chitalmari Police Station', 4, 31, NULL, 1, 1, NULL, NULL, '2018-07-16 04:22:40', '2018-07-16 04:23:29'),
(315, 'Fakirhat Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:24:21', '2018-07-16 04:24:21'),
(316, 'Kachua Police Station, Bagerhat', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:26:18', '2018-07-16 04:26:18'),
(317, 'Mollahat Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:26:58', '2018-07-16 04:26:58'),
(318, 'Mongla Police Station', 4, 31, NULL, 1, 1, NULL, NULL, '2018-07-16 04:27:37', '2018-07-16 04:27:47'),
(319, 'Morrelganj Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:28:19', '2018-07-16 04:28:19'),
(320, 'Rampal Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:28:50', '2018-07-16 04:28:50'),
(321, 'Sarankhola Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:29:29', '2018-07-16 04:29:29'),
(322, 'Alamdanga Police Station', 4, 32, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:35:46', '2018-07-16 04:35:46'),
(323, 'Chuadanga Police Station', 4, 32, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:36:13', '2018-07-16 04:36:13'),
(324, 'Damurhuda Police Station', 4, 32, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:36:39', '2018-07-16 04:36:39'),
(325, 'Jiban Nagar Police Station', 4, 32, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:37:26', '2018-07-16 04:37:26'),
(326, 'Abhoynagar Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:43:01', '2018-07-16 04:43:01'),
(327, 'Bagharpara Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:43:36', '2018-07-16 04:43:36'),
(328, 'Benapol Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:44:24', '2018-07-16 04:44:24'),
(329, 'Chaugacha Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:45:23', '2018-07-16 04:45:23'),
(330, 'Jhikargacha Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:46:11', '2018-07-16 04:46:11'),
(331, 'Keshabpur Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:46:50', '2018-07-16 04:46:50'),
(332, 'Kotwali Police Station, Jashore', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:47:56', '2018-07-16 04:47:56'),
(333, 'Manirampur Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:48:29', '2018-07-16 04:48:29'),
(334, 'Sharsha Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:48:59', '2018-07-16 04:48:59'),
(335, 'Harinakunda Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:53:32', '2018-07-16 04:53:32'),
(336, 'Jhenaidah Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:54:23', '2018-07-16 04:54:23'),
(337, 'Kaliganj Police Station, Jhenaidah', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:57:12', '2018-07-16 04:57:12'),
(338, 'Kotchandpur Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:00:04', '2018-07-16 05:00:04'),
(339, 'Maheshpur Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:01:22', '2018-07-16 05:01:22'),
(340, 'Shailkupa Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:02:00', '2018-07-16 05:02:00'),
(341, 'Arangghata  Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:06:58', '2018-07-16 05:06:58'),
(342, 'Doulatpur Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:07:46', '2018-07-16 05:07:46'),
(343, 'Horintana Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:08:23', '2018-07-16 05:08:23'),
(344, 'Khalishpur Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:09:19', '2018-07-16 05:09:19'),
(345, 'Khan Jahan Ali  Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:09:52', '2018-07-16 05:09:52'),
(346, 'Khulna Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:10:18', '2018-07-16 05:10:18'),
(347, 'Labanchara Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:10:51', '2018-07-16 05:10:51'),
(348, 'Sonadanga Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:11:39', '2018-07-16 05:11:39'),
(349, 'Batiaghata Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:36:38', '2018-07-16 05:36:38'),
(350, 'Dacope Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:37:00', '2018-07-16 05:37:00'),
(351, 'Dighalia Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:37:19', '2018-07-16 05:37:19'),
(352, 'Dumuria Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:37:40', '2018-07-16 05:37:40'),
(353, 'Koyra Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:38:06', '2018-07-16 05:38:06'),
(354, 'Paikgacha Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:38:42', '2018-07-16 05:38:42'),
(355, 'Phultala Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:39:05', '2018-07-16 05:39:05'),
(356, 'Rupsa Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:39:46', '2018-07-16 05:39:46'),
(357, 'Terokhada Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:40:25', '2018-07-16 05:40:25'),
(358, 'Bheramara Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:43:46', '2018-07-16 05:43:46'),
(359, 'Daulatpur Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:44:13', '2018-07-16 05:44:13'),
(360, 'Islami University Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:44:53', '2018-07-16 05:44:53'),
(361, 'Khoksha Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:45:39', '2018-07-16 05:45:39'),
(362, 'Kumarkhali Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:46:07', '2018-07-16 05:46:07'),
(363, 'Kushtia Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:46:31', '2018-07-16 05:46:31'),
(364, 'Mirpur Police Station, Kushtia', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:49:14', '2018-07-16 05:49:14'),
(365, 'Magura Police Station', 4, 37, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:51:14', '2018-07-16 05:51:14'),
(366, 'Mohammadpur Police Station, Magura', 4, 37, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:52:12', '2018-07-16 05:52:12'),
(367, 'Shalikha Police Station', 4, 37, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:52:40', '2018-07-16 05:52:40'),
(368, 'Sreepur Police Station, Magura', 4, 37, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:54:06', '2018-07-16 05:54:06'),
(369, 'Gangni Police Station', 4, 38, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:56:22', '2018-07-16 05:56:22'),
(370, 'Meherpur Police Station', 4, 38, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:57:03', '2018-07-16 05:57:03'),
(371, 'Mujibnagar Police Station', 4, 38, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:57:32', '2018-07-16 05:57:32'),
(372, 'Kalia Police Station', 4, 39, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:59:54', '2018-07-16 05:59:54'),
(373, 'Lohagara Police Station, Narail', 4, 39, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:01:04', '2018-07-16 06:01:04'),
(374, 'Naragathy Police Station', 4, 39, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:02:24', '2018-07-16 06:02:24'),
(375, 'Narail Police Station', 4, 39, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:02:59', '2018-07-16 06:02:59'),
(376, 'Assasuni Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:31:47', '2018-07-16 06:31:47'),
(377, 'Debhata Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:32:54', '2018-07-16 06:32:54'),
(378, 'Kalaroa Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:33:20', '2018-07-16 06:33:20'),
(379, 'Kaliganj Police Station, Satkhira', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:34:27', '2018-07-16 06:34:27'),
(380, 'Patkelghata Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:35:00', '2018-07-16 06:35:00'),
(381, 'Satkhira Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:35:29', '2018-07-16 06:35:29'),
(382, 'Shyamnagar Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:35:59', '2018-07-16 06:35:59'),
(383, 'Tala Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:36:30', '2018-07-16 06:36:30'),
(384, 'Bahadurabad Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:45:44', '2018-07-16 06:45:44'),
(385, 'Bakshiganj Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:46:04', '2018-07-16 06:46:04'),
(386, 'Dewanganj Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:46:29', '2018-07-16 06:46:29'),
(387, 'Islampur Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:46:48', '2018-07-16 06:46:48'),
(388, 'Jamalpur Sadar Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:48:14', '2018-07-16 06:48:14'),
(389, 'Madarganj Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:48:49', '2018-07-16 06:48:49'),
(390, 'Melandah Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:51:40', '2018-07-16 06:51:40'),
(391, 'Sarishabari Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:52:11', '2018-07-16 06:52:11'),
(392, 'Bhaluka Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:56:38', '2018-07-16 22:56:38'),
(393, 'Dhobaura Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:57:13', '2018-07-16 22:57:13'),
(394, 'Fulbari Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:57:43', '2018-07-16 22:57:43'),
(395, 'Gaffargaon Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:58:01', '2018-07-16 22:58:01'),
(396, 'Gauripur Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:58:54', '2018-07-16 22:58:54'),
(397, 'Haluaghat Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:59:25', '2018-07-16 22:59:25'),
(398, 'Ishwarganj Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:59:47', '2018-07-16 22:59:47'),
(399, 'Kotwali Police Station, Mymensingh', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:00:24', '2018-07-16 23:00:24'),
(400, 'Muktagacha Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:00:52', '2018-07-16 23:00:52'),
(401, 'Nandail Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:01:32', '2018-07-16 23:01:32'),
(402, 'Pagla Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:02:29', '2018-07-16 23:02:29'),
(403, 'Phulpur Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:02:57', '2018-07-16 23:02:57'),
(404, 'Tarakanda Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:03:16', '2018-07-16 23:03:16'),
(405, 'Trishal Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:03:38', '2018-07-16 23:03:38'),
(406, 'Atpara Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:16:32', '2018-07-16 23:16:32'),
(407, 'Barhatta  Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:16:52', '2018-07-16 23:16:52'),
(408, 'Durgapur Police Station, Netrokona', 5, 43, NULL, 1, 1, NULL, NULL, '2018-07-16 23:17:10', '2018-07-17 00:39:58'),
(409, 'Kalmakanda Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:17:30', '2018-07-16 23:17:30'),
(410, 'Kendua Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:18:08', '2018-07-16 23:18:08'),
(411, 'Khaliajuri Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:19:11', '2018-07-16 23:19:11'),
(412, 'Madan  Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:19:29', '2018-07-16 23:19:29'),
(413, 'Mohanganj Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:20:41', '2018-07-16 23:20:41'),
(414, 'Netrokona Sadar Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:21:06', '2018-07-16 23:21:06'),
(415, 'Purbadhala Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:21:34', '2018-07-16 23:21:34'),
(416, 'Jhenaigati Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:23:58', '2018-07-16 23:23:58'),
(417, 'Nakla Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:24:15', '2018-07-16 23:24:15'),
(418, 'Nalitabari Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:24:35', '2018-07-16 23:24:35'),
(419, 'Sherpur Sadar Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:26:21', '2018-07-16 23:26:21'),
(420, 'Sreebordi Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:27:14', '2018-07-16 23:27:14'),
(421, 'Adamdighi Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:37:54', '2018-07-16 23:37:54'),
(422, 'Bogra Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:38:12', '2018-07-16 23:38:12'),
(423, 'Dhunat Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:38:33', '2018-07-16 23:38:33'),
(424, 'Dhupchanchia Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:39:12', '2018-07-16 23:39:12'),
(425, 'Gabtali Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:40:12', '2018-07-16 23:40:12'),
(426, 'Kahaloo Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:40:41', '2018-07-16 23:40:41'),
(427, 'Nandigram Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:41:06', '2018-07-16 23:41:06'),
(428, 'Sariakandi Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:42:11', '2018-07-16 23:42:11'),
(429, 'Shajahanpur Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:43:09', '2018-07-16 23:43:09'),
(430, 'Sherpur Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:44:41', '2018-07-16 23:44:41'),
(431, 'Shibganj Police Station, Bagura', 6, 45, NULL, 1, 1, NULL, NULL, '2018-07-16 23:45:02', '2018-07-17 03:51:44'),
(432, 'Sonatola Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:45:23', '2018-07-16 23:45:23'),
(433, 'Akkelpur Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:48:26', '2018-07-16 23:48:26'),
(434, 'Joypurhat Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:48:49', '2018-07-16 23:48:49'),
(435, 'kalai Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:49:22', '2018-07-16 23:49:22'),
(436, 'Khetlal Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:49:59', '2018-07-16 23:49:59'),
(437, 'Panchbibi Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:50:19', '2018-07-16 23:50:19'),
(438, 'Atrai Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:53:04', '2018-07-16 23:53:04'),
(439, 'Badalgachi Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:53:57', '2018-07-16 23:53:57');
INSERT INTO `police_stations` (`id`, `name`, `division_id`, `district_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(440, 'Dhamoirhat Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:54:24', '2018-07-16 23:54:24'),
(441, 'Manda Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:55:25', '2018-07-16 23:55:25'),
(442, 'Mohadevpur Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:55:50', '2018-07-16 23:55:50'),
(443, 'Naogaon Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:56:31', '2018-07-16 23:56:31'),
(444, 'Niamatpur Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:57:04', '2018-07-16 23:57:04'),
(445, 'Patnitala Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:57:25', '2018-07-16 23:57:25'),
(446, 'Porsha Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:01:10', '2018-07-17 00:01:10'),
(447, 'Raninagar Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:01:44', '2018-07-17 00:01:44'),
(448, 'Shapahar Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:02:30', '2018-07-17 00:02:30'),
(449, 'Bagatipara Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:04:32', '2018-07-17 00:04:32'),
(450, 'Baraigram Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:04:54', '2018-07-17 00:04:54'),
(451, 'Gurudaspur Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:05:47', '2018-07-17 00:05:47'),
(452, 'Lalpur Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:06:21', '2018-07-17 00:06:21'),
(453, 'Naldanga Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:07:07', '2018-07-17 00:07:07'),
(454, 'Natore Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:07:25', '2018-07-17 00:07:25'),
(455, 'Singra Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:08:01', '2018-07-17 00:08:01'),
(456, 'Aminpur Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:24:38', '2018-07-17 00:24:38'),
(457, 'Ataikula Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:25:01', '2018-07-17 00:25:01'),
(458, 'Atgharia Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:25:30', '2018-07-17 00:25:30'),
(459, 'Bera Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:26:01', '2018-07-17 00:26:01'),
(460, 'Bhangura Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:26:29', '2018-07-17 00:26:29'),
(461, 'Chatmohar Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:26:52', '2018-07-17 00:26:52'),
(462, 'Faridpur Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:27:30', '2018-07-17 00:27:30'),
(463, 'Ishwardi Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:27:50', '2018-07-17 00:27:50'),
(464, 'Pabna Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:28:05', '2018-07-17 00:28:05'),
(465, 'Santhia Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:28:49', '2018-07-17 00:28:49'),
(466, 'Sujanagar Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:29:15', '2018-07-17 00:29:15'),
(467, 'Boalia Police Station (RMP)', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:31:44', '2018-07-17 00:31:44'),
(468, 'Motihar Police Station (RMP)', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:32:10', '2018-07-17 00:32:10'),
(469, 'Rajpara Police Station (RMP)', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:32:37', '2018-07-17 00:32:37'),
(470, 'Shah Mokhdum Police Station (RMP)', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:33:09', '2018-07-17 00:33:09'),
(471, 'Bagha Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:37:05', '2018-07-17 00:37:05'),
(472, 'Baghmara Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:37:50', '2018-07-17 00:37:50'),
(473, 'Charghat Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:38:38', '2018-07-17 00:38:38'),
(474, 'Durgapur Police Station, Rahshahi', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:41:01', '2018-07-17 00:41:01'),
(475, 'Godagari Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:41:33', '2018-07-17 00:41:33'),
(476, 'Mohanpur Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:41:50', '2018-07-17 00:41:50'),
(477, 'Paba Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:42:25', '2018-07-17 00:42:25'),
(478, 'Puthia Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:42:40', '2018-07-17 00:42:40'),
(479, 'Tanore Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:43:12', '2018-07-17 00:43:12'),
(480, 'Belkuchi Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 02:58:51', '2018-07-17 02:58:51'),
(481, 'Chowhali Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 02:59:20', '2018-07-17 02:59:20'),
(482, 'Enayetpur Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 02:59:46', '2018-07-17 02:59:46'),
(483, 'Jamuna Bridge West Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:06:40', '2018-07-17 03:06:40'),
(484, 'Kamar Khanda Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:07:16', '2018-07-17 03:07:16'),
(485, 'Kazipur Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:07:33', '2018-07-17 03:07:33'),
(486, 'Raiganj Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:08:02', '2018-07-17 03:08:02'),
(487, 'Salanga Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:08:29', '2018-07-17 03:08:29'),
(488, 'Shahjadpur Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:08:49', '2018-07-17 03:08:49'),
(489, 'Sirajganj Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:09:07', '2018-07-17 03:09:07'),
(490, 'Tarash Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:09:34', '2018-07-17 03:09:34'),
(491, 'Ullahpara Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:09:53', '2018-07-17 03:09:53'),
(492, 'Bholahat Police Station', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:14:16', '2018-07-17 03:14:16'),
(493, 'Chapai Nawabganj Police Station', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:49:46', '2018-07-17 03:49:46'),
(494, 'Gomastapur Police Station', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:50:17', '2018-07-17 03:50:17'),
(495, 'Nachole Police Station', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:50:51', '2018-07-17 03:50:51'),
(496, 'Shibganj Police Station, Chapai Nawabganj', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:52:22', '2018-07-17 03:52:22'),
(497, 'Biral Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:06:38', '2018-07-17 04:06:38'),
(498, 'Birampur Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:07:06', '2018-07-17 04:07:06'),
(499, 'Birganj  Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:07:23', '2018-07-17 04:07:23'),
(500, 'Bochaganj Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:07:46', '2018-07-17 04:07:46'),
(501, 'Chirirbandar Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:08:00', '2018-07-17 04:08:00'),
(502, 'Fulbari  Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:08:19', '2018-07-17 04:08:19'),
(503, 'Ghoraghat Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:08:37', '2018-07-17 04:08:37'),
(504, 'Hakimpur Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:09:03', '2018-07-17 04:09:03'),
(505, 'Kaharol Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:09:35', '2018-07-17 04:09:35'),
(506, 'Khanshama Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:10:24', '2018-07-17 04:10:24'),
(507, 'Kotwali Police Station, Dinajpur', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:10:51', '2018-07-17 04:10:51'),
(508, 'Nawabganj Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:11:50', '2018-07-17 04:11:50'),
(509, 'Parbatipur Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:12:07', '2018-07-17 04:12:07'),
(510, 'Fulchhari Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:14:57', '2018-07-17 04:14:57'),
(511, 'Gaibandha Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:15:13', '2018-07-17 04:15:13'),
(512, 'Gobindaganj Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:15:28', '2018-07-17 04:15:28'),
(513, 'Palashbari Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:15:43', '2018-07-17 04:15:43'),
(514, 'Sadullapur Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:15:58', '2018-07-17 04:15:58'),
(515, 'Shaghata Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:16:12', '2018-07-17 04:16:12'),
(516, 'Sundarganj Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:22:50', '2018-07-17 04:22:50'),
(517, 'Bhurungamari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:24:42', '2018-07-17 04:24:42'),
(518, 'Charjabbar police station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:24:56', '2018-07-17 04:24:56'),
(519, 'Chilmari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:25:12', '2018-07-17 04:25:12'),
(520, 'Dushmara Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:25:29', '2018-07-17 04:25:29'),
(521, 'Kochakata Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:25:47', '2018-07-17 04:25:47'),
(522, 'Kurigram Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:26:26', '2018-07-17 04:26:26'),
(523, 'Nageswari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:26:41', '2018-07-17 04:26:41'),
(524, 'Phulbari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:26:51', '2018-07-17 04:26:51'),
(525, 'Rajarhat Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:27:09', '2018-07-17 04:27:09'),
(526, 'Rowmari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:27:24', '2018-07-17 04:27:24'),
(527, 'Ulipur Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:27:37', '2018-07-17 04:27:37'),
(528, 'Aditmari Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:29:06', '2018-07-17 04:29:06'),
(529, 'Hatibanda Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:29:24', '2018-07-17 04:29:24'),
(530, 'Kaliganj Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:29:36', '2018-07-17 04:29:36'),
(531, 'Lalmonirhat Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:29:47', '2018-07-17 04:29:47'),
(532, 'Patgram Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:30:05', '2018-07-17 04:30:05'),
(533, 'Dimla Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:41:31', '2018-07-17 04:41:31'),
(534, 'Domar Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:42:02', '2018-07-17 04:42:02'),
(535, 'Jaldhaka Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:42:32', '2018-07-17 04:42:32'),
(536, 'Kishoreganj Police Station, Nilphamari', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:48:11', '2018-07-17 04:48:11'),
(537, 'Nilphamari Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:48:59', '2018-07-17 04:48:59'),
(538, 'Sayedpur Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:49:36', '2018-07-17 04:49:36'),
(539, 'Atwari Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:51:40', '2018-07-17 04:51:40'),
(540, 'Boda Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:51:58', '2018-07-17 04:51:58'),
(541, 'Debiganj Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:52:19', '2018-07-17 04:52:19'),
(542, 'Panchagarh Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:52:40', '2018-07-17 04:52:40'),
(543, 'Tetulia Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:52:58', '2018-07-17 04:52:58'),
(544, 'Badarganj Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:55:35', '2018-07-17 04:55:35'),
(545, 'Gangachara Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:55:50', '2018-07-17 04:55:50'),
(546, 'Kaunia Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:56:01', '2018-07-17 04:56:01'),
(547, 'Kotwali Police Station, Rangpur', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:56:34', '2018-07-17 04:56:34'),
(548, 'Mitha Pukur Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:56:56', '2018-07-17 04:56:56'),
(549, 'Pirgacha Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:57:10', '2018-07-17 04:57:10'),
(550, 'Pirganj Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:57:26', '2018-07-17 04:57:26'),
(551, 'Taraganj Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:57:40', '2018-07-17 04:57:40'),
(552, 'Baliadangi Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:59:28', '2018-07-17 04:59:28'),
(553, 'Haripur Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:59:45', '2018-07-17 04:59:45'),
(554, 'Pirgonj Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:00:10', '2018-07-17 05:00:10'),
(555, 'Ranisankail Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:00:26', '2018-07-17 05:00:26'),
(556, 'Ruhia Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:00:57', '2018-07-17 05:00:57'),
(557, 'Thakurgaon Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:01:10', '2018-07-17 05:01:10'),
(558, 'Azmiriganj Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:06:03', '2018-07-17 05:06:03'),
(559, 'Bahubal Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:06:27', '2018-07-17 05:06:27'),
(560, 'Baniachong Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:06:44', '2018-07-17 05:06:44'),
(561, 'Chunarughat Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:06:59', '2018-07-17 05:06:59'),
(562, 'Habiganj Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:07:12', '2018-07-17 05:07:12'),
(563, 'Lakhai Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:07:27', '2018-07-17 05:07:27'),
(564, 'Madhabpur Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:07:39', '2018-07-17 05:07:39'),
(565, 'Nabiganj Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:08:00', '2018-07-17 05:08:00'),
(566, 'Shayestaganj Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:08:13', '2018-07-17 05:08:13'),
(567, 'Barlekha Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:50:53', '2018-07-17 05:50:53'),
(568, 'Juri Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:51:12', '2018-07-17 05:51:12'),
(569, 'Kamalganj Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:51:26', '2018-07-17 05:51:26'),
(570, 'Kulaura Police Station', 8, 62, NULL, 1, 1, NULL, NULL, '2018-07-17 05:52:56', '2018-07-17 05:53:15'),
(571, 'Moulvibazar Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:53:38', '2018-07-17 05:53:38'),
(572, 'Rajnagar Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:53:53', '2018-07-17 05:53:53'),
(573, 'Sreemangal Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:54:33', '2018-07-17 05:54:33'),
(574, 'Biswamvarpur Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:56:56', '2018-07-17 05:56:56'),
(575, 'Chatak Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:57:09', '2018-07-17 05:57:09'),
(576, 'Derai Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:57:23', '2018-07-17 05:57:23'),
(577, 'Dharampasha Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:57:36', '2018-07-17 05:57:36'),
(578, 'Dowarabazar Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:57:46', '2018-07-17 05:57:46'),
(579, 'Jagannathpur Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:01', '2018-07-17 05:58:01'),
(580, 'Jamalganj Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:13', '2018-07-17 05:58:13'),
(581, 'Moddhonagar Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:25', '2018-07-17 05:58:25'),
(582, 'South Sunamganj  Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:39', '2018-07-17 05:58:39'),
(583, 'Sulla Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:50', '2018-07-17 05:58:50'),
(584, 'Sunamganj Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:59:01', '2018-07-17 05:59:01'),
(585, 'Tahirpur Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:59:16', '2018-07-17 05:59:16'),
(586, 'Airport Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:02:45', '2018-07-17 06:02:45'),
(587, 'Jalalabad Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:03:09', '2018-07-17 06:03:09'),
(588, 'Kotwali Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:03:31', '2018-07-17 06:03:31'),
(589, 'Moglabazar Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:03:49', '2018-07-17 06:03:49'),
(590, 'Shah Paran Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:04:12', '2018-07-17 06:04:12'),
(591, 'South Surma  Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:04:28', '2018-07-17 06:04:28'),
(592, 'Balaganj Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:05:55', '2018-07-17 06:05:55'),
(593, 'Beani Bazar Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:06:07', '2018-07-17 06:06:07'),
(594, 'Biswanath Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:06:19', '2018-07-17 06:06:19'),
(595, 'Companiganj Police Station, Sylhet', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:07:27', '2018-07-17 06:07:27'),
(596, 'Fenchuganj Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:07:42', '2018-07-17 06:07:42'),
(597, 'Golapganj Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:08:09', '2018-07-17 06:08:09'),
(598, 'Gowainghat Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:08:23', '2018-07-17 06:08:23'),
(599, 'Jointiapur Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:08:36', '2018-07-17 06:08:36'),
(600, 'Jokiganj Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:08:48', '2018-07-17 06:08:48'),
(601, 'Kanaighat Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:09:00', '2018-07-17 06:09:00'),
(602, 'Osmani Nagar Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:09:12', '2018-07-17 06:09:12'),
(603, 'Arai Hazar Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:10:27', '2018-07-17 06:10:27'),
(604, 'Bandar Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:10:52', '2018-07-17 06:10:52'),
(605, 'Fatulla  Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:11:16', '2018-07-17 06:11:16'),
(606, 'Narayanganj Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:11:40', '2018-07-17 06:11:40'),
(607, 'Rupganj Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:12:00', '2018-07-17 06:12:00'),
(608, 'Siddhirganj Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:12:19', '2018-07-17 06:12:19'),
(609, 'Sonargaon Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:12:35', '2018-07-17 06:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `police_stations_orig`
--

CREATE TABLE `police_stations_orig` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `division_id` int(10) UNSIGNED NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `police_stations_orig`
--

INSERT INTO `police_stations_orig` (`id`, `name`, `division_id`, `district_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Amtali Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:49:04', '2018-07-09 02:49:04'),
(2, 'Bamna Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:52:27', '2018-07-09 02:52:27'),
(3, 'Barguna Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:52:50', '2018-07-09 02:52:50'),
(4, 'Betagi Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:53:24', '2018-07-09 02:53:24'),
(5, 'Patharghata Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:53:57', '2018-07-09 02:53:57'),
(6, 'Taltali Police Station', 1, 1, NULL, 1, NULL, NULL, NULL, '2018-07-09 02:54:24', '2018-07-09 02:54:24'),
(7, 'Airport Police Station (BMP)', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:05:03', '2018-07-09 03:05:03'),
(8, 'Bandar Police Station (BMP)', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:05:38', '2018-07-09 03:05:38'),
(9, 'Kawnia Police Station (BMP)', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:06:57', '2018-07-09 03:06:57'),
(10, 'Kotwali Police Station (BMP)', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:07:28', '2018-07-09 03:07:28'),
(11, 'Agailihara Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:09:26', '2018-07-09 03:09:26'),
(12, 'Babuganj Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:10:00', '2018-07-09 03:10:00'),
(13, 'Bakerganj Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:10:21', '2018-07-09 03:10:21'),
(14, 'Banaripara Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:12:15', '2018-07-09 03:12:15'),
(15, 'Gouranadi Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:13:08', '2018-07-09 03:13:08'),
(16, 'Hizla Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:13:44', '2018-07-09 03:13:44'),
(17, 'Kazirhat Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:14:20', '2018-07-09 03:14:20'),
(18, 'Mehediganj Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:14:41', '2018-07-09 03:14:41'),
(19, 'Muladi Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:15:03', '2018-07-09 03:15:03'),
(20, 'Uzirpur Police Station', 1, 2, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:15:25', '2018-07-09 03:15:25'),
(21, 'Bhola Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:21:05', '2018-07-09 03:21:05'),
(22, 'Burhanuddin Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:21:30', '2018-07-09 03:21:30'),
(23, 'Charfassion Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:21:48', '2018-07-09 03:21:48'),
(24, 'Daulatkhan Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:22:23', '2018-07-09 03:22:23'),
(25, 'Lalmohan Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:23:07', '2018-07-09 03:23:07'),
(26, 'Monpura Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:23:24', '2018-07-09 03:23:24'),
(27, 'Shashi Bhushan Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:23:54', '2018-07-09 03:23:54'),
(28, 'South Aaicha Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:24:15', '2018-07-09 03:24:15'),
(29, 'Tazumuddin Police Station', 1, 3, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:24:39', '2018-07-09 03:24:39'),
(30, 'Jhalokati Police Station', 1, 4, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:33:35', '2018-07-09 03:33:35'),
(31, 'Kathalia Police Station', 1, 4, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:33:56', '2018-07-09 03:33:56'),
(32, 'Nalchity Police Station', 1, 4, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:34:24', '2018-07-09 03:34:24'),
(33, 'Rajapur Police Station', 1, 4, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:35:01', '2018-07-09 03:35:01'),
(34, 'Bauphal Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:38:11', '2018-07-09 03:38:11'),
(35, 'Dashmina Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:38:38', '2018-07-09 03:38:38'),
(36, 'Dumki Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:39:14', '2018-07-09 03:39:14'),
(37, 'Galachipa  Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:39:47', '2018-07-09 03:39:47'),
(38, 'Kalapara Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:40:21', '2018-07-09 03:40:21'),
(39, 'Mirzaganj Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:40:59', '2018-07-09 03:40:59'),
(40, 'Mohipur Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:41:18', '2018-07-09 03:41:18'),
(41, 'Patuakhali Police Station', 1, 5, NULL, 1, 1, NULL, NULL, '2018-07-09 03:41:34', '2018-07-09 03:42:20'),
(42, 'Rangabali Police Station', 1, 5, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:42:56', '2018-07-09 03:42:56'),
(43, 'Bhandaria Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:48:31', '2018-07-09 03:48:31'),
(44, 'Indurkandi Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:48:48', '2018-07-09 03:48:48'),
(45, 'Kawkhali Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:49:43', '2018-07-09 03:49:43'),
(46, 'Matbaria Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:50:09', '2018-07-09 03:50:09'),
(47, 'Nazirpur Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:50:32', '2018-07-09 03:50:32'),
(48, 'Nesarabad Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:50:53', '2018-07-09 03:50:53'),
(49, 'Pirojpur Police Station', 1, 6, NULL, 1, NULL, NULL, NULL, '2018-07-09 03:51:19', '2018-07-09 03:51:19'),
(50, 'Alikadam Police Station', 2, 7, NULL, 1, 1, NULL, NULL, '2018-07-09 05:53:57', '2018-07-09 05:54:57'),
(51, 'Lama police station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:54:34', '2018-07-09 05:54:34'),
(52, 'Naikhongchhari Police Station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:55:35', '2018-07-09 05:55:35'),
(53, 'Royanchari Police Station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:56:13', '2018-07-09 05:56:13'),
(54, 'Ruma Police Station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:57:07', '2018-07-09 05:57:07'),
(55, 'Sadar Police Station, Bandarban', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:58:07', '2018-07-09 05:58:07'),
(56, 'Thanchi Police Station', 2, 7, NULL, 1, NULL, NULL, NULL, '2018-07-09 05:58:58', '2018-07-09 05:58:58'),
(57, 'Akhaura Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:02:30', '2018-07-09 06:02:30'),
(58, 'Ashuganj Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:02:59', '2018-07-09 06:02:59'),
(59, 'Bancharampur Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:03:20', '2018-07-09 06:03:20'),
(60, 'Bijoynagar Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:04:07', '2018-07-09 06:04:07'),
(61, 'Brahmanbaria Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:05:26', '2018-07-09 06:05:26'),
(62, 'Kasba Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:05:53', '2018-07-09 06:05:53'),
(63, 'Nabinagar Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:06:46', '2018-07-09 06:06:46'),
(64, 'Nasirnagar Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:07:13', '2018-07-09 06:07:13'),
(65, 'Sarail Police Station', 2, 8, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:07:31', '2018-07-09 06:07:31'),
(66, 'Chandpur Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:12:23', '2018-07-09 06:12:23'),
(67, 'Faridganj Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:12:49', '2018-07-09 06:12:49'),
(68, 'Haimchar Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:13:36', '2018-07-09 06:13:36'),
(69, 'Hajiganj Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:14:00', '2018-07-09 06:14:00'),
(70, 'Kachua Police Station, Chandpur', 2, 9, NULL, 1, 1, NULL, NULL, '2018-07-09 06:14:42', '2018-07-16 04:25:40'),
(71, 'Matlab (North) Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:15:17', '2018-07-09 06:15:17'),
(72, 'Matlab South Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:15:35', '2018-07-09 06:15:35'),
(73, 'Shahrasti Police Station', 2, 9, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:16:01', '2018-07-09 06:16:01'),
(74, 'Akbar Shah Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:21:03', '2018-07-09 06:21:03'),
(75, 'Baijid Bostami Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:21:38', '2018-07-09 06:21:38'),
(76, 'Bakuali Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:22:14', '2018-07-09 06:22:14'),
(77, 'Bandar  Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:22:56', '2018-07-09 06:22:56'),
(78, 'Chakbazar Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:23:26', '2018-07-09 06:23:26'),
(79, 'Chandgaon Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:23:55', '2018-07-09 06:23:55'),
(80, 'Double Moorning Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:24:29', '2018-07-09 06:24:29'),
(81, 'EPZ Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:24:54', '2018-07-09 06:24:54'),
(82, 'Halishahar Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:25:31', '2018-07-09 06:25:31'),
(83, 'Karnaphuli Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:26:01', '2018-07-09 06:26:01'),
(84, 'Khulsi Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:26:35', '2018-07-09 06:26:35'),
(85, 'Kotwali Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:27:04', '2018-07-09 06:27:04'),
(86, 'Pahartoli Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:27:24', '2018-07-09 06:27:24'),
(87, 'Panchlaish Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:27:55', '2018-07-09 06:27:55'),
(88, 'Potenga Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:28:30', '2018-07-09 06:28:30'),
(89, 'Sadarghat Police Station (CMP)', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:28:56', '2018-07-09 06:28:56'),
(90, 'Anowara Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:30:53', '2018-07-09 06:30:53'),
(91, 'Banshkhali Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:31:07', '2018-07-09 06:31:07'),
(92, 'Boalkhali Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:31:24', '2018-07-09 06:31:24'),
(93, 'Chandanaish Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:31:37', '2018-07-09 06:31:37'),
(94, 'Fatikchhari Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:32:33', '2018-07-09 06:32:33'),
(95, 'Hathazari Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:32:46', '2018-07-09 06:32:46'),
(96, 'Lohagara Police Station, Chittagong', 2, 10, NULL, 1, 1, NULL, NULL, '2018-07-09 06:33:26', '2018-07-16 06:04:01'),
(97, 'Mirsarai Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:37:13', '2018-07-09 06:37:13'),
(98, 'Patiya Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:37:38', '2018-07-09 06:37:38'),
(99, 'Rangunia Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:38:00', '2018-07-09 06:38:00'),
(100, 'Raujan Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:47:24', '2018-07-09 06:47:24'),
(101, 'Sandwip Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:47:38', '2018-07-09 06:47:38'),
(102, 'Satkania Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:48:11', '2018-07-09 06:48:11'),
(103, 'Sitakunda Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:48:35', '2018-07-09 06:48:35'),
(104, 'Vujpur Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:48:54', '2018-07-09 06:48:54'),
(105, 'Zorargonj Police Station', 2, 10, NULL, 1, NULL, NULL, NULL, '2018-07-09 06:49:10', '2018-07-09 06:49:10'),
(106, 'Bangora Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:24:10', '2018-07-15 02:24:10'),
(107, 'Barura Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:25:49', '2018-07-15 02:25:49'),
(108, 'Brahmanpara Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:28:10', '2018-07-15 02:28:10'),
(109, 'Burichong Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:28:53', '2018-07-15 02:28:53'),
(110, 'Chandina Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:29:11', '2018-07-15 02:29:11'),
(111, 'Chouddagram Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:29:49', '2018-07-15 02:29:49'),
(112, 'Daudkandi Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:30:18', '2018-07-15 02:30:18'),
(113, 'Debidwar Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:30:46', '2018-07-15 02:30:46'),
(114, 'Homna Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:31:12', '2018-07-15 02:31:12'),
(115, 'Kotwali Police Station, Comilla', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:31:55', '2018-07-15 02:31:55'),
(116, 'Laksham Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:32:20', '2018-07-15 02:32:20'),
(117, 'Meghna Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:32:38', '2018-07-15 02:32:38'),
(118, 'Mohongonj Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:32:55', '2018-07-15 02:32:55'),
(119, 'Muradnagar Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:33:17', '2018-07-15 02:33:17'),
(120, 'Nangalkot Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:33:42', '2018-07-15 02:33:42'),
(121, 'Sadar South Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:34:06', '2018-07-15 02:34:06'),
(122, 'Titas Police Station', 2, 11, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:34:25', '2018-07-15 02:34:25'),
(123, 'Chakoria Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:38:45', '2018-07-15 02:38:45'),
(124, 'Cox\'s Bazar Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:39:30', '2018-07-15 02:39:30'),
(125, 'Kutubdia Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:39:53', '2018-07-15 02:39:53'),
(126, 'Moheskhali Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:40:24', '2018-07-15 02:40:24'),
(127, 'Pekua Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:40:45', '2018-07-15 02:40:45'),
(128, 'Ramu Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:41:15', '2018-07-15 02:41:15'),
(129, 'Teknaf Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:41:33', '2018-07-15 02:41:33'),
(130, 'Ukhiya Police Station', 2, 12, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:41:54', '2018-07-15 02:41:54'),
(131, 'Chhagalnaiya Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:45:40', '2018-07-15 02:45:40'),
(132, 'Daganbhuiyan Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:46:04', '2018-07-15 02:46:04'),
(133, 'Feni Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:46:26', '2018-07-15 02:46:26'),
(134, 'Fulgazi Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:46:45', '2018-07-15 02:46:45'),
(135, 'Porshuram Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:49:47', '2018-07-15 02:49:47'),
(136, 'Sonagazi Police Station', 2, 13, NULL, 1, NULL, NULL, NULL, '2018-07-15 02:50:12', '2018-07-15 02:50:12'),
(137, 'Dighinala Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:08:07', '2018-07-15 03:08:07'),
(138, 'Gulimara Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:08:45', '2018-07-15 03:08:45'),
(139, 'Khagrachari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:09:07', '2018-07-15 03:09:07'),
(140, 'Laxmichari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:09:42', '2018-07-15 03:09:42'),
(141, 'Mahalchari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:10:05', '2018-07-15 03:10:05'),
(142, 'Manikchari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:10:40', '2018-07-15 03:10:40'),
(143, 'Matiranga Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:11:06', '2018-07-15 03:11:06'),
(144, 'Panchari Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:11:37', '2018-07-15 03:11:37'),
(145, 'Ramgarh Police Station', 2, 14, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:12:03', '2018-07-15 03:12:03'),
(146, 'Chandraganj Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:21:11', '2018-07-15 03:21:11'),
(147, 'Kamalnagar Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:21:37', '2018-07-15 03:21:37'),
(148, 'Lakshmipur Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:22:05', '2018-07-15 03:22:05'),
(149, 'Raipur Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:24:04', '2018-07-15 03:24:04'),
(150, 'Ramganj Police Station', 2, 15, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:24:38', '2018-07-15 03:24:38'),
(151, 'Ramgati Police Station', 2, 15, NULL, 1, 1, NULL, NULL, '2018-07-15 03:25:41', '2018-07-15 03:35:09'),
(152, 'Begumganj Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:36:46', '2018-07-15 03:36:46'),
(153, 'Char Rajibpur Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:37:09', '2018-07-15 03:37:09'),
(154, 'Chatkhil Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:37:35', '2018-07-15 03:37:35'),
(155, 'Companiganj Police Station, Noakhali', 2, 16, NULL, 1, 1, NULL, NULL, '2018-07-15 03:37:59', '2018-07-17 06:07:07'),
(156, 'Hatiya Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:38:19', '2018-07-15 03:38:19'),
(157, 'Kabirhat Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:38:49', '2018-07-15 03:38:49'),
(158, 'Senbagh Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:39:15', '2018-07-15 03:39:15'),
(159, 'Sonaimuri Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:39:39', '2018-07-15 03:39:39'),
(160, 'Subarna Char Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:39:54', '2018-07-15 03:39:54'),
(161, 'Sudharam Police Station', 2, 16, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:40:13', '2018-07-15 03:40:13'),
(162, 'Baghaichari Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:43:37', '2018-07-15 03:43:37'),
(163, 'Barkal Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:44:04', '2018-07-15 03:44:04'),
(164, 'Belaichhari Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:44:28', '2018-07-15 03:44:28'),
(165, 'Chandroghona Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:45:00', '2018-07-15 03:45:00'),
(166, 'Juraichari Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:45:20', '2018-07-15 03:45:20'),
(167, 'Kaptai Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:45:43', '2018-07-15 03:45:43'),
(168, 'Kaukhali Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:46:09', '2018-07-15 03:46:09'),
(169, 'Kotwali Police Station, Rangamati', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:46:52', '2018-07-15 03:46:52'),
(170, 'Longadu Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:47:15', '2018-07-15 03:47:15'),
(171, 'Naniarchar Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:47:36', '2018-07-15 03:47:36'),
(172, 'Rajasthali Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:47:58', '2018-07-15 03:47:58'),
(173, 'Sajek Police Station', 2, 17, NULL, 1, NULL, NULL, NULL, '2018-07-15 03:48:20', '2018-07-15 03:48:20'),
(174, 'Adabor Police Station (DMP)', 3, 18, NULL, 1, 1, NULL, NULL, '2018-07-15 03:59:30', '2018-07-15 04:00:24'),
(175, 'Airport Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:00:58', '2018-07-15 04:00:58'),
(176, 'Badda Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:01:43', '2018-07-15 04:01:43'),
(177, 'Banani Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:02:12', '2018-07-15 04:02:12'),
(178, 'Bangshal Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:02:50', '2018-07-15 04:02:50'),
(179, 'Cantonment Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:03:25', '2018-07-15 04:03:25'),
(180, 'Chak Bazar Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:03:49', '2018-07-15 04:03:49'),
(181, 'Darus Salam Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:04:28', '2018-07-15 04:04:28'),
(182, 'Daskhinkhan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:05:01', '2018-07-15 04:05:01'),
(183, 'Demra Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:05:28', '2018-07-15 04:05:28'),
(184, 'Dhanmondi  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:05:59', '2018-07-15 04:05:59'),
(185, 'Gendaria Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:06:24', '2018-07-15 04:06:24'),
(186, 'Gulshan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:07:08', '2018-07-15 04:07:08'),
(187, 'Hazaribag  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:07:35', '2018-07-15 04:07:35'),
(188, 'Jatrabari Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:08:00', '2018-07-15 04:08:00'),
(189, 'Kadomtoli Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:08:30', '2018-07-15 04:08:30'),
(190, 'Kafrul Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:08:56', '2018-07-15 04:08:56'),
(191, 'Kalabagan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:09:26', '2018-07-15 04:09:26'),
(192, 'Kamrangirchar Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:10:04', '2018-07-15 04:10:04'),
(193, 'Khilgaon Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:10:28', '2018-07-15 04:10:28'),
(194, 'Khilkhet Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:10:59', '2018-07-15 04:10:59'),
(195, 'Kotwali Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:11:25', '2018-07-15 04:11:25'),
(196, 'Lalbag Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:12:04', '2018-07-15 04:12:04'),
(197, 'Mirpur Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:12:25', '2018-07-15 04:12:25'),
(198, 'Mohammadpur Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:13:03', '2018-07-15 04:13:03'),
(199, 'Motijheel Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:13:36', '2018-07-15 04:13:36'),
(200, 'Mugda Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:13:59', '2018-07-15 04:13:59'),
(201, 'New Market Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:14:26', '2018-07-15 04:14:26'),
(202, 'Pallabi Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:14:48', '2018-07-15 04:14:48'),
(203, 'Paltan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:15:21', '2018-07-15 04:15:21'),
(204, 'Ramna Model Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:15:51', '2018-07-15 04:15:51'),
(205, 'Rampura  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:16:32', '2018-07-15 04:16:32'),
(206, 'Rupnagar Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:17:01', '2018-07-15 04:17:01'),
(207, 'Sabujbag Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:17:39', '2018-07-15 04:17:39'),
(208, 'Shah Ali Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:18:17', '2018-07-15 04:18:17'),
(209, 'Shahbag  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:18:48', '2018-07-15 04:18:48'),
(210, 'Shahjahanpur Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:19:22', '2018-07-15 04:19:22'),
(211, 'Shampur Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:19:46', '2018-07-15 04:19:46'),
(212, 'Sher-e-Bangla Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:20:21', '2018-07-15 04:20:21'),
(213, 'Sutrapur  Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:20:51', '2018-07-15 04:20:51'),
(214, 'Tejgaon I/A Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:21:22', '2018-07-15 04:21:22'),
(215, 'Tejgaon Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:21:54', '2018-07-15 04:21:54'),
(216, 'Turag Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:23:02', '2018-07-15 04:23:02'),
(217, 'Uttara (West) Police Station (DMP)', 3, 18, NULL, 1, 1, NULL, NULL, '2018-07-15 04:23:24', '2018-07-15 04:24:08'),
(218, 'Uttara Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:23:50', '2018-07-15 04:23:50'),
(219, 'Uttarkhan Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:24:54', '2018-07-15 04:24:54'),
(220, 'Vasantek Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:25:18', '2018-07-15 04:25:18'),
(221, 'Vatara Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:26:12', '2018-07-15 04:26:12'),
(222, 'Wari Police Station (DMP)', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:26:48', '2018-07-15 04:26:48'),
(223, 'Ashulia Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:34:11', '2018-07-15 04:34:11'),
(224, 'Dhamrai Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:34:25', '2018-07-15 04:34:25'),
(225, 'Dohar Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:34:41', '2018-07-15 04:34:41'),
(226, 'Keraniganj Model Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:35:05', '2018-07-15 04:35:05'),
(227, 'Nawabganj Model Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:35:26', '2018-07-15 04:35:26'),
(228, 'Savar Model Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:35:44', '2018-07-15 04:35:44'),
(229, 'South Keraniganj Police Station', 3, 18, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:36:01', '2018-07-15 04:36:01'),
(230, 'Alfadanga Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:42:54', '2018-07-15 04:42:54'),
(231, 'Boalmari Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:43:13', '2018-07-15 04:43:13'),
(232, 'Charbhadrasan Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:43:53', '2018-07-15 04:43:53'),
(233, 'Kotwali Police Station, Faridpur', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:44:35', '2018-07-15 04:44:35'),
(234, 'Madhukhali Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:45:04', '2018-07-15 04:45:04'),
(235, 'Nagarkanda Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:45:34', '2018-07-15 04:45:34'),
(236, 'Sadarpur Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:46:01', '2018-07-15 04:46:01'),
(237, 'Saltha Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:46:36', '2018-07-15 04:46:36'),
(238, 'Vanga Police Station', 3, 19, NULL, 1, NULL, NULL, NULL, '2018-07-15 04:46:55', '2018-07-15 04:46:55'),
(239, 'Joydebpur Police Station', 3, 20, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:00:21', '2018-07-15 23:00:21'),
(240, 'Kaliakoir Police Station', 3, 20, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:00:44', '2018-07-15 23:00:44'),
(241, 'Kaliganj Police Station, Gazipur', 3, 20, NULL, 1, 1, NULL, NULL, '2018-07-15 23:01:09', '2018-07-16 04:57:52'),
(242, 'Kapasia Police Station', 3, 20, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:01:33', '2018-07-15 23:01:33'),
(243, 'Sreepur Police Station, Gazipur', 3, 20, NULL, 1, 1, NULL, NULL, '2018-07-15 23:01:55', '2018-07-16 05:54:42'),
(244, 'Tongi Police Station', 3, 20, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:02:41', '2018-07-15 23:02:41'),
(245, 'Gopalganj Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:09:03', '2018-07-15 23:09:03'),
(246, 'Kasiani Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:10:29', '2018-07-15 23:10:29'),
(247, 'Kotalipara Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:11:04', '2018-07-15 23:11:04'),
(248, 'Muksudpur Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:11:34', '2018-07-15 23:11:34'),
(249, 'Tungipara Police Station', 3, 21, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:12:00', '2018-07-15 23:12:00'),
(250, 'Austagram Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:17:11', '2018-07-15 23:17:11'),
(251, 'Bajitpur Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:17:32', '2018-07-15 23:17:32'),
(252, 'Bhairab Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:18:17', '2018-07-15 23:18:17'),
(253, 'Hosainpur Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:18:38', '2018-07-15 23:18:38'),
(254, 'Itna Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:28:41', '2018-07-15 23:28:41'),
(255, 'Karimganj Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:29:11', '2018-07-15 23:29:11'),
(256, 'Katiadi Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:29:51', '2018-07-15 23:29:51'),
(257, 'Kishoreganj Police Station, Kishoreganj', 3, 22, NULL, 1, 1, NULL, NULL, '2018-07-15 23:30:30', '2018-07-17 04:45:50'),
(258, 'Kuliarchar Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:31:50', '2018-07-15 23:31:50'),
(259, 'Mithamoin Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:32:29', '2018-07-15 23:32:29'),
(260, 'Nikli Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:32:59', '2018-07-15 23:32:59'),
(261, 'Pakundia Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:34:32', '2018-07-15 23:34:32'),
(262, 'Tarail Police Station', 3, 22, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:35:16', '2018-07-15 23:35:16'),
(263, 'Dashar Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:39:56', '2018-07-15 23:39:56'),
(264, 'Kalkini Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:40:21', '2018-07-15 23:40:21'),
(265, 'Madaripur Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:40:51', '2018-07-15 23:40:51'),
(266, 'Rajoir Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:41:18', '2018-07-15 23:41:18'),
(267, 'Shibchar Police Station', 3, 23, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:41:41', '2018-07-15 23:41:41'),
(268, 'Doulatpur Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:45:27', '2018-07-15 23:45:27'),
(269, 'Ghior Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:46:00', '2018-07-15 23:46:00'),
(270, 'Harirampur  Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:46:39', '2018-07-15 23:46:39'),
(271, 'Manikganj Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:47:06', '2018-07-15 23:47:06'),
(272, 'Saturia Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:47:42', '2018-07-15 23:47:42'),
(273, 'Shibalaya Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:48:11', '2018-07-15 23:48:11'),
(274, 'Singair Police Station', 3, 24, NULL, 1, NULL, NULL, NULL, '2018-07-15 23:49:09', '2018-07-15 23:49:09'),
(275, 'Gazaria Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:02:25', '2018-07-16 03:02:25'),
(276, 'Lohajang Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:03:07', '2018-07-16 03:03:07'),
(277, 'Munshiganj Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:04:16', '2018-07-16 03:04:16'),
(278, 'Serajdikhan Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:04:53', '2018-07-16 03:04:53'),
(279, 'Sreenagar Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:05:53', '2018-07-16 03:05:53'),
(280, 'Tongibari Police Station', 3, 25, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:06:29', '2018-07-16 03:06:29'),
(281, 'Belabo Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:09:22', '2018-07-16 03:09:22'),
(282, 'Madhabdi Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:09:40', '2018-07-16 03:09:40'),
(283, 'Manohardi Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:09:59', '2018-07-16 03:09:59'),
(284, 'Narsingdi Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:11:10', '2018-07-16 03:11:10'),
(285, 'Palash Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:11:38', '2018-07-16 03:11:38'),
(286, 'Raipura Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:12:13', '2018-07-16 03:12:13'),
(287, 'Shibpur Police Station', 3, 27, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:12:39', '2018-07-16 03:12:39'),
(288, 'Baliakandi Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:15:28', '2018-07-16 03:15:28'),
(289, 'Goalanda Ghat Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:15:49', '2018-07-16 03:15:49'),
(290, 'Kalukhali Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:16:19', '2018-07-16 03:16:19'),
(291, 'Pangsha Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:16:50', '2018-07-16 03:16:50'),
(292, 'Rajbari Police Station', 3, 28, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:17:10', '2018-07-16 03:17:10'),
(293, 'Bhedarganj Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:22:07', '2018-07-16 03:22:07'),
(294, 'Damudya Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:22:51', '2018-07-16 03:22:51'),
(295, 'Goshairhat Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:23:19', '2018-07-16 03:23:19'),
(296, 'Janjira Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:23:42', '2018-07-16 03:23:42'),
(297, 'Noria Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:24:00', '2018-07-16 03:24:00'),
(298, 'Palong Police Station', 3, 29, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:24:26', '2018-07-16 03:24:26'),
(299, 'Sakhipur Police Station, Shariatpur', 3, 29, NULL, 1, 1, NULL, NULL, '2018-07-16 03:24:45', '2018-07-16 03:34:07'),
(300, 'Basail Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:27:03', '2018-07-16 03:27:03'),
(301, 'Bhuapur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:27:26', '2018-07-16 03:27:26'),
(302, 'Delduar Police Staton', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:27:57', '2018-07-16 03:27:57'),
(303, 'Dhanbari Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:28:35', '2018-07-16 03:28:35'),
(304, 'Ghatail Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:28:54', '2018-07-16 03:28:54'),
(305, 'Gopalpur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:29:20', '2018-07-16 03:29:20'),
(306, 'Jamuna Bridge Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:29:39', '2018-07-16 03:29:39'),
(307, 'Kalihati Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:29:57', '2018-07-16 03:29:57'),
(308, 'Madhupur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:30:23', '2018-07-16 03:30:23'),
(309, 'Mirzapur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:30:54', '2018-07-16 03:30:54'),
(310, 'Nagarpur Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:32:00', '2018-07-16 03:32:00'),
(311, 'Sakhipur Police Station, Tangail', 3, 30, NULL, 1, 1, NULL, NULL, '2018-07-16 03:35:09', '2018-07-16 03:35:43'),
(312, 'Tangail Police Station', 3, 30, NULL, 1, NULL, NULL, NULL, '2018-07-16 03:36:08', '2018-07-16 03:36:08'),
(313, 'Bagerhat Police Station', 4, 31, NULL, 1, 1, NULL, NULL, '2018-07-16 04:22:14', '2018-07-16 04:23:14'),
(314, 'Chitalmari Police Station', 4, 31, NULL, 1, 1, NULL, NULL, '2018-07-16 04:22:40', '2018-07-16 04:23:29'),
(315, 'Fakirhat Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:24:21', '2018-07-16 04:24:21'),
(316, 'Kachua Police Station, Bagerhat', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:26:18', '2018-07-16 04:26:18'),
(317, 'Mollahat Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:26:58', '2018-07-16 04:26:58'),
(318, 'Mongla Police Station', 4, 31, NULL, 1, 1, NULL, NULL, '2018-07-16 04:27:37', '2018-07-16 04:27:47'),
(319, 'Morrelganj Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:28:19', '2018-07-16 04:28:19'),
(320, 'Rampal Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:28:50', '2018-07-16 04:28:50'),
(321, 'Sarankhola Police Station', 4, 31, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:29:29', '2018-07-16 04:29:29'),
(322, 'Alamdanga Police Station', 4, 32, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:35:46', '2018-07-16 04:35:46'),
(323, 'Chuadanga Police Station', 4, 32, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:36:13', '2018-07-16 04:36:13'),
(324, 'Damurhuda Police Station', 4, 32, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:36:39', '2018-07-16 04:36:39'),
(325, 'Jiban Nagar Police Station', 4, 32, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:37:26', '2018-07-16 04:37:26'),
(326, 'Abhoynagar Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:43:01', '2018-07-16 04:43:01'),
(327, 'Bagharpara Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:43:36', '2018-07-16 04:43:36'),
(328, 'Benapol Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:44:24', '2018-07-16 04:44:24'),
(329, 'Chaugacha Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:45:23', '2018-07-16 04:45:23'),
(330, 'Jhikargacha Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:46:11', '2018-07-16 04:46:11'),
(331, 'Keshabpur Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:46:50', '2018-07-16 04:46:50'),
(332, 'Kotwali Police Station, Jashore', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:47:56', '2018-07-16 04:47:56'),
(333, 'Manirampur Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:48:29', '2018-07-16 04:48:29'),
(334, 'Sharsha Police Station', 4, 33, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:48:59', '2018-07-16 04:48:59'),
(335, 'Harinakunda Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:53:32', '2018-07-16 04:53:32'),
(336, 'Jhenaidah Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:54:23', '2018-07-16 04:54:23'),
(337, 'Kaliganj Police Station, Jhenaidah', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 04:57:12', '2018-07-16 04:57:12'),
(338, 'Kotchandpur Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:00:04', '2018-07-16 05:00:04'),
(339, 'Maheshpur Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:01:22', '2018-07-16 05:01:22'),
(340, 'Shailkupa Police Station', 4, 34, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:02:00', '2018-07-16 05:02:00'),
(341, 'Arangghata  Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:06:58', '2018-07-16 05:06:58'),
(342, 'Doulatpur Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:07:46', '2018-07-16 05:07:46'),
(343, 'Horintana Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:08:23', '2018-07-16 05:08:23'),
(344, 'Khalishpur Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:09:19', '2018-07-16 05:09:19'),
(345, 'Khan Jahan Ali  Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:09:52', '2018-07-16 05:09:52'),
(346, 'Khulna Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:10:18', '2018-07-16 05:10:18'),
(347, 'Labanchara Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:10:51', '2018-07-16 05:10:51'),
(348, 'Sonadanga Police Station (KMP)', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:11:39', '2018-07-16 05:11:39'),
(349, 'Batiaghata Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:36:38', '2018-07-16 05:36:38'),
(350, 'Dacope Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:37:00', '2018-07-16 05:37:00'),
(351, 'Dighalia Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:37:19', '2018-07-16 05:37:19'),
(352, 'Dumuria Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:37:40', '2018-07-16 05:37:40'),
(353, 'Koyra Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:38:06', '2018-07-16 05:38:06'),
(354, 'Paikgacha Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:38:42', '2018-07-16 05:38:42'),
(355, 'Phultala Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:39:05', '2018-07-16 05:39:05'),
(356, 'Rupsa Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:39:46', '2018-07-16 05:39:46'),
(357, 'Terokhada Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:40:25', '2018-07-16 05:40:25'),
(358, 'Bheramara Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:43:46', '2018-07-16 05:43:46'),
(359, 'Daulatpur Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:44:13', '2018-07-16 05:44:13'),
(360, 'Islami University Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:44:53', '2018-07-16 05:44:53'),
(361, 'Khoksha Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:45:39', '2018-07-16 05:45:39'),
(362, 'Kumarkhali Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:46:07', '2018-07-16 05:46:07'),
(363, 'Kushtia Police Station', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:46:31', '2018-07-16 05:46:31'),
(364, 'Mirpur Police Station, Kushtia', 4, 36, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:49:14', '2018-07-16 05:49:14'),
(365, 'Magura Police Station', 4, 37, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:51:14', '2018-07-16 05:51:14'),
(366, 'Mohammadpur Police Station, Magura', 4, 37, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:52:12', '2018-07-16 05:52:12'),
(367, 'Shalikha Police Station', 4, 37, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:52:40', '2018-07-16 05:52:40'),
(368, 'Sreepur Police Station, Magura', 4, 37, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:54:06', '2018-07-16 05:54:06'),
(369, 'Gangni Police Station', 4, 38, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:56:22', '2018-07-16 05:56:22'),
(370, 'Meherpur Police Station', 4, 38, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:57:03', '2018-07-16 05:57:03'),
(371, 'Mujibnagar Police Station', 4, 38, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:57:32', '2018-07-16 05:57:32'),
(372, 'Kalia Police Station', 4, 39, NULL, 1, NULL, NULL, NULL, '2018-07-16 05:59:54', '2018-07-16 05:59:54'),
(373, 'Lohagara Police Station, Narail', 4, 39, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:01:04', '2018-07-16 06:01:04'),
(374, 'Naragathy Police Station', 4, 39, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:02:24', '2018-07-16 06:02:24'),
(375, 'Narail Police Station', 4, 39, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:02:59', '2018-07-16 06:02:59'),
(376, 'Assasuni Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:31:47', '2018-07-16 06:31:47'),
(377, 'Debhata Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:32:54', '2018-07-16 06:32:54'),
(378, 'Kalaroa Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:33:20', '2018-07-16 06:33:20'),
(379, 'Kaliganj Police Station, Satkhira', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:34:27', '2018-07-16 06:34:27'),
(380, 'Patkelghata Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:35:00', '2018-07-16 06:35:00'),
(381, 'Satkhira Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:35:29', '2018-07-16 06:35:29'),
(382, 'Shyamnagar Police Station', 4, 40, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:35:59', '2018-07-16 06:35:59'),
(383, 'Tala Police Station', 4, 35, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:36:30', '2018-07-16 06:36:30'),
(384, 'Bahadurabad Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:45:44', '2018-07-16 06:45:44'),
(385, 'Bakshiganj Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:46:04', '2018-07-16 06:46:04'),
(386, 'Dewanganj Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:46:29', '2018-07-16 06:46:29'),
(387, 'Islampur Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:46:48', '2018-07-16 06:46:48'),
(388, 'Jamalpur Sadar Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:48:14', '2018-07-16 06:48:14'),
(389, 'Madarganj Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:48:49', '2018-07-16 06:48:49'),
(390, 'Melandah Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:51:40', '2018-07-16 06:51:40'),
(391, 'Sarishabari Police Station', 5, 41, NULL, 1, NULL, NULL, NULL, '2018-07-16 06:52:11', '2018-07-16 06:52:11'),
(392, 'Bhaluka Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:56:38', '2018-07-16 22:56:38'),
(393, 'Dhobaura Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:57:13', '2018-07-16 22:57:13'),
(394, 'Fulbari Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:57:43', '2018-07-16 22:57:43'),
(395, 'Gaffargaon Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:58:01', '2018-07-16 22:58:01'),
(396, 'Gauripur Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:58:54', '2018-07-16 22:58:54'),
(397, 'Haluaghat Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:59:25', '2018-07-16 22:59:25'),
(398, 'Ishwarganj Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 22:59:47', '2018-07-16 22:59:47'),
(399, 'Kotwali Police Station, Mymensingh', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:00:24', '2018-07-16 23:00:24'),
(400, 'Muktagacha Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:00:52', '2018-07-16 23:00:52'),
(401, 'Nandail Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:01:32', '2018-07-16 23:01:32'),
(402, 'Pagla Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:02:29', '2018-07-16 23:02:29'),
(403, 'Phulpur Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:02:57', '2018-07-16 23:02:57'),
(404, 'Tarakanda Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:03:16', '2018-07-16 23:03:16'),
(405, 'Trishal Police Station', 5, 42, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:03:38', '2018-07-16 23:03:38'),
(406, 'Atpara Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:16:32', '2018-07-16 23:16:32'),
(407, 'Barhatta  Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:16:52', '2018-07-16 23:16:52'),
(408, 'Durgapur Police Station, Netrokona', 5, 43, NULL, 1, 1, NULL, NULL, '2018-07-16 23:17:10', '2018-07-17 00:39:58'),
(409, 'Kalmakanda Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:17:30', '2018-07-16 23:17:30'),
(410, 'Kendua Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:18:08', '2018-07-16 23:18:08'),
(411, 'Khaliajuri Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:19:11', '2018-07-16 23:19:11'),
(412, 'Madan  Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:19:29', '2018-07-16 23:19:29'),
(413, 'Mohanganj Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:20:41', '2018-07-16 23:20:41'),
(414, 'Netrokona Sadar Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:21:06', '2018-07-16 23:21:06'),
(415, 'Purbadhala Police Station', 5, 43, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:21:34', '2018-07-16 23:21:34'),
(416, 'Jhenaigati Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:23:58', '2018-07-16 23:23:58'),
(417, 'Nakla Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:24:15', '2018-07-16 23:24:15'),
(418, 'Nalitabari Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:24:35', '2018-07-16 23:24:35'),
(419, 'Sherpur Sadar Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:26:21', '2018-07-16 23:26:21'),
(420, 'Sreebordi Police Station', 5, 44, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:27:14', '2018-07-16 23:27:14'),
(421, 'Adamdighi Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:37:54', '2018-07-16 23:37:54'),
(422, 'Bogra Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:38:12', '2018-07-16 23:38:12'),
(423, 'Dhunat Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:38:33', '2018-07-16 23:38:33'),
(424, 'Dhupchanchia Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:39:12', '2018-07-16 23:39:12'),
(425, 'Gabtali Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:40:12', '2018-07-16 23:40:12'),
(426, 'Kahaloo Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:40:41', '2018-07-16 23:40:41'),
(427, 'Nandigram Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:41:06', '2018-07-16 23:41:06'),
(428, 'Sariakandi Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:42:11', '2018-07-16 23:42:11'),
(429, 'Shajahanpur Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:43:09', '2018-07-16 23:43:09'),
(430, 'Sherpur Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:44:41', '2018-07-16 23:44:41'),
(431, 'Shibganj Police Station, Bagura', 6, 45, NULL, 1, 1, NULL, NULL, '2018-07-16 23:45:02', '2018-07-17 03:51:44'),
(432, 'Sonatola Police Station', 6, 45, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:45:23', '2018-07-16 23:45:23'),
(433, 'Akkelpur Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:48:26', '2018-07-16 23:48:26'),
(434, 'Joypurhat Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:48:49', '2018-07-16 23:48:49'),
(435, 'kalai Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:49:22', '2018-07-16 23:49:22'),
(436, 'Khetlal Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:49:59', '2018-07-16 23:49:59'),
(437, 'Panchbibi Police Station', 6, 46, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:50:19', '2018-07-16 23:50:19'),
(438, 'Atrai Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:53:04', '2018-07-16 23:53:04'),
(439, 'Badalgachi Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:53:57', '2018-07-16 23:53:57');
INSERT INTO `police_stations_orig` (`id`, `name`, `division_id`, `district_id`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(440, 'Dhamoirhat Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:54:24', '2018-07-16 23:54:24'),
(441, 'Manda Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:55:25', '2018-07-16 23:55:25'),
(442, 'Mohadevpur Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:55:50', '2018-07-16 23:55:50'),
(443, 'Naogaon Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:56:31', '2018-07-16 23:56:31'),
(444, 'Niamatpur Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:57:04', '2018-07-16 23:57:04'),
(445, 'Patnitala Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-16 23:57:25', '2018-07-16 23:57:25'),
(446, 'Porsha Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:01:10', '2018-07-17 00:01:10'),
(447, 'Raninagar Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:01:44', '2018-07-17 00:01:44'),
(448, 'Shapahar Police Station', 6, 47, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:02:30', '2018-07-17 00:02:30'),
(449, 'Bagatipara Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:04:32', '2018-07-17 00:04:32'),
(450, 'Baraigram Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:04:54', '2018-07-17 00:04:54'),
(451, 'Gurudaspur Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:05:47', '2018-07-17 00:05:47'),
(452, 'Lalpur Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:06:21', '2018-07-17 00:06:21'),
(453, 'Naldanga Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:07:07', '2018-07-17 00:07:07'),
(454, 'Natore Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:07:25', '2018-07-17 00:07:25'),
(455, 'Singra Police Station', 6, 48, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:08:01', '2018-07-17 00:08:01'),
(456, 'Aminpur Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:24:38', '2018-07-17 00:24:38'),
(457, 'Ataikula Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:25:01', '2018-07-17 00:25:01'),
(458, 'Atgharia Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:25:30', '2018-07-17 00:25:30'),
(459, 'Bera Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:26:01', '2018-07-17 00:26:01'),
(460, 'Bhangura Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:26:29', '2018-07-17 00:26:29'),
(461, 'Chatmohar Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:26:52', '2018-07-17 00:26:52'),
(462, 'Faridpur Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:27:30', '2018-07-17 00:27:30'),
(463, 'Ishwardi Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:27:50', '2018-07-17 00:27:50'),
(464, 'Pabna Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:28:05', '2018-07-17 00:28:05'),
(465, 'Santhia Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:28:49', '2018-07-17 00:28:49'),
(466, 'Sujanagar Police Station', 6, 50, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:29:15', '2018-07-17 00:29:15'),
(467, 'Boalia Police Station (RMP)', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:31:44', '2018-07-17 00:31:44'),
(468, 'Motihar Police Station (RMP)', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:32:10', '2018-07-17 00:32:10'),
(469, 'Rajpara Police Station (RMP)', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:32:37', '2018-07-17 00:32:37'),
(470, 'Shah Mokhdum Police Station (RMP)', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:33:09', '2018-07-17 00:33:09'),
(471, 'Bagha Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:37:05', '2018-07-17 00:37:05'),
(472, 'Baghmara Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:37:50', '2018-07-17 00:37:50'),
(473, 'Charghat Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:38:38', '2018-07-17 00:38:38'),
(474, 'Durgapur Police Station, Rahshahi', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:41:01', '2018-07-17 00:41:01'),
(475, 'Godagari Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:41:33', '2018-07-17 00:41:33'),
(476, 'Mohanpur Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:41:50', '2018-07-17 00:41:50'),
(477, 'Paba Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:42:25', '2018-07-17 00:42:25'),
(478, 'Puthia Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:42:40', '2018-07-17 00:42:40'),
(479, 'Tanore Police Station', 6, 51, NULL, 1, NULL, NULL, NULL, '2018-07-17 00:43:12', '2018-07-17 00:43:12'),
(480, 'Belkuchi Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 02:58:51', '2018-07-17 02:58:51'),
(481, 'Chowhali Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 02:59:20', '2018-07-17 02:59:20'),
(482, 'Enayetpur Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 02:59:46', '2018-07-17 02:59:46'),
(483, 'Jamuna Bridge West Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:06:40', '2018-07-17 03:06:40'),
(484, 'Kamar Khanda Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:07:16', '2018-07-17 03:07:16'),
(485, 'Kazipur Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:07:33', '2018-07-17 03:07:33'),
(486, 'Raiganj Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:08:02', '2018-07-17 03:08:02'),
(487, 'Salanga Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:08:29', '2018-07-17 03:08:29'),
(488, 'Shahjadpur Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:08:49', '2018-07-17 03:08:49'),
(489, 'Sirajganj Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:09:07', '2018-07-17 03:09:07'),
(490, 'Tarash Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:09:34', '2018-07-17 03:09:34'),
(491, 'Ullahpara Police Station', 6, 52, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:09:53', '2018-07-17 03:09:53'),
(492, 'Bholahat Police Station', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:14:16', '2018-07-17 03:14:16'),
(493, 'Chapai Nawabganj Police Station', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:49:46', '2018-07-17 03:49:46'),
(494, 'Gomastapur Police Station', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:50:17', '2018-07-17 03:50:17'),
(495, 'Nachole Police Station', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:50:51', '2018-07-17 03:50:51'),
(496, 'Shibganj Police Station, Chapai Nawabganj', 6, 49, NULL, 1, NULL, NULL, NULL, '2018-07-17 03:52:22', '2018-07-17 03:52:22'),
(497, 'Biral Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:06:38', '2018-07-17 04:06:38'),
(498, 'Birampur Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:07:06', '2018-07-17 04:07:06'),
(499, 'Birganj  Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:07:23', '2018-07-17 04:07:23'),
(500, 'Bochaganj Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:07:46', '2018-07-17 04:07:46'),
(501, 'Chirirbandar Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:08:00', '2018-07-17 04:08:00'),
(502, 'Fulbari  Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:08:19', '2018-07-17 04:08:19'),
(503, 'Ghoraghat Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:08:37', '2018-07-17 04:08:37'),
(504, 'Hakimpur Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:09:03', '2018-07-17 04:09:03'),
(505, 'Kaharol Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:09:35', '2018-07-17 04:09:35'),
(506, 'Khanshama Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:10:24', '2018-07-17 04:10:24'),
(507, 'Kotwali Police Station, Dinajpur', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:10:51', '2018-07-17 04:10:51'),
(508, 'Nawabganj Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:11:50', '2018-07-17 04:11:50'),
(509, 'Parbatipur Police Station', 7, 53, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:12:07', '2018-07-17 04:12:07'),
(510, 'Fulchhari Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:14:57', '2018-07-17 04:14:57'),
(511, 'Gaibandha Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:15:13', '2018-07-17 04:15:13'),
(512, 'Gobindaganj Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:15:28', '2018-07-17 04:15:28'),
(513, 'Palashbari Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:15:43', '2018-07-17 04:15:43'),
(514, 'Sadullapur Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:15:58', '2018-07-17 04:15:58'),
(515, 'Shaghata Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:16:12', '2018-07-17 04:16:12'),
(516, 'Sundarganj Police Station', 7, 54, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:22:50', '2018-07-17 04:22:50'),
(517, 'Bhurungamari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:24:42', '2018-07-17 04:24:42'),
(518, 'Charjabbar police station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:24:56', '2018-07-17 04:24:56'),
(519, 'Chilmari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:25:12', '2018-07-17 04:25:12'),
(520, 'Dushmara Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:25:29', '2018-07-17 04:25:29'),
(521, 'Kochakata Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:25:47', '2018-07-17 04:25:47'),
(522, 'Kurigram Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:26:26', '2018-07-17 04:26:26'),
(523, 'Nageswari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:26:41', '2018-07-17 04:26:41'),
(524, 'Phulbari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:26:51', '2018-07-17 04:26:51'),
(525, 'Rajarhat Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:27:09', '2018-07-17 04:27:09'),
(526, 'Rowmari Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:27:24', '2018-07-17 04:27:24'),
(527, 'Ulipur Police Station', 7, 55, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:27:37', '2018-07-17 04:27:37'),
(528, 'Aditmari Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:29:06', '2018-07-17 04:29:06'),
(529, 'Hatibanda Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:29:24', '2018-07-17 04:29:24'),
(530, 'Kaliganj Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:29:36', '2018-07-17 04:29:36'),
(531, 'Lalmonirhat Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:29:47', '2018-07-17 04:29:47'),
(532, 'Patgram Police Station', 7, 56, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:30:05', '2018-07-17 04:30:05'),
(533, 'Dimla Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:41:31', '2018-07-17 04:41:31'),
(534, 'Domar Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:42:02', '2018-07-17 04:42:02'),
(535, 'Jaldhaka Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:42:32', '2018-07-17 04:42:32'),
(536, 'Kishoreganj Police Station, Nilphamari', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:48:11', '2018-07-17 04:48:11'),
(537, 'Nilphamari Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:48:59', '2018-07-17 04:48:59'),
(538, 'Sayedpur Police Station', 7, 57, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:49:36', '2018-07-17 04:49:36'),
(539, 'Atwari Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:51:40', '2018-07-17 04:51:40'),
(540, 'Boda Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:51:58', '2018-07-17 04:51:58'),
(541, 'Debiganj Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:52:19', '2018-07-17 04:52:19'),
(542, 'Panchagarh Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:52:40', '2018-07-17 04:52:40'),
(543, 'Tetulia Police Station', 7, 58, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:52:58', '2018-07-17 04:52:58'),
(544, 'Badarganj Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:55:35', '2018-07-17 04:55:35'),
(545, 'Gangachara Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:55:50', '2018-07-17 04:55:50'),
(546, 'Kaunia Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:56:01', '2018-07-17 04:56:01'),
(547, 'Kotwali Police Station, Rangpur', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:56:34', '2018-07-17 04:56:34'),
(548, 'Mitha Pukur Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:56:56', '2018-07-17 04:56:56'),
(549, 'Pirgacha Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:57:10', '2018-07-17 04:57:10'),
(550, 'Pirganj Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:57:26', '2018-07-17 04:57:26'),
(551, 'Taraganj Police Station', 7, 59, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:57:40', '2018-07-17 04:57:40'),
(552, 'Baliadangi Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:59:28', '2018-07-17 04:59:28'),
(553, 'Haripur Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 04:59:45', '2018-07-17 04:59:45'),
(554, 'Pirgonj Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:00:10', '2018-07-17 05:00:10'),
(555, 'Ranisankail Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:00:26', '2018-07-17 05:00:26'),
(556, 'Ruhia Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:00:57', '2018-07-17 05:00:57'),
(557, 'Thakurgaon Police Station', 7, 60, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:01:10', '2018-07-17 05:01:10'),
(558, 'Azmiriganj Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:06:03', '2018-07-17 05:06:03'),
(559, 'Bahubal Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:06:27', '2018-07-17 05:06:27'),
(560, 'Baniachong Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:06:44', '2018-07-17 05:06:44'),
(561, 'Chunarughat Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:06:59', '2018-07-17 05:06:59'),
(562, 'Habiganj Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:07:12', '2018-07-17 05:07:12'),
(563, 'Lakhai Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:07:27', '2018-07-17 05:07:27'),
(564, 'Madhabpur Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:07:39', '2018-07-17 05:07:39'),
(565, 'Nabiganj Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:08:00', '2018-07-17 05:08:00'),
(566, 'Shayestaganj Police Station', 8, 61, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:08:13', '2018-07-17 05:08:13'),
(567, 'Barlekha Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:50:53', '2018-07-17 05:50:53'),
(568, 'Juri Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:51:12', '2018-07-17 05:51:12'),
(569, 'Kamalganj Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:51:26', '2018-07-17 05:51:26'),
(570, 'Kulaura Police Station', 8, 62, NULL, 1, 1, NULL, NULL, '2018-07-17 05:52:56', '2018-07-17 05:53:15'),
(571, 'Moulvibazar Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:53:38', '2018-07-17 05:53:38'),
(572, 'Rajnagar Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:53:53', '2018-07-17 05:53:53'),
(573, 'Sreemangal Police Station', 8, 62, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:54:33', '2018-07-17 05:54:33'),
(574, 'Biswamvarpur Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:56:56', '2018-07-17 05:56:56'),
(575, 'Chatak Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:57:09', '2018-07-17 05:57:09'),
(576, 'Derai Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:57:23', '2018-07-17 05:57:23'),
(577, 'Dharampasha Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:57:36', '2018-07-17 05:57:36'),
(578, 'Dowarabazar Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:57:46', '2018-07-17 05:57:46'),
(579, 'Jagannathpur Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:01', '2018-07-17 05:58:01'),
(580, 'Jamalganj Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:13', '2018-07-17 05:58:13'),
(581, 'Moddhonagar Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:25', '2018-07-17 05:58:25'),
(582, 'South Sunamganj  Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:39', '2018-07-17 05:58:39'),
(583, 'Sulla Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:58:50', '2018-07-17 05:58:50'),
(584, 'Sunamganj Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:59:01', '2018-07-17 05:59:01'),
(585, 'Tahirpur Police Station', 8, 63, NULL, 1, NULL, NULL, NULL, '2018-07-17 05:59:16', '2018-07-17 05:59:16'),
(586, 'Airport Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:02:45', '2018-07-17 06:02:45'),
(587, 'Jalalabad Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:03:09', '2018-07-17 06:03:09'),
(588, 'Kotwali Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:03:31', '2018-07-17 06:03:31'),
(589, 'Moglabazar Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:03:49', '2018-07-17 06:03:49'),
(590, 'Shah Paran Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:04:12', '2018-07-17 06:04:12'),
(591, 'South Surma  Police Station (SMP)', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:04:28', '2018-07-17 06:04:28'),
(592, 'Balaganj Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:05:55', '2018-07-17 06:05:55'),
(593, 'Beani Bazar Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:06:07', '2018-07-17 06:06:07'),
(594, 'Biswanath Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:06:19', '2018-07-17 06:06:19'),
(595, 'Companiganj Police Station, Sylhet', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:07:27', '2018-07-17 06:07:27'),
(596, 'Fenchuganj Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:07:42', '2018-07-17 06:07:42'),
(597, 'Golapganj Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:08:09', '2018-07-17 06:08:09'),
(598, 'Gowainghat Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:08:23', '2018-07-17 06:08:23'),
(599, 'Jointiapur Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:08:36', '2018-07-17 06:08:36'),
(600, 'Jokiganj Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:08:48', '2018-07-17 06:08:48'),
(601, 'Kanaighat Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:09:00', '2018-07-17 06:09:00'),
(602, 'Osmani Nagar Police Station', 8, 64, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:09:12', '2018-07-17 06:09:12'),
(603, 'Arai Hazar Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:10:27', '2018-07-17 06:10:27'),
(604, 'Bandar Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:10:52', '2018-07-17 06:10:52'),
(605, 'Fatulla  Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:11:16', '2018-07-17 06:11:16'),
(606, 'Narayanganj Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:11:40', '2018-07-17 06:11:40'),
(607, 'Rupganj Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:12:00', '2018-07-17 06:12:00'),
(608, 'Siddhirganj Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:12:19', '2018-07-17 06:12:19'),
(609, 'Sonargaon Police Station', 3, 26, NULL, 1, NULL, NULL, NULL, '2018-07-17 06:12:35', '2018-07-17 06:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `selects`
--

CREATE TABLE `selects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `selects`
--

INSERT INTO `selects` (`id`, `name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Call Type', NULL, 1, NULL, NULL, NULL, '2018-08-11 12:02:17', '2018-08-11 12:02:17'),
(2, 'Warranty or Paid', NULL, 1, NULL, NULL, NULL, '2018-08-11 12:07:00', '2018-08-11 12:07:00'),
(3, 'Subject', NULL, 1, NULL, NULL, NULL, '2018-09-12 05:20:45', '2018-09-12 05:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `sms_to_phone_numbers`
--

CREATE TABLE `sms_to_phone_numbers` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sms_to_phone_numbers`
--

INSERT INTO `sms_to_phone_numbers` (`id`, `phone_number`, `message`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '01717304242', 'Dear Sir/Ma\'am, Your complain has been generated. Ref. no: 22. For any query please call 16212.', 21, NULL, NULL, NULL, '2018-10-06 09:13:49', '2018-10-06 09:13:49'),
(2, '01613878705', 'Dear Sir/Ma\'am, Your complain (Ref. no: 21) has been resolved. For any query please call 16212.\r\n\r\n', 28, NULL, NULL, NULL, '2018-10-06 09:26:15', '2018-10-06 09:26:15'),
(3, '01912709498', 'Dear Sir/Ma\'am, Your complain has been generated. Ref. no:23 . For any query please call 16212.', 22, NULL, NULL, NULL, '2018-10-06 11:24:40', '2018-10-06 11:24:40'),
(4, '01912709498', 'Dear Sir/Ma\'am, Your complain (Ref. no:23 ) has been resolved. For any query please call 16212.', 22, NULL, NULL, NULL, '2018-10-06 11:38:48', '2018-10-06 11:38:48'),
(5, '01717304242', 'Dear Sir/Ma\'am, Your complain (Ref. no:22 ) has been resolved. For any query please call 16212.', 21, NULL, NULL, NULL, '2018-10-06 11:52:34', '2018-10-06 11:52:34'),
(6, '01819198186', 'Dear Sir/Ma\'am, Your complain has been generated. Ref. no: . For any query please call 16212.', 24, NULL, NULL, NULL, '2018-10-06 13:03:51', '2018-10-06 13:03:51'),
(7, '01782382140', 'Dear Sir/Ma\'am, Your complain has been generated. Ref. no:26 . For any query please call 16212.', 24, NULL, NULL, NULL, '2018-10-06 13:07:32', '2018-10-06 13:07:32'),
(8, '01819261926', 'Dear Sir/Ma\'am, Your complain has been generated. Ref. no:27 . For any query please call 16212.', 24, NULL, NULL, NULL, '2018-10-06 13:13:14', '2018-10-06 13:13:14'),
(9, '01710829343', 'Dear Sir/Ma\'am, Your complain has been generated. Ref. no:28 . For any query please call 16212.', 31, NULL, NULL, NULL, '2018-10-06 13:15:59', '2018-10-06 13:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(10) UNSIGNED DEFAULT NULL,
  `police_station_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_name_with_model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_status_id` int(10) UNSIGNED NOT NULL,
  `ticket_type_id` int(10) UNSIGNED NOT NULL,
  `assigned_id` int(10) UNSIGNED NOT NULL,
  `cc_to` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warranty_or_paid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tp_or_engineer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `subject`, `customer_name`, `phone_number`, `district_id`, `police_station_id`, `customer_address`, `product_name_with_model`, `ticket_status_id`, `ticket_type_id`, `assigned_id`, `cc_to`, `call_type`, `invoice_no`, `job_no`, `warranty_or_paid`, `tp_or_engineer_name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Technician Schedule Missed(Serv)', 'Arfan Hossain', '01828398969', 18, 0, '1/5 South Rajarbagh,Basabo,1st floor,Dhaka', 'Transtec Inverter AC ', 3, 1, 4, '8, 9, 14', 'Service Call', 'DBB-2018-1777', 'H1822370', 'Warranty', 'Shaymol Gomes', NULL, 21, 21, NULL, NULL, '2018-10-03 05:33:38', '2018-10-03 09:13:52'),
(2, 'Technician Behavior Issue(Serv) ', 'Md. Ataur Rahman', '01713006521', 18, 0, 'Flat# 2-D, House# 1/4, Block# F, Lalmatia,', 'Panasonic Inverter AC', 3, 1, 4, '8, 9, 14, 35', 'Service Call', 'DGN-2018-1775', 'H1822310', 'Warranty', 'Arif[535]', NULL, 26, 26, NULL, NULL, '2018-10-03 07:44:36', '2018-10-03 08:39:48'),
(3, 'Front Desk Issue(Front)', 'Mr. Yeasin Ali Sarker', '01775055257', 18, 0, 'DOM-Inno Garden, Khandoker Lane, 27, Shiddeshwari Road, Dhaka, Beside of Channal I & Kali Mondir.', 'W/P 3D Cool 111 AC SAR24k33D0 ', 3, 4, 15, '8, 9, 14, 35', 'Service Call', 'DST-2016-0227', 'h1816783', 'Warranty', 'Humayan Kabir', NULL, 23, 23, NULL, NULL, '2018-10-03 08:47:36', '2018-10-03 10:32:40'),
(4, 'Not Skilled Technician(Serv)', 'Arnika Noor', '01762632222', 18, 0, 'H#13C/4C(6th Floor), Block#B, Babar Road', 'Whirlpool AC SPOW ', 3, 1, 4, '8, 9, 14, 35', 'Service Call', 'DMD-2017-1430', 'H1822357', 'Warranty', 'Akas[534]', NULL, 26, 26, NULL, NULL, '2018-10-03 08:57:27', '2018-10-03 10:19:48'),
(5, 'Technician Schedule Missed(Serv)', 'Anis-Uz- zaman khan', '01620961002', 18, 0, 'House-12, Road-30, Gulshan-2, Dhaka', 'Transtec Smart Boomstation TLED 43S1', 3, 3, 5, '8, 9, 14, 35', 'Service Call', 'DGT-2018-1000', 'H1822401', 'Warranty', 'Jahangir Alam', NULL, 10, 10, NULL, NULL, '2018-10-03 09:17:54', '2018-10-03 11:09:29'),
(6, 'Service Delay Issue from Workshop(Serv)', 'Mr. Mahabub', '01700711535', 18, 0, 'H#668/1, Sabuj Ch Shaheber bari, East Manikdi,Dhakaata Goli, Kamal', 'W/P W/M 622D Deluxe 6.2 KG Full Grey (B)', 3, 2, 6, '8, 9, 14, 35', 'Service Call', 'NA', 'H1819615', 'Paid', 'Md.Sahadujjaman Babu', NULL, 10, 21, NULL, NULL, '2018-10-03 12:18:43', '2018-10-04 06:41:11'),
(7, 'Showroom Service Issue(Sales)', 'Umme Hanee Answary', '01778148013', 18, 0, 'House# 197, Road# 06, Block# F, Baundhara R/A,', 'Sanfrod Vaccum Flask', 1, 6, 3, '8, 9, 14, 16, 17, 35', 'Service Call', 'DGN-2018-2112', 'N/A', 'Warranty', 'N/A', NULL, 28, NULL, NULL, NULL, '2018-10-03 12:43:33', '2018-10-03 12:43:33'),
(8, 'Service Delay Issue(Serv)', 'Sabina Hoq', '01711830600', 18, 0, '56/1,Sheder shori,Silver app,6th fllor', '180210-Samsung Audio System HT', 3, 3, 5, '8, 9, 14, 35', 'Service Call', 'DDM-2017-3085', 'W1802353', 'Warranty', 'Monirul Islam', NULL, 10, 21, NULL, NULL, '2018-10-03 14:55:50', '2018-10-04 05:38:19'),
(9, 'Service Delay Issue from Workshop(Serv)', 'SHUMONA AKTER', '01711014965', 18, 0, '74/6, R#14, KOLLANPUR, NEEAR NEW BAZAR, DHAKA', 'Philips 50\" LED 50PFA4500/98', 3, 3, 5, '8, 9, 14, 35', 'Service Call', 'DMP-2016-0994', 'H1819433', 'Paid', 'Shajul Haque', NULL, 10, 21, NULL, NULL, '2018-10-03 15:05:09', '2018-10-04 05:36:15'),
(10, 'Delay Delivery from Showroom(Log)', 'Ahsanul Abid', '01711500317', 18, 0, 'flat;4D,paradise Kabir Fantacia.62 Shantinagor', 'Samsung Refrigerator RT56K6378SL/D2', 2, 7, 2, '8, 9, 14, 18, 35', 'Invoice Call', 'DDM-2018-2876', 'N/A', 'Warranty', 'N/A', NULL, 38, 2, NULL, NULL, '2018-10-04 07:34:18', '2018-10-06 10:15:27'),
(11, 'Service Delay Issue from Workshop(Serv)', 'Shekh Shihab Nur Rahaman', '01715165484', 18, 0, 'Sham bazar, Farash gonj, Dhaka', 'W/P 3D Cool 111 AC SAR12k33D0 1.0 Ton', 3, 1, 4, '8, 9, 14, 35', 'Service Call', 'NA', 'H1817437', 'Paid', 'Din Mohammad', NULL, 10, 10, NULL, NULL, '2018-10-04 08:20:28', '2018-10-04 09:33:18'),
(12, 'Delay Delivery from Showroom(Log)', 'Mr. Al Masum', '01971090707', 10, 0, '57/B,Highlavel Road,Lalkhanbazar.ctg', 'Samsung LED TV UA32M5500ARSER', 2, 7, 2, '8, 9, 14, 18, 35', 'Invoice Call', 'CTN-2018-3104', 'N/A', 'Warranty', 'N/A', NULL, 38, 2, NULL, NULL, '2018-10-04 09:02:59', '2018-10-06 09:55:54'),
(13, 'Technician Schedule Missed(Serv)', 'Md Mozammel Haque', '01928672405', 10, 0, 'H:15,South Campus,Ctg University CTG', 'Transtec A/C 18000 BTU TSA18GP', 3, 1, 4, '8, 9, 14, 35', 'Service Call', 'CTN-2017-2688', 'h1821812', 'Warranty', 'Kazol Mahmud Kabir', NULL, 10, 10, NULL, NULL, '2018-10-04 09:52:30', '2018-10-04 11:09:04'),
(14, 'Customer Demanding Replace/Refund(Ser)', 'Quamrul Islam Golder', '01769400067', 28, 0, 'Rajbari Palli Bidyut Samiti', 'Hitachi Refrigerator R-VG460P3PB (XRZ)', 3, 2, 6, '8, 9, 14, 35', 'Service Call', 'FAM-2018-0093', 'H1821259', 'Warranty', 'Haque Ref: & Engr works, (Rajbari)', NULL, 21, 21, NULL, NULL, '2018-10-04 10:27:28', '2018-10-05 05:52:54'),
(15, 'Not Skilled Salesman(Sales)', 'Jashim Uddin Chowdhury', '01713062082', 18, 0, 'H 23 R 9 Sector 9 Uttara', 'Samsung SMART TV', 1, 6, 3, '8, 9, 14, 16, 17, 35', 'Invoice Call', 'DGN-2018-2847', 'N/A', 'Warranty', 'N/A', NULL, 39, NULL, NULL, NULL, '2018-10-04 10:58:57', '2018-10-04 10:58:57'),
(16, 'Extra Tips Wanted by Delivery Man(Log)', 'Mohammad Shahjahan Miah', '01716836696', 30, 0, '172/3 Bokul Toli,Akur Takur Para,Tangail', 'Hitachi Refrigerator ', 1, 6, 3, '8, 9, 14, 16, 17, 35', 'Invoice Call', 'TMR-2018-0881', 'N/A', 'Warranty', 'N/A', NULL, 38, NULL, NULL, NULL, '2018-10-04 11:05:41', '2018-10-04 11:05:41'),
(17, 'Delivery Man Behavior Issue(Log) ', 'National Center For State Courts ', '01712037521', 18, 0, 'House -9,Flat -A-4, Road -29, Gulshan 1', 'Transtec Refrigerator ', 2, 7, 2, '8, 9, 14, 18, 35', 'Invoice Call', 'DGN-2018-2842', 'N/A', 'Warranty', 'N/A', NULL, 37, 2, NULL, NULL, '2018-10-04 11:15:22', '2018-10-06 09:43:22'),
(18, 'Technician Schedule Missed(Serv)', 'Mrs.Shirin Akter (Md. Sahariar jony)', '01712110015', 18, 0, 'Lalmatia new colony, government officers quarter, H-19/1( Ground floor).', 'Hitachi Refrigerator R-V440PG3-SLS (S)', 3, 2, 6, '8, 9, 14, 35', 'Service Call', 'DST-2015-0037', 'H1822719', 'Paid', 'Sanjibon Chandra Das', NULL, 22, 22, NULL, NULL, '2018-10-05 03:51:56', '2018-10-06 07:36:28'),
(19, 'Customer Demanding Replace/Refund(Ser)', 'Mr. Farhad', '01615880551', 26, 0, 'Amin R/A, Bandar, Narayanganj', 'Hitachi Refrigerator R-VG460P3PB (GBW)', 2, 2, 6, '8, 9, 14, 35', 'Service Call', 'NGJ-2018-1551', 'H1822924', 'Warranty', 'R A Engineering', NULL, 22, 22, NULL, NULL, '2018-10-05 12:02:38', '2018-10-06 07:56:30'),
(20, 'Customer Demanding Replace/Refund(Ser)', 'Md. Ashif Iqbal', '01715300664', 18, 0, 'Parlament Campus, Shangsad Avenue, Dhaka.', 'Whirlpool AC SPOW 224/3L (2.0 Ton)', 2, 1, 4, '8, 9, 14, 35', 'Service Call', 'DBP-2018-0261', 'H1817446', 'Warranty', 'Shaymol Gomes', NULL, 10, 10, NULL, NULL, '2018-10-06 05:29:36', '2018-10-06 11:48:51'),
(21, 'Service Delay Issue from Workshop(Serv)', 'Mr Mostafijur Rahman', '01613878705', 18, 0, 'H#969&976,F#A4,4th floor, R#15,House Name:Blue Roses,Baitul Aman Housing, Adabor,Dhaka.', 'Whirlpool Split AC SAR18K32T0 1.5 Ton (B)', 3, 1, 4, '8, 9, 14, 35', 'Service Call', 'DMD-2014-0561', 'h1817784', 'Paid', 'Din Mohammad', NULL, 28, 28, NULL, NULL, '2018-10-06 08:58:24', '2018-10-06 09:24:55'),
(22, 'Technician Schedule Missed(Serv)', '01717304242', '01717304242', 18, 0, '40/1, Alamin Road, Green Road, Dhaka', 'Whirlpool Split AC SAR18K32T0 1.5 Ton (B)', 3, 1, 4, '8, 9, 14, 35', 'Service Call', 'DKB-2017-0833', 'H1822642', 'Paid', 'Humayan Kabir', NULL, 21, 21, NULL, NULL, '2018-10-06 09:12:11', '2018-10-06 11:51:09'),
(23, 'Technician Schedule Missed(Serv)', 'Mirza Showkot Ali', '01912709498', 18, 0, 'CB-252/2,Old Kochukhat,Dhaka Cantt.Dhaka-1206.', 'Whirlpool Inverter AC SPIW 418 (1.5 Ton)', 3, 1, 4, '8, 9, 14, 35', 'Service Call', 'DIP-2018-0409', 'H1822135', 'Warranty', 'Shaymol Gomes ', NULL, 22, 22, NULL, NULL, '2018-10-06 10:53:00', '2018-10-06 11:38:03'),
(24, 'Product Delivery Delay from Service(Front)', 'Mr.Shakwat Hossain', '01740810689', 27, 0, '296/10, vela nogor, bank colony, Narsingdi', 'W/P W/M Stain Wash', 1, 4, 15, '8, 9, 14, 35', 'Service Call', 'NSD-2016-0025', 'h1817980', 'Paid', 'Md.Sahadujjaman Babu', NULL, 10, NULL, NULL, NULL, '2018-10-06 11:28:49', '2018-10-06 11:28:49'),
(25, 'Technician Schedule Missed(Serv)', 'Mr. Ashraful Islam', '01819198186', 20, 0, 'Vill.Name: Baligow, Baro Bari, Kaligonj,Beside Of Kaligonj Upjila Porishod, Gazipur.', 'Hitachi Refrigerator', 1, 2, 6, '8, 9, 14, 35', 'Service Call', 'DUT-2014-3653', 'H1822599', 'Paid', 'Erfan Ullah', NULL, 24, NULL, NULL, NULL, '2018-10-06 12:59:53', '2018-10-06 12:59:53'),
(26, 'Technician Schedule Missed(Serv)', 'DOEL GROUP', '01782382140', 18, 0, '49,Flat;5th,Mitali Road,Hazaribag,Jigatola,Dhaka', 'Hitachi Refrigerator', 1, 2, 6, '8, 9, 14, 35', 'Service Call', 'DDM-2018-2896', 'H1823033', 'Warranty', 'Sanjibon Chandra Das', NULL, 24, NULL, NULL, NULL, '2018-10-06 13:06:30', '2018-10-06 13:06:30'),
(27, 'Technician Schedule Missed(Serv)', 'Md. Maruf karim', '01819261926', 18, 0, 'H-21,R-1,B-E,Banasree,Dhaka', 'W/P Split AC', 2, 1, 4, '8, 9, 14, 35', 'Service Call', 'N/A', 'H1822788', 'Paid', 'Arifur Rahman', NULL, 24, 4, NULL, NULL, '2018-10-06 13:12:31', '2018-10-07 04:07:31'),
(28, 'Service Delay Issue(Serv)', 'Mr. Moshiur Rahaman', '01710829343', 18, 0, 'H#4, R#2, Block#D,Behind Sony cenama hall, Mirpur-2. Dhaka', '810046-Transtec A/C 18000 BTU TSA18G', 2, 1, 4, '8, 9, 14, 35', 'Invoice Call', 'N/A', 'H1821119', 'Paid', 'Humayan Kabir', NULL, 31, 4, NULL, NULL, '2018-10-06 13:14:28', '2018-10-07 04:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `ticket_status_id` int(10) UNSIGNED NOT NULL,
  `verbatim_or_issue` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`id`, `ticket_id`, `ticket_status_id`, `verbatim_or_issue`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Technician not attended in the Schedule  also no one communicated customer for re-schedule', NULL, 21, NULL, NULL, NULL, '2018-10-03 05:33:38', '2018-10-03 05:33:38'),
(2, 1, 2, 'TN couldn\'t able to attend this job yesterday as he have to engaged with a VIP customers home call. He is saying that he contract with call canter to reschedule this job but they didn\'t. Now as he don\'t have any blank schedule  space till tomorrow so that reschedule it to him for Oct 5.', NULL, 4, NULL, NULL, NULL, '2018-10-03 07:31:44', '2018-10-03 07:31:44'),
(3, 2, 1, 'As per the customer Technician misbehaved with customer badly. He said that why we send such technician. He request us to take care the issue next time.', NULL, 26, NULL, NULL, NULL, '2018-10-03 07:44:36', '2018-10-03 07:44:36'),
(4, 2, 2, 'I have contracted with the TP about this incident. They ensure that further they will more careful about issue', NULL, 4, NULL, NULL, NULL, '2018-10-03 08:30:16', '2018-10-03 08:30:16'),
(5, 2, 3, 'I have  communicated with the customer , customer is convince now ', NULL, 26, NULL, NULL, NULL, '2018-10-03 08:39:48', '2018-10-03 08:39:48'),
(6, 3, 1, 'Technician visited on (23 Sep,18) and informed customer that Product need to be bring to the Workshop but no further communication also he had dismantal the product. In the system TR given  on 1st Oct,18 by Hasib bhai but no one communicated yet with the customer.', NULL, 23, NULL, NULL, NULL, '2018-10-03 08:47:36', '2018-10-03 08:47:36'),
(7, 4, 1, 'Technician went their for servicing but when he was working with the AC circuit then he created problem with the whole house electricity. Then the customer had to fix it by other technician and it cost about 3000 BDT.  Customer wanted us to take care the issue and send a experienced technician next time if needed.', NULL, 26, NULL, NULL, NULL, '2018-10-03 08:57:27', '2018-10-03 08:57:27'),
(8, 1, 2, 'We have communicated with Shaymol Gomez and told him that as he was with Hasib bhai right now then talk to him regarding this and let us know about the update he did not give us any update.', NULL, 21, NULL, NULL, NULL, '2018-10-03 09:09:26', '2018-10-03 09:09:26'),
(9, 1, 3, 'Customer wanted the service before Friday as he is leaving Dhaka on Friday. We have communicated with Hasib bhai and as per his instruction we have assigned  Sharif Ahmed on 4th Sep,18(10 am-12pm). ', NULL, 21, NULL, NULL, NULL, '2018-10-03 09:13:52', '2018-10-03 09:13:52'),
(10, 5, 1, 'Schedule was 02/10/2018, 04-06 pm but Technician yet not attended  or no one communicated customer ', NULL, 10, NULL, NULL, NULL, '2018-10-03 09:17:54', '2018-10-03 09:17:54'),
(11, 4, 2, 'I have contracted with the TP about this incident. They ensure that further they will more careful about issue.', NULL, 4, NULL, NULL, NULL, '2018-10-03 09:45:43', '2018-10-03 09:45:43'),
(12, 4, 3, '  I have communicated with the customer , she is convince now ', NULL, 26, NULL, NULL, NULL, '2018-10-03 10:19:48', '2018-10-03 10:19:48'),
(13, 3, 2, 'Informed schedule on 04/10/18, Customer communicated & Convinced.', NULL, 15, NULL, NULL, NULL, '2018-10-03 10:21:40', '2018-10-03 10:21:40'),
(14, 3, 3, 'I have communicated with the customer. She is convinced now.', NULL, 23, NULL, NULL, NULL, '2018-10-03 10:32:40', '2018-10-03 10:32:40'),
(15, 5, 2, '\r\nEngineer called customer and rescheduled job 4.10.18 time 10-11 AM.', NULL, 5, NULL, NULL, NULL, '2018-10-03 10:38:46', '2018-10-03 10:38:46'),
(16, 5, 2, 'Rescheduled as per customer demand 6.10.18 time 10-12 pm', NULL, 5, NULL, NULL, NULL, '2018-10-03 11:07:46', '2018-10-03 11:07:46'),
(17, 5, 3, 'We have communicated with the customer he wants the service on  6th Sep by 4-6 pm. We have rescheduled the job & informed regarding technician as per the requirement. Customer is convinced now.', NULL, 10, NULL, NULL, NULL, '2018-10-03 11:09:29', '2018-10-03 11:09:29'),
(18, 6, 1, 'EDD was on [01.10.2018] but customer not updated about further Date till today . Customer claim to delivered job immediately.\r\nPlease conform update ASAP.', NULL, 10, NULL, NULL, NULL, '2018-10-03 12:18:43', '2018-10-03 12:18:43'),
(19, 7, 1, 'Customer purchased the product on 31st July,18 then he found fault on it and return it to the showroom and wanted the money back or replace it. But showroom concern did not cooperate with him. He knocked them many time for update but they did not response properly. Now he wants his money back or replacement of the product ASAP.', NULL, 28, NULL, NULL, NULL, '2018-10-03 12:43:33', '2018-10-03 12:43:33'),
(20, 8, 1, 'Product is in workshop and last feedback date is 25th Oct,18 due to parts(MPEG) unavailability issue. When we called him to tell about the EDD he shouted and asked why we are taking that much time. We tried to tell him about the issue but he wanted to talk with any other higher concern other wise tomorrow he will got the showroom and will make scene create.', NULL, 10, NULL, NULL, NULL, '2018-10-03 14:55:50', '2018-10-03 14:55:50'),
(21, 9, 1, 'Pending for LED bar 4th time EDD changed last EDD will be 11-Oct-2018, But customer not agree with the time , Customer wants delivery urgent otherwise he will make complain at consumer rights.  ', NULL, 10, NULL, NULL, NULL, '2018-10-03 15:05:09', '2018-10-03 15:05:09'),
(22, 9, 2, 'We will delivery job on 7.10.18. Customer already informed on 4.10.18.', NULL, 5, NULL, NULL, NULL, '2018-10-04 04:01:39', '2018-10-04 04:01:39'),
(23, 8, 2, 'We will delivery job on 8.10.18 customer informed.', NULL, 5, NULL, NULL, NULL, '2018-10-04 04:25:48', '2018-10-04 04:25:48'),
(24, 9, 3, 'communication done with customer.', NULL, 21, NULL, NULL, NULL, '2018-10-04 05:36:15', '2018-10-04 05:36:15'),
(25, 8, 3, 'communication done with customer.', NULL, 21, NULL, NULL, NULL, '2018-10-04 05:38:19', '2018-10-04 05:38:19'),
(26, 6, 2, 'The product is now ready for delivery. ', NULL, 9, NULL, NULL, NULL, '2018-10-04 05:39:48', '2018-10-04 05:39:48'),
(27, 6, 3, 'communication done with customer, He is convinced.', NULL, 21, NULL, NULL, NULL, '2018-10-04 06:41:11', '2018-10-04 06:41:11'),
(28, 10, 1, 'Product did not deliver on time.He is unhappy about the delivery system.  Also he said delivery man should be minimum educated for understanding the address and product should be deliver by van. ', NULL, 38, NULL, NULL, NULL, '2018-10-04 07:34:18', '2018-10-04 07:34:18'),
(29, 11, 1, 'EDD was on [24/09/2018] but customer not updated about further Date till today [04/10/2018]. Customer claim to deliver job immediately', NULL, 10, NULL, NULL, NULL, '2018-10-04 08:20:28', '2018-10-04 08:20:28'),
(30, 11, 2, 'Work in progress, Hopefully we will deliver within 08.10.18', NULL, 4, NULL, NULL, NULL, '2018-10-04 08:32:56', '2018-10-04 08:32:56'),
(31, 12, 1, 'Product  delivery after 10 days of showroom commitment, showroom service is bad, customer had to call many times.\r\n', NULL, 38, NULL, NULL, NULL, '2018-10-04 09:02:59', '2018-10-04 09:02:59'),
(32, 11, 3, 'Communication done, customer convened. ', NULL, 10, NULL, NULL, NULL, '2018-10-04 09:33:18', '2018-10-04 09:33:18'),
(33, 13, 1, '“Schedule was 12-02 pm but Technician yet not (03:51pm)  attended  or no one communicated customer, Customer is waiting and wants service urgent ', NULL, 10, NULL, NULL, NULL, '2018-10-04 09:52:30', '2018-10-04 09:52:30'),
(34, 14, 1, 'Customer purchased this product 3rd September 2018. Customer raised his complain for his product in 19 th September 2018. our technician visited his house but problem not solved. Now customer not agree to repair this product and he wants replacement. Customer is very irate and wants solution ASAP. Please take care of this issue.', NULL, 21, NULL, NULL, NULL, '2018-10-04 10:27:28', '2018-10-04 10:27:28'),
(35, 13, 2, 'TN already visited several time for sound issue but TN said that sound was natural but customer not convinced. Any way tn will communicated and Re-schedule on 06.10.18.', NULL, 4, NULL, NULL, NULL, '2018-10-04 10:31:58', '2018-10-04 10:31:58'),
(36, 15, 1, 'Salesman could not give proper information regarding exchange offer. He visited several showroom and found different different price. He wants some expert salesman.', NULL, 39, NULL, NULL, NULL, '2018-10-04 10:58:57', '2018-10-04 10:58:57'),
(37, 16, 1, 'Delivery man took  500 tk charge  for delivery as his house is in the ground floor and also approximately 1 km.away from showroom. \r\n', NULL, 38, NULL, NULL, NULL, '2018-10-04 11:05:42', '2018-10-04 11:05:42'),
(38, 13, 3, 'Communication done with customer', NULL, 10, NULL, NULL, NULL, '2018-10-04 11:09:04', '2018-10-04 11:09:04'),
(39, 17, 1, 'Bad behavior  from delivery man ', NULL, 37, NULL, NULL, NULL, '2018-10-04 11:15:22', '2018-10-04 11:15:22'),
(40, 14, 2, 'Our Supervisor Mr. Mazhar is taking care. We need the original Hitachi Serial but Customer is not allowing Tech. Please convince Customer to let our tech. visit and take the original serial and problem pictures. Then we shall communicate with Hitachi and try to make the solution.', NULL, 9, NULL, NULL, NULL, '2018-10-04 13:30:40', '2018-10-04 13:30:40'),
(41, 18, 1, 'Schedule was 04-Oct-2018, 02-04pm but Technician yet not  05-Oct-2018 ,(9:50pm)  attended  or no one communicated customer. Customer is very irate and want service urgent. Please take care of this issue.', NULL, 22, NULL, NULL, NULL, '2018-10-05 03:51:56', '2018-10-05 03:51:56'),
(42, 14, 3, 'Right now customer is convinced to visit technician in his house but customer wants to replacement  in any way. Rescheduled this job 07/10/2018, 10-12 pm.', NULL, 21, NULL, NULL, NULL, '2018-10-05 05:52:54', '2018-10-05 05:52:54'),
(43, 19, 1, 'Customer purchased the product from NGJ outlet at 29-Sep-2018, after that he was facing sound problem for his freeze, today he complained us about the freeze, we sent TN against his complain , TN found compressor problem and asked to change the compressor, but customer don\'t want to change the compressor , customer wants replacement for his freeze, customer is too angry , he wants a feedback from us by tomorrow. Please take care this issue ASAP', NULL, 22, NULL, NULL, NULL, '2018-10-05 12:02:38', '2018-10-05 12:02:38'),
(44, 20, 1, 'AC purchased on 26-Mar-2018, after that customer has taken service 4 times, than problem arise again. Now product in our service center and “ready for delivery” but customer not wants the product any more, he wants replace. Please take care ASAP.', NULL, 10, NULL, NULL, NULL, '2018-10-06 05:29:36', '2018-10-06 05:29:36'),
(45, 19, 2, 'The product was bought on 30 September, 2018. Compressor is making abnormal sound and there is mechanical problem in the compressor. Our supervisor Mr. Majhar is trying to convince the customer so that he lets us change the compressor. Also, from Call Center’s end, I’ll request to convince the customer so that he lets us change the compressor and give us feedback.\r\n\r\n', NULL, 8, NULL, NULL, NULL, '2018-10-06 06:45:48', '2018-10-06 06:45:48'),
(46, 18, 2, 'Mr. Israfil Hossen Babu will attend the job today', NULL, 8, NULL, NULL, NULL, '2018-10-06 06:46:20', '2018-10-06 06:46:20'),
(47, 20, 2, 'Product checked by Factory but they are not found any problem that\'s why  we already product send to front  for delivery. For delivery issue, pls contact with Mr. Sobuj/Rayhan', NULL, 4, NULL, NULL, NULL, '2018-10-06 07:12:35', '2018-10-06 07:12:35'),
(48, 18, 3, 'Comunication done with customer. TN attended .', NULL, 22, NULL, NULL, NULL, '2018-10-06 07:36:28', '2018-10-06 07:36:28'),
(49, 19, 2, 'We tried to convinced customer as per the instruction, but he is not agree with it. Customer wants replacement anyway.', NULL, 22, NULL, NULL, NULL, '2018-10-06 07:56:30', '2018-10-06 07:56:30'),
(50, 20, 2, 'We are tried to convince customer to take delivery the product, as your instruction “that product checked from factory and no fault found “. But as per customer we already delivered the same dialog and product as previous and that was happen again. Now customer not wants this product again, he wants replace. ', NULL, 10, NULL, NULL, NULL, '2018-10-06 08:19:11', '2018-10-06 08:19:11'),
(51, 21, 1, 'EDD was on [04/10/2018] but customer not updated about further Date till today [06/10/2018]. Customer claim to deliver job immediately.\r\ncustomer wants to know exact delivery date and re-installation date.', NULL, 28, NULL, NULL, NULL, '2018-10-06 08:58:24', '2018-10-06 08:58:24'),
(52, 22, 1, 'Customer complained for his AC in 3/10/2018 and wants service in saturday 10-12 pm. Schedule was  today 06/10/2018,10-12pm but Technician yet not (3:05pm)  attended  or no one communicated customer . customer is very disappointed with this type of service.Please take care  of this issue', NULL, 21, NULL, NULL, NULL, '2018-10-06 09:12:11', '2018-10-06 09:12:11'),
(53, 21, 2, 'Product is ready to Install, we will deliver by Today InshaAllah', NULL, 4, NULL, NULL, NULL, '2018-10-06 09:14:31', '2018-10-06 09:14:31'),
(54, 22, 2, 'TN was busy a VIP complain that\'s way. TN on the way & communicated with customer', NULL, 4, NULL, NULL, NULL, '2018-10-06 09:19:11', '2018-10-06 09:19:11'),
(55, 21, 3, 'comunication done with customer.customer is convinced.', NULL, 28, NULL, NULL, NULL, '2018-10-06 09:24:55', '2018-10-06 09:24:55'),
(56, 22, 2, 'We are communicate with customer, customer told that no one communicated with him . Now customer is not available at home. He wants Technician 07/10/2018 within 12 pm in his home but technician \'s schedule is full in 07/10/2018.', NULL, 21, NULL, NULL, NULL, '2018-10-06 09:38:34', '2018-10-06 09:38:34'),
(57, 17, 2, 'The ticket is not raised properly. Complain was not related with delivery team.', NULL, 2, NULL, NULL, NULL, '2018-10-06 09:43:22', '2018-10-06 09:43:22'),
(58, 12, 2, 'The invoice was online based. Product was not available due to EOL product. The delivery commitment was not proper. ', NULL, 2, NULL, NULL, NULL, '2018-10-06 09:55:54', '2018-10-06 09:55:54'),
(59, 10, 2, 'Customer did not like delivery through rickshaw van and product lifting issue.\r\nI have talked to the customer and he is convinced to be with us. ', NULL, 2, NULL, NULL, NULL, '2018-10-06 10:15:27', '2018-10-06 10:15:27'),
(60, 23, 1, 'Customer complained us about the AC at 29-Sep-2018, We scheduled TN at 30-Sep-2018 at about 02:00 PM-04:00 PM, But TN did not visited as per schedule, after that the job was re scheduled for today ,Schedule was 10-12pm but Technician yet not (4:35pm)  attended  or no one communicated customer. Customer is very irate and want service urgent. Please take care of this issue ASAP', NULL, 22, NULL, NULL, NULL, '2018-10-06 10:53:00', '2018-10-06 10:53:00'),
(61, 23, 2, 'There was Runner problem. Runner was not available our store. We will try to manage it by factory, hopefully it will be manage by tomorrow from factory otherwise we will raise loan.', NULL, 4, NULL, NULL, NULL, '2018-10-06 11:13:26', '2018-10-06 11:13:26'),
(62, 22, 2, 'TN communicated and customer said that he is not at home. Pls Re-schedule by tomorrow 10-12pm', NULL, 4, NULL, NULL, NULL, '2018-10-06 11:24:47', '2018-10-06 11:24:47'),
(63, 24, 1, 'Product is ready for delivery also received at front desk on 27/09/2018, but till now customer didn\'t get delivery of the product. Customer called us and wants to know customer will get delivery or not.  ', NULL, 10, NULL, NULL, NULL, '2018-10-06 11:28:49', '2018-10-06 11:28:49'),
(64, 20, 2, 'Pls escalate the issue to HOS, he has informed that issue.', NULL, 4, NULL, NULL, NULL, '2018-10-06 11:32:19', '2018-10-06 11:32:19'),
(65, 23, 3, 'Communication done with customer,Customer is convinced', NULL, 22, NULL, NULL, NULL, '2018-10-06 11:38:03', '2018-10-06 11:38:03'),
(66, 20, 2, 'Please escalate the issue from your end, and provide us an expected time to take from customer about the issue. ', NULL, 10, NULL, NULL, NULL, '2018-10-06 11:48:51', '2018-10-06 11:48:51'),
(67, 22, 3, ' As discus with you , Informed customer about Re-schedule.', NULL, 21, NULL, NULL, NULL, '2018-10-06 11:51:09', '2018-10-06 11:51:09'),
(68, 25, 1, 'TN Schedule was 04-06 pm but till now (6:53) no one communicate with customer or no one attend to customer\'s  house. ', NULL, 24, NULL, NULL, NULL, '2018-10-06 12:59:53', '2018-10-06 12:59:53'),
(69, 26, 1, 'Schedule was 04-06pm but Technician yet not (7:06pm)  attended  or no one communicated customer.', NULL, 24, NULL, NULL, NULL, '2018-10-06 13:06:30', '2018-10-06 13:06:30'),
(70, 27, 1, 'Schedule was 04-06pm but Technician yet not (7:10pm)  attended  or no one communicated customer .', NULL, 24, NULL, NULL, NULL, '2018-10-06 13:12:31', '2018-10-06 13:12:31'),
(71, 28, 1, 'product Delivered in customer house but did  not install yet customer wants installation within today for this issue we called you didn\'t reach you by phone. please provide an update as per customer requirement   ', NULL, 31, NULL, NULL, NULL, '2018-10-06 13:14:28', '2018-10-06 13:14:28'),
(72, 27, 2, 'Job Re-scheduled on Today', NULL, 4, NULL, NULL, NULL, '2018-10-07 04:07:31', '2018-10-07 04:07:31'),
(73, 28, 2, 'TN will attend today', NULL, 4, NULL, NULL, NULL, '2018-10-07 04:08:04', '2018-10-07 04:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_statuses`
--

CREATE TABLE `ticket_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_statuses`
--

INSERT INTO `ticket_statuses` (`id`, `name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pending', NULL, 1, 8, NULL, NULL, '2018-09-26 05:25:51', '2018-10-03 14:30:10'),
(2, 'Feedback Given', NULL, 1, NULL, NULL, NULL, '2018-09-26 05:26:18', '2018-09-26 05:26:18'),
(3, 'Closed', NULL, 1, NULL, NULL, NULL, '2018-09-26 05:26:36', '2018-09-26 05:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `name`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Service (AC)', NULL, 1, 1, NULL, NULL, '2018-08-11 09:31:47', '2018-09-13 05:43:23'),
(2, 'Service (HA)', NULL, 1, 1, NULL, NULL, '2018-08-11 09:32:18', '2018-09-13 05:44:08'),
(3, 'Service (AV)', NULL, 1, 1, NULL, NULL, '2018-08-11 09:32:55', '2018-09-13 05:44:50'),
(4, 'Service (Front)', NULL, 1, 1, NULL, NULL, '2018-08-11 09:35:09', '2018-09-13 05:45:20'),
(5, 'Service (Samsung)', NULL, 1, 1, NULL, NULL, '2018-08-11 09:37:29', '2018-09-13 05:46:03'),
(6, 'Sales', NULL, 1, 1, NULL, NULL, '2018-08-11 09:38:21', '2018-09-13 05:46:25'),
(7, 'Logistics', NULL, 1, 1, NULL, NULL, '2018-08-11 09:38:59', '2018-09-13 05:46:54'),
(8, 'Call Center', NULL, 1, NULL, NULL, NULL, '2018-09-13 05:47:11', '2018-09-13 05:47:11'),
(9, 'Others/NA', NULL, 1, NULL, NULL, NULL, '2018-09-13 06:46:54', '2018-09-13 06:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `ticket_type_id` int(10) UNSIGNED DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `role`, `ticket_type_id`, `phone_number`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'MYOLBD', 'myol@myolbd.com', '$2y$10$/QWAqqU6lMpl7bOOtGMnTuKODlLWmeMVa1fMLccj9JspXafGmr3S2', 'VGMAo3hZ9O7l35quTAZucZOBJa1cHpDt5NmuCKr0nUCTphtwpBC5TV0iisJ9', 'super_admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-11 06:03:16', '2018-10-04 07:09:32'),
(2, 'Rafiuzzaman', 'km.rafiuzzaman@tel.transcombd.com', '$2y$10$UJvv8FgEngM/iwcfirf/f.XvR7lMwuk4IA.WadwHgzpbi8eq0TVtG', 'I97myp4R4qaVQWHRevpwEie8i69Sna241aXzsIFT0HyDDkQhtXYaInOUSvEw', 'agent', 7, '01730097363', '', NULL, NULL, 11, NULL, NULL, '2018-08-11 06:12:21', '2018-10-06 08:58:31'),
(3, 'hasan', 'hasan.ahmed@tel.transcombd.com', '$2y$10$6ZIe3EeCiSVT/xwtzoJa.ORGmRAxIgyAnXkDdor31ym60aKR1BKYa', '8rK1GM9aiqHwbzNcOaEOwL1cQjA6dbZ5HLe5MufFvKUG7pgHHtS0wkUSWnYL', 'agent', 6, '01713082479', '', NULL, NULL, 11, NULL, NULL, '2018-08-11 06:14:15', '2018-10-04 09:09:08'),
(4, 'hasibur', 'hasibur.rahman@beil.transcombd.com', '$2y$10$3PDLOasjJdrvZBvlcb1SouJxyiVuKrBmria/gf5upDxWNnYYE9HrO', '00GVKFhxtN6qSSa8kzGGQo8A17PcjFwWsX95uZNzqNLfXW4d6m0oXPveOEF9', 'agent', 1, '01755519480', '', NULL, NULL, 1, NULL, NULL, '2018-08-11 06:16:06', '2018-10-04 07:17:19'),
(5, 'mosharaf', 'kazi.mosharaf@beil.transcombd.com', '$2y$10$0Cd51ojiwSR7DXxtwj3t9e6sciut80.4Gmegouy4f/z92yylM3Kl6', '9sZriJiT4eLN4UfO4s7HtTY8FhuQr1AWREIRxI9nifFk0gZvGYaNwszHAlZ4', 'agent', 3, '01714089136', '', NULL, NULL, 11, NULL, NULL, '2018-08-11 06:17:57', '2018-10-06 05:04:40'),
(6, 'mynul', 'mynul.islam@tel.transcombd.com', '$2y$10$VO7L3ZXDGgpkSDZIw3WsHuLCahxrTf6Zs8ZOxBKhnA6JSWzQTzrBW', 'KcjRuFhJCAnYdukOUz3ZH6BRPzPGh2wI65mEPpdlWQ4KhV8invB0tNPqyvBv', 'agent', 2, '01714089209', '', NULL, NULL, 11, NULL, NULL, '2018-08-11 06:19:34', '2018-10-04 09:09:18'),
(7, 'Rokon Asm', 'rokon.asm@tel.transcombd.com', '$2y$10$ckM6Dky6SKx6CmREQ8zOM.MeInxUG8lp6k78Ur.qHq/zFhSDKcv6q', 'Al2zWZcXS3FaliOAaQHBSfJ93Xs5jErfShFhyELpbxKbrJ4LfoJK8dWk2HTy', 'agent', 5, '01701217956', '', NULL, NULL, 11, NULL, NULL, '2018-08-11 06:21:58', '2018-10-04 09:09:25'),
(8, 'farzana', 'farzana.ahmed@tel.transcombd.com', '$2y$10$ZXyI0ZOuuaG569xZBLE1hejZB3ABO7ydZGR0aZz8GKM7c9pDRogVC', 'SO13OKk0H10mgAaKRBUEFuugATxJxjaoSuQ4AWKkLbTQ4UOXGEw5406pSnOt', 'ticket_admin', 9, '01714089114', '', NULL, NULL, 11, NULL, NULL, '2018-08-11 07:36:08', '2018-10-06 08:55:49'),
(9, 'smimtiaz', 'shahm.imtiaz@tel.transcombd.com', '$2y$10$FUOwCQ18WlQpbcXJrRwNEe4SKPP7FEmfSQnFn3kFLqrDjfmbqt5P.', 'aLguAJuwL8pFoLdcduQUewqQaMfvplJ3s97bhB9WmwywFr1OHFO1kXzcr6jF', 'ticket_admin', 9, '01701217968', '', NULL, NULL, 1, NULL, NULL, '2018-08-11 07:38:17', '2018-10-04 09:55:39'),
(10, 'patwary', 'patwary@gmail.com', '$2y$10$XIvkbCJ0nQn9v0Ht/jWVreK4cU7n5L37tLbvgSwx1DqpDjiVbZ0Su', 'QeIfshYaamwQXq04KzAIMsc4eblgyhAI8X2K5eiJ6PrYXm9YzLLplvHRUkJp', 'agent', NULL, '', '', NULL, NULL, 1, NULL, NULL, '2018-08-11 07:47:07', '2018-10-06 09:59:38'),
(11, 'Sharif', 'sharif@myolbd.com', '$2y$10$gbVFuFYdVnCZllXNMVklre3DWJpYOaSa.XhWLGqdCGL0h3RNGFApi', '4TavfVZF5tIf7K4p93Z4orbueLa5R3qMo0PoyE4wEIiAyE3UqfxUHbhE76GP', 'ticket_admin', 8, '01717266972', 'Banani', NULL, NULL, 1, NULL, NULL, '2018-08-11 08:44:20', '2018-10-06 07:32:03'),
(12, 'Maruf', 'maruf@myolbd.com', '$2y$10$3XcCvSkK/r0X.VcQo8.pouXf.fChYHWjz9ebO/yUwrdg9eM9JzXPy', 'ijB2vI5EakiBl4P8FwtDOkXt3Xj2XbaqMG7cM7uo5GiSrRHMUDUIyBOh345r', 'ticket_admin', 8, '01711505949', 'Banani', NULL, NULL, 1, NULL, NULL, '2018-08-11 08:45:25', '2018-09-13 06:23:51'),
(13, 'Mohsin', 'mohsin@myolbd.com', '$2y$10$jEmUERgzrCo7d/yGV89aQe3nLoZt96f6gyyo2lKhpKrPKwWGAYg3m', 'yuqtkzMT7rRRAaXDDVi3AoSMB6dUUEHSJenWU4uFPl3K30NVWkUincWdpB2M', 'user', 8, '01758214966', 'Banani', NULL, NULL, 1, NULL, NULL, '2018-08-11 10:52:30', '2018-10-06 08:55:24'),
(14, 'manju', 'fazlul.haque@beil.transcombd.com', '$2y$10$K4zIPF8B6KpYaISPwnJUFeng1K1dL85TM0BlXsZA29zvTyhu6k1ge', 'jYxsysnSPqwE4DfNpCedv1VEaBlp9zPHgCD4OngWhOqrR3TMaQaxQoLwRI3K', 'ticket_admin', 9, '01714089140', '', NULL, NULL, 11, NULL, NULL, '2018-09-13 04:56:17', '2018-10-06 04:44:33'),
(15, 'sabuj', 'alimul.alam@tel.transcombd.com', '$2y$10$J2hUOir79Bn74w6b0ji7CeAL1oGW43.Z7MTwppwhDg/JwXGVPpLu.', 'SlccSRJIwm7gfCJqfWk27lMxVvMo9jM8sUJQMsdQAJCOuTznZAkeNut1e4xH', 'agent', 4, '01714089258', '', NULL, NULL, 11, NULL, NULL, '2018-09-13 05:15:21', '2018-10-04 09:09:33'),
(16, 'aislam', 'aminul.islam@tel.transcombd.com', '$2y$10$6p7GO470lI.XbFqWxWNsveCjEpgizVVNUKmH2QDZtSh3mhyJPm3vi', 'eLyFpPO3jaAKwt9fGy4q1WCCVYPONZfpYfyyprHBXpTkN9n4f95tM5ldN5aZ', 'agent', 9, '01713082492', '', NULL, NULL, 11, NULL, NULL, '2018-09-15 06:26:53', '2018-10-04 09:09:41'),
(17, 'nazmulhasan', 'nazmul.hasan@tel.transcombd.com', '$2y$10$m6I8nRAjK7F.I2.6utjkRuanw8TwtBinjU80fUM1yyZrcP.89Oa4S', 'pVxJAF9PFJV6nuywYxUyXQ1a44b8iK5a0Jxcf9uiJ6G6q2Oxs9BdlPIuPFNH', 'agent', 9, '01730340638', '', NULL, NULL, 11, NULL, NULL, '2018-09-15 06:31:47', '2018-10-04 09:09:48'),
(18, 'Khairul', 'khairul.islam@transcombd.com', '$2y$10$.Fo2lghqR8Ocrafc/a79JeR0uXaqkzHltMzdtxai.xPhbQMl2CRWe', 'mwN8IuY7hY7O5NvtlZg4gGy4vFCnzzI3HEboVsMTGsLx9eCbIeaIiyQTShuS', 'user', 9, '01713041237', '', NULL, NULL, 1, NULL, NULL, '2018-09-15 06:43:44', '2018-10-03 07:05:40'),
(19, 'Yeamin', 'yeamin.sharif@tel.transcombd.com', '$2y$10$Lu/ULyv4iEJ4CK.NsyWkuOVm0dzYxccMvHXPagMhpWT9ybDn5BDDq', 'AgqwLExXR8npWQCzXOMwC13Kr4lHTEQv89cRnuvFw45MPOIFQ1nhaAVm968h', 'user', 9, '01713009891', '', NULL, NULL, 1, NULL, NULL, '2018-09-15 07:37:50', '2018-10-03 07:06:41'),
(20, 'Basher', 'basher@mygroupbd.com', '$2y$10$bjX9ujh9Z1nGoZ83HxdHEeqAMuuhvwNHvOXLesPhdgz9vY9ukl9MG', 'X2XPPPMI412GQYyXhCNqwr7kPal4Dkp6TzkdnyntjHFb6XAyAyFhm7MmmfAv', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-15 07:40:35', '2018-09-15 07:40:55'),
(21, 'rumana', 'rumana@gmail.com', '$2y$10$14rAXpumrIS1.XrOJRZFcOy11.cb4YAQqOLzIfBuvZCOvxFxHlJ1C', 'NBBcwb4LpSM6cErOJPFKDiUBH802KOvEbXEH3FS16SxUq7nxUyePsan99ipJ', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 10:20:09', '2018-10-04 13:28:05'),
(22, 'hasiba', 'hasiba@gmail.com', '$2y$10$DJILEep2/O9IERMVBWoereILGlefj/kLdWOwxGdV1vq8SVXDUkMpa', 'jjFZylkFGi2som2Q1LXG4TQIxmubvxplCGhJ84GGth13V3kcZiB0LwVajQnR', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:42:34', '2018-10-02 12:43:25'),
(23, 'emon', 'emon@gmail.com', '$2y$10$KbDFq6x/oc5sbsIxxwx5pO51ST7VLyroA3bCZkVjtz/A4uijRI6ZK', 'M6k0a38b6FM9Ao4qz76o2YqSTiE662LtQx876YZ4PkR2YbSp33iymGPKCQIy', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:46:19', '2018-10-03 12:32:11'),
(24, 'mmkorim', 'mmkorim@gmail.com', '$2y$10$aUUuVDKi0DqPmXPsGNlNmOPcWKuxYaKrlDmLaS0oWvGZsQO.zIZsS', 'npFKTdiWcb4EF40F2t47Azcw9KnTzkS9SHEZp2num3Co7cUiZngGTGWfjmna', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:48:14', '2018-10-06 14:50:01'),
(25, 'shopnil', 'shopnil@gmail.com', '$2y$10$SZVCFbsJcySfxX2pppsiHuvCjKLIkpNEwv3.ZdynoPGUa8Y1luQpq', 'c6Q94DP3oThe44oJk7IP41I6KjxxTyUO4OgSt85Rt09jEZXdDKvD9lrziQav', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:50:42', '2018-10-03 04:51:34'),
(26, 'akkhor', 'akkhor@gmail.com', '$2y$10$AhQAHJMkk9KwcdtWe/Wu9ealUg6DZj876quhA9sde1hagk.QUX.zC', '2qD5EuK6tIUJUUc9WEFse7UfAF3TXODvOcMJNR98sQeU1WmvrhV3o80tYB5a', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:51:51', '2018-10-02 12:55:37'),
(27, 'msheikh', 'msheikh@gmail.com', '$2y$10$H0KI734mbPdXnSZKfNetVeqnVg7xRIIfqu2.daCyYDWe2pxLdayPu', '8x27iRaVgclix2vdjJyowZqo7dIFEQspbzDmDBRS0FkOY19bOZXL2ujKAkHZ', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:52:23', '2018-10-02 12:55:48'),
(28, 'shakila', 'shakila@gmail.com', '$2y$10$jB23CVYRI.2dUWAb6dklgenv1dYcLn14G1wF3su/hA8H0GelHxNXa', 'frbZRxK1nS06SJvReWPzXbxjAHd04zTOgnExsvMorhDWDRxNrslTWjS1Ckzl', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:52:51', '2018-10-02 12:55:57'),
(29, 'ohhimu', 'ohhimu@gmail.com', '$2y$10$.HFpomypHg7x/IIA4QUWeu82GUKIeHfLMWhn9sTtkW8QLQccBZ6t.', 'sj9gJ3Ij3NdObtWk17hO9cy0CuqFDi9SCrGYNsiQG64drrNNXF9emqJ3tvlp', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:56:43', '2018-10-02 12:58:15'),
(30, 'shreza', 'shreza@gmail.com', '$2y$10$zeTkNvPUYwgptVt4xwbxJ.zneb6ta9wexUqbnLY/OULlKWG9hS6L6', '7baEghJTO4M9IcoMjnQEF5hhXRtFY34pR9bc3Np6FPXdFwTDwFNnUFR7QLxw', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:57:23', '2018-10-02 12:58:23'),
(31, 'tainjena', 'tainjena@gmail.com', '$2y$10$CzO/MTyAeWAHvfiFQ1U.BeAzmcPQNL9WD3nQ695n6daQoC4ReEpwW', 'pvla4g2BprEMJlF8w76QWiSxKPJehIrDzDW1oe6h7ibR0pmKHMtCzv3RzwC0', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 12:59:17', '2018-10-06 14:27:08'),
(32, 'arafat', 'arafat@gmail.com', '$2y$10$YtSLf.xg5/U/TPTWSGIA5uNoa64I.5LDtpu0LAei7sR0JH4T3ufCe', 'uLMyl8HLTvaixRRk1gV8FOHLuJ8uyCHRIQOf8Hoi4FvAOw9lCSxllnExa7vN', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 13:01:49', '2018-10-02 13:04:03'),
(33, 'muinul', 'muinul@gmail.com', '$2y$10$fLZifzYWMYffkd5TeOWLRu1zONkUV1fYB4z5BHLGjniKZvTN.EGr.', '96Yh3C6vNVCAABUWwuP1pZH8ExMIIUMIr0l1c6Xm4q4snE1gljX7BWDtXCFA', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 13:02:25', '2018-10-02 13:04:11'),
(34, 'roni', 'roni@gmail.com', '$2y$10$AEmRFGcme5lhbD73rNhJNOYlPcOgYqscC2T3CYP0X8a2bqDDckK1K', 'ub8hYkJqB0RRz4l7LkObZYu6gM66iq511r828XMIWD2jtqd3k9OwAOb0TZ2l', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-02 13:03:06', '2018-10-06 07:45:17'),
(35, 'shafi', 'md.shafiullah@tel.transcombd.com', '$2y$10$D5RKN1r4lLmkozyivb6/feLOGIl3F.FZFaZ1hDwJIFzuWE582I94q', '5dgPJKIGl8rSrW8QAsoWOqc79uDce1dtPBFVnJwmpXLQqerKYiToCAQhHDs2', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-03 06:27:48', '2018-10-07 04:38:01'),
(36, 'mrsultan', 'rayhain.sultan@tel.transcombd.com', '$2y$10$OGOTCloMmsGe/9zLFB59q.CrfT5DvrIHAsS9EQIisg8WKAiULKU7q', 'Nmp1DlB14IdvcdtIDFynlclqtMGh1KFAVhuz3gggFWtBEtqH3urGCqAseTZg', 'agent', 4, '01730340603', 'Mohakhali', NULL, NULL, 11, NULL, NULL, '2018-10-03 13:25:41', '2018-10-04 09:10:06'),
(37, 'invoice1', 'invoice1@gmail.com', '$2y$10$oHiCuhd48C6.zlUEC7fHdurakDECUxepefo2uwpUeAevJI0htfmNy', 'xdkmQ94ugvqUHH4kdoQqBEUPAPqvS6EKFthZtJOT1NVUKXpmsvAPSLtkibYp', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-04 04:58:27', '2018-10-04 05:01:15'),
(38, 'invoice2', 'invoice2@gmail.com', '$2y$10$HfoHmQ/3TGAAI2G3Qaocb.SEeTZ7k5r4mmkAk59JrAkQwi2N.vDzG', 'od80krkdfGFIMWPtgUwvfgr1i5VqTfH659lZM7H7NaVazDzJvPcUn8SlUj4a', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-04 04:58:58', '2018-10-04 05:01:27'),
(39, 'invoice3', 'invoice3@gmail.com', '$2y$10$gtfcjkT0LZuGE94vAoVabu6KvFoo.Cpt9R88.iV3NJuVLeMmVYmjW', '8WXRPcJCBzSpSzaZPrrXLVbduGLVaU1yjeqIMWjrO4Au211UHFn65PKwZ60T', 'agent', 9, '', '', NULL, NULL, 11, NULL, NULL, '2018-10-04 04:59:37', '2018-10-04 12:06:24'),
(40, 'wahid', 'wahid.murad@tel.transcombd.com', '$2y$10$VF.UDe2VMkxUpN8SGg1gIuxxXPmHdD2zP7yUzqn45apiNhpvO4MSS', '62MgxQDeSecME3TPmjnV5SspYwRqAsxVE3bNcmHUvHZg9YUmXUr7lE7zXLxk', 'agent', 7, '01714089281', '', NULL, NULL, 11, NULL, NULL, '2018-10-04 12:47:14', '2018-10-04 12:48:16'),
(41, 'muntakim', 'abm.muntakim@tel.transcombd.com', '$2y$10$cs04NW0V5uIpmMSgwR0BP.sOAd6aTL0mezvj3IU3w25pJh.AgJZW6', 'it0D8w1gCqCnNr28JsA0YVPbAcXUexfHFG5IYdJ8oEKP0kKaVmbSX6qmjAe5', 'agent', 5, '01730340641', '', NULL, NULL, 11, NULL, NULL, '2018-10-06 09:05:33', '2018-10-06 09:09:39'),
(42, 'pasarkar', 'parvez.sarkar@beil.transcombd.com', '$2y$10$R/TmnzHw0Ig8wXtQF8ZtceA8jEBeLQ9sGuOINub4cziH.3aEwe7E2', 'CAXU9OuDs6CDvc0ASwDrFeW0QZmqirxeESLRYorik0uxmlKIlRXayrZUAP74', 'agent', 5, '01701217965', '', NULL, NULL, 11, NULL, NULL, '2018-10-06 09:07:42', '2018-10-06 09:09:58'),
(43, 'asmrzaman', 'nayon.kumar@tel.transcombd.com', '$2y$10$WCscqA2U9HVU6CTSBZu.2eEMERnOvQKarK1sKqb/Nh8TX8Pvj/dg.', 'vR5EpcTuSu9SuvfVV4Tl4jIEwrFLbcUa7fhJbTEkkSDIBYrHPZyh50wGNWBF', 'agent', 5, '01711404596', '', NULL, NULL, 11, NULL, NULL, '2018-10-06 09:08:55', '2018-10-06 09:10:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts_orig`
--
ALTER TABLE `districts_orig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions_orig`
--
ALTER TABLE `divisions_orig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `police_stations`
--
ALTER TABLE `police_stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `police_stations_orig`
--
ALTER TABLE `police_stations_orig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selects`
--
ALTER TABLE `selects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_to_phone_numbers`
--
ALTER TABLE `sms_to_phone_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
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
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `districts_orig`
--
ALTER TABLE `districts_orig`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `divisions_orig`
--
ALTER TABLE `divisions_orig`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `police_stations`
--
ALTER TABLE `police_stations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=610;
--
-- AUTO_INCREMENT for table `police_stations_orig`
--
ALTER TABLE `police_stations_orig`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=610;
--
-- AUTO_INCREMENT for table `selects`
--
ALTER TABLE `selects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sms_to_phone_numbers`
--
ALTER TABLE `sms_to_phone_numbers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `ticket_details`
--
ALTER TABLE `ticket_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
