# Write your MySQL query statement below
select id, month, salary
from (
    select e1.id, e1.month, ifnull(e1.salary,0)+ifnull(e2.salary,0)+ifnull(e3.salary,0) as salary, row_number() over(partition by e1.id order by e1.month desc) as my_rank
    from Employee as e1
    left join Employee as e2
    on e1.id=e2.id and e1.month-1=e2.month
    left join Employee as e3
    on e1.id=e3.id and e1.month-2=e3.month
    order by e1.id, e1.month desc
) a
where a.my_rank!=1
