                  -- Project: Supermarket Sales Analysis
				-- Author: Harini Selvaraju
                -- Tools Used: MySQL
				-- Dataset Size: 1000+ records
 -- Description: Business analysis using aggregate functions, grouping, case statements, and date conversion.
-- What is the total number of transactions
SELECT COUNT(*) AS tot_trans FROM sales;
-- What is the total sales revenue
SELECT SUM(sales) AS tot_sal FROM  sales;
-- What is the total quantity of products sold
SELECT SUM(Quantity) AS sol_pro FROM sales;
-- What is the average rating of the supermarket
SELECT avg(Rating) AS rat FROM sales;
-- What is the average unit price
SELECT avg(`Unit price`) AS unit FROM sales;
-- What is the total sales in each city 
SELECT City,sum(Sales) AS tot_sal FROM sales group by City;
-- Which city has the highest total sales
SELECT city,sum(sales) FROM sales group by city order by sum(sales) desc limit 1;
-- Which branch generates the highest total revenue
SELECT branch,sum(sales) FROM sales group by Branch order by sum(Sales) desc limit 1;
-- Which product line has the highest total sales?
SELECT `product line`,sum(sales) FROM sales group by `Product line` order by sum(sales)
desc limit 1;
-- Which product line sold the highest total quantity?
select `product line`,SUM(quantity) FROM sales group by `product line` 
order by sum(Quantity) desc limit 1;
-- Which payment method is used the most?
SELECT `Payment`,count(Payment) FROM sales group by `Payment` 
order by count(`Payment`) desc limit 1;
-- Which product line generates the highest gross income?
SELECT `product line`,sum(`gross income`) FROM sales group by `Product line` order by 
sum(`gross income`)  desc limit 1; 
-- Which city has the highest average rating
SELECT city,avg(rating) FROM  sales group by City order by avg(Rating) desc  limit 1;
-- Which customer type generates the highest total sales?
select `Customer type`,sum(`Sales`) AS maxi FROM sales group by `Customer type` order by sum(Sales)
desc limit 1;
-- Which branch has the highest average gross income?
select `Branch`,avg(`gross income`) FROM sales GROUP BY Branch ORDER BY avg(`gross income`)
desc limit 1;
-- Which day of the week has the highest total sales?
SELECT DAYNAME(STR_TO_DATE(`Date`, '%m/%d/%Y')) AS day_name,
SUM(Sales) AS total_sales FROM sales GROUP BY day_name ORDER BY total_sales DESC
LIMIT 1;
-- Which month has the highest total sales?
SELECT MONTHNAME(STR_TO_DATE(`Date`, '%m/%d/%Y')) AS day_name,
SUM(Sales) AS total_sales FROM sales GROUP BY day_name ORDER BY total_sales DESC
LIMIT 1;
-- Which gender spends more on average?
SELECT Gender,avg(sales) FROM sales group by Gender order by avg(sales) desc limit 1;
--  Which time of the day has the highest number of transactions?
SELECT CASE WHEN HOUR(Time) < 12 THEN 'Morning' WHEN HOUR(Time) < 17 THEN 'Afternoon'
ELSE 'Evening' END AS time_of_day,COUNT(*) AS total_transactions FROM sales
GROUP BY time_of_day ORDER BY total_transactions DESC LIMIT 1;
-- 