# Write your MySQL query statement below
select e.name
from Employee as e
inner join (
    select count(*) as cnt, managerId
    from Employee
    group by managerId
) as tmp
on e.id=tmp.managerId
and tmp.cnt>=5
