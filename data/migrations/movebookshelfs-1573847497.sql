CREATE TABLE BOOKSHELVES
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);
-- Create a new table to contain the bookshelfs

INSERT INTO bookshelves
    (name)
SELECT DISTINCT bookshelf
FROM books;
-- Finds all the unique keys and adds them into the new table

ALTER TABLE books ADD COLUMN bookshelf_id INT;
-- This adds the new column that will house the new ID keys we just made

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT *
    FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
-- Sets the values of the new ID column to be set to the equal to the new keys

ALTER TABLE books DROP COLUMN bookshelf;
-- Remove the old bookshelf column

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
-- This links the two tables and tells SQL that the bookshelf ID is the same as the value in the bookshelf table.s