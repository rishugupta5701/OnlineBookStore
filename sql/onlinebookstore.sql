CREATE DATABASE IF NOT EXISTS onlinebookstore;
USE onlinebookstore;


DROP TABLE IF EXISTS books;
CREATE TABLE IF NOT EXISTS Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Genre VARCHAR(20),
    Published_Year INT,
    Price NUMERIC(10 , 2 ),
    Stock INT
);		



DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(12) NOT NULL,
    City VARCHAR(100),
    Country VARCHAR(50)
);


DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Book_ID INT NOT NULL,
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10 , 2 )
);


-- ************ BASIC QUESTIONS *****************

-- 1) Retrieve all books in the "Fiction" genre:

	SELECT *
	FROM
		Books
	WHERE
		Author = 'Fiction';

	-- 2) Find books published after the year 1950:
	SELECT * FROM books
	WHERE Published_Year > 1950;

-- 3) List all customers from the Canada:
	SELECT *
	FROM
		Customers
	WHERE
		Country = 'Canada';

	-- 4) Show orders placed in November 2023:
	SELECT *
	FROM
		orders
	WHERE
		Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
	SELECT 
		SUM(Stock) AS Total_Books_Available
	FROM
    books;

-- 6) Find the details of the most expensive book.

	SELECT * FROM books
	ORDER BY Price DESC
	LIMIT 1;

-- 7) Show customers who ordered more than one quantity of a book.-- 
	SELECT 
		c.Customer_ID,
		c.Name,
		c.Email,
		c.Phone,
		c.City,
		c.Country,
		o.Quantity
	FROM
		customers AS c
			INNER JOIN
		orders AS o ON c.Customer_ID = o.Customer_ID
	WHERE
		o.Quantity > 1;

	-- 8) Retrieve orders where the total amount exceeds $20.-- 
	SELECT *
	FROM
		orders
	WHERE
		Total_Amount > 20;

-- 9) List all genres available in the Books table.-- 
	SELECT DISTINCT Genre FROM books;
    
-- 10. Find the book with the lowest stock.-- 
	SELECT *
	FROM books
	ORDER BY Stock ASC
	LIMIT 1;
    
-- 11. Calculate the total revenue generated from all orders.-- 
	SELECT 
	SUM(Total_Amount) AS Total_Revenue
	FROM orders;
    
    
    
-- **************ADVANCE QUESTIONS*************** 

-- 1) Retrieve the total number of books sold for each genre:
	SELECT b.Genre, SUM(o.Quantity) AS Total_Books_Sold
	FROM orders o
	JOIN books b 
	ON o.Book_ID = b.Book_ID
	GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
	SELECT Genre, AVG(Price) AS Average_Price
	FROM books
	WHERE Genre = "Fantasy";

-- 3) List customers who have placed at least 2 orders:
	SELECT c.Name, COUNT(o.Customer_ID) AS No_Of_Order
	FROM Customers AS c
	INNER JOIN orders AS o
	ON c.Customer_ID = o.Customer_ID
	GROUP BY c. Name
	HAVING No_Of_Order >=2
	ORDER BY No_Of_Order DESC;

-- 4) Find the most frequently ordered book:
	SELECT b.Title, o.Book_ID, COUNT(o.Order_id) AS Order_Count
	FROM orders o
	INNER JOIN books b
	ON o.Book_ID = b.Book_ID
	GROUP BY o.Book_id
	ORDER BY Order_Count DESC
	LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
	SELECT * FROM books
	WHERE Genre = "Fantasy"
	ORDER BY Price DESC
	LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
	SELECT b.Author, SUM(o.Quantity) AS Quantity_sold
	FROM orders o
	JOIN books b
	ON o.Book_ID = b.Book_ID
	GROUP BY b.Author
	ORDER BY Quantity_sold DESC;

-- 7) List the cities where customers who spent over $30 are located:
	SELECT DISTINCT c.City, Total_Amount
	FROM orders o
	JOIN customers c
	ON o.Customer_ID = c.Customer_ID
	WHERE o. Total_Amount > 30;

-- 8) Find the customer who spent the most on orders:
	SELECT c.Customer_ID, c.Name, SUM(o.Total_Amount) AS Total_Spent
	FROM customers c
	JOIN orders o 
	ON c.Customer_ID = o.Customer_ID
	GROUP BY c.Customer_ID , c.Name
	ORDER BY Total_Spent DESC
	LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders:-- 
	SELECT
	b.Book_ID,
	b.Title,
	b.Stock,
	COALESCE(SUM(o.Quantity), 0) AS Quantity_sold,
	(b.Stock - COALESCE(SUM(o.Quantity), 0)) AS Available_Quantity
	FROM books b
	LEFT JOIN orders o 
	ON b.Book_ID = o.Book_ID
	GROUP BY b.Book_ID , b.Stock;
