# Write your MySQL query statement below
with t1 as (
    select avg(amount) as amount, department_id, date_format(pay_date, '%Y-%m') as pay_month
    from Salary as s
    join Employee as e
    on s.employee_id=e.employee_id
    group by department_id, month(pay_date), year(pay_date)
), t2 as (
    select avg(amount) as avg_amount, date_format(pay_date, '%Y-%m') as pay_month
    from Salary as s
    join Employee as e
    on s.employee_id=e.employee_id
    group by month(pay_date), year(pay_date)
)

select t1.pay_month, t1.department_id,
case 
when t1.amount>t2.avg_amount then 'higher'
when t1.amount<t2.avg_amount then 'lower'
when t1.amount=t2.avg_amount then 'same'
end as comparison
from t1
join t2
on t1.pay_month=t2.pay_month



