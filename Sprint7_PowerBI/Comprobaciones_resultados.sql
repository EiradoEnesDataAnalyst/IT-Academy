######## MAIN PAGE ######

### (CONTROLO VALUDA) ###
### controlar si hay transacciones donde el precio pagado es diferente de el precio real ###

create view controlo_pagos as
select u.id,
       u.user_region,
       dt.product_id,
       t.amount as precio_pagado,
       p.price_$ as precio_real,
       if(t.amount != p.price_$, "Problema" , "Ok") as verifica_anomalias
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join users as u
on t.user_id = u.id
where t.id in (select transaction_id
               from detalles_transactions
               group by transaction_id
               having count(product_id) = 1);
               
select count(*) as tot_anomalias
from controlo_pagos
where verifica_anomalias = "Problema";

#### algunos productos tienen mas de un precio!

select p.product_name,count(distinct(p.price_$))
from detalles_transactions as d
join products as p
on d.product_id = p.id
group by p.product_name
having count(distinct(p.price_$)) >=2;


########## GLOBAL vs GERMANY ##########

#global
select avg(t.amount) 
from transactions as t
join companies as c
on t.company_id = c.id
and t.declined = 0;

#global-2021
select avg(t.amount) 
from transactions as t
join companies as c
on t.company_id = c.id
where year(t.timestamp) = 2021
and t.declined = 0;

#germany - 2018 - companies
select round(avg(t.amount),2)
from transactions as t
join companies as c
on t.company_id = c.id
where year(t.timestamp) = 2018
and c.country = "Germany"
and t.declined = 0;

#germany - 2019 - users
select round(avg(t.amount),2)
from transactions as t
join users as u
on t.user_id = u.id
where year(t.timestamp) = 2019
and u.country = "Germany"
and t.declined = 0;

############# CLIENTS #############

#### best product sell(Winterfell)

select count(d.product_id ),p.product_name
from transactions as t
join detalles_transactions as d
on t.id = d.transaction_id
join products as p
on d.product_id=p.id
where t.declined = 0
group by product_name;

##### best client avg (no hace falta consulta dinamica pero se quieremos reutilizarla en futuro si!)

select u.id,u.name,round(avg(t.amount),2) as avg_amount
from users as u
join transactions as t
on u.id = t.user_id
where t.declined = 0
group by u.id,u.name
order by avg(t.amount) desc;


#### best client amount total (no hace falta consulta dinamica pero se quieremos reutilizarla en futuro si!)

select u.id,u.name,sum(t.amount) as tot_amount
from users as u
join transactions as t
on u.id = t.user_id
where t.declined = 0
group by u.id,u.name
order by sum(t.amount) desc;


##### cheaper and expensive price by costumer
with ranked as (select u.id as user_id,
                       u.name ,
                       p.product_name,
                       p.price_$,
                       row_number() over (partition by u.id order by p.price_$ asc)  as rn_min,
                       row_number() over (partition by u.id order by p.price_$ desc) as rn_max
                       from users as u
                       join transactions as t
                       on u.id = t.user_id
					   join detalles_transactions as d 
					   on t.id = d.transaction_id
                       join products as p           
                       on d.product_id = p.id
                       where t.declined = 0)

select user_id, name, product_name, price_$, 'cheapest' as type
from ranked
where rn_min = 1

union all

select user_id, name, product_name, price_$, 'most_expensive' as type
from ranked
where rn_max = 1
order by user_id, type;

####### cheap and expensive products

select *
from products
order by price_$ asc
limit 1;

select *
from products
order by price_$ desc
limit 1;

### count N products
select count(d.product_id)
from detalles_transactions as d
join transactions as t
on d.transaction_id = t.id
where declined = 0;

#group by users
select u.id,u.name,count(d.product_id)
from detalles_transactions as d
join transactions as t
on d.transaction_id = t.id
join users as u
on t.user_id = u.id
where declined = 0
group by u.id,u.name;


### conclusiones finales : stuttgart 1 ciudad por avg, Genova segunda...

select u.city,avg(amount) as avg_amount
from users as u
join transactions as t
on u.id = t.user_id
where t.declined = 0
group by u.city
order by avg(amount) desc;







