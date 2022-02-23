# Write your MySQL query statement below
select name
from(
    select c.name, count(*) over (partition by v.candidateId) as cnt
    from Candidate as c
    inner join Vote as v
    on c.id=v.candidateId
    order by cnt desc
) tmp
limit 1
