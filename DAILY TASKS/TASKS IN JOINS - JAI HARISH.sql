-- 1. Find the salesperson and customer who reside in the same city
SELECT s.name AS Salesman, c.cust_name, s.city 
FROM salesman s
JOIN customer c ON s.city = c.city;

-- 2. Find orders where the order amount exists between 500 and 2000
SELECT o.ord_no, o.purch_amt, c.cust_name, c.city 
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 500 AND 2000;

-- 3. Find the salesperson(s) and the customer(s) he represents
SELECT c.cust_name, c.city, s.name AS Salesman, s.commission 
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id;

-- 4. Find salespeople who received commissions of more than 12 percent
SELECT c.cust_name, c.city AS customer_city, s.name AS Salesman, s.commission 
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.12;

-- 5. Find salespeople who do not live in the same city as their customers and have a commission > 12%
SELECT c.cust_name, c.city AS customer_city, s.name AS Salesman, s.city AS salesman_city, s.commission 
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.city <> s.city AND s.commission > 0.12;

-- 6. Find the details of an order
SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name AS Salesman, s.commission 
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN salesman s ON o.salesman_id = s.salesman_id;

-- 7. Join salesman, customer, and orders tables to return only relational rows
SELECT DISTINCT s.*, c.*, o.* 
FROM salesman s
JOIN customer c ON s.salesman_id = c.salesman_id
JOIN orders o ON c.customer_id = o.customer_id;

-- 8. Display customer name, city, grade, salesman, salesman city, sorted by ascending customer_id
SELECT c.cust_name, c.city, c.grade, s.name AS Salesman, s.city AS salesman_city 
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY c.customer_id;

-- 9. Find customers with a grade less than 300, ordered by customer_id
SELECT c.cust_name, c.city, c.grade, s.name AS Salesman, s.city AS salesman_city 
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.grade < 300
ORDER BY c.customer_id;

-- 10. Report of existing customers who placed an order
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt 
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.ord_date;

-- 11. Report of customers who placed orders through a salesman or by themselves
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name AS Salesman, s.commission 
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id;

-- 12. List of salespersons who work for customers or have not yet joined any customers
SELECT DISTINCT s.* 
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
ORDER BY s.salesman_id;

-- 13. List of salespersons with customers and orders
SELECT s.*, c.*, o.* 
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 14. List of salesmen meeting specific order criteria
SELECT DISTINCT s.*
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE (o.purch_amt >= 2000 AND c.grade IS NOT NULL) OR o.customer_id IS NULL;

-- 15. Report of customers who placed orders or whose orders are not linked to a listed customer
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt 
FROM customer c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- 16. Report of customers with a grade who placed orders or whose orders are not linked to a graded customer
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt 
FROM customer c
RIGHT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.grade IS NOT NULL;

-- 17. Combine each row of the salesman table with each row of the customer table (Cartesian Product)
SELECT s.*, c.* FROM salesman s CROSS JOIN customer c;

-- 18. Cartesian product of salesperson and customer where they belong to the same city
SELECT s.*, c.* FROM salesman s CROSS JOIN customer c WHERE s.city = c.city;

-- 19. Cartesian product where salesmen belong to a city and customers require a grade
SELECT s.*, c.* FROM salesman s CROSS JOIN customer c WHERE s.city IS NOT NULL AND c.grade IS NOT NULL;

-- 20. Cartesian product where salesmen and customers are in different cities and customers have a grade
SELECT s.*, c.* FROM salesman s CROSS JOIN customer c WHERE s.city <> c.city AND c.grade IS NOT NULL;

-- 21. Select all rows from both participating tables as long as there is a match
SELECT * FROM company_mast cm JOIN item_mast im ON cm.com_id = im.pro_com;

-- 22. Display item name, price, and company name of all products
SELECT im.pro_name, im.pro_price, cm.com_name 
FROM item_mast im
JOIN company_mast cm ON im.pro_com = cm.com_id;

-- 23. Calculate the average price of items for each company
SELECT cm.com_name, AVG(im.pro_price) AS avg_price 
FROM item_mast im
JOIN company_mast cm ON im.pro_com = cm.com_id
GROUP BY cm.com_name;

-- 24. Calculate the average price of items for each company (>= 350)
SELECT cm.com_name, AVG(im.pro_price) AS avg_price 
FROM item_mast im
JOIN company_mast cm ON im.pro_com = cm.com_id
GROUP BY cm.com_name
HAVING AVG(im.pro_price) >= 350;

-- 25. Find the most expensive product of each company
SELECT im.pro_name, im.pro_price, cm.com_name 
FROM item_mast im
JOIN company_mast cm ON im.pro_com = cm.com_id
WHERE im.pro_price = (SELECT MAX(im2.pro_price) FROM item_mast im2 WHERE im2.pro_com = im.pro_com);

-- 26. Display all data of employees including their department
SELECT e.emp_idno, e.emp_fname, e.emp_lname, e.emp_dept,d.dpt_code, d.dpt_name, d.dpt_allotment
FROM emp_details e 
JOIN emp_department d ON e.emp_dept = d.dpt_code;

-- 27. Display employee names, department name, and budget
SELECT e.emp_fname, e.emp_lname, d.dpt_name, d.dpt_allotment 
FROM emp_details e JOIN emp_department d ON e.emp_dept = d.dpt_code;

-- 28. Find employees in departments with budgets over 50000
SELECT e.emp_fname, e.emp_lname 
FROM emp_details e JOIN emp_department d ON e.emp_dept = d.dpt_code
WHERE d.dpt_allotment > 50000;

-- 29. Find departments with more than two employees
SELECT d.dpt_name 
FROM emp_department d JOIN emp_details e ON d.dpt_code = e.emp_dept
GROUP BY d.dpt_name HAVING COUNT(e.emp_idno) > 2;
