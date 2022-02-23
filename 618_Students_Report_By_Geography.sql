# Write your MySQL query statement below
select America, Asia, Europe
from(
    select row_number() over(order by name) as my_rank, name as America
    from Student
    where continent='America'
) a
left join (
    select row_number() over(order by name) as my_rank, name as Asia
    from Student
    where continent='Asia'
) b
on a.my_rank=b.my_rank
left join(
    select row_number() over(order by name) as my_rank, name as Europe
    from Student
    where continent='Europe'
) c
on a.my_rank=c.my_rank
