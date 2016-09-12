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

SELECT CustNo, CustFirstName, CustLastName, custstreet, custcity, custzip, custbal
FROM Customer
WHERE CustLastName LIKE 'S%'
OR CustLastName LIKE 's%';