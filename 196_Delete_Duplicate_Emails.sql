# Write your MySQL query statement below
delete from Person
where id not in (
    select id from (
        select min(p1.id) as id 
        from Person as p1
        group by p1.email
    ) t
)
