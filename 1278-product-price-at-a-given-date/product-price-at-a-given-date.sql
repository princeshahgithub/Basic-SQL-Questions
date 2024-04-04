# Write your MySQL query statement below
select distinct product_id, price from 
(
select product_id
, last_value(new_price) over (partition by product_id order by change_date rows between unbounded preceding and unbounded following) price
from products
where change_date < '2019-08-17'
UNION
select product_id, 10 from products group by product_id having min(change_date) > '2019-08-16'
) abc;