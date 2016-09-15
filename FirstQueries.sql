--Seperate columns with comas
/*
SELECT CustNo, CustFirstName, CustLastName, custstreet, custcity, custzip, custbal
FROM Customer
WHERE Custcity = 'Seattle'
AND CustLastName = 'Taylor';
*/
/*
SELECT CustNo, CustFirstName, CustLastName, custstreet, custcity, custzip, custbal
FROM Customer
Where CustCity = 'Seattle'
OR CustCity = 'Denver'
ORDER BY CustNo;
*/
/*
SELECT ProdNo, ProdName, Prodmfg, ProdPrice, ProdNextShipDate, ProdQOH
FROM Product
WHERE PRODPRICE > 100
AND ProdNextShipDate > '01-Feb-07';
*/
/*
SELECT ProdNo, ProdName AS Name, Prodmfg "Manufacturer", ProdPrice AS Price, ProdNextShipDate, ProdQOH
FROM Product
WHERE Prodmfg LIKE '%on%'
AND ProdPrice BETWEEN 100 and 200;
*/
/*
SELECT CustNo, CustFirstName, CustLastName, custstreet, custcity, custzip, custbal
FROM Customer
WHERE CustLastName LIKE 'S%'
OR CustLastName LIKE 's%';
*/

/*
--List the First, last city and state for all customers
SELECT CustFirstName, CustLastName, custcity, custstate
FROM Customer;
*/
/*
--List first name, last na,e and phone of all employees
SELECT empfirstname, emplastname, empphone
FROM Employee
*/

/*
--List first, last and balance of customers in Denver
SELECT custfirstname, custlastname, custbal
FROM customer
WHERE custcity like 'Denver';
*/

/*
--list the product name for all products costing more than $150
SELECT prodname, prodprice
FROM product
WHERE prodprice > 150;
*/

/*
--list name and phone number for all employees in area code 303
SELECT empfirstname, emplastname, empphone
FROM employee
WHERE empphone like '(303)%';
*/

/*
--List all order lines with a quantity greater than 3
SELECT ordno, prodno, qty
FROM Ordline
WHERE qty > 3;
*/

/*
--List the order name for all orders in seattle descending
SELECT ordname
FROM OrderTBL
WHERE ordcity like 'Seattle'
Order By ordname DESC;
*/

/*
--list the order num and date for all orders placed in january 2007
SELECT ordno, orddate
FROM Ordertbl
WHERE orddate like '%JAN-07';
*/

/*
--list products without a next shipdate
SELECT prodno, prodname, prodnextshipdate
FROM Product
WHERE prodnextshipdate IS NULL;
*/

/*
--list names of customers who have balances between 200-350
SELECT custfirstname, custlastname
FROM customer
WHERE custbal > 200
AND custbal < 350;*/