# Write your MySQL query statement below
select round(sum(i.tiv_2016),2) as tiv_2016
from Insurance as i
where i.tiv_2015 in (
    select tiv_2015
    from Insurance
    group by tiv_2015
    having count(*)>1
    and concat(lat,lon) not in(
        select concat(lat,lon)
        from Insurance
        group by lat,lon
        having count(*)>1
    )
)
