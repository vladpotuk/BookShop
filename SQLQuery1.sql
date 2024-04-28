USE Bookstore;

-- Update the price of all books published after 2020 to 15.99
UPDATE Books
SET Price = 15.99
WHERE PublishDate > '2020-01-01';

-- Update the theme of all books authored by Stephen King to 'Horror'
UPDATE Books
SET ThemeId = (SELECT Id FROM Themes WHERE Name = 'Horror')
WHERE AuthorId = (SELECT Id FROM Authors WHERE Name = 'Stephen' AND Surname = 'King');

-- Increase the price of all books with 'Detective' theme by 10%
UPDATE Books
SET Price = Price * 1.10
WHERE ThemeId = (SELECT Id FROM Themes WHERE Name = 'Detective');

-- Update the country of the shop 'The Bookshelf' to 'Ireland'
UPDATE Shops
SET CountryId = (SELECT Id FROM Countries WHERE Name = 'Ireland')
WHERE Name = 'The Bookshelf';
