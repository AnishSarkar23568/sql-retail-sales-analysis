
 
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
  
