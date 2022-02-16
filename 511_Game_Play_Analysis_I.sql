# Write your MySQL query statement below
select a.player_id, a.first_login
from (
    select c.player_id, c.event_date as first_login from (
        select b.player_id, b.event_date , dense_rank() over(partition by b.player_id order by b.event_date) as my_rank
        from Activity as b
    ) as c
    where c.my_rank=1
) as a
