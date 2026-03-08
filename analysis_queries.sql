create database project;
use project;
 create table customers ( customer_id int primary key , name varchar(50));
 insert into customers values (1,'Rahul'),(2,'Aman'),(3,'Anita'),(4,'Riya');
 select * from   customers

 create table products ( product_id int primary key , product varchar(50),category varchar(50),cost int);
  insert into products values (10,'shors','footwear',900),(11,'jeans','clothing',1500),(12,'cap','accessories',100),(13,'jacket','clothing',1200);
  select * from   products
 
  create table orders ( order_id int primary key , customer_id int,product_id int,revenue int );
 insert into orders values (101,1,10,1500),(102,3,11,2400),(103,1,12,300);
  select * from   orders ;
 
 -- Total revenue
  select sum(revenue ) as total_revenue from orders;

  -- Revenue by Product
  SELECT products.product, SUM(orders.revenue) AS total_revenue
FROM products
JOIN orders
ON products.product_id = orders.product_id
GROUP BY products.product;

  -- Profit by Product
  select  products . product , sum(orders . revenue -  products.cost) as profit from  products join orders on  products .product_id = orders .product_id 
   group by  products . product ;
  -- Top Customer by Revenue
  select   customers . name , sum(orders . revenue ) as revenue  from   customers join orders on 
   customers . customer_id = orders . customer_id 
    group by  customers . name order by revenue desc limit 1 ;
   -- Products That Never Sold
    select  products . product  as profit from  products left join  orders on  products .product_id = orders .product_id 
    where  orders . order_id is null ;
   -- Customers Who Never Ordered
   select   customers . name  as  customer from   customers left join  orders on   customers . customer_id = orders . customer_id 
    where  orders . order_id is null ;
  
