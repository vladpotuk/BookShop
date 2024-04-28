-- Create database "BookShop"
CREATE DATABASE BookShop;
GO

-- Use database "BookShop"
USE BookShop;
GO

-- Create table "Authors"
CREATE TABLE Authors (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,
    CountryId INT NOT NULL,
    FOREIGN KEY (CountryId) REFERENCES Countries(Id)
);

-- Create table "Books"
CREATE TABLE Books (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Pages INT NOT NULL CHECK (Pages > 0),
    Price MONEY NOT NULL CHECK (Price >= 0),
    PublishDate DATE NOT NULL CHECK (PublishDate <= GETDATE()),
    AuthorId INT NOT NULL,
    ThemeId INT NOT NULL,
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id),
    FOREIGN KEY (ThemeId) REFERENCES Themes(Id)
);

-- Create table "Countries"
CREATE TABLE Countries (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL UNIQUE
);

-- Create table "Sales"
CREATE TABLE Sales (
    Id INT PRIMARY KEY IDENTITY,
    Price MONEY NOT NULL CHECK (Price >= 0),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    SaleDate DATE NOT NULL DEFAULT GETDATE(),
    BookId INT NOT NULL,
    ShopId INT NOT NULL,
    FOREIGN KEY (BookId) REFERENCES Books(Id),
    FOREIGN KEY (ShopId) REFERENCES Shops(Id)
);

-- Create table "Shops"
CREATE TABLE Shops (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    CountryId INT NOT NULL,
    FOREIGN KEY (CountryId) REFERENCES Countries(Id)
);

-- Create table "Themes"
CREATE TABLE Themes (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);
