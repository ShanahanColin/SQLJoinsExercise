-- find all products--
select * from products as p;
 
-- find all products that cost $1400
select * from products
where p.price = 1400;
 
-- find all products that cost $11.99 or $13.99
select * from products
where p.Price = 11.99 or 13.99;
 
-- find all products that do NOT cost 11.99 - using NOT
select * from products
where NOT p.price = 11.99;
 
-- find  all products and sort them by price from greatest to least
select * from products
order by p.price desc;
 
-- find all employees who don't have a middle initial
select * from employees as e
where e.middleinitial is NULL; 
 
-- find distinct product prices
select distinct price from products;

 
-- find all employees whose first name starts with the letter ‘j’
select * from employees as e
where e.firstname LIKE 'j%';
 
-- find all Macbooks --
select * from products
where Name = 'Macbook';
 
-- find all products that are on sale
select * from products
WHERE Products.OnSale =1;
 
-- find the average price of all products --
select avg(p.price) from products;
 
-- find all Geek Squad employees who don't have a middle initial --
select * from employees as e
where MiddleInitial is null AND title= 'Geek Squad' ;

 
-- find all products from the products table whose stock level is in the range of 500 to 1200. 
-- Order by Price from least to greatest. **Try this with the between keyword
select * from products 
where p.stocklevel between 500 and 1200
order by p.price asc;



-- joins: select all the computers from the products table:
 -- using the products table and the categories table, 
 -- return the product name and the category name
 Select products.Name , categories.Name FROM products
 INNER JOIN categories ON categories.CategoryID = products.CategoryID
 WHERE Category.Name = 'Computers';
 
 
-- joins: find all product names, product prices, 
-- and products ratings that have a rating of 5
SELECT products.Name , products.Price , reviews.rating FROM products
INNER JOIN reviews ON reviews.ProductID = products.ProductID
WHERE reviews.Rating = 5;


 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT e.FirstName , e.LastName , Sum(s.Quantity) AS total FROM sales as s
INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY total DESC
LIMIT 1;


-----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT c.Name , d.Name FROM departments AS d
INNER JOIN categories as c on c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Applicances' or c.Name = 'Games';



-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()
SELECT p.Name , SUM(s.Quantity) AS 'Total Sold' , sum(s.Quantity * s.PricePerUnit) AS 'Total Price' FROM products as p
INNER JOIN sales as s on s.ProductID = p.ProductID
WHERE  p.ProductID = 97;
-- SELECT * FROM sales WHERE ProductID = 97;




-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
SELECT p.Name , r.Reviewer , r.Rating, r.Comment FROM products as p
INNER JOIN reviews AS r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating =1;









-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, 
the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) FROM sales as s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
INNER JOIN  products AS p ON p.ProductID = s.ProductID
GROUP BY s.EmployeeID , p.ProductID, s.Date;
