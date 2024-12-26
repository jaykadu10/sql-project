-- Join the necessary tables to find the total quantity of each pizza category ordered.category 

select pizza_types.category ,sum(order_details.quantity) as cat
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category
order by cat desc ;

-- Determine the distribution of orders by hour of the day .  

select hour(order_time) ,count(order_id) from orders 
group by hour(order_time)
order by count(order_id) desc
 ;
-- Join relevant tables to find the category-wise distribution of pizzas .

select category ,count(name) from pizza_types
group by category ;


-- Group the orders by date and calculate the average number of pizzas ordered per day.

select avg(quant) from 
	(select  order_date ,sum(quantity ) as quant from order_details 
    join orders
    on orders.order_id =order_details.order_id
    group by order_date) as groupa ;
    
-- Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name ,
sum (order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id 
join order_details
on order_details.pizza_id= pizzas.pizza_id
group by pizza_types.name order by  revenue desc 
limit 3 ;

