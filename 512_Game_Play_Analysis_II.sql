# Write your MySQL query statement below
select a.player_id, a.device_id
from Activity as a
inner join (
    select b.player_id, min(b.event_date) as min_date
    from Activity as b
    group by b.player_id
) c
on a.player_id=c.player_id
and a.event_date=c.min_date
