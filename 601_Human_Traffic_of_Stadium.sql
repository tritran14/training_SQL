# Write your MySQL query statement below


select id, visit_date, people
from (
    select id, visit_date, people, id-ord_rank as color
    from (
        select id, visit_date, people, dense_rank() over (order by id) as ord_rank
        from Stadium 
        where people >= 100
    ) a
) b
where color in (
    select color
    from (
        select id, visit_date, people, id-ord_rank as color
        from (
            select id, visit_date, people, dense_rank() over (order by id) as ord_rank
            from Stadium 
            where people >= 100
        ) a
    ) b
    group by color
    having count(*)>=3
)
