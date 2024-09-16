--  sqlcase study swiggy data 
-- crete user table 
create table users (
  user_id int, 
  name varchar(225), 
  email varchar(225), 
  password varchar(225)
);
-- insert value into users table
insert into users (user_id, name, email, password) 
values 
  (
    1, 'nitish', 'nitish@gmail.com', 'p252h'
  ), 
  (
    3, 'vartika', 'vartika@gmail.com', 
    '9hu7j'
  ), 
  (
    4, 'ankit', 'ankit@gmail.com', 'lkko3'
  ), 
  (
    5, 'neha', 'neha@gmail.com', '3i7qm'
  ), 
  (
    6, 'anupama', 'anupama@gmail.com', 
    '46rdw2'
  ), 
  (
    7, 'rishabh', 'rishabh@gmail.com', 
    '4sw123'
  );
-- create restaurants table 
create table restaurants(
  r_id int, 
  name varchar(225), 
  cuisine varchar (225)
);
-- insert valuses in resturant table
insert into restaurants 
values 
  (1, 'dominos', 'italian'), 
  (2, 'kfc', 'american'), 
  (3, 'box8', 'north indian'), 
  (4, 'dosa plaza', 'south indian'), 
  (5, 'china town', 'chinese');
-- create table food 
create table food (
  f_id int, 
  f_name varchar(255), 
  type varchar(255)
);
-- insert values into  food table
insert into food 
values 
  (1, 'non-veg pizza', 'non-veg'), 
  (2, 'veg pizza', 'veg'), 
  (3, 'choco lava cake', 'veg'), 
  (4, 'chicken wings', 'non-veg'), 
  (5, 'chicken popcorn', 'non-veg'), 
  (6, 'rice meal', 'veg'), 
  (7, 'roti meal', 'veg'), 
  (8, 'masala dosa', 'veg'), 
  (9, 'rava idli', 'veg'), 
  (10, 'schezwan noodles', 'veg'), 
  (11, 'veg manchurian', 'veg');
-- create menu table
create table menu (
  menu_id int, r_id int, f_id int, price int
);
-- insert into menu table
insert into menu (menu_id, r_id, f_id, price) 
values 
  (1, 1, 1, 450), 
  (2, 1, 2, 400), 
  (3, 1, 3, 100), 
  (4, 2, 3, 115), 
  (5, 2, 4, 230), 
  (6, 2, 5, 300), 
  (7, 3, 3, 80), 
  (8, 3, 6, 160), 
  (9, 3, 7, 140), 
  (10, 4, 6, 230), 
  (11, 4, 8, 180), 
  (12, 4, 9, 120), 
  (13, 5, 6, 250), 
  (14, 5, 10, 220), 
  (15, 5, 11, 180);
-- create order table
create table orders (
  order_id int, user_id int, r_id int, 
  amount int, date date, partner_id int, 
  delivery_time int, delivery_rating int, 
  restaurant_rating int
);
-- insert data into into orders table
insert into orders (
  order_id, user_id, r_id, amount, date, 
  partner_id, delivery_time, delivery_rating, 
  restaurant_rating
) 
values 
  (1001, 1, 1, 550, '2022-05-10', 1, 25, 5, 3), 
  (1002, 1, 2, 415, '2022-05-26', 1, 19, 5, 2), 
  (1003, 1, 3, 240, '2022-06-15', 5, 29, 4, null), 
  (1004, 1, 3, 240, '2022-06-29', 4, 42, 3, 5), 
  (1005, 1, 3, 220, '2022-07-10', 1, 58, 1, 4), 
  (1006, 2, 1, 950, '2022-06-10', 2, 16, 5, null), 
  (1007, 2, 2, 530, '2022-06-23', 3, 60, 1, 5), 
  (1008, 2, 3, 240, '2022-07-07', 5, 33, 4, 5), 
  (1009, 2, 4, 300, '2022-07-17', 4, 41, 1, null), 
  (1010, 2, 5, 650, '2022-07-31', 1, 67, 1, 4), 
  (1011, 3, 1, 450, '2022-05-10', 2, 25, 3, 1), 
  (1012, 3, 4, 180, '2022-05-20', 5, 33, 4, 1), 
  (1013, 3, 2, 230, '2022-05-30', 4, 45, 3, null), 
  (1014, 3, 2, 230, '2022-06-11', 2, 55, 1, 2), 
  (1015, 3, 2, 230, '2022-06-22', 3, 21, 5, null), 
  (1016, 4, 4, 300, '2022-05-15', 3, 31, 5, 5), 
  (1017, 4, 4, 300, '2022-05-30', 1, 50, 1, null), 
  (1018, 4, 4, 400, '2022-06-15', 2, 40, 3, 5), 
  (1019, 4, 5, 400, '2022-06-30', 1, 70, 2, 4), 
  (1020, 4, 5, 400, '2022-07-15', 3, 26, 5, 3), 
  (1021, 5, 1, 550, '2022-07-01', 5, 22, 2, null), 
  (1022, 5, 1, 550, '2022-07-08', 1, 34, 5, 1), 
  (1023, 5, 2, 645, '2022-07-15', 4, 38, 5, 1), 
  (1024, 5, 2, 645, '2022-07-21', 2, 58, 2, 1), 
  (1025, 5, 2, 645, '2022-07-28', 2, 44, 4, null);
  
-- create delivery_partners table.
create table delivery_partners (
  partner_id int, 
  partner_name varchar(50)
);
-- insert data into the delivery_partners table.
insert into delivery_partners (partner_id, partner_name) 
values 
  (1, 'suresh'), 
  (2, 'amit'), 
  (3, 'lokesh'), 
  (4, 'kartik'), 
  (5, 'gyandeep');
-- create order_details table.
create table order_details (id int, order_id int, f_id int);
-- insert data into the order_deatils table.
insert into order_details (id, order_id, f_id) 
values 
  (1, 1001, 1), 
  (2, 1001, 3), 
  (3, 1002, 4), 
  (4, 1002, 3), 
  (5, 1003, 6), 
  (6, 1003, 3), 
  (7, 1004, 6), 
  (8, 1004, 3), 
  (9, 1005, 7), 
  (10, 1005, 3), 
  (11, 1006, 1), 
  (12, 1006, 2), 
  (13, 1006, 3), 
  (14, 1007, 4), 
  (15, 1007, 3), 
  (16, 1008, 6), 
  (17, 1008, 3), 
  (18, 1009, 8), 
  (19, 1009, 9), 
  (20, 1010, 10), 
  (21, 1010, 11), 
  (22, 1010, 6), 
  (23, 1011, 1), 
  (24, 1012, 8), 
  (25, 1013, 4), 
  (26, 1014, 4), 
  (27, 1015, 4), 
  (28, 1016, 8), 
  (29, 1016, 9), 
  (30, 1017, 8), 
  (31, 1017, 9), 
  (32, 1018, 10), 
  (33, 1018, 11), 
  (34, 1019, 10), 
  (35, 1019, 11), 
  (36, 1020, 10), 
  (37, 1020, 11), 
  (38, 1021, 1), 
  (39, 1021, 3), 
  (40, 1022, 1), 
  (41, 1022, 3), 
  (42, 1023, 3), 
  (43, 1023, 4), 
  (44, 1023, 5), 
  (45, 1024, 3), 
  (46, 1024, 4), 
  (47, 1024, 5), 
  (48, 1025, 3), 
  (49, 1025, 4), 
  (50, 1025, 5);
-- 1 find customers who have never ordered
select 
  u.name as never_ordered, 
  o.order_id 
from 
  users u 
  left join orders o on u.user_id = o.user_id 
where 
  o.order_id is null 
group by 
  u.name, 
  o.order_id;
-- 2 average price/dish
select 
  f.f_name as dishes,
  avg (price) as average_price 
from 
  menu m 
  join food f on m.f_id = f.f_id 
group by 
 dishes
order by 
  average_price;
-- 3 find the top restaurant in terms of the number of orders for a given month
with order_cte as (
  select 
    r.name as top_restaurants, 
    month(o.date) as months, 
    count(o.order_id) as order_count, 
      DENSE_RANK() over (
      partition by month(o.date) 
      order by 
        count(o.order_id) desc
    ) as rn 
  from 
    restaurants r 
    inner join orders o on o.r_id = r.r_id 
  group by 
    r.name, 
    month(o.date)
) 
select 
  top_restaurants, 
  order_count, 
  months 
from 
  order_cte 
where 
  rn = 1 
order by 
  months;
-- 4 restaurants with monthly sales greater than x for
-- assuming  x=avg-sale
with res_name_cet as (
  select 
    r.name as restaurants, 
    sum(o.amount) as amount, 
    month(o.date) as months 
  from 
    orders o 
    join restaurants r on r.r_id = o.r_id 
  group by 
    r.name, 
    month(o.date)
) 
select 
  restaurants, 
  months, 
  amount as sale 
from 
  res_name_cet 
where 
  amount > (
    select 
      avg(amount) 
    from 
      res_name_cet
  ) 
order by 
  months, 
restaurants;
-- 5 show all orders with order details for a particular customer in a particular date range
select 
  o.order_id, 
  o.user_id, 
  o.amount, 
  d.f_id, 
  o.date as date_range 
from 
  orders o 
  join order_details d on o.order_id = d.order_id 
where 
  o.user_id = 1 
  and date_range  between '2022-05-10' 
  and '2022-07-28';
-- 6 find restaurants with max repeated customers
select 
  r.name as restaurants,
  count(o.user_id) as customer_count 
from 
  orders as o 
  join restaurants r on r.r_id = o.r_id 
group by 
 restaurants
order by 
  customer_count desc;
-- 7 month over month revenue growth of swiggy 
with rev_cte as (
  select 
    month(date) as month, 
    sum(amount) as revenue 
  from 
    orders 
  group by 
    month(date)
) 
select 
  month, 
  revenue, 
  (
    revenue - lag(revenue, 1, 0) over (
      order by 
        month
    )
  ) / lag(revenue, 1, 0) over (
    order by 
      month
  ) * 100 as mom_growth 
from 
  rev_cte 
order by 
  month;
-- 8 customer — favourite food
select 
  f.f_name as food, 
  (
    sum(m.price)
  ) as max_sale 
from 
  menu m 
  join food f on f.f_id = m.f_id 
group by 
  food 
order by 
  max_sale desc 
limit 
  1;
-- 9 find the most loyal customers for all restaurant
select 
  r.name as restaurants, 
  u.name as loyal_customer, 
 sum(  o.amount) as purchase_amount  
from 
  orders o 
  join users u on o.user_id = u.user_id 
  JOIN 
  restaurants r ON o.r_id = r.r_id
group by 
  r.name,
  u.name
order by 
  purchase_amount   desc ;

-- 10 month-over-month revenue growth of a restaurant 

with rev_cte as (
  select 
    r.name as restaurant , 
    month(date) as month, 
    sum(amount) as revenue 
  from 
    orders o 
    join resturants r on r.r_id = o.r_id 
  group by 
   restaurant ,
    month(date)
) 
select 
  restaurant, 
  month, 
  revenue, 
  (
    revenue - lag(revenue, 1, 0) over (
      order by 
        month
    )
  ) / lag(revenue, 1, 0) over (
    order by 
      month
  ) * 100 as mom_growth 
from 
  rev_cte 
order by 
  names, 
  month;
