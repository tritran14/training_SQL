# Write your MySQL query statement below
select a.name as 'Employee' from Employee as a join Employee as b
on a.salary > b.salary and a.managerId=b.id
