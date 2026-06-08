create database zepto_inv;
select *from zepto_v2;

alter table zepto_v2  
add column id int auto_increment primary key;

-- data exploration
-- count number fof rows 
select count(*) from zepto_v2;

-- check null values
select *from zepto_v2
where name is null
 or category is null
 or mrp is null
 or discountpercent is null
 or availableQuantity is null
 or discountedsellingprice is null;
 
--  show categories
 select distinct category
from zepto_v2
order by category asc;

-- products of out stock
select outofstock,count(*)
from zepto_v2
group by outofstock;

-- product names multiple times
select name ,count(*)
from zepto_v2
group by name 
order by count(*) desc;

select * from zepto_v2;
-- product with price=0
select * from zepto_v2
where mrp=0 or discountedsellingprice=0;

-- convert paise into rupees
SET SQL_SAFE_UPDATES = 0;
update zepto_v2
set mrp=mrp/100.0,
discountedsellingprice=discountedsellingprice/100.0;
select mrp,discountedsellingprice from zepto_v2;

-- SET SQL_SAFE_UPDATES = 0;
update zepto_v2
set mrp=mrp*100.0,
discountedsellingprice=discountedsellingprice*100.0;
select mrp,discountedsellingprice from zepto_v2;

rollback;

drop table zepto_v2;

-- Q1 top 10 best value produst based on  discount pecentage
select name,mrp,discountPercent from zepto_v2
order by discountPercent desc
limit 10;

-- Q2 prodcuts with high MRP but outofstock
select distinct name,mrp,outofstock
from zepto_v2
where outofstock='true' and mrp>300
order by mrp;

-- Q3 calc estimates revenue for each product 
select category,
SUM(discountedsellingprice* availablequantity) as total_revenue
from zepto_v2
group by category
order by total_revenue;


-- Q4 find all products where mrp is greater than 500 andd discount is less than 10%
select name , mrp,discountPercent
from zepto_v2
where mrp>500 and discountPercent<10
order by mrp desc , discountPercent desc ;

select count(*),name
from zepto_v2
where mrp>500
group by name;

rollback;

select * from zepto_v2;

-- Q5 identify top 5 categories  offering the highest average discount percentage
select category, 
round (avg(discountPercent),2) as avg_discount_percentage
from zepto_v2
group by category
order by avg_discount_percentage desc
limit 5;

-- Q6 find price per gram for products above 100kg and sort by best value
select name,weightInGms,discountedSellingPrice,
round((discountedSellingPrice/weightInGms),2) as price_per_gms
from zepto_v2
where weightInGms>100
order by price_per_gms asc;

-- Q7 group products into categories like low med bulk based on their weigth in grams
select category,name,weightingms ,
case when weightingms<1000 then 'low' 
when weightingms<5000 then 'medium'
else 'bulk'
end as weight_Cat
from zepto_v2 ;

-- Q8 wat is total inventory weight per category
select category,sum(weightInGms * availableQuantity) as total_w
from zepto_v2
group by category
order by total_w;

-- Q9 what is the count of products in each category
SELECT category,
       COUNT(*) AS total_products
FROM zepto_v2
GROUP BY category;

-- Q10 find the product with the highest stock and gruop then on basis of categories
Select *
from zepto_v2
where availableQuantity=(
	select max(availableQuantity)
    from zepto_v2
);

-- Q11 find products that are priced above the average MRP.
select mrp, category
from zepto_v2 
where mrp> (
	select avg(mrp)
    from zepto_v2 
    );
    
-- Q12 Find categories whose average MRP is higher than the overall average MRP
select avg(mrp) as avg_mrp, category
from zepto_v2 
group by category
having avg(mrp)> (
	select avg(mrp)
    from zepto_v2 
    );
    