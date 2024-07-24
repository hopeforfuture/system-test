-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2024 at 09:43 PM
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
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `author_name` varchar(50) NOT NULL,
  `genre` varchar(25) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `published_date` date DEFAULT NULL,
  `is_available` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 Available 0 Not Available',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `author_name`, `genre`, `isbn`, `published_date`, `is_available`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Core Java: The complete Reference', 'Mr. Dennis Gulgowski', 'Technical', 'isbn_101', '2023-07-01', 1, '2024-07-20 17:57:09', '2024-07-20 23:49:41', NULL),
(2, 'Pure Javascript', 'Barbara O\'Connell', 'Technical', 'isbn_102', '2023-07-01', 1, '2024-07-20 17:57:09', '2024-07-21 00:08:37', NULL),
(3, 'Professional PHP5', 'Dr. Nash Herman', 'Technical', 'isbn_103', '2023-07-01', 1, '2024-07-20 17:57:09', '2024-07-20 17:57:09', NULL),
(4, 'Core PHP Programming', 'Ottilie Bailey', 'Technical', 'isbn_104', '2023-07-01', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10', NULL),
(5, 'Begining MySQL', 'Prof. Darien Pfeffer', 'Technical', 'isbn_105', '2023-07-01', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10', NULL),
(6, 'Let Us C', 'Jada Stamm', 'Technical', 'isbn_106', '2023-07-01', 0, '2024-07-20 17:57:10', '2024-07-25 01:01:24', NULL),
(7, 'Professional Wordpress', 'Lydia Huels', 'Technical', 'isbn_107', '2023-07-01', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10', NULL),
(8, 'Professional Joomla', 'Van Rowe', 'Technical', 'isbn_108', '2023-07-01', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10', NULL),
(9, 'Custom Drupal Development', 'Judge Jacobi', 'Technical', 'isbn_109', '2023-07-01', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10', NULL),
(16, 'Laravel in 1 Hour', 'Casandra Doyle', 'Technical', 'isbn_2481', '2024-07-24', 1, '2024-07-24 11:58:10', '2024-07-25 00:59:50', '2024-07-25 00:59:50'),
(17, 'Only I don\'t take.', 'Tad Green Jr.', 'Technical', 'isbn_9604', '2024-07-24', 1, '2024-07-24 11:58:10', '2024-07-24 11:58:10', NULL),
(18, 'Pray how did you.', 'Ezequiel Homenick', 'Technical', 'isbn_4157', '2024-07-24', 1, '2024-07-24 11:58:11', '2024-07-24 11:58:11', NULL),
(19, 'Alice alone with.', 'Dr. Rosina Kulas', 'Technical', 'isbn_5528', '2024-07-24', 1, '2024-07-24 11:58:11', '2024-07-24 11:58:11', NULL),
(20, 'Queen. \'It proves.', 'Miss Phoebe Kling', 'Literature', 'isbn_8765', '2023-08-09', 1, '2024-07-24 11:58:11', '2024-07-24 20:00:06', NULL),
(21, 'A brief history of time', 'Stephen Hawking', 'Astronomy', 'isbn_1012', '2000-12-31', 1, '2024-07-24 19:08:54', '2024-07-24 19:08:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `borrowings`
--

CREATE TABLE `borrowings` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkout_date` datetime NOT NULL,
  `checkin_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowings`
--

INSERT INTO `borrowings` (`id`, `book_id`, `user_id`, `checkout_date`, `checkin_date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-07-20 23:30:27', '2024-07-20 23:47:26', '2024-07-20 23:30:27', '2024-07-20 23:47:26'),
(2, 1, 2, '2024-07-20 23:48:57', '2024-07-20 23:49:41', '2024-07-20 23:48:57', '2024-07-20 23:49:41'),
(3, 2, 4, '2024-07-20 23:53:00', '2024-07-21 00:08:37', '2024-07-20 23:53:00', '2024-07-21 00:08:37'),
(4, 6, 1, '2024-07-25 01:01:23', NULL, '2024-07-25 01:01:24', '2024-07-25 01:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1 Admin 2 Member',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Manojit Nandi', 'manojit.nandi@aparajitha.com', '$2y$10$jFKpoZ4vAqk9KWegDOpbU.6L5BbQh1g2TTd7rf8zYph/KBwB/rB1C', 1, '2024-07-20 17:45:57', '2024-07-25 00:50:38', NULL),
(2, 'Neal Kassulke', 'lamar.beer@example.com', '', 2, '2024-07-20 17:45:57', '2024-07-25 01:00:51', '2024-07-25 01:00:51'),
(3, 'Vernon Hilpert', 'katarina.reichel@example.net', '', 2, '2024-07-20 17:45:57', '2024-07-20 17:45:57', NULL),
(4, 'Dannie Murphy', 'milford.bradtke@example.com', '', 2, '2024-07-20 17:45:58', '2024-07-20 17:45:58', NULL),
(5, 'Lora Olson', 'koch.halle@example.org', '', 2, '2024-07-20 17:45:58', '2024-07-20 17:45:58', NULL),
(6, 'Lilian Jaskolski', 'esperanza.shanahan@example.com', '', 2, '2024-07-20 17:45:58', '2024-07-20 17:45:58', NULL),
(7, 'Angelina Gaylord', 'lempi01@example.org', '', 2, '2024-07-20 17:45:58', '2024-07-20 17:45:58', NULL),
(8, 'Muriel White', 'hudson.madilyn@example.net', '', 2, '2024-07-20 17:45:58', '2024-07-20 17:45:58', NULL),
(9, 'Gust Tromp', 'jevon.emmerich@example.com', '', 2, '2024-07-20 17:45:58', '2024-07-20 17:45:58', NULL),
(10, 'Samir Bogan', 'marshall74@example.org', '', 2, '2024-07-20 17:45:58', '2024-07-20 17:45:58', NULL),
(11, 'Raj Kumar', 'raj.kumar@example.com', '$2y$10$SDX3FPGOpfzlJLbt.CPTAOnkJVw3Qjr.MqfiNwXVSM1m2FWeJ3z4G', 1, '2024-07-24 23:36:55', '2024-07-24 23:36:55', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `borrowings`
--
ALTER TABLE `borrowings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
