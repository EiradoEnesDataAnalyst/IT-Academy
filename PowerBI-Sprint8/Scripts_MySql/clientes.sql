#### ACTIVE OR NOT , año especifico

select distinct u.id,concat(u.name,' ',u.surname) as full_name
from users as u
join transactions as t
on u.id = t.user_id
where year(t.timestamp) = 2022
and t.declined = 0;

select count(distinct u.id)
from users as u
join transactions as t
on u.id = t.user_id
where year(t.timestamp) = 2024
and t.declined = 0;

#### USERS AMOUNT

select * from users;

select u.id,u.name,u.surname,u.phone,u.email,u.birth_date,u.country,u.city,u.postal_code,u.address,u.user_region
from users as u
join transactions as t
on u.id = t.user_id
group by u.id,u.name,u.surname,u.phone,u.email,u.birth_date,u.country,u.city,u.postal_code,u.address,u.user_region
having sum(t.amount) >= 15000;


select sum(t.amount)
from users as u
join transactions as t
on u.id = t.user_id
where t.declined = 0;


### CONSTUMER INACTIVE BETWEEN 2020-24

select t.user_id,concat(u.name," ",u.surname) AS full_name , sum(t.amount) as tot_amount_historico
from transactions as t
join users as u
on t.user_id = u.id
where user_id not in (select user_id
                      from transactions
                      where year(timestamp) between 2020 and 2024)
and t.declined = 0
group by t.user_id,concat(u.name," ",u.surname);
