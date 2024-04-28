USE Bookstore;

-- Delete sales older than 2022
DELETE FROM Sales
WHERE YEAR(SaleDate) < 2022;

-- Delete books with less than 300 pages
DELETE FROM Books
WHERE Pages < 300;

-- Delete authors with no associated books
DELETE FROM Authors
WHERE Id NOT IN (SELECT DISTINCT AuthorId FROM Books);
