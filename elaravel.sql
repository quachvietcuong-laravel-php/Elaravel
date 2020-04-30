-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 30, 2020 lúc 07:06 AM
-- Phiên bản máy phục vụ: 10.4.8-MariaDB
-- Phiên bản PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `elaravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_04_16_121211_create_tbl_category_product', 1),
(19, '2020_04_16_121553_create_tbl_brand_product', 2),
(20, '2020_04_16_121641_create_tbl_product', 2),
(21, '2020_04_16_121824_create_tbl_admin', 2),
(22, '2020_04_16_122104_create_tbl_color', 2),
(23, '2020_04_16_122244_create_tbl_size', 2),
(24, '2020_04_16_122855_create_tbl_size_details', 2),
(25, '2020_04_16_122949_create_tbl_color_details', 2),
(26, '2020_04_16_123232_create_tbl_payment', 2),
(27, '2020_04_16_123316_create_tbl_customers', 2),
(28, '2020_04_16_123352_create_tbl_checkout', 2),
(29, '2020_04_16_123428_create_tbl_order', 2),
(30, '2020_04_16_123659_create_tbl_order_details', 2),
(31, '2020_04_17_095423_creat_tbl_total_product_details', 3),
(32, '2020_04_17_145640_add_sold_to_tbl_total_product_details', 4),
(33, '2020_04_18_072737_add_status_to_tbl_order_details', 5),
(36, '2020_04_18_111653_create_tbl_chosen', 6),
(37, '2020_04_18_111747_create_tbl_comment', 6),
(38, '2020_04_19_164412_add_level_to_users', 7),
(39, '2020_04_26_093951_create_tbl_coupon', 8),
(40, '2020_04_29_100752_add_coupon_id_to_tbl_order', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'cuong@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Quách Việt Cường', '0365889218', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`id`, `name`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Vascara', 'vascara', 'Vascara', 1, '2020-04-17 00:55:26', '2020-04-17 00:55:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`id`, `name`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giày búp bê', 'giay-bup-be', 'Giày búp bê', 1, '2020-04-16 05:45:17', '2020-04-16 05:45:17'),
(3, 'Túi xách tay', 'tui-xach-tay', 'Túi xách tay', 1, '2020-04-17 00:55:17', '2020-04-17 00:55:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_checkout`
--

CREATE TABLE `tbl_checkout` (
  `id` int(10) UNSIGNED NOT NULL,
  `customers_id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_checkout`
--

INSERT INTO `tbl_checkout` (`id`, `customers_id`, `phone`, `address`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, '0101010101', 'nguyễn văn lượng', '2', '2020-04-18 01:15:16', '2020-04-18 01:15:16'),
(2, 1, '0101010101', 'nguyễn văn lượng', '1', '2020-04-18 01:18:46', '2020-04-18 01:18:46'),
(3, 1, '0101010101', 'b', 'g', '2020-04-18 01:42:21', '2020-04-18 01:42:21'),
(4, 1, '0101010101', 'a', '12', '2020-04-18 01:54:51', '2020-04-18 01:54:51'),
(5, 1, '0101010101', 'nguyễn văn lượng', 'asfđsf', '2020-04-18 03:23:27', '2020-04-18 03:23:27'),
(6, 1, '0101010101', 'a', 'a', '2020-04-26 01:01:50', '2020-04-26 01:01:50'),
(7, 1, '0101010101', 'a', 'a', '2020-04-26 01:03:17', '2020-04-26 01:03:17'),
(8, 1, '0101010101', 'nguyễn văn lượng', 'a', '2020-04-26 01:07:39', '2020-04-26 01:07:39'),
(9, 1, '0101010101', '2/7 aa', 'a', '2020-04-26 02:03:58', '2020-04-26 02:03:58'),
(10, 1, '0101010101', '2/7 aa', 'a', '2020-04-26 02:03:59', '2020-04-26 02:03:59'),
(11, 1, '0101010101', 'nguyễn văn lượng', 'a', '2020-04-26 02:05:32', '2020-04-26 02:05:32'),
(12, 1, '0101010101', 'nguyễn văn lượng', 'a', '2020-04-26 02:11:16', '2020-04-26 02:11:16'),
(13, 1, '0101010101', 'a', 'a', '2020-04-28 02:15:39', '2020-04-28 02:15:39'),
(14, 1, '0101010101', 'b', 'a', '2020-04-28 02:25:32', '2020-04-28 02:25:32'),
(15, 1, '0101010101', 'aa', 'l', '2020-04-28 02:43:31', '2020-04-28 02:43:31'),
(16, 1, '0101010101', '2/7 aa', 'a', '2020-04-28 02:45:34', '2020-04-28 02:45:34'),
(17, 1, '0101010101', 'b', 's', '2020-04-28 02:46:49', '2020-04-28 02:46:49'),
(18, 3, '0101010101', 'nguyễn văn lượng', '2', '2020-04-29 03:34:04', '2020-04-29 03:34:04'),
(19, 3, '0101010101', 'nguyễn văn lượng', '1', '2020-04-29 03:49:30', '2020-04-29 03:49:30'),
(20, 1, '0101010101', 'nguyễn văn lượng', '3', '2020-04-29 04:05:22', '2020-04-29 04:05:22'),
(21, 1, '0101010101', 'nguyễn văn lượng', 'a', '2020-04-29 04:09:56', '2020-04-29 04:09:56'),
(22, 1, '0101010101', 'aa', 'd', '2020-04-29 04:12:22', '2020-04-29 04:12:22'),
(23, 1, '0101010101', 'aa', 'a', '2020-04-29 04:32:11', '2020-04-29 04:32:11'),
(24, 1, '0101010101', 'nguyễn văn lượng', 'a', '2020-04-29 05:47:14', '2020-04-29 05:47:14'),
(25, 1, '0101010101', 'nguyễn văn lượng', 'a', '2020-04-29 05:51:01', '2020-04-29 05:51:01'),
(26, 1, '0101010101', 'aa', 'a', '2020-04-29 06:01:27', '2020-04-29 06:01:27'),
(27, 1, '0101010101', 'a', 'a', '2020-04-29 06:04:30', '2020-04-29 06:04:30'),
(28, 1, '0101010101', 'aa', 'a', '2020-04-29 08:15:07', '2020-04-29 08:15:07'),
(29, 1, '0101010101', 'nguyễn văn lượng', '5', '2020-04-29 08:20:30', '2020-04-29 08:20:30'),
(30, 1, '0101010101', 'nguyễn văn lượng', 'a', '2020-04-29 08:30:54', '2020-04-29 08:30:54'),
(31, 1, '0101010101', '2/7 aa', '5', '2020-04-29 08:50:32', '2020-04-29 08:50:32'),
(32, 1, '0101010101', 'aa', 'a', '2020-04-29 08:56:10', '2020-04-29 08:56:10'),
(33, 1, '0101010101', '6', 's', '2020-04-29 09:58:40', '2020-04-29 09:58:40'),
(34, 1, '0101010101', '4', '4', '2020-04-29 09:59:32', '2020-04-29 09:59:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_chosen`
--

CREATE TABLE `tbl_chosen` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customers_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_chosen`
--

INSERT INTO `tbl_chosen` (`id`, `product_id`, `customers_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2020-04-18 05:26:40', '2020-04-18 06:01:50'),
(2, 1, 1, 1, '2020-04-18 05:28:29', '2020-04-18 05:28:29'),
(3, 2, 3, 1, '2020-04-18 07:53:36', '2020-04-18 07:53:36'),
(4, 1, 3, 1, '2020-04-18 07:53:40', '2020-04-18 07:53:40'),
(5, 2, 4, 1, '2020-04-19 04:33:58', '2020-04-19 05:37:22'),
(6, 1, 4, 1, '2020-04-19 04:34:01', '2020-04-19 04:34:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_color`
--

CREATE TABLE `tbl_color` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_color`
--

INSERT INTO `tbl_color` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Đỏ', 'do', 1, '2020-04-17 00:57:03', '2020-04-17 00:57:03'),
(2, 'Xanh', 'xanh', 1, '2020-04-17 00:57:17', '2020-04-17 00:57:17'),
(3, 'Tím', 'tim', 1, '2020-04-17 00:57:20', '2020-04-17 00:57:20'),
(4, 'Vàng', 'vang', 1, '2020-04-20 02:10:59', '2020-04-20 02:10:59'),
(5, 'Cam', 'cam', 1, '2020-04-20 02:13:43', '2020-04-20 02:30:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_color_details`
--

CREATE TABLE `tbl_color_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `color_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_color_details`
--

INSERT INTO `tbl_color_details` (`id`, `product_id`, `color_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, '2020-04-17 01:00:20', '2020-04-17 01:00:20'),
(2, 2, 2, 1, '2020-04-17 01:00:24', '2020-04-17 01:00:24'),
(3, 2, 1, 1, '2020-04-17 01:00:27', '2020-04-17 01:00:27'),
(4, 2, 3, 1, '2020-04-17 01:07:18', '2020-04-17 01:07:18'),
(5, 1, 1, 1, '2020-04-17 01:07:18', '2020-04-17 01:07:53'),
(6, 1, 2, 1, '2020-04-17 01:08:08', '2020-04-20 03:28:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customers_id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `product_id`, `customers_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'good', '2020-04-19 08:15:16', '2020-04-19 08:15:16'),
(2, 2, 1, 'good', '2020-04-19 08:15:44', '2020-04-19 08:15:44'),
(3, 2, 1, 'good', '2020-04-19 08:16:56', '2020-04-19 08:16:56'),
(4, 2, 1, 'ok', '2020-04-19 08:17:20', '2020-04-19 08:17:20'),
(5, 2, 1, 'ổn', '2020-04-19 08:26:12', '2020-04-19 08:26:12'),
(6, 2, 1, 'ổn', '2020-04-19 08:26:12', '2020-04-19 08:26:12'),
(7, 2, 3, 'cũng tạm', '2020-04-19 08:33:08', '2020-04-19 08:33:08'),
(8, 2, 3, 'cũng tạm', '2020-04-19 08:33:08', '2020-04-19 08:33:08'),
(9, 1, 3, 'đẹp đấy', '2020-04-19 08:35:23', '2020-04-19 08:35:23'),
(10, 1, 3, 'đẹp đấy', '2020-04-19 08:35:24', '2020-04-19 08:35:24'),
(11, 2, 4, 'nice', '2020-04-19 08:50:40', '2020-04-19 08:50:40'),
(12, 2, 4, 'bỏ ra bạn êi', '2020-04-19 09:12:33', '2020-04-19 09:12:33'),
(13, 2, 4, 'a', '2020-04-19 09:13:16', '2020-04-19 09:13:16'),
(14, 2, 4, 'a', '2020-04-19 09:16:49', '2020-04-19 09:16:49'),
(15, 2, 4, 'khá', '2020-04-19 09:17:21', '2020-04-19 09:17:21'),
(16, 2, 1, '<srript></srript>', '2020-04-28 02:48:59', '2020-04-28 02:48:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `condition` int(11) NOT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_coupon`
--

INSERT INTO `tbl_coupon` (`id`, `name`, `code`, `time`, `condition`, `number`, `created_at`, `updated_at`) VALUES
(2, 'Mã giảm giá Covide', 'COVID99', '20', 2, '200000', '2020-04-26 03:21:07', '2020-04-29 09:15:19'),
(3, 'Chiến thắng Covid', 'VICTORYCV99', '18', 1, '20', '2020-04-26 03:43:03', '2020-04-29 08:30:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `email`, `password`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'User 1', 'user1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0101010101', '2020-04-17 01:15:51', '2020-04-17 01:15:51'),
(2, 'User 1', 'user1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0101010101', '2020-04-17 01:15:51', '2020-04-17 01:15:51'),
(3, 'user 2', 'user2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0101010101', '2020-04-18 07:53:32', '2020-04-18 07:53:32'),
(4, 'User 3', 'user3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0101010101', '2020-04-19 04:33:52', '2020-04-19 04:33:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkout_id` int(10) UNSIGNED NOT NULL,
  `customers_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `total` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `checkout_id`, `customers_id`, `payment_id`, `total`, `status`, `created_at`, `updated_at`, `coupon_id`) VALUES
(1, 1, 1, 1, '19,000,000.00', 2, '2020-04-18 01:15:18', '2020-04-18 01:17:46', 0),
(2, 2, 1, 2, '19,000,000.00', 2, '2020-04-18 01:18:49', '2020-04-18 01:35:17', 0),
(3, 3, 1, 3, '19,000,000.00', 2, '2020-04-18 01:42:24', '2020-04-18 01:46:46', 0),
(4, 4, 1, 4, '19,000,000.00', 2, '2020-04-18 01:54:57', '2020-04-18 01:56:09', 0),
(5, 5, 1, 5, '57,000,000.00', 2, '2020-04-18 03:36:57', '2020-04-19 08:38:24', 0),
(6, 6, 1, 6, '79,000,000.00', 3, '2020-04-26 01:01:56', '2020-04-26 02:12:53', 0),
(7, 13, 1, 7, '98,000,000.00', 3, '2020-04-28 02:15:44', '2020-04-28 02:18:21', 0),
(8, 14, 1, 8, '45,600,000', 3, '2020-04-28 02:41:01', '2020-04-29 03:20:50', 0),
(9, 17, 1, 9, '19,800,000', 3, '2020-04-28 02:47:07', '2020-04-29 03:20:49', 0),
(10, 18, 3, 10, '15,200,000', 3, '2020-04-29 03:34:10', '2020-04-29 03:48:44', 3),
(11, 19, 3, 11, '15,200,000', 3, '2020-04-29 03:54:56', '2020-04-29 04:04:05', 3),
(12, 20, 1, 12, '135,800,000', 3, '2020-04-29 04:05:43', '2020-04-29 04:07:41', 2),
(13, 21, 1, 13, '15,200,000', 3, '2020-04-29 04:11:15', '2020-04-29 04:11:45', 3),
(14, 22, 1, 14, '19,800,000', 3, '2020-04-29 04:12:37', '2020-04-29 04:27:27', 2),
(15, 23, 1, 15, '76,000,000', 2, '2020-04-29 04:32:16', '2020-04-29 04:34:29', 3),
(16, 26, 1, 16, '94,800,000', 3, '2020-04-29 06:01:40', '2020-04-29 09:15:19', 2),
(17, 27, 1, 17, '57,000,000.00', 2, '2020-04-29 06:04:42', '2020-04-29 06:18:54', 0),
(18, 30, 1, 18, '15,200,000', 3, '2020-04-29 08:30:57', '2020-04-29 09:55:12', 3),
(19, 31, 1, 19, '38,000,000.00', 2, '2020-04-29 08:50:36', '2020-04-29 09:51:44', 0),
(20, 32, 1, 20, '115,000,000.00', 3, '2020-04-29 08:56:15', '2020-04-29 09:16:01', 0),
(21, 33, 1, 21, '19,000,000.00', 3, '2020-04-29 09:58:43', '2020-04-29 09:59:08', 0),
(22, 34, 1, 22, '19,000,000.00', 3, '2020-04-29 09:59:35', '2020-04-29 10:00:04', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `size_details_id` int(10) UNSIGNED NOT NULL,
  `size_color_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_sale_quantity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`id`, `order_id`, `product_id`, `size_details_id`, `size_color_id`, `product_name`, `product_price`, `product_sale_quantity`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-18 01:15:18', '2020-04-18 01:17:30', 2),
(2, 2, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-18 01:18:49', '2020-04-18 01:35:02', 2),
(3, 3, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-18 01:42:24', '2020-04-18 01:46:26', 2),
(4, 4, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-18 01:54:57', '2020-04-18 01:55:43', 2),
(5, 5, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '3', '2020-04-18 03:36:57', '2020-04-19 08:38:17', 2),
(6, 6, 1, 4, 1, 'Giày Búp Bê GBB 0398', '20000000', '3', '2020-04-26 01:01:56', '2020-04-26 02:12:53', 3),
(7, 6, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-26 01:01:56', '2020-04-26 02:12:53', 3),
(8, 7, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '2', '2020-04-28 02:15:44', '2020-04-28 02:18:21', 3),
(9, 7, 1, 4, 1, 'Giày Búp Bê GBB 0398', '20000000', '3', '2020-04-28 02:15:44', '2020-04-28 02:18:21', 3),
(10, 8, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '3', '2020-04-28 02:41:01', '2020-04-29 03:20:51', 3),
(11, 9, 1, 4, 1, 'Giày Búp Bê GBB 0398', '20000000', '1', '2020-04-28 02:47:07', '2020-04-29 03:20:49', 3),
(12, 10, 2, 2, 3, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-29 03:34:10', '2020-04-29 03:48:44', 3),
(13, 11, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-29 03:54:56', '2020-04-29 04:04:05', 3),
(14, 12, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '4', '2020-04-29 04:05:43', '2020-04-29 04:07:41', 3),
(15, 12, 1, 4, 1, 'Giày Búp Bê GBB 0398', '20000000', '3', '2020-04-29 04:05:43', '2020-04-29 04:07:41', 3),
(16, 13, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-29 04:11:16', '2020-04-29 04:11:46', 3),
(17, 14, 1, 4, 1, 'Giày Búp Bê GBB 0398', '20000000', '1', '2020-04-29 04:12:37', '2020-04-29 04:27:27', 3),
(18, 15, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '5', '2020-04-29 04:32:16', '2020-04-29 04:34:02', 2),
(19, 16, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '5', '2020-04-29 06:01:40', '2020-04-29 09:15:19', 3),
(20, 17, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '3', '2020-04-29 06:04:42', '2020-04-29 06:18:49', 2),
(21, 18, 2, 1, 4, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-29 08:30:58', '2020-04-29 09:55:13', 3),
(22, 19, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '2', '2020-04-29 08:50:36', '2020-04-29 09:50:41', 2),
(23, 20, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '5', '2020-04-29 08:56:15', '2020-04-29 09:16:01', 3),
(24, 20, 1, 4, 6, 'Giày Búp Bê GBB 0398', '20000000', '1', '2020-04-29 08:56:15', '2020-04-29 09:16:01', 3),
(25, 21, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-29 09:58:43', '2020-04-29 09:59:08', 3),
(26, 22, 2, 1, 2, 'Túi Xách Nắp Gập - SAT 0213', '19000000', '1', '2020-04-29 09:59:35', '2020-04-29 10:00:04', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`id`, `method`, `status`, `created_at`, `updated_at`) VALUES
(1, '2', 0, '2020-04-18 01:15:18', '2020-04-18 01:15:18'),
(2, '2', 0, '2020-04-18 01:18:49', '2020-04-18 01:18:49'),
(3, '2', 0, '2020-04-18 01:42:24', '2020-04-18 01:42:24'),
(4, '2', 0, '2020-04-18 01:54:57', '2020-04-18 01:54:57'),
(5, '2', 0, '2020-04-18 03:36:57', '2020-04-18 03:36:57'),
(6, '2', 2, '2020-04-26 01:01:56', '2020-04-26 02:12:53'),
(7, '2', 2, '2020-04-28 02:15:44', '2020-04-28 02:18:21'),
(8, '2', 2, '2020-04-28 02:41:01', '2020-04-29 03:20:51'),
(9, '2', 2, '2020-04-28 02:47:07', '2020-04-29 03:20:49'),
(10, '2', 2, '2020-04-29 03:34:10', '2020-04-29 03:48:44'),
(11, '2', 2, '2020-04-29 03:54:56', '2020-04-29 04:04:05'),
(12, '2', 2, '2020-04-29 04:05:43', '2020-04-29 04:07:41'),
(13, '2', 2, '2020-04-29 04:11:15', '2020-04-29 04:11:46'),
(14, '2', 2, '2020-04-29 04:12:37', '2020-04-29 04:27:27'),
(15, '2', 0, '2020-04-29 04:32:16', '2020-04-29 04:32:16'),
(16, '2', 0, '2020-04-29 06:01:40', '2020-04-29 06:01:40'),
(17, '2', 0, '2020-04-29 06:04:42', '2020-04-29 06:04:42'),
(18, '2', 2, '2020-04-29 08:30:57', '2020-04-29 09:19:59'),
(19, '2', 0, '2020-04-29 08:50:36', '2020-04-29 08:50:36'),
(20, '2', 0, '2020-04-29 08:56:15', '2020-04-29 08:56:15'),
(21, '2', 2, '2020-04-29 09:58:43', '2020-04-29 09:59:08'),
(22, '2', 2, '2020-04-29 09:59:35', '2020-04-29 10:00:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sale_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `slug`, `category_id`, `brand_id`, `description`, `content`, `unit_price`, `sale_price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giày Búp Bê GBB 0398', 'giay-bup-be-gbb-0398', 1, 1, 'Giày Búp Bê GBB 0398', 'Giày Búp Bê GBB 0398', '20000000', '0', '35020_1520563018.jpg', 1, '2020-04-17 00:56:33', '2020-04-17 02:06:11'),
(2, 'Túi Xách Nắp Gập - SAT 0213', 'tui-xach-nap-gap-sat-0213', 3, 1, 'Túi Xách Nắp Gập - SAT 0213', 'Túi Xách Nắp Gập - SAT 0213', '20000000', '19000000', '42750_1543565323.jpg', 1, '2020-04-17 00:56:50', '2020-04-17 00:56:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_size`
--

CREATE TABLE `tbl_size` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_size`
--

INSERT INTO `tbl_size` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kiểu chữ', 'kieu-chu', 1, '2020-04-17 00:57:28', '2020-04-17 00:57:28'),
(2, 'Kiểu số', 'kieu-so', 1, '2020-04-17 00:57:31', '2020-04-17 00:57:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_size_details`
--

CREATE TABLE `tbl_size_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `size_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_size_details`
--

INSERT INTO `tbl_size_details` (`id`, `product_id`, `size_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'S', 's', 1, '2020-04-17 01:09:11', '2020-04-17 01:09:11'),
(2, 2, 1, 'M', 'm', 1, '2020-04-17 01:09:16', '2020-04-17 01:09:16'),
(3, 2, 1, 'L', 'l', 1, '2020-04-17 01:09:22', '2020-04-17 01:09:22'),
(4, 1, 2, '37', '37', 1, '2020-04-17 01:09:45', '2020-04-17 01:09:45'),
(5, 1, 2, '38', '38', 1, '2020-04-17 01:09:52', '2020-04-17 01:09:52'),
(6, 1, 2, '39', '39', 1, '2020-04-17 01:09:58', '2020-04-17 01:09:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_total_product_details`
--

CREATE TABLE `tbl_total_product_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `size_details_id` int(10) UNSIGNED NOT NULL,
  `color_details_id` int(10) UNSIGNED NOT NULL,
  `total` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `old` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `new` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sold` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_total_product_details`
--

INSERT INTO `tbl_total_product_details` (`id`, `product_id`, `size_details_id`, `color_details_id`, `total`, `old`, `new`, `created_at`, `updated_at`, `sold`) VALUES
(1, 2, 1, 2, '2', '0', '2', '2020-04-17 04:01:25', '2020-04-29 09:50:41', '2'),
(2, 2, 2, 2, '26', '0', '50', '2020-04-17 04:43:54', '2020-04-18 00:23:41', '24'),
(3, 2, 3, 2, '50', '0', '50', '2020-04-17 07:53:11', '2020-04-17 07:53:11', '0'),
(4, 1, 4, 5, '22', '0', '50', '2020-04-17 07:59:24', '2020-04-17 14:46:26', '28'),
(5, 1, 4, 6, '32', '0', '50', '2020-04-17 08:00:27', '2020-04-18 00:23:41', '18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `level`) VALUES
(1, 'Quách Việt Cường', 'cuong@gmail.com', NULL, '$2y$10$96Hh7Px31oHasxhjJjY4E.FADfi4tSjvq8RbcvbxpMnNP9vV6vHMa', NULL, NULL, NULL, 3),
(2, 'Clone 1', 'clone1@gmail.com', NULL, '$2y$10$U3V5nuTYkMaKV6kddHKeheBBCsKou8LKwP9icJ2/93Wi8GAbni.OO', NULL, NULL, NULL, 2),
(3, 'Clone 2', 'clone2@gmail.com', NULL, '$2y$10$zS8eNjqtWP3cxuULWShSou1sGCLZ3pwPi0EdbxHDZsmMtPyZaItW.', NULL, NULL, NULL, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_checkout`
--
ALTER TABLE `tbl_checkout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_checkout_customers_id_foreign` (`customers_id`);

--
-- Chỉ mục cho bảng `tbl_chosen`
--
ALTER TABLE `tbl_chosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_chosen_product_id_foreign` (`product_id`),
  ADD KEY `tbl_chosen_customers_id_foreign` (`customers_id`);

--
-- Chỉ mục cho bảng `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_color_details`
--
ALTER TABLE `tbl_color_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_color_details_product_id_foreign` (`product_id`),
  ADD KEY `tbl_color_details_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_comment_product_id_foreign` (`product_id`),
  ADD KEY `tbl_comment_customers_id_foreign` (`customers_id`);

--
-- Chỉ mục cho bảng `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_order_checkout_id_foreign` (`checkout_id`),
  ADD KEY `tbl_order_customers_id_foreign` (`customers_id`),
  ADD KEY `tbl_order_payment_id_foreign` (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_order_details_order_id_foreign` (`order_id`),
  ADD KEY `tbl_order_details_product_id_foreign` (`product_id`),
  ADD KEY `tbl_order_details_size_details_id_foreign` (`size_details_id`),
  ADD KEY `tbl_order_details_size_color_id_foreign` (`size_color_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_product_category_id_foreign` (`category_id`),
  ADD KEY `tbl_product_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_size`
--
ALTER TABLE `tbl_size`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_size_details`
--
ALTER TABLE `tbl_size_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_size_details_product_id_foreign` (`product_id`),
  ADD KEY `tbl_size_details_size_id_foreign` (`size_id`);

--
-- Chỉ mục cho bảng `tbl_total_product_details`
--
ALTER TABLE `tbl_total_product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_total_product_details_product_id_foreign` (`product_id`),
  ADD KEY `tbl_total_product_details_size_details_id_foreign` (`size_details_id`),
  ADD KEY `tbl_total_product_details_color_details_id_foreign` (`color_details_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_checkout`
--
ALTER TABLE `tbl_checkout`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `tbl_chosen`
--
ALTER TABLE `tbl_chosen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_color_details`
--
ALTER TABLE `tbl_color_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_size`
--
ALTER TABLE `tbl_size`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_size_details`
--
ALTER TABLE `tbl_size_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_total_product_details`
--
ALTER TABLE `tbl_total_product_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_checkout`
--
ALTER TABLE `tbl_checkout`
  ADD CONSTRAINT `tbl_checkout_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `tbl_customers` (`id`);

--
-- Các ràng buộc cho bảng `tbl_chosen`
--
ALTER TABLE `tbl_chosen`
  ADD CONSTRAINT `tbl_chosen_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `tbl_customers` (`id`),
  ADD CONSTRAINT `tbl_chosen_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`);

--
-- Các ràng buộc cho bảng `tbl_color_details`
--
ALTER TABLE `tbl_color_details`
  ADD CONSTRAINT `tbl_color_details_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `tbl_color` (`id`),
  ADD CONSTRAINT `tbl_color_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`);

--
-- Các ràng buộc cho bảng `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `tbl_comment_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `tbl_customers` (`id`),
  ADD CONSTRAINT `tbl_comment_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`);

--
-- Các ràng buộc cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_checkout_id_foreign` FOREIGN KEY (`checkout_id`) REFERENCES `tbl_checkout` (`id`),
  ADD CONSTRAINT `tbl_order_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `tbl_customers` (`id`),
  ADD CONSTRAINT `tbl_order_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `tbl_payment` (`id`);

--
-- Các ràng buộc cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `tbl_order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`),
  ADD CONSTRAINT `tbl_order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`),
  ADD CONSTRAINT `tbl_order_details_size_color_id_foreign` FOREIGN KEY (`size_color_id`) REFERENCES `tbl_color_details` (`id`),
  ADD CONSTRAINT `tbl_order_details_size_details_id_foreign` FOREIGN KEY (`size_details_id`) REFERENCES `tbl_size_details` (`id`);

--
-- Các ràng buộc cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand` (`id`),
  ADD CONSTRAINT `tbl_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `tbl_category_product` (`id`);

--
-- Các ràng buộc cho bảng `tbl_size_details`
--
ALTER TABLE `tbl_size_details`
  ADD CONSTRAINT `tbl_size_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`),
  ADD CONSTRAINT `tbl_size_details_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `tbl_size` (`id`);

--
-- Các ràng buộc cho bảng `tbl_total_product_details`
--
ALTER TABLE `tbl_total_product_details`
  ADD CONSTRAINT `tbl_total_product_details_color_details_id_foreign` FOREIGN KEY (`color_details_id`) REFERENCES `tbl_color_details` (`id`),
  ADD CONSTRAINT `tbl_total_product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`),
  ADD CONSTRAINT `tbl_total_product_details_size_details_id_foreign` FOREIGN KEY (`size_details_id`) REFERENCES `tbl_size_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
