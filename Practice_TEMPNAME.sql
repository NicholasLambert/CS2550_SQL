/*This file is meant to show practice problems using such keywords as: AND, OR,
IN, 
I have created these practice problems myself or have adapted them through classroom discussions.
*/
/*
--This query gets the orders from WA that were from only 2 different employee numbers
SELECT *
FROM ORDERTBL
WHERE OrdState = 'WA'
AND Empno IN('E9345771', 'E8544399');
*/
/*
SELECT ProdNo, ProdName, ProdMFG, To_Char(ProdNextShipDate, 'MM DD, YYYY - HH24:MI:SS Q DDD') AS "DATE"
FROM Product;
*/

/*NOTES - NOTES - NOTES - NOTES
To_Char - converts a datetime or interval value and turn it into a character
To_Char(OrderDate, ' DD Month YYYY')

To_Date - takes characters and treats them as dates
To_Date('21 Mar 2016', 'DD MM YYYY')
*/

/*
--List the order name and order city for all orders on Jan 23 2007. Arrange the list by order name
SELECt ORDNAME, ORDCITY, ORDDATE
FROM ORDERTBL
WHERE ORDDATE LIKE To_Date('23 Jan 2007', 'DD Month YYYY')
ORDER BY ORDNAME ASC;
*/

--List the order number and order date for all febrauray orders in washington state. Arrange by order number
SELECT ORDNO, ORDDATE
FROM ORDERTBL
WHERE ORDDATE LIKE '%FEB%'
AND ORDSTATE LIKE 'WA'
ORDER BY ORDNO;

--List the product number and name for all products with a next ship date in february 2007. Arrange the list by product number
SELECT ProdNo, ProdName, ProdNextShipDate
FROM Product
WHERE ProdNextShipDate LIKE '%FEB%'
ORDER BY ProdNo ASC;

--List the order number for all orders that shipped on the 11th day of any month
SELECT OrdNo, OrdDate
FROM OrderTbl
WHERE OrdDate LIKE '11-%';

--List the order number and expected arrival date for all February 2007 order (The expected arribal date is 5 days after the order) Sort in order of arrival date
SELECT Ordno, To_Char(Orddate + 5, 'DD-MON-YY') AS "Expected Arrival Date"
FROM Ordertbl
WHERE To_Char(Orddate, 'Mon YYYY') = 'Feb 2007'
ORDER BY "Expected Arrival Date";

--Alphabetical List of products by name and price that have a price that is an even dollar amount
SELECT ProdName, ProdPrice
From Product
WHERE To_Char(ProdPrice, '$9999.99') LIKE '%.00';

--Provide a list of the days of the month that products have been shipped, eliminating duplicates. SOrt by day of month
SELECT DISTINCT To_Char(ProdNextShipDate, 'DD') AS "Day of the Month"
FROM Product
WHERE ProdNextShipDate IS NOT NULL
ORDER BY "Day of the Month";

--List the order number, order date and the number of days since the order (as of december 31, 2007). Sort by number of days since the order
SELECT OrdNo, OrdDate, To_Char(To_Date('DEC 31, 2007', 'Mon DD, YYYY') - OrdDate, '999') AS "Day since ORder"
FROM OrderTBL;

--Selects the max, min and Average or ProdPrice
--Max and Min will work on strings as well. AVG with through an error
SELECT MAX(ProdPRice)
From Product;

SELECT AVG(ProdPrice)
FROM Product;

Select MIN(ProdPrice)
FROM Product;

--Count doesn't work on Null values. It will only count items with a value
--Returns the count of a given set when using asterisk
SELECT COUNT(ProdNextShipDate)
FROM Product;

SELECT COUNT(*)
FROM Product;

SELECT COUNT(*)
FROM Customer;

--Return the sum of everything in the column
--This statement sorts by product manufacturer
SELECT SUM(ProdPrice), SUM(ProdQOH), ProdMFG
FROM Product
GROUP BY ProdMFG;

--Grouo by the Customer state while displaying the avg custBal
--shorten digits down with To_Char
SELECT To_Char(AVG(CustBal), '999.99') AS Customer_Balance_Per_State, CustSTate
FROM Customer
GROUP BY CustState;

--gets the averages that are higher than 500. Having Statement Used
SELECT To_Char(AVG(CustBal), '999.99') AS Customer_Balance_Per_State, CustCity, CustState
FROM Customer
GROUP BY CustCity, CustState
HAVING AVG(CustBal) >= 500;

--Get the total number of customers in each state
SELECT COUNT(*), CustState
FROM Customer
GROUP BY CUSTSTATE;

--gets the employee commission rates
SELECT COUNT(*) AS NumEmployeesPerCommission, Empno, Empcommrate
FROM Employee
WHERE EmpCommRate IS NOT NULL
GROUP BY EmpCommRate;

--Working with number manipulation stuffs, I don't really remember
SELECT To_Char((Sysdate - ProdNextShipDate)/365, '99.99') AS "Number of Years"
FROM Product
WHERE ProdNextShipDate IS NOT NULL
Order By "Number of Years";

--Getting rid of duplicate stuff
SELECT To_Char(OrdDate, 'DD Mon YYYY HH:MI')
FROM OrderTBL;

--Using HAVING
--HAVING has to be with a GROUP BY
--GROUP BY does not need a HAVING
Select COUNT(*), OrdDate
FROM Ordertbl
GROUP BY Orddate
HAVING COUNT(*) > 1;

-- 1. Find the customer Balance for each customer 
SELECT To_Char(AVG(CustBal), '9999.99') AS "Average Customer Balance"
FROM Customer;

-- 2. Show the name of the customer with the highest balance and what the balance is
SELECT To_Char(MAX(CustBal), '9999.99') AS "Highst Customer balance"
FROM Customer;

-- 3. Show the difference between the highest balance and the average balance
SELECT  MAX(CustBal) - AVG(CustBal) AS "Dif Between High and Avg"
FROM Customer;

-- .4 Show the easliest order date
SELECT MIN(OrdDate)
FROM OrderTbl;

-- .5 Show how many customers eash ctate has
SELECT COUNT(*), CustState
FROM Customer
GROUP BY CustState
ORDER BY COUNT(*);

--.6 Show the employees 
SELECT COUNT(*), EmpCommRate
FROM Employee
WHERE EmpCommRate IS NOT NULL
GROUP BY EmpCommRate;

-- 7. Show the total price of the products for each manufacturer
SELECT SUM(ProdPrice), ProdMFG
FROM Product
GROUP BY ;

-- 8. List the number of orders being sent to Washington
SELECT COUNT(*), OrdState
FROM Ordertbl
GROUP BY OrdState;

-- 9. Show the number of orders for those customers who have ordered more than once
SELECT COUNT (*), CUstNo
FROM Ordertbl
GROUP BY CustNo
HAVING COUNT(*) > 1;

/*
STARTING TO WORK WITH MULTIPLE TABLES
*/
--Select from two tables, give an alias to the tables
SELECT first_name, last_name, final_grade, enroll_date
FROM student s, enrollment e
WHERE s.student_id = e.student_id;

--Join using this field
--the USING value has to be the same between the two tables
SELECT First_Name, Last_Name, Enroll_Date
FROM student s JOIN enrollment e
USING (student_id);

--Using an ON statement
SELECT First_Name, Last_Name, Enroll_Date
FROM student s JOIN enrollment e
ON s.student_id = e.student_id;

--JOINS
SELECT First_Name, Last_Name, Enroll_Date, e.student_id, sec.section_id
FROM student s JOIN enrollment e
ON s.student_id = e.student_id
JOIN section sec
ON e.section_id = sec.section_id;

--Use an alias and grab information from multiple tables
SELECT EmpFirstName, EmpLastName, CustFirstName, CustLastName
FROM employee e, ordertbl o, customer c
WHERE e.empno = o.empno
AND o.custno = c.custno;

--Grabs information from the same table using a join. Let's us print the employee and the supervisor together
SELECT empno, empfirstname, supervisorfirstname, supervisorlastname
FROM employee empfirstname, employee sup
WHERE emp.supno = sup.empno;

/*
EXAMPLE QUERIES FOR JOIN
*/
-- #1 - List the ifrst and last names for employess that have customers in seattle
SELECT empfirstname, emplastname, empphone
FROM employee emp JOIN orderTbl order
ON emp.empno = ord.empno
JOIN customer cust
ON ord.custno = cust.custno
WHERE custcity = 'Seattle';

-- #2 - List the orderno, orderdate, custno, custstate and the shipping state in which the customer state differs from the shipping state
SELECT o.ordno, o.orddate, o.custno, c.custstate, o.ordstate
FROM ordertbl o JOIN customer c
ON c.custno = o.custnoWHERE c.custstate != o.ordstate;

-- #3 for coloardo customers, compute the number of orders placed during janurary 2007. The result should include the customer number, last name and number of orders placed
SELECT c.custno, custlastname, ordno, orddate
FROM customer c JOIN ordertbl o
ON c.custno = o.custno
WHERE to_Char(Orddate, 'Mon YYYY') = 'Jan 2007'
AND custstate = 'CO'
GROUP BY c.custno, custlastname;

-- #4 - List the product manufacturer, product name and number of times that the product has appeared on an order for products that have appeared on an order at least 5 times
SELECT ProdMFG, ProdName, COUNT(*)
FROM Product p JOIN ordline ol
ON p.prodno = ol.prodno
GROUP BY prodmfg, prodname
HAVING COUNT(*) >= 5;

-- #5 - List each customer city and state and the number of customers in that city and state. Order the list such that the city with the highest number of customers is at the top of the list
--Oops, wasn't paying attention on this one

-- #6 - For each employee with a commission rate greater than or equal to 0.05, compute the number of orders taken in January 2007. The result should include the employee number, employee last name and number of orders taken
SELECT e.empno, e.emplastname, o.ordno, empcommrate, orddate
FROM employee e JOIN ordertbl o
ON e.empno = o.empno
WHERE To_Char(orddate, 'MM YY') = '01 07'
AND empcommrate >= 0.05
GROUP BY e.empno, e.empLastName

-- #8 - List each customer name and total number of items ordered for customers with zereo balances
SELECT custfirstname, custlastname, qty
FROM customer c JOIN ordertbl o
ON c.custno = o.custno
JOIN ordline ol
ON o.ordno = ol.ordno
WHERE custbal = 0.00
GROUP BY custlastname, custfirstname
ORDER BY custfirstname name, custlastname;

/* -------------------------------------------------------
Here's some new stuff, woot woot...
----------------------------------------------------------*/
SELECT Cost, Cost * 1.1, Cost + 100, Cost - 100, Cost / 2
FROM Course;

SELECT Course_No, NVL(To_Char(Prerequisite), 'NA')
FROM Course;

--SUBQUERY TIME (aka death of me)
SELECT Description, Course_No
FROM Course
WHERE Cost = (SELECT MAX(Cost) FROM Course);
--JK, that wasn't too bad

SELECT SUM(Capacity) * Cost AS "Potential Revnue"
FROM Enrollment e JOIN Section s
ON e.Section_ID = s. Section_ID
WHERE Course_No = 20;

--Let's just go ahead and do a bunch of weird stuff. This practice sheet has
--been way too easy
SELECT Num_enrolled, Num_enrolled * Cost AS "Actual Revenue", Total_Capacity, Total_Capacity * Cost AS "Potential Capacity"
FROM
(SELECT COUNT(*) AS Num_Enrolled, course_no
FROM Enrollment e JOIN section s
ON e.Section_ID = s.Section_ID
WHERE Course_No = 20
GROUP BY course_no) Num
JOIN
(SELECT SUM(Capacity) AS Total_Capacity, Course_No
FROM Enrollment e JOIN Section s
ON e.Section_ID = s.Section_ID
WHERE Course_No = 20
GROUP BY course_no) Cap
ON Num.course_no = cap.course_no
JOIN Course c
ON c.Course_No = num.Course_No;

--Get first 5 values
SELECT First_Name, Last_Name
FROM Student
WHERE ROWNUM <= 5;

SELECT city, state, zip,
	(SELECT COUNT(*)
	FROM student s
	WHERE s.zip = z.zip)
FROM zipcode z
WHERE state = 'CT';

SELECT COUNT(*), sec.course_no
FROM section sec JOIN enrollment e
ON sec.section_id = e.section_id
WHERE sec.course_no = 20
GROUP BY sec.course_no;

SELECT s.student_id, COUNT(*)
FROM student s JOIN enrollment e
ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY s.student_id;

/* Some new stuff, let's hope it doesn't destroy me 
  Mainly consists of Outer Join Examples  */

--This grabs courses that don't have sections and courses that do have sections
SELECT c.course_no, sec.course_no, description, start_date_time
FROM course c LEFT JOIN section sec
ON c.course_no = sec.course_no
ORDER BY c.course_no;

SELECT i.instructor_id, s.student_id
FROM instructor i FULL OUTER JOIN student s
ON i.zip = s.zip;