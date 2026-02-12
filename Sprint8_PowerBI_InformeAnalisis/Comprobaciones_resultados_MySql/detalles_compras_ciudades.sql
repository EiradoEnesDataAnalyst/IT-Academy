### AMADORA ,  2022 - marzo  , products
select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2022
and month(timestamp) = 3 
and u.city = "Amadora"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### AMADORA ,  2021 - april  , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2021
and month(timestamp) = 4 
and u.city = "Amadora"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;


##### BARCELONA 2021 , SEPT

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2021
and month(timestamp) = 9 
and u.city = "Barcelona"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### GDANSK ,  2021 - OCTUBRE  , products
### precios de el mismo producto

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2021
and month(timestamp) = 10 
and u.city = "Gdansk"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### GDANSK ,  2022 - MARZO  , products
### precios de el mismo producto

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2022
and month(timestamp) = 3 
and u.city = "Gdansk"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### GENOA ,  2020 - MARZO  , products
### precios de el mismo producto

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2020
and month(timestamp) = 3 
and u.city = "Genoa"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### GENOA ,  2021 - MARZO  , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2021
and month(timestamp) = 3 
and u.city = "Genoa"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### GOTHENBURG ,  2020 - SEPTIEMBRE  , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2020
and month(timestamp) = 9
and u.city = "Gothenburg"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;


### KRAKOW ,  2021 - AGUST  , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2021
and month(timestamp) = 8
and u.city = "Krakow"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### LISBON ,  2019 - FEBR  , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2019
and month(timestamp) = 2
and u.city = "Lisbon"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;


### LONDON ,  2021 - ENERO  , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2021
and month(timestamp) = 1
and u.city = "London"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;


### LONDON ,  2022 - junio  , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2022
and month(timestamp) = 6 
and u.city = "London"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### MADRID ,  2022 - Septiembre  , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2022
and month(timestamp) = 9
and u.city = "Madrid"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;



### MANCHESTER ,  2021 - JULIO , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2021
and month(timestamp) = 7
and u.city = "Manchester"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### MUNICH ,  2023 - MAYO , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2023
and month(timestamp) = 5
and u.city = "Munich"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### POZNAN ,  2022 - MAYO , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2022
and month(timestamp) = 5
and u.city = "Poznan"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;

### STUTTGART ,  2019 - MARZO , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2019
and month(timestamp) = 3
and u.city = "Stuttgart"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;


### UTRECHT ,  2020 - JUNIO , products

select u.city,p.id,p.product_name, p.price_$,count(p.id) as N_productos
from users as u
join transactions as t
on u.id = t.user_id
join detalles_transactions as dt
on t.id = dt.transaction_id
join products as p
on dt.product_id = p.id
where declined = 0
and year(timestamp) = 2020
and month(timestamp) = 6
and u.city = "Utrecht"
group by u.city,p.id,p.product_name, p.price_$
order by count(p.id) desc;



