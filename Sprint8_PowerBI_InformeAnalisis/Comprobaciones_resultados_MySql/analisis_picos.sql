### MISMO CLIENTE QUE COMPRA MISMOS PRODUCTOS MAS VECES ###
#Podemos cambiar año , mes y ciudad para ver que cada vez que tenemos un pico muy alto de ingresos
#he debido a un evento aislado de un cliente que compra una cantidad elevada de los mismos productos

select u.city,u.name,u.surname,p.id,p.product_name, p.price_$,count(p.id) as N_productos
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
group by u.city,u.name,u.surname,p.id,p.product_name, p.price_$
order by count(p.id) desc;
