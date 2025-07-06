select * from [dbo].[KMS Sql Case Study1]

select * from [dbo].[Order_Status]

---Q1. Which product category had the highest sales?

select top 1 [Product_Category],
	sum (sales)as [total_sales]
	from [KMS Sql Case Study1]
	group by Product_Category
	order by [total_sales] desc

--- Q2.what are the top 3 and buttom 3 region in terms of sales

select
	top 3 [Region],sum([sales]) as [Total Sales]
	from [KMS Sql Case Study1]
	group by Region
	order by [Total Sales] desc

select 
	top 3 [Region],sum([sales]) as [Total Sales]
	from [KMS Sql Case Study1]
	group by Region
	order by [Total Sales] asc

-- Q3. the Total Sales of appliances in ontario?--

select Region,
	SUM(sales) as [Total Sales]
	from [KMS Sql Case Study1]
	where Region='ontario'
	group by Region
	
	

--Q4. Advice the management of KMS on what to do to increase the revenue from the buttom 10 customer 
Select 
	top 10 [Customer_Name], SUM([Sales]) as [Total Sales]
	from [KMS Sql Case Study1]
	group by Customer_Name
	order by [Total Sales] asc

///*To increase the revenue from the bottom 10 customers, the company should: Reach  out to their customers  to understand their past experience, 
or carry out a  Survey to Understand  customers needs and their level of satisfacton with their services. They sould Give discounts on their most viewed or purchased products, Upsell and Cross-sell Offers,
Offer faster delivery, better after-sales support.*///

---Q5. KMS incurred the Most shipping cost using which shipping method ?

Select 
	Top 1 [Ship_Mode], SUM([Shipping_Cost]) as [Total Shipping Cost]
	from [KMS Sql Case Study1]
	group by Ship_Mode
	order by [Total Shipping Cost] desc

---Q6. Who are the most valuable customer, and what products or services did they typically purchase?

select  
	TOP 10 [Customer_Name],Product_Name, SUM(sales) as [Total Sales]
  from [KMS Sql Case Study1]
	Group by Customer_Name,Product_Name
	order by [Total Sales] desc

---Q7. Which small business customer have the highest sales ?

select 
top 1 Customer_Name,Customer_Segment, SUM([Sales]) as [Total Sales]
   from [KMS Sql Case Study1]
   where Customer_Segment ='small Business'
   group by Customer_Name,Customer_Segment
   order by [Total Sales] desc


   --Q8. Which corporate customer placed the most number of orders in 2009 -2012?

select * from [dbo].[KMS Sql Case Study1]

 select 
 top 1  Customer_Name, count([Order_ID]) as [Total order]
	from [KMS Sql Case Study1]
	where Customer_Segment ='corporate' and Order_Date between '2009-01-01' and '2012-12-31'
	group by Customer_Name
	order by [Total order] desc

	-- Q9. Which consumer customer was the most profitable one?

select top 1 Customer_Name,Customer_Segment, sum([Profit]) as [Total profit]
	from [KMS Sql Case Study1]
	where Customer_Segment ='Consumer'
	group by Customer_Name,Customer_Segment
	order by [Total profit] desc

alter table [dbo].[KMS Sql Case Study1]
alter column Profit float (10)

--Q10. Which customer returned items, and what segments do they belong to?

select distinct  Customer_Name,Customer_Segment,[Status]
	from [KMS Sql Case Study1]
	join [dbo].[Order_Status]
	on [KMS Sql Case Study1].Order_ID = [dbo].[Order_Status].[Order_ID]

---/*Q11.  If the delivery truck is the most economical but the slowest shipping method and express air is the fastestbut the most expensiv one, 
---do you think the company appropriately spent shipping costs based on the Order Priority?/


Select
	Order_Priority, Ship_Mode,
	COUNT([Order_ID]) AS [order count],
	SUM(shipping_cost) AS [Total shipping cost]
from  
	[KMS Sql Case Study1] 
group by Order_Priority,Ship_Mode
order by Order_Priority,Ship_Mode desc
	

