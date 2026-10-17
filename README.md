# Online Bookstore SQL Analysis

A MySQL project exploring book sales, customer purchasing patterns, pricing, and inventory through **20 SQL questions**. The accompanying presentation contains query examples and execution screenshots across 25 slides.

**Prepared by:** Rishu Gupta

[Project files](#project-files) · [Dataset](#dataset) · [Key findings](#key-findings) · [SQL analysis](#sql-analysis) · [Getting started](#getting-started) · [Connect with me](#connect-with-me)

## Project overview

This project uses three related datasets to answer practical bookstore questions: which genres sell the most, who spends the most, which books are frequently ordered, and how recorded stock compares with ordered quantities.

SQL concepts demonstrated include filtering, sorting, aggregate functions, `DISTINCT`, `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, and `COALESCE`.

## Project files


| File | Description |
| --- | --- |
| [Books.csv](Books.csv) | 500 book records with authors, genres, prices, and stock |
| [Customers.csv](Customers.csv) | 500 customer records with contact and location fields |
| [Orders.csv](Orders.csv) | 500 order records linking customers to books |
| [OnlineBookStore_SQL_Project_Results.pptx](OnlineBookStore_SQL_Project_Results.pptx) | 25-slide presentation with 11 basic and 9 advanced SQL questions |
| [README.md](README.md) | Project documentation, verified findings, and sample queries |

## Dataset

### Table structure

| Table | Columns |
| --- | --- |
| `books` | `Book_ID`, `Title`, `Author`, `Genre`, `Published_Year`, `Price`, `Stock` |
| `customers` | `Customer_ID`, `Name`, `Email`, `Phone`, `City`, `Country` |
| `orders` | `Order_ID`, `Customer_ID`, `Book_ID`, `Order_Date`, `Quantity`, `Total_Amount` |

### Relationships

- `books.Book_ID` identifies each book and links to `orders.Book_ID`.
- `customers.Customer_ID` identifies each customer and links to `orders.Customer_ID`.
- `orders.Order_ID` uniquely identifies each order record. Each supplied row references one book and one customer.

### Data profile

| Metric | Verified value |
| --- | ---: |
| Books | 500 |
| Customers | 500 |
| Orders | 500 |
| Customers with at least one order | 307 |
| Customers with at least two orders | 139 |
| Genres | 7 |
| Order date range | 9 December 2022–7 December 2024 |
| Missing values across the three CSVs | 0 |
| Duplicate rows / duplicate primary IDs | 0 / 0 |
| Orders referencing missing books or customers | 0 |



## Key findings


| Metric | Result |
| --- | --- |
| Total recorded revenue | **$75,628.66** |
| Total units ordered | **2,697** |
| Average order value | **$151.26** |
| Recorded stock | **25,056 units** |
| Highest-selling genre by units | **Mystery: 504 units** |
| Highest-revenue genre | **Romance: $13,086.98** |
| Highest-spending customer | **Kim Turner: $1,398.90** |
| Most expensive book | **Proactive system-worthy orchestration**, Book_ID 340: **$49.98** |
| Average Fantasy book price | **$25.98** |
| Leading author by units sold | **Patrick Contreras: 28 units** |
| Books with zero recorded stock | **5**: IDs 44, 60, 127, 163, and 378 |

### Sales by genre

| Genre | Units ordered | Revenue |
| --- | ---: | ---: |
| Mystery | 504 | $12,788.45 |
| Science Fiction | 447 | $11,770.51 |
| Fantasy | 446 | $11,238.38 |
| Romance | 439 | $13,086.98 |
| Non-Fiction | 351 | $11,603.06 |
| Biography | 285 | $7,870.06 |
| Fiction | 225 | $7,271.22 |
| **Total** | **2,697** | **$75,628.66** |


## SQL analysis

### Basic questions

1. Retrieve books in the Fiction genre.
2. Find books published after 1950.
3. List customers from Canada.
4. Show orders placed in November 2023.
5. Calculate total recorded book stock.
6. Find the most expensive book.
7. Show customers associated with orders containing more than one unit.
8. Retrieve orders with a total amount above $20.
9. List all available genres.
10. Find books with the lowest stock.
11. Calculate total recorded revenue.

### Advanced questions

1. Calculate units sold by genre.
2. Find the average price of Fantasy books.
3. Identify customers with at least two orders.
4. Find the most frequently ordered books.
5. Retrieve the three most expensive Fantasy books.
6. Calculate units sold by author.
7. Identify cities associated with orders above $30.
8. Find the highest-spending customer.
9. Calculate stock after subtracting ordered quantities, subject to the inventory assumption above.


## Getting started

1. Download or clone this repository and keep the CSVs and presentation together.
2. Open MySQL Workbench or another MySQL client and create a database:

   ```sql
   CREATE DATABASE onlinebookstore;
   USE onlinebookstore;
   ```

3. Import `Books.csv` as `books` and `Customers.csv` as `customers`. Use integer IDs, `DECIMAL(10,2)` for `Price`, integers for `Stock` and `Published_Year`, and text types for descriptive fields. Store `Phone` as text.
4. Import `Orders.csv` as `orders_raw`, with `Order_Date` as text, integer IDs and quantities, and `Total_Amount` as `DECIMAL(10,2)`.

5. Confirm that each analysis table contains 500 rows and that converted dates contain no `NULL` values. Define primary keys on each ID and foreign keys from `orders` to `books` and `customers` after checking the imported types.
6. Run the sample queries above and explore the remaining questions in the presentation. Compare full-data results against the verified findings in this README.



## Connect with me

**Name:** Rishu Gupta


| Platform | Profile link |
| --- | --- |
| GitHub | [https://github.com/rishugupta5701](https://github.com/YOUR_GITHUB_USERNAME) |
| LinkedIn | [https://www.linkedin.com/in/rishu-gupta-717915335/](https://www.linkedin.com/in/YOUR_LINKEDIN_USERNAME/) |
| Instagram | [https://www.instagram.com/rishugupta5701/](https://www.instagram.com/YOUR_INSTAGRAM_USERNAME/) |

<!-- Optional: Add a short personal introduction or portfolio link here. -->
