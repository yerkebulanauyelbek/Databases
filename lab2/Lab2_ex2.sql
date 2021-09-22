create table customers(
    id integer primary key,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null
);
create table orders(
    code integer primary key,
    customer_id integer references customers(id),
    total_sum double precision not null,
    is_paid boolean not null,
    check (total_sum>0)
);
create table products(
    id varchar primary key,
    name varchar not null unique,
    description text,
    price double precision not null,
    check (price > 0)
);
create table order_items(
    order_code integer references orders(code),
    product_id varchar references products(id),
    quantity integer not null,
    primary key(order_code, product_id)
);

Insert into products values('123','Box','Paper',12.23);
Update products set name ='Pencil' where name='Box';
Delete from products where id = '123';