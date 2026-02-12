### cuales productos venden las empresas de cada pais
# todos los paises venden todos los productos

select c.country, count(distinct(p.id)) as numero_productos
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
group by c.country;

### cuales productos venden cada empresas
# todas las empresas venden todos los productos

select c.id,c.company_name, count(distinct(p.id)) as numero_productos
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
group by c.id,c.company_name ;

### mejores empresas por cantidad vendidas productos
#GENERAL

select c.id,c.company_name,c.country,count(p.id) as numero_productos
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
group by c.id,c.company_name ,c.country
order by count(p.id) desc;


### mejores empresas por vendidas productos
#2020-2024

select c.id,c.company_name,c.country,count(p.id) as numero_productos
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
and year(timestamp) between 2020 and 2024
group by c.id,c.company_name ,c.country
order by count(p.id) desc;

### mejores empresas ingresos
# total

select c.id,c.company_name,c.country,count(p.id) as numero_productos,sum(t.amount) as tot_amount
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
group by c.id,c.company_name ,c.country
order by sum(t.amount) desc;

### mejores empresas ingresos
# 2020-2024
select c.id,c.company_name,c.country,count(p.id) as numero_productos,sum(t.amount) as tot_amount
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
and year(timestamp) between 2020 and 2024
group by c.id,c.company_name ,c.country
order by sum(t.amount) desc;


### confronto 2020/22 - 23/24 ###

## AVG EMPRESA POR PRODUCTO 2020-2022

select c.id,c.company_name,c.country,count(p.id) as numero_productos,avg(t.amount) as tot_amount
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
and year(timestamp) between 2020 and 2022
group by c.id,c.company_name ,c.country
order by avg(t.amount) desc;

## AVG EMPRESA POR PRODUCTO 2023-24

select c.id,c.company_name,c.country,count(p.id) as numero_productos,avg(t.amount) as tot_amount
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
and year(timestamp) between 2023 and 2024
group by c.id,c.company_name ,c.country
order by avg(t.amount) desc;


### empresa que han generado mas gananza 2020-22

select c.id,c.company_name,c.country,sum(t.amount) as tot_amount
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
and year(timestamp) between 2020 and 2022
group by c.id,c.company_name ,c.country
order by sum(t.amount) desc;

## empresa que han generado mas gananza 2023-24

select c.id,c.company_name,c.country,sum(t.amount) as tot_amount
from products as p
join detalles_transactions as dt
on p.id = dt.product_id
join transactions as t
on dt.transaction_id = t.id
join companies as c
on t.company_id = c.id
where t.declined = 0
and year(timestamp) between 2023 and 2024
group by c.id,c.company_name ,c.country
order by sum(t.amount) desc;

###### AC FERMENTUM COLAPASA!!!! ######





