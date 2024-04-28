USE Bookstore;

-- Task 1: Show all books with page count between 500 and 650
SELECT * FROM Books
WHERE Pages > 500 AND Pages < 650;

-- Task 2: Show all books where the first letter of the title is either 'A' or 'Z'
SELECT * FROM Books
WHERE Name LIKE 'A%' OR Name LIKE 'Z%';

-- Task 3: Show all detective genre books with more than 30 copies sold
SELECT b.*
FROM Books b
JOIN Sales s ON b.Id = s.BookId
WHERE b.ThemeId = (SELECT Id FROM Themes WHERE Name = 'Detective')
GROUP BY b.Id
HAVING SUM(s.Quantity) > 30;

-- Task 4: Show all books with 'Microsoft' in the title but not 'Windows'
SELECT * FROM Books
WHERE Name LIKE '%Microsoft%' AND Name NOT LIKE '%Windows%';

-- Task 5: Show all books with price per page less than 65 cents (in one cell: title, theme, full author name)
SELECT CONCAT(b.Name, ', ', t.Name, ', ', a.Name, ' ', a.Surname) AS Book_Info
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
JOIN Authors a ON b.AuthorId = a.Id
WHERE b.Price / b.Pages < 0.65;

-- Task 6: Show all books with a title consisting of 4 words
SELECT * FROM Books
WHERE LEN(Name) - LEN(REPLACE(Name, ' ', '')) = 3;

-- Task 7: Show sales information (title without 'A', theme not 'Programming', author not 'Herbert Schildt', price between 10 and 20, quantity at least 8, shop not in Ukraine or Russia)
SELECT b.Name AS Book_Title, t.Name AS Theme, CONCAT(a.Name, ' ', a.Surname) AS Author, s.Price, s.Quantity, sh.Name AS Shop_Name
FROM Sales s
JOIN Books b ON s.BookId = b.Id
JOIN Themes t ON b.ThemeId = t.Id
JOIN Authors a ON b.AuthorId = a.Id
JOIN Shops sh ON s.ShopId = sh.Id
WHERE b.Name NOT LIKE '%A%' AND t.Name <> 'Programming' AND CONCAT(a.Name, ' ', a.Surname) <> 'Herbert Schildt' AND s.Price BETWEEN 10 AND 20 AND s.Quantity >= 8
AND sh.CountryId NOT IN (SELECT Id FROM Countries WHERE Name IN ('Ukraine', 'Russia'));

-- Task 8: Show the following information in two columns
SELECT 
    'Number of authors' AS "Information",
    COUNT(*) AS "Value"
FROM Authors
UNION ALL
SELECT 
    'Number of books',
    COUNT(*)
FROM Books
UNION ALL
SELECT 
    'Average selling price',
    CAST(AVG(Price) AS DECIMAL(10, 2)) AS "Value"
FROM Sales
UNION ALL
SELECT 
    'Average page count',
    CAST(AVG(Pages) AS DECIMAL(10, 1)) AS "Value"
FROM Books;

-- Task 9: Show book themes and total page count for each theme
SELECT t.Name AS Theme, SUM(b.Pages) AS Total_Pages
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
GROUP BY t.Name;

-- Task 10: Show the number of books and total page count per author
SELECT CONCAT(a.Name, ' ', a.Surname) AS Author, COUNT(*) AS Total_Books, SUM(b.Pages) AS Total_Pages
FROM Books b
JOIN Authors a ON b.AuthorId = a.Id
GROUP BY CONCAT(a.Name, ' ', a.Surname);

-- Task 11: Show the book with theme 'Programming' and the highest page count
SELECT TOP 1 b.Name AS Book_Title, b.Pages
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
WHERE t.Name = 'Programming'
ORDER BY b.Pages DESC;

-- Task 12: Show the average page count per theme not exceeding 400
SELECT t.Name AS Theme, AVG(b.Pages) AS Avg_Pages
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
WHERE b.Pages <= 400
GROUP BY t.Name;

-- Task 13: Show the total page count per theme for books with page count over 400, considering themes 'Programming', 'Administration', and 'Design'
SELECT t.Name AS Theme, SUM(b.Pages) AS Total_Pages
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
WHERE b.Pages > 400 AND t.Name IN ('Programming', 'Administration', 'Design')
GROUP BY t.Name;

-- Task 14: Show information about shop activities: what, where, by whom, when, and in what quantity
SELECT b.Name AS Book_Title, c.Name AS Country, CONCAT(a.Name, ' ', a.Surname) AS Author, s.SaleDate, s.Quantity, sh.Name AS Shop_Name
FROM Sales s
JOIN Books b ON s.BookId = b.Id
JOIN Authors a ON b.AuthorId = a.Id
JOIN Shops sh ON s.ShopId = sh.Id
JOIN Countries c ON sh.CountryId = c.Id;

-- Task 15: Show the most profitable shop
SELECT TOP 1 sh.Name AS Shop_Name, SUM(s.Price * s.Quantity) AS Total_Revenue
FROM Sales s
JOIN Shops sh ON s.ShopId = sh.Id
GROUP BY sh.Name
ORDER BY Total_Revenue DESC;
