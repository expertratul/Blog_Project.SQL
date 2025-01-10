-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 05:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `author_name`, `created_at`, `updated_at`) VALUES
(1, 'Jane Doe', '2025-01-10 15:40:49', '2025-01-10 15:40:49'),
(2, 'Jane Smith', '2025-01-10 15:40:49', '2025-01-10 15:40:49'),
(3, 'Alice Johnson', '2025-01-10 15:40:49', '2025-01-10 15:40:49'),
(4, 'Robert Brown', '2025-01-10 15:40:49', '2025-01-10 15:40:49'),
(5, 'Emily Davis', '2025-01-10 15:40:49', '2025-01-10 15:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `body` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `body`, `category_id`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'The Future of AI', 'Content about artificial intelligence...', 1, 1, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(2, 'Top 10 Healthy Habits', 'Content about staying healthy...', 2, 2, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(3, 'Minimalist Living Tips', 'Content about minimalism...', 3, 3, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(4, 'Backpacking in Europe', 'Content about budget travel...', 4, 4, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(5, 'Online Learning Platforms', 'Content about online education...', 5, 5, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(6, 'Cloud Computing Explained', 'Content about cloud technologies...', 1, 1, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(7, 'Yoga for Beginners', 'Content about starting yoga...', 2, 2, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(8, 'How to Declutter Your Home', 'Content about decluttering...', 3, 3, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(9, 'Top 5 Beaches to Visit', 'Content about travel destinations...', 4, 4, '2025-01-10 15:40:54', '2025-01-10 15:40:54'),
(10, 'Importance of Lifelong Learning', 'Content about continuous education...', 3, 2, '2025-01-10 15:40:54', '2025-01-10 16:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Technology', '2025-01-10 15:40:52', '2025-01-10 15:40:52'),
(2, 'Health & Wellness', '2025-01-10 15:40:52', '2025-01-10 15:40:52'),
(3, 'Lifestyle', '2025-01-10 15:40:52', '2025-01-10 15:40:52'),
(4, 'Travel', '2025-01-10 15:40:52', '2025-01-10 15:40:52'),
(5, 'Education', '2025-01-10 15:40:52', '2025-01-10 15:40:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blogs_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
