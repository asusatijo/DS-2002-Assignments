-- Part 1

USE world;
-- 1
SELECT Name FROM country WHERE Continent = 'South America';
-- 2
SELECT Population FROM country WHERE Name = 'Germany';
-- 3
SELECT Name from city where countrycode = 'JPN';
-- 4
SELECT Population FROM country WHERE continent = 'Africa' Order by population DESC limit 3;
-- 5
SELECT Name, lifeexpectancy FROM country where Population > 1000000 and population < 5000000 ORDER BY Population DESC;
-- 6
SELECT country.Name FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

USE Chinook_AutoIncrement;
-- 7 
SELECT Title FROM Album WHERE artistId = 1;
-- 8
SELECT FirstName, LastName, Email FROM Customer where country = 'Brazil';
-- 9
SELECT Name FROM Playlist;
-- 10
select count(*) from Track where genreid = 1;
-- 11
SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards');
-- 12
SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName, 
    SUM(i.Total) AS TotalSales
FROM 
    Customer c
JOIN 
    Invoice i ON c.CustomerId = i.CustomerId
GROUP BY 
    c.CustomerId, c.FirstName, c.LastName
ORDER BY 
    TotalSales DESC;
    
-- Part 2
USE egg2qp;

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Invoice (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    Total DECIMAL(10, 2),
    BillingCity VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Customer (FirstName, LastName, Email, Phone)
VALUES ('John', 'Doe', 'john.doe@example.com', '555-1234');

INSERT INTO Invoice (CustomerID, InvoiceDate, Total)
VALUES (1, '2024-09-07', 100.00);

-- 1
select email from customer;
-- 2
select firstname from customer where phone = '555-1234';
-- 3
select total from invoice where customerid = 1