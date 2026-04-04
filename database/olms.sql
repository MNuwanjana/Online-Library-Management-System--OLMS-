-- =====================================================================================
-- DATABASE SETUP & SAFETY CLEAR
-- =====================================================================================

DROP DATABASE IF EXISTS `olms`;
CREATE DATABASE `olms`;
USE `olms`;

-- --------------------------------------------------------
-- OLMS Master Database Structure
-- --------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;

-- 1. Create the `users` table
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE,
  `email` varchar(100) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') DEFAULT 'member',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inject a default Admin user so the admin team can log in.
-- Note: The password hash below is for the word: password123
INSERT INTO `users` (`username`, `email`, `password`, `role`) VALUES
('admin', 'admin@library.com', '$2y$10$ctE9miG4sQ/V4g.YGL23xubgk5qzPs7LVGmw74IMSIPL4T/gcp586', 'admin');

-- ALL users below now have the password: password123
-- ID mapping: 2=Minu, 3=Thiseni, 4=Amaya, 5=Rakesh, 6=Shehara, 7=Test
INSERT INTO users (username, email, password, role) VALUES
('Minu', 'minu@olms.com', '$2y$10$ctE9miG4sQ/V4g.YGL23xubgk5qzPs7LVGmw74IMSIPL4T/gcp586', 'member'),
('Thiseni', 'thiseni@olms.com', '$2y$10$ctE9miG4sQ/V4g.YGL23xubgk5qzPs7LVGmw74IMSIPL4T/gcp586', 'member'),
('Amaya', 'amaya@olms.com', '$2y$10$ctE9miG4sQ/V4g.YGL23xubgk5qzPs7LVGmw74IMSIPL4T/gcp586', 'member'),
('Rakesh', 'rakesh@olms.com', '$2y$10$ctE9miG4sQ/V4g.YGL23xubgk5qzPs7LVGmw74IMSIPL4T/gcp586', 'member'),
('Shehara', 'shehara@olms.com', '$2y$10$ctE9miG4sQ/V4g.YGL23xubgk5qzPs7LVGmw74IMSIPL4T/gcp586', 'member'),
('Test', 'test@olms.com', '$2y$10$ctE9miG4sQ/V4g.YGL23xubgk5qzPs7LVGmw74IMSIPL4T/gcp586', 'member');


-- 2. Create the `books` table
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT 'default-cover.jpg',
  `total_qty` int(11) NOT NULL DEFAULT 0,
  `available_qty` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Math perfectly calculated based on 'active' borrows below.
INSERT INTO books (title, author, category, cover_image, total_qty, available_qty) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'To Kill a Mockingbird.jpg', 5, 3), -- (2 active: Thiseni & Test)
('1984', 'George Orwell', 'Dystopian Fiction', '1984.jpg', 4, 3),                     -- (1 active: Rakesh)
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Fiction', 'The Great Gatsby.jpg', 4, 4), -- (0 active)
('A Brief History of Time', 'Stephen Hawking', 'Science', 'A Brief History of Time.jpg', 3, 2), -- (1 active: Test)
('The Diary of a Young Girl', 'Anne Frank', 'Biography', 'The Diary of a Young Girl.jpg', 3, 2); -- (1 active: Test)


-- 3. Create the `transactions` table (For borrows and returns)
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `due_date` datetime DEFAULT NULL,
  `returned_date` datetime DEFAULT NULL,
  `status` enum('active','returned') DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dummy Data for Transactions (Testing history and active reads)
INSERT INTO transactions (user_id, book_id, borrow_date, due_date, returned_date, status) VALUES
-- User 7 (Test) History - 4 Books Read
(7, 1, '2026-03-01 10:00:00', '2026-03-15 10:00:00', '2026-03-12 14:30:00', 'returned'),
(7, 2, '2026-03-10 11:15:00', '2026-03-24 11:15:00', '2026-03-20 09:45:00', 'returned'),
(7, 5, '2026-03-18 09:20:00', '2026-04-01 09:20:00', '2026-03-30 16:10:00', 'returned'),
(7, 3, '2025-12-05 14:00:00', '2025-12-19 14:00:00', '2025-12-18 10:00:00', 'returned'),

-- User 7 (Test) Active Reads - 3 Books Borrowed
(7, 4, '2026-04-01 09:00:00', '2026-04-15 09:00:00', NULL, 'active'),
(7, 5, '2026-04-03 14:20:00', '2026-04-17 14:20:00', NULL, 'active'),
(7, 1, '2026-04-04 08:30:00', '2026-04-18 08:30:00', NULL, 'active'),

-- Other Community Members Active Reads
(3, 1, '2026-03-28 16:00:00', '2026-04-11 16:00:00', NULL, 'active'), -- Thiseni
(5, 2, '2026-04-02 13:00:00', '2026-04-16 13:00:00', NULL, 'active'), -- Rakesh

-- Other Community Members History
(4, 5, '2026-02-10 08:30:00', '2026-02-24 08:30:00', '2026-02-22 11:00:00', 'returned'); -- Amaya


-- 4. Create the `reviews` table
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT 5,
  `comment` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dummy Data for Reviews
INSERT INTO reviews (book_id, user_id, rating, comment, created_at) VALUES
-- Test User (ID 7) Reviews - 5 total
(1, 7, 5, 'An absolute masterpiece. The themes of justice and innocence are handled beautifully. Highly recommend!', '2026-03-13 09:00:00'),
(2, 7, 4, 'Really thought-provoking and slightly terrifying. It makes you look at society differently.', '2026-03-21 10:30:00'),
(5, 7, 5, 'A sobering reminder of history. Read it in one sitting.', '2026-03-31 09:12:00'),
(3, 7, 5, 'The imagery of the roaring twenties is perfectly woven together. A tragic but beautiful romance.', '2025-12-19 08:15:00'),
(4, 7, 4, 'Fascinating concepts, though a bit heavy on the physics. Still a great read!', '2026-04-02 09:30:00'),

-- Community Reviews
(5, 4, 5, 'Such a powerful and emotional read. It is heartbreaking but essential for everyone.', '2026-02-23 15:45:00'), -- Amaya
(1, 5, 4, 'Great classic. The pacing is a little slow at times, but the payoff is worth it.', '2026-03-15 11:20:00'), -- Rakesh
(2, 2, 5, 'I read this every few years and it never stops being relevant.', '2026-01-10 12:00:00'); -- Minu

COMMIT;