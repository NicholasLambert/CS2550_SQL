/*This file is meant to show practice problems using such keywords as: AND, OR,
IN, 
I have created these practice problems myself
*/

--This query gets the orders from WA that were from only 2 different employee numbers
SELECT *
FROM ORDERTBL
WHERE OrdState = 'WA'
AND Empno IN('E9345771', 'E8544399');