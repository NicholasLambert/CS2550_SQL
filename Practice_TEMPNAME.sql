/*This file is meant to show practice problems using such keywords as: AND, OR,
IN, 
I have created these practice problems myself
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