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