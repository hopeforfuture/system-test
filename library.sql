-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2024 at 12:12 PM
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
  `book_description` text NOT NULL,
  `author_name` varchar(50) NOT NULL,
  `is_available` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 Available 0 Not Available',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `book_description`, `author_name`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 'Core Java: The complete Reference', 'And so it was an old Crab took the hookah out of its little eyes, but it had been, it suddenly appeared again. \'By-the-bye, what became of the baby?\' said the Gryphon went on for some way, and then.', 'Mr. Dennis Gulgowski', 1, '2024-07-20 17:57:09', '2024-07-20 23:49:41'),
(2, 'Pure Javascript', 'Prizes!\' Alice had no very clear notion how long ago anything had happened.) So she set off at once, and ran till she got up, and began singing in its hurry to change the subject. \'Go on with the.', 'Barbara O\'Connell', 1, '2024-07-20 17:57:09', '2024-07-21 00:08:37'),
(3, 'Professional PHP5', 'Alice, always ready to play croquet.\' The Frog-Footman repeated, in the wood, \'is to grow larger again, and Alice heard the Rabbit coming to look for her, and she dropped it hastily, just in time to.', 'Dr. Nash Herman', 1, '2024-07-20 17:57:09', '2024-07-20 17:57:09'),
(4, 'Core PHP Programming', 'She said the Caterpillar; and it set to work, and very angrily. \'A knot!\' said Alice, a little girl or a serpent?\' \'It matters a good many little girls of her skirt, upsetting all the jurymen are.', 'Ottilie Bailey', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10'),
(5, 'Begining MySQL', 'There seemed to have finished,\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you turned a corner, \'Oh my ears and the other bit. Her chin was pressed hard against.', 'Prof. Darien Pfeffer', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10'),
(6, 'Let Us C', 'Alice replied thoughtfully. \'They have their tails in their mouths--and they\'re all over their slates; \'but it seems to grin, How neatly spread his claws, And welcome little fishes in With gently.', 'Jada Stamm', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10'),
(7, 'Professional Wordpress', 'Tortoise because he taught us,\' said the Gryphon, \'she wants for to know what to beautify is, I suppose?\' \'Yes,\' said Alice, a little bird as soon as the jury eagerly wrote down on one of its little.', 'Lydia Huels', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10'),
(8, 'Professional Joomla', 'Alice, \'it\'ll never do to hold it. As soon as she swam nearer to make ONE respectable person!\' Soon her eye fell on a summer day: The Knave did so, very carefully, nibbling first at one end of the.', 'Van Rowe', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10'),
(9, 'Custom Drupal Development', 'Said his father; \'don\'t give yourself airs! Do you think, at your age, it is I hate cats and dogs.\' It was the only difficulty was, that she was walking hand in her pocket) till she fancied she.', 'Judge Jacobi', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10'),
(10, 'Laravel in 1 Hour', 'All this time the Queen to-day?\' \'I should like to be said. At last the Mouse, who seemed to think to herself, as she went on, looking anxiously about as it was very hot, she kept tossing the baby.', 'Judy Doyle Sr.', 1, '2024-07-20 17:57:10', '2024-07-20 17:57:10');

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
(3, 2, 4, '2024-07-20 23:53:00', '2024-07-21 00:08:37', '2024-07-20 23:53:00', '2024-07-21 00:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Anthony Schoen IV', 'padberg.giovanna@example.com', '2024-07-20 17:45:57', '2024-07-20 17:45:57'),
(2, 'Neal Kassulke', 'lamar.beer@example.com', '2024-07-20 17:45:57', '2024-07-20 17:45:57'),
(3, 'Vernon Hilpert', 'katarina.reichel@example.net', '2024-07-20 17:45:57', '2024-07-20 17:45:57'),
(4, 'Dannie Murphy', 'milford.bradtke@example.com', '2024-07-20 17:45:58', '2024-07-20 17:45:58'),
(5, 'Lora Olson', 'koch.halle@example.org', '2024-07-20 17:45:58', '2024-07-20 17:45:58'),
(6, 'Lilian Jaskolski', 'esperanza.shanahan@example.com', '2024-07-20 17:45:58', '2024-07-20 17:45:58'),
(7, 'Angelina Gaylord', 'lempi01@example.org', '2024-07-20 17:45:58', '2024-07-20 17:45:58'),
(8, 'Muriel White', 'hudson.madilyn@example.net', '2024-07-20 17:45:58', '2024-07-20 17:45:58'),
(9, 'Gust Tromp', 'jevon.emmerich@example.com', '2024-07-20 17:45:58', '2024-07-20 17:45:58'),
(10, 'Samir Bogan', 'marshall74@example.org', '2024-07-20 17:45:58', '2024-07-20 17:45:58');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `borrowings`
--
ALTER TABLE `borrowings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
