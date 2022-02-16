# Write your MySQL query statement below
with rank_board as (
    select a.player_id, min(a.event_date) as first_date
    from Activity as a
    group by a.player_id
)

select round(t.cnt / (select count(distinct a.player_id) as cnt from Activity as a) ,2) as fraction
from (
    select count(distinct a.player_id) as cnt
    from Activity as a
    inner join rank_board
    on a.player_id=rank_board.player_id
    and datediff(a.event_date,rank_board.first_date)=1
) t
