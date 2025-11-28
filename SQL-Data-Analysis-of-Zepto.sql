create table zepto(
sku_id SERIAL Primary Key,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--data exploration

--count of rows
select count(*) from zepto;

select * from zepto 
limit 10

--null value
select * from zepto
where name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL

--different product category
select DISTINCT category
from zepto
order by category

--inStock Vs outOfStock
select outOfStock, count(sku_id)
from zepto
group by outOfStock 

--product name multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count (sku_id) DESC

--data cleaning
--product price=0
select * from zepto
where mrp=0 or discountedSellingPrice=0

delete from zepto
where mrp=0

update zepto
set mrp=mrp/100.0, discountedSellingPrice=discountedSellingprice/100.0

select mrp, discountedSellingPrice from zepto
limit 10 

--top 10 best value products based on the discount percentage
select distinct name, mrp,discountPercent
from zepto
order by discountPercent desc
limit 10

--products with high mrp but out of stock
select distinct name,mrp
from zepto
where outOfStock= True and mrp >300
order by mrp desc

--estimated revenue for each category
select category, 
sum(discountedSellingPrice*availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue desc

--products where mrp is greater than  Rs 500 and discount is less than 10%
select distinct name, mrp, discountPercent
from zepto
where mrp > 500 AND discountPercent<10
order by mrp desc, discountPercent desc

--the top 5 categories offering the highest average discount percentage
select category,
ROUND(AVG(discountPercent),2) as average_discount
from zepto
group by category
order by average_discount desc
limit 5

--price per gram for products above 100g and sort by best value
select distinct name, weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms>=100
order by price_per_gram

--group the products into categories like low, medium, bulk in weight
select distinct name,weightInGms,
case when weightInGms < 1000 then 'low'
	when weightInGms < 5000 then 'medium'
	else 'bulk'
	end as weight_category
from zepto

--total inventory weight per category
select category,
sum(weightInGms*availableQuantity) as total_weight
from zepto
group by category
order by total_weight