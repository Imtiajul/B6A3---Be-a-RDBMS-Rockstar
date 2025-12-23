
-- query 1 
select b.id as booking_id, u.name as customer_name,  v.name as vehicle_name, b.start_date, b.end_date, b.status 
from bookings as b 
join users u on b.user_id = u.id
join vehicles as v on b.vehicle_id = v.id

-- query 2
select v.* from vehicles v where not exists (
  select 1
  from bookings b
  where v.id = b.vehicle_id
)

-- query 3
select v.* from bookings as b join vehicles as v on b.vehicle_id = v.id where type = 'car'

-- query 4
select v.name as vehicle_name, count(b.*) as total_bookings from bookings as b
join vehicles as v on b.vehicle_id = v.id
group by v.name having count(b.*) > 2
