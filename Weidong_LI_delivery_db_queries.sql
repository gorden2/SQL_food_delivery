create view order_total as 
select order_detail.orderid, SUM(rest_menu.foodprice*order_detail.quantity) as total 
from rest_menu,order_detail 
where rest_menu.foodid=order_detail.foodid group by order_detail.orderid;

create view undeliver_detail as 
select deliver_detail.orderid, concat_ws(' ', driver_profile.firstname,driver_profile.lastname) as driver, concat_ws(',',address.detail,address.city,address.state,address.zip) as deliver_address, orders.paid, order_total.total 
from deliver_detail,address,driver_profile,orders,order_total
where deliver_detail.currentstatus = 0 and deliveraddress_id = address.address_id and driver_profile.driverid = deliver_detail.driverid and orders.orderid = deliver_detail.orderid and deliver_detail.orderid = order_total.orderid;

create view order_history_5_2 as 
select orders.orderid, orders.userid, m.foodname,m.foodprice, od.quantity, od.quantity*m.foodprice as subtotal 
from rest_menu m, order_detail od, orders 
where od.foodid = m.foodid and orders.orderid = od.orderid and orders.placedate = '2015-5-2';

create view maxtime as 
select od.orderid, MAX(m.preparetime) as maxtime 
from rest_menu m, order_detail od 
where od.foodid = m.foodid group by od.orderid;

create view late_delivery as
select orders.orderid, orders.placetime, orders.finishtime, ADDTIME(e.maxtime,orders.placetime) as estimatetime, timediff(orders.finishtime,ADDTIME(e.maxtime,orders.placetime)) as diff 
from orders 
join maxtime e on e.orderid = orders.orderid 
where orders.paid = 1 and timediff(orders.finishtime,ADDTIME(e.maxtime,orders.placetime)) > CAST("00:05:00" AS TIME) order by diff DESC;

create view rest_reviews as 
select p.restname, avg(r.review_star) as review_star, count(r.orderid) as review_count 
from orders, review_order r,rest_profile p 
where orders.orderid = r.orderid and p.restid = orders.restid group by orders.restid order by review_star DESC;

create view rest_costomers as 
select  orders.restid, p.restname, group_concat(r.userid) as customers 
from review_order r, orders,rest_profile p 
where orders.orderid = r.orderid and p.restid = orders.restid group by orders.restid;

create view menus as 
select p.restname, group_concat(concat(m.foodname,":","$",m.foodprice)) as menu 
from rest_menu m, rest_profile p 
where p.restid = m.restid group by m.restid;

create view user7 as 
select orders.restid from orders where orders.userid = 7;

create view user7u as 
select orders.userid from orders,user7 where orders.restid = user7.restid;

create view user7r as 
select distinct orders.restid from orders, user7u where orders.userid = user7u.userid;

create view rec_user7 as 
select r.restname from rest_profile r, user7r,user7 
where r.restid= user7r.restid and r.restid != user7.restid;



