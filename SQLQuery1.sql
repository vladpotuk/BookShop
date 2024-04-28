USE Bookstore;

-- Insert authors
INSERT INTO Authors (Name, Surname, CountryId)
VALUES ('Stephen', 'King', 1),
       ('Agatha', 'Christie', 2),
       ('J.K.', 'Rowling', 3),
       ('Dan', 'Brown', 4);

-- Insert themes
INSERT INTO Themes (Name)
VALUES ('Detective'),
       ('Fantasy'),
       ('Thriller'),
       ('Science Fiction');

-- Insert countries
INSERT INTO Countries (Name)
VALUES ('USA'),
       ('UK'),
       ('Canada'),
       ('France');

-- Insert shops
INSERT INTO Shops (Name, CountryId)
VALUES ('Book Haven', 1),
       ('The Bookshelf', 2),
       ('Readers Paradise', 3),
       ('Librairie Paris', 4);

-- Insert books
INSERT INTO Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
VALUES ('The Shining', 512, 12.99, '1977-01-28', 1, 1),
       ('Murder on the Orient Express', 256, 9.99, '1934-01-01', 2, 1),
       ('Harry Potter and the Philosopher''s Stone', 320, 14.99, '1997-06-26', 3, 2),
       ('The Da Vinci Code', 464, 11.99, '2003-03-18', 4, 3);

-- Insert sales
INSERT INTO Sales (Price, Quantity, SaleDate, BookId, ShopId)
VALUES (12.99, 50, '2023-01-15', 1, 1),
       (9.99, 40, '2023-02-10', 2, 2),
       (14.99, 60, '2023-03-05', 3, 3),
       (11.99, 30, '2023-04-20', 4, 4);
