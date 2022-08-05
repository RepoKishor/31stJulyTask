/**  
*******************
Task 2 Sql Script 
*******************
**/
use classicmodels;
show tables;
/* select `Order ID` from superstore_usa limit 10; */
select * from Returns;
select DISTINCT `Ship Mode` from superstore_usa;
SELECT 
    o.`Order ID`,
    o.`Customer Name`, 
    o.`Product Name`
FROM
    superstore_usa o 
    INNER JOIN 
    returns r ON o.`Order ID` = r.`Order ID`;

SELECT DISTINCT `Customer ID` FROM superstore_usa;
SELECT DISTINCT `Ship Mode` FROM superstore_usa;
SELECT DISTINCT `Postal Code` FROM superstore_usa;
SELECT  STR_TO_DATE(`Order Date`, '%d-%m-%Y') from superstore_usa;
SELECT  STR_TO_DATE(`Ship Date`, '%d-%m-%Y') from superstore_usa;
 select * from superstore_usa limit 10; 
ALTER TABLE superstore_usa ADD Fulfillment INT AS (STR_TO_DATE(`Ship Date`, '%d-%m-%Y') - STR_TO_DATE(`Order Date`, '%d-%m-%Y'));
select `Order Id` from superstore_usa where Fulfillment >10;
/* Group by region and find out which region is more profitable */
select Region, sum(Profit) from superstore_usa group by Region order by sum(Profit) desc;
select `State or Province`, max(Discount) from superstore_usa;
/* Most profitable customer segment */ 
select `Customer Segment`, sum(Profit) from superstore_usa group by `Customer Segment` order by sum(Profit) desc;
/* Try to find out 10 top  product with highest margins */
select `Product Name`, sum(`Product Base Margin`) from superstore_usa group by `Product Name` order by sum(`Product Base Margin`) desc limit 10;
/* try to find out the 10th most loss making product catagory */
select `Product Category`, sum(Profit) from superstore_usa where Profit < 0  group by `Product Category` order by sum(Profit) limit 10;