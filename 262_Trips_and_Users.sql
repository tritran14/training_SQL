select t.request_at as Day, round(sum(if(t.status='completed',0,1)) / count(distinct t.id),2) as 'Cancellation Rate'
from Trips as t
inner join Users as client
on t.client_id=client.users_id
inner join Users as driver
on t.driver_id=driver.users_id
where client.banned='No'
and driver.banned='No'
and t.request_at >= '2013-10-01'
and t.request_at <= '2013-10-03'
group by t.request_at
