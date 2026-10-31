drop table if exists zepto;

create table zepto(
sku_id serial primary key,
cateogory varchar(120),
name varchar(100) not null,
mrp numeric(8,2),
discountpercent numeric(5,2),
availablequantity integer,
discounterdsellingprice numeric(8,2),
weightingrams integer,
outofstock boolean,
quantity integer
);
SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'zepto';

  ALTER TABLE public.zepto
RENAME COLUMN weightingrams TO weightinggrams;

--data exploration

--count of rows
select count(*) from zepto;

--sample data
select * from zepto limit 10;

--null values
select * from zepto
where name is null 
or 
cateogory is null 
or 
mrp is null 
or 
discountpercent is null 
or 
discounterdsellingprice is null 
or 
weightinggrams is null 
or 
availablequantity is null 
or 
outofstock is null 
or 
quantity is null ;

--different product cateogories
select distinct cateogory
from zepto
order by cateogory;

--product in stock vs productoutofstock
select outofstock, count(sku_id)
from zepto
group by outofstock;

--product name present multiple times
 select name,count(sku_id) as "number of skus"
 from zepto
 group by name
 having count(sku_id)>1
 order by count(sku_id) Desc;

--data cleaning

--check for the product where price might be=0
select * from zepto 
where mrp=0 
or discounterdsellingprice=0;

--now we have to delete the row where mrp=0
delete from zepto 
where mrp=0;

--convert paise to rupees
update zepto 
set mrp=mrp/100.0, 
discounterdsellingprice=discounterdsellingprice/100.0;

select mrp,discounterdsellingprice from zepto

--now here is business insight
--1) find the top 10 best-value products based on the discount percentage.
select distinct name,mrp,discountpercent
from zepto 
order by discountpercent desc
limit 10;

--2)what are the product with high mrp but outofstock
select distinct name,mrp
from zepto
where outofstock=True and mrp>300
order by mrp desc;

--3)calculate Estimate revenu from each category
select cateogory,
sum(discounterdsellingprice*availablequantity) as total_revenue
from zepto 
group by cateogory 
order by total_revenue;

--4)find all the product where mrp is greater than rupess500 
   --discount is less than 10%
select distinct name,mrp,discountpercent
from zepto
where mrp>500 and discountpercent<10
order by mrp desc, discountpercent desc;

--5)identify the top 5 cateogories offering the highest average discount percentage
select cateogory,
avg(discountpercent) as avg_discount
from zepto 
group by cateogory
order by avg_discount desc
limit 5;

--6)find the pergrams of product above 100g and sort_by best values
select distinct name,weightinggrams,discounterdsellingprice,
ROUND(discounterdsellingprice/weightinggrams,2) as price_per_gram
FROM zepto
where weightinggrams>=100
order by price_per_gram;

--7)grouping the product in to weight cateogories like low,medium,bulk

select distinct name,weightinggrams,
case when weightinggrams<1000 then 'low'
else 'bulk'
end as weight_category
from zepto;

--8)what is the total invernotry weught per cateogory

select cateogory,
sum (weightinggrams * availablequantity) as total_weight
from zepto 
group by cateogory
order by total_weight;





