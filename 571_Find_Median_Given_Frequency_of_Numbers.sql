

with t1 as (
    select num, frequency, sum(frequency) over (order by num) as prefix_sum
    from Numbers
), t2 as (
    select sum(a.frequency)/2 as middle, if(sum(a.frequency)%2=0,1,0) as is_even
    from Numbers as a
)

select round((ans1+ans2) / 2,1) as median
from (
    (
        select num as ans1
        from t1
        where prefix_sum >= (
            select middle
            from t2
        )
        limit 1
    ) b1
    join
    (
        select num as ans2
        from t1
        where prefix_sum >= (
            select middle
            from t2
        ) + (
            select is_even
            from t2
        )
        limit 1
    ) b2
) 
