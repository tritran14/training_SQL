with label as (
    select 
    distinct spend_date, 'mobile' as platform
    from Spending
    union all
    select
    distinct spend_date, 'desktop' as platform
    from Spending
    union all
    select
    distinct spend_date, 'both' as platform
    from Spending
), tb as (
    select s.user_id, s.spend_date, sum(s.amount) as sum, if(count(*)=2,'both',s.platform) as label
    from Spending as s
    group by s.user_id, s.spend_date
)

select label.spend_date, label.platform, ifnull(sum(tb.sum),0) as total_amount, ifnull(count(distinct user_id),0) as total_users
from label
left join tb
on label.platform=tb.label and label.spend_date=tb.spend_date
group by label.spend_date, label.platform
