# Write your MySQL query statement below
select order_db.id, order_db.company, order_db.salary
from (
    select id,company,salary,row_number() over (partition by company order by salary) as ord
    from Employee
    order by company, ord
) as order_db
inner join (
    select company, count(*) as cnt
    from Employee 
    group by company
) as cnt_db
where order_db.company=cnt_db.company
and (order_db.ord=floor((cnt_db.cnt+1)/2) or order_db.ord=floor((cnt_db.cnt+2)/2))
