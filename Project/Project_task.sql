---Task 1
---1
select sender_id from package inner join truck on package_id=pack_id where status='Undone';
---2
select recipient_id from (package inner join shipment on package_id=shipment.pack_id) inner join truck on package_id=truck.pack_id where status='Undone';
---Task 2
select max(cnt) from (select count(sender_id) as cnt from package where send_date_time > '2019-12-31 23:59:59' and send_date_time<'2020-12-31 23:59:59' group by sender_id) as max1;
---Task 3
select max(cnt) from (select sum(ship_price) as cnt from package as cnt group by sender_id) as max1;
---Task 4
select count(street) from customers where customers.street like 'R%';
---Task 5
select pack_id from location where executed=false;
