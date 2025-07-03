-- E_commerce_project
-- task
-- 1(1)  What devices do my customers use to reach me?

select Device_Type,count(*) as customer_usage
from e_commerce_dataset
group by Device_Type
order by customer_usage desc;

-- 1(2) Who is the customer base?

select Gender,count(distinct Customer_Id) as count_customer
from e_commerce_dataset
group by Gender;


-- 1(3) What product categories am I selling?

select *
from e_commerce_dataset;

select Product_Category,count(Sales) as total_sales
from e_commerce_dataset
group by Product_Category
order by total_sales desc;

-- 1(4) Which product categories do I sell to whom? (Gender Distribution by Category or 

select Product_Category,Gender,count(*) as purchase_count
from e_commerce_dataset
group by Product_Category,Gender
order by Product_Category,purchase_count desc;

-- 1(5)  Which login type do my customers prefer when shopping?

select Customer_Login_type,count(Customer_Id) as count_customer
from e_commerce_dataset
group by Customer_Login_type
order by count_customer desc;


-- 1(6) How does the date and time affect my sales? (Total sales by month, the days of week
-- monthly sales

select monthname(order_date),sum(Sales) as total_sales
from e_commerce_dataset
group by  monthname(order_date)
order by total_sales desc;

-- sales by day of week

select dayname(order_date),sum(Sales) as total_sales
from e_commerce_dataset
group by  dayname(order_date)
order by  total_sales asc;

-- 1(7) From which product do I earn the most profit per unit?

select Product,sum(Profit/Quantity) as profit_per_unit
from e_commerce_dataset
group by Product
order by profit_per_unit desc
limit 1;

-- 1(8)  How is my delivery speed and order priority?

select Order_Priority,avg(Aging) as avg_delivery_time
from e_commerce_dataset
group by Order_Priority
order by avg_delivery_time;

-- 2(a) Calculate total sales for each month over the time period covered by the dataset

select monthname(order_date),sum(Sales) as total_sales
from e_commerce_dataset
group by  monthname(order_date)
order by total_sales desc;

-- 2(b) Identify the month with the highest sales 

select monthname(order_date),sum(Sales) as total_sales
from e_commerce_dataset
group by  monthname(order_date)
order by total_sales desc
limit 1;

-- 3(a) Determine the top 5 best-selling products based on the total quantity sold

select Product,sum(Quantity) as total_quantity
from e_commerce_dataset
group by Product
order by total_quantity desc
limit 5;

-- 3(b) Provide insights into the characteristics of these products

select Product,Product_Category,min(Sales/Quantity) as min_price,max(Sales/Quantity) as max_price
from e_commerce_dataset
group by Product,Product_Category
order by sum(Quantity) desc;

-- 4(a) Analyze total sales by product category to determine which categories contribute 

select Product_Category,sum(sales) as total_sales
from e_commerce_dataset
group by Product_Category
order by total_sales desc;

-- 4(b) Calculate the percentage contribution of each category to the overall sales

select Product_Category,
round(sum(sales) * 100 / (select sum(sales) from  e_commerce_dataset),2) as sales_percentage
from e_commerce_dataset
group by  Product_Category
order by sales_percentage;

-- 5(a) Calculate the average sales per order

select avg(Sales) as avg_sales_per_order
from e_commerce_dataset;

-- 5(b) top 5 orders by total sales amount(customer_id)

select Customer_Id, sum(Sales) as total_sales
from e_commerce_dataset
group by Customer_Id
order by total_sales desc
limit 5;

-- 6(a) discount vs non discount sales

select
case when Discount > 0 then 'discounted' else 'non-discounted' end as discount_status,
count(*) as order_count,
sum(Sales) as total_sales,
avg(Sales) as avg_sales_per_order
from e_commerce_dataset
group by discount_status;


-- 6(b)  recommendation on profit

select
case when Discount > 0 then 'discounted' else 'non-discounted' end as discount_status,
avg(Profit) as avg_profit
from e_commerce_dataset
group by discount_status 













