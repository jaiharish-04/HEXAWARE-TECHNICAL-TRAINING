-- 1. Display all salespeople information
SELECT * FROM salesman;

-- 2. Display names and commissions for all salespeople
SELECT name, commission FROM salesman;

-- 3. Display order date, salesman ID, order number, and purchase amount for all orders
SELECT ord_date, salesman_id, ord_no, purch_amt FROM orders;

-- 4. Identify unique salespeople IDs
SELECT DISTINCT salesman_id FROM orders;

-- 5. Locate salespeople who live in Paris
SELECT name, city FROM salesman WHERE city = 'Paris';

-- 6. Find customers whose grade is 200
SELECT customer_id, cust_name, city, grade, salesman_id FROM customer WHERE grade = 200;

-- 7. Find orders delivered by salesperson with ID 5001
SELECT ord_no, ord_date, purch_amt FROM orders WHERE salesman_id = 5001;

-- 8. Find Nobel Prize winners in 1970
SELECT year, subject, winner FROM nobel_win WHERE year = 1970;

-- 9. Combine winners in Physics (1970) and Economics (1971)
SELECT year, subject, winner, country, category FROM nobel_win 
WHERE (year = 1970 AND subject = 'Physics') 
   OR (year = 1971 AND subject = 'Economics');

-- 10. Combine winners in Physiology before 1971 and Peace on or after 1974
SELECT year, subject, winner, country, category FROM nobel_win 
WHERE (subject = 'Physiology' AND year < 1971) 
   OR (subject = 'Peace' AND year >= 1974);
