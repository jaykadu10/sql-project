create database pizza;
use pizza;
select* from pizzas;

create table orders (
order_id int not null,
order_date date not null ,
order_time time not null ,
primary key(order_id )
);


create table order_details(
order_details_id int not null,
order_id int not null ,
pizza_id text not null ,
quantity int not null ,
primary key (order_details_id)
);




select * from orders;

--  Retrieve the total number of orders placed. FIRST QUERY 

select count(order_id) from orders;

-- Calculate the total revenue generated from pizza sales. SECOND QUE

SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2)
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
    
    -- Identify the highest-priced pizza.  THIRD QUESTION 
    
    Select name from pizza_types 
    join pizzas
    on pizzas.pizza_type_id = pizza_types.pizza_type_id
    order by price desc
    limit 1;
    
    
    
    -- Identify the most common pizza size ordered.
    
    SELECT size from pizzas;
    
select pizzas.size ,count(order_details.order_details_id) as order_count
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size order by  order_count desc
limit 1;  

-- List the top 5 most ordered pizza types along with their quantities. 


select pizza_types.name ,count(order_details.quantity) as quan
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name 
order by quan desc 
limit 5

