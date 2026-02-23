### DECLINED TRANS ###
## all clients 2024 ##

select u.id , concat(u.name,' ',u.surname) as full_name,t.amount
from transactions as t
join users as u
on t.user_id = u.id
where t.declined = 1
and year(t.timestamp) = 2024;

## tot amount 2024 ##
select sum(t.amount) as tot_amount_2024_declined
from transactions as t
join users as u
on t.user_id = u.id
where t.declined = 1
and year(t.timestamp) = 2024;

## Record total transactions in a single day ##
## total ##
select date(timestamp),sum(amount)
from transactions
where declined = 0
and year(timestamp) between 2020 and 2024
group by date(timestamp)
order by sum(amount) desc;

## by city ##
select date(t.timestamp),u.city,sum(t.amount)
from transactions as t
join users as u
where t.declined = 0
and year(t.timestamp) between 2020 and 2024
group by date(t.timestamp),u.city
order by sum(t.amount) desc;



### interval days by user_id###

select * from transactions
where user_id = 289


