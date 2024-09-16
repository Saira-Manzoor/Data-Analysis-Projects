-- Assignmet#2-SQL Case Study-dannys_diner

create database dannys_diner;
use dannys_diner;
create table sales(
customer_id char,
order_date date,
product_id int 
);
insert into sales(customer_id , order_date , product_id  )
values 
 ('a', '2021-01-01', '1'),
  ('a', '2021-01-01', '2'),
  ('a', '2021-01-07', '2'),
  ('a', '2021-01-10', '3'),
  ('a', '2021-01-11', '3'),
  ('a', '2021-01-11', '3'),
  ('b', '2021-01-01', '2'),
  ('b', '2021-01-02', '2'),
  ('b', '2021-01-04', '1'),
  ('b', '2021-01-11', '1'),
  ('b', '2021-01-16', '3'),
  ('b', '2021-02-01', '3'),
  ('c', '2021-01-01', '3'),
  ('c', '2021-01-01', '3'),
  ('c', '2021-01-07', '3');
  
create table menu (
product_id char ,
product_name varchar(50),
price int
);

insert into menu( product_id  ,
product_name ,
price
)
values 
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  
create table members (
  customer_id varchar(1),
  join_date date
);

insert into members (customer_id, join_date)
values ('a', '2021-01-07'), ('b', '2021-01-09');

  -- 1. what is the total amount each customer spent at the restaurant?  
  select s.customer_id,  sum(m.price) as total_amount  
  from menu m
  join sales s on m.product_id=s.product_id
  group by s.customer_id
  order by s.customer_id;
  
-- 2. how many days has each customer visited the restaurant?

select s.customer_id, 
count(distinct s.order_date) as days 
from sales as s
  group by s.customer_id
  order by s.customer_id;
 
-- 3. what was the first item from the menu purchased by each customer?
  

with cte_order as(
select sales.customer_id, menu.product_name,

row_number() over (
partition by sales.customer_id 
 order by sales.order_date,
		sales.product_id 
 )
 as item_order from sales
 join menu on menu.product_id=sales.product_id
 
)
select * from cte_order 
where item_order=1;

    -- 4. what is the most purchased item on the menu and how many times was it purchased by all customers?
-- most purchased item 
select 
	m.product_name, 
	count(s.product_id) as purchase_count
from 
	sales s
inner join 
	menu m on s.product_id = m.product_id
group by 
	m.product_name
order by 
	purchase_count desc
limit 1;

-- how many times was it purchased by all customers
select 
	  s.customer_id ,count(s.product_id) as ramen_purchase_count
from 
	sales s
join 
	menu m on m.product_id = s.product_id
where 
	m.product_name = "ramen"
group by customer_id;

-- 5. which item was the most popular for each customer?
select 
	customer_id, 
	product_name, 
	count as popular_item_count
from (
	select 
		customer_id, 
		m.product_name, 
		count(m.product_name) as count,
		row_number() over (
        partition by customer_id 
        order by count(m.product_name) desc) as rn
	from 
		sales s
	join 
		menu m on m.product_id = s.product_id
	group by 
		customer_id, 
		m.product_name
) t
where 
	rn = 1;

-- 6. which item was purchased first by the customer after they became a member?

with cte_order as (
  select 
    sales.customer_id, 
    menu.product_name, 
    row_number() over (partition by sales.customer_id order by sales.order_date, sales.product_id) as item_order
  from 
    sales
  join 
    menu on menu.product_id = sales.product_id
  join 
    members on members.customer_id = sales.customer_id
  where 
    join_date <= order_date
)
select 
  *
from 
  cte_order
where 
  item_order = 1;
  
  -- 7. which item was purchased just before the customer became a member?

with cte_order as (
  select 
    sales.customer_id, 
    menu.product_name, 
    row_number() over (partition by sales.customer_id order by sales.order_date, sales.product_id) as item_order
  from 
    sales
  join 
    menu on menu.product_id = sales.product_id
  join 
    members on members.customer_id = sales.customer_id
  where 
    join_date > order_date
)
select 
  *
from 
  cte_order
where 
  item_order = 1;
  
  
  
  -- 8. what is the total items and amount spent for each member before they became a member?
 
 select 
  s.customer_id, 
  sum(m.price) as total_amount, 
  count(s.product_id) as total_items
from 
  sales s
join 
  menu m on m.product_id = s.product_id
join 
  members mb on mb.customer_id = s.customer_id
where 
  s.order_date < mb.join_date
group by 
  s.customer_id
order by 
  s.customer_id;
  
  -- 9.  if each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select 
  s.customer_id, 
  sum(case when m.product_name = 'sushi' then m.price * 20 else m.price * 10 end) as total_points
from 
  sales s
join 
  menu m on m.product_id = s.product_id

group by 
  s.customer_id;

-- 10. in the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer a and b have at the end of january?

select s.customer_id, sum(
  case 
    when s.order_date between mb.join_date and mb.join_date + interval 6 day then m.price * 20
    when m.product_name = 'sushi' then m.price * 20
    else m.price * 10
  end
) as total_points
from sales s
join menu m on m.product_id = s.product_id
join members mb on mb.customer_id = s.customer_id
where s.order_date <= '2021-01-31'
and s.customer_id in ('a', 'b')
group by s.customer_id;
