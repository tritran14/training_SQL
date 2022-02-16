# Write your MySQL query statement below
select d.name as 'Department', e.name as 'Employee', e.salary as 'Salary'
from Employee as e join Department as d
on e.departmentId=d.id 
join (
    select max(salary) as salary, e2.departmentId from Employee as e2 
    group by e2.departmentId 
) best_salary
on e.departmentId=best_salary.departmentId
and e.salary=best_salary.salary
