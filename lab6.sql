--- Task 1
/* 1, a) */
select * from dealer,client;
/* 1, b) */
select dealer.id, client.name, client.city, sell.id, sell.amount, sell.date, client.priority
from (dealer inner join client on dealer.id=client.dealer_id) inner join sell on dealer.id=sell.dealer_id and client.id=sell.client_id;
/* 1, c) */
select dealer.id, dealer.name, client.id, client.name from (dealer inner join client on dealer.location=client.city);
/* 1, d) */
select sell.id, sell.amount, client.name, client.city from (sell inner join client on sell.amount>100 and sell.amount<500);
/* 1, e) */
select id,name from dealer;
/* 1, f) */
select dealer.id, dealer.charge, client.name, client.city from (dealer inner join client on dealer.id=client.dealer_id);
/* 1, g) */
select dealer.id, dealer.charge, client.name, client.city from (dealer inner join client on dealer.charge>0.12 and dealer.id=client.dealer_id);
/* 1, h) */
select client.name, client.city, sell.id, sell.date, sell.amount, dealer.name, dealer.charge
from (dealer inner join client on dealer.id=client.dealer_id) inner join sell on dealer.id=sell.dealer_id and client.id=sell.client_id;
/* 1, i) */
---

--- Task 2
/* 2, a) */
create view view1 as
    select count(distinct sell.client_id), sell.date, avg(sell.amount), sum(sell.amount)
    from (sell inner join client on client.id=sell.client_id)
    group by date;
/* 2, b) */
create view view1 as
    select date, sum(sell.amount)
    from sell
    group by date
    order by sum desc;
/* 2, c) */
---
/* 2, d) */
create view view1 as
    select dealer.id,client.city,sum(sell.amount)*dealer.charge as tot_sum
    from (dealer inner join client on dealer.id = client.dealer_id) inner join sell on sell.dealer_id=dealer.id and sell.client_id=client.id
    group by dealer.id,client.city;
/* 2, e) */
create view deal_sal as
    select dealer.id,client.city,count(sell.dealer_id),avg(sell.amount),sum(sell.amount)
    from (dealer inner join client on dealer.id = client.dealer_id) inner join sell on sell.dealer_id=dealer.id and sell.client_id=client.id
    group by dealer.id,client.city
/* 2, f) */
---
/* 2, g) */
---