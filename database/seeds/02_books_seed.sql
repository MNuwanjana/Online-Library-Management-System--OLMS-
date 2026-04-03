-- =====================================================================================
-- TEAM INSTRUCTIONS: 
-- Write your INSERT INTO `books` sql queries below this line.
-- Do NOT write any CREATE TABLE commands here.
-- =====================================================================================
-- =====================================================================================
--  SEED FILE: 02_books_seed.sql
--  Inserts 5 famous books into the books table
-- =====================================================================================

INSERT INTO books (title, author, category, cover_image, total_qty, available_qty) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'To Kill a Mockingbird.jpg', 5, 5),
('1984', 'George Orwell', 'Dystopian Fiction', '1984.jpg', 4, 4),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Fiction', 'The Great Gatsby.jpg', 4, 4),
('A Brief History of Time', 'Stephen Hawking', 'Science', 'A Brief History of Time.jpg', 3, 3),
('The Diary of a Young Girl', 'Anne Frank', 'Biography', 'The Diary of a Young Girl.jpg', 3, 3);