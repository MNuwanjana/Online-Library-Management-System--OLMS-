-- =====================================================================================
-- TEAM INSTRUCTIONS: 
-- Write your INSERT INTO `users` sql queries below this line.
-- Do NOT write any CREATE TABLE commands here.
-- =====================================================================================

-- 01_users_seed.sql
-- ONLY this file is used. Do NOT change olms.sql

TRUNCATE TABLE users;

INSERT INTO users (username, email, password, role) VALUES
('Admin User', 'admin@olms.com', '$2y$10$wH8QxYyQJx8l7GzK6q5zKe6z0w8Qwz3v9l8Jp7kGqZ6m9YFQZr1Hy', 'admin'),
('Test Student 1', 'student1@olms.com', '$2y$10$wH8QxYyQJx8l7GzK6q5zKe6z0w8Qwz3v9l8Jp7kGqZ6m9YFQZr1Hy', 'member'),
('Test Student 2', 'student2@olms.com', '$2y$10$wH8QxYyQJx8l7GzK6q5zKe6z0w8Qwz3v9l8Jp7kGqZ6m9YFQZr1Hy', 'member'),
('Test Student 3', 'student3@olms.com', '$2y$10$wH8QxYyQJx8l7GzK6q5zKe6z0w8Qwz3v9l8Jp7kGqZ6m9YFQZr1Hy', 'member');