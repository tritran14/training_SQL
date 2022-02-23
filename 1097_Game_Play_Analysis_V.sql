with first_date_install as (
    select player_id, min(event_date) as install_dt
    from Activity
    group by player_id
)

select 
    i.install_dt, 
    count(i.player_id) as installs,
    round(count(a.player_id) / count(i.player_id),2) as Day1_retention
from first_date_install as i
left join Activity as a
on i.player_id=a.player_id
and datediff(a.event_date,i.install_dt)=1
group by i.install_dt
