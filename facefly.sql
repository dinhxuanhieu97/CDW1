-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 01, 2019 lúc 04:14 CH
-- Phiên bản máy phục vụ: 5.7.14
-- Phiên bản PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `facefly`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airways`
--

CREATE TABLE `airways` (
  `id` int(11) NOT NULL,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airways`
--

INSERT INTO `airways` (`id`, `airways_name`) VALUES
(1, 'Quatar Airlines'),
(2, 'Vietnam Airlines'),
(3, 'JetStar');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` int(11) NOT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ccv_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flights_booking`
--

CREATE TABLE `flights_booking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flist_id` int(11) NOT NULL,
  `fclass_id` int(11) NOT NULL,
  `flight_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_per` int(11) NOT NULL,
  `ticket_buy` datetime NOT NULL,
  `total_price` double NOT NULL,
  `card_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_class`
--

CREATE TABLE `flight_class` (
  `id` int(11) NOT NULL,
  `fclass_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_class`
--

INSERT INTO `flight_class` (`id`, `fclass_name`) VALUES
(1, 'Economy'),
(2, 'Business'),
(3, 'Premium Economy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_list`
--

CREATE TABLE `flight_list` (
  `id` int(11) NOT NULL,
  `airways_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `place_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `airport_from` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `time_from` time NOT NULL,
  `place_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `airport_to` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `time_to` time NOT NULL,
  `duration` text COLLATE utf8_unicode_ci NOT NULL,
  `transit` int(11) NOT NULL,
  `total_sit` int(11) NOT NULL,
  `code` varchar(55) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_list`
--

INSERT INTO `flight_list` (`id`, `airways_id`, `city_id`, `place_from`, `airport_from`, `time_from`, `place_to`, `airport_to`, `time_to`, `duration`, `transit`, `total_sit`, `code`) VALUES
(1, 1, 1, 'TP Hồ Chí Minh (SNG)', 'Tan Son Nhat Airport', '18:45:00', 'Hà Nội (HAN)\r\n', 'Ha Noi Airport', '02:55:00', '11h 10m', 1, 1200000, 'VN 23434'),
(2, 2, 2, 'Hà Nội (HAN)', 'Ha Noi Airport', '22:50:00', 'Đà Nẵng (DN)', 'Da Nang Airport', '10:50:00', '36h 00m', 2, 1300000, 'VN 23235'),
(3, 3, 3, 'Đà Nẵng (DN)', 'Da Nang Airport', '05:11:00', 'Cần Thơ (CTN)', 'Can Tho Airport', '14:00:00', '9h 00m', 2, 1600000, 'VN 65453'),
(4, 2, 4, 'Huế (HN)', 'Hue Airport', '13:17:12', 'Tp. Hồ Chí Minh', 'Tan Son Nhat Airport', '06:25:10', '7h 00m', 1, 1800000, 'VN 43353');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_cities`
--

CREATE TABLE `list_cities` (
  `id` int(11) NOT NULL,
  `cityname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_cities`
--

INSERT INTO `list_cities` (`id`, `cityname`, `shortname`) VALUES
(1, 'Hồ Chí Minh', 'SGN'),
(2, 'Hà Nội', 'HAN'),
(3, 'Đà Nẵng', 'DN'),
(4, 'Huế', 'HU'),
(5, 'Bussan', 'KOREA'),
(6, 'ToKio', 'JPN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(13) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL,
  `attempt` int(11) NOT NULL,
  `last_access` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `phone`, `remember_token`, `created_at`, `updated_at`, `active`, `attempt`, `last_access`) VALUES
(15, 'dxhieu97@gmail.com', 'Xuân Hiếu', 'hieuit97', 999999, NULL, '2019-03-09 01:40:39', '2019-03-09 01:40:39', 0, 0, '0000-00-00 00:00:00'),
(16, 'hieubds97@gmail.com', 'Đinh Xuân Hiếu', '$2y$10$.Ao5BTgmMssh.5RXF3xkLOQzeh3jblUPE/U.c.GXY22nFkdqkNuoy', 345995727, '65THgQjWfdqclq9MGNr9DPAwzra7LmYjZMdeBl54yPTbdEKi1kuFivhlsEEv', '2019-04-01 15:18:19', '2019-04-01 15:18:19', 0, 0, '0000-00-00 00:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `airways`
--
ALTER TABLE `airways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `airways_id` (`id`),
  ADD KEY `airways_id_2` (`id`);

--
-- Chỉ mục cho bảng `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `flights_booking`
--
ALTER TABLE `flights_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flist_id`),
  ADD KEY `flights_booking_ibfk_1` (`user_id`),
  ADD KEY `card_id` (`card_id`),
  ADD KEY `fclass_id` (`fclass_id`);

--
-- Chỉ mục cho bảng `flight_class`
--
ALTER TABLE `flight_class`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `flight_list`
--
ALTER TABLE `flight_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airways_id` (`airways_id`);

--
-- Chỉ mục cho bảng `list_cities`
--
ALTER TABLE `list_cities`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `airways`
--
ALTER TABLE `airways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `flights_booking`
--
ALTER TABLE `flights_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `flight_class`
--
ALTER TABLE `flight_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `flight_list`
--
ALTER TABLE `flight_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `list_cities`
--
ALTER TABLE `list_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `flights_booking`
--
ALTER TABLE `flights_booking`
  ADD CONSTRAINT `flights_booking_ibfk_1` FOREIGN KEY (`flist_id`) REFERENCES `flight_list` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_3` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_4` FOREIGN KEY (`fclass_id`) REFERENCES `flight_class` (`id`);

--
-- Các ràng buộc cho bảng `flight_list`
--
ALTER TABLE `flight_list`
  ADD CONSTRAINT `flight_list_ibfk_1` FOREIGN KEY (`airways_id`) REFERENCES `airways` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
