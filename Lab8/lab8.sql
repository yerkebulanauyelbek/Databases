-- 1 A
create or replace function increment(x integer)
returns integer AS
    $$
        BEGIN
            return $1+1;
        END;
    $$
language 'plpgsql';

-- 1 B
create or replace function sum_of_ints(integer, integer)
returns integer as
    $$
        BEGIN
            return $1+$2;
        end
    $$
language 'plpgsql';

-- 1 C
create or replace function divides_by_2(x integer)
returns boolean AS
    $$
        begin
            if x % 2 == 0 then
                return true;
            else
                return false;
            end if;
        end;

    $$
language 'plpgsql';

--1 d
CREATE or replace function password(x text)
returns boolean as
    $$
        BEGIN
            if length(x) >= 8 and length(x) <= 15 then return True;
            else return FALSE;
            end if;
        end;
    $$
language 'plpgsql';

--1 e
create function two_increment_decrement(a integer,out a_plus integer,out a_minus integer) as
    $$
    begin
        a_plus=a+1;
        a_minus=a-1;
    end;
    $$
    language  'plpgsql';
select * from two_increment_decrement(1);

-- 2
create table persons(
    id integer primary key,
    age int,
    name varchar(60),
    birthday date,
    today date default now()

);

--a
create or replace function curr_time()
returns trigger as
    $$
        begin
            if(name!=new.name) then new.today = current_date;
            end if;
            return new;
        end;
    $$
language 'plpgsql';

create trigger today_1
    before update
    on persons
    for each row
    execute procedure curr_time();
insert into persons(id, name) values (, '');
update persons set name = '' where name = '';

--b
create or replace function age()
returns trigger AS
    $$
        BEGIN
            update persons
            set age = round((current_date-new.birthday)/365.25)
            where id = new.id;
            return new;
end;
    $$
language 'plpgsql';
create trigger neewagee after insert on persons
    for each row execute procedure age();
insert into persons(id, name, birthday)  values (, '', '');

--c
CREATE table product(
    id integer primary key,
    name_of_prod varchar(80),
    price integer
);

create or replace function price_of_products()
returns trigger as
    $$
        BEGIN
            update product
            set price=price+0.12*price
            where id = new.id;
            return new;
        end;
    $$
language 'plpgsql';

create trigger cost after insert on product
    for each row execute procedure price_of_products();
insert into product(id, name_of_prod,price) values (, '', );

insert into product(id,name_of_prod,price) values (, '', );


--d
create or replace function stop_del() returns trigger language plpgsql
    as $$
    begin
        insert into product(id,name_of_prod,price) values(old.id,old.name,old.price);
        return old;
    end;
    $$;

create trigger del_changes
    after delete
    on product
    for each row
    execute procedure stop_del();
delete from product where id=2;
select * from product;
--e

--4
Create table employee(
    salary int,
    id int primary key,
    name varchar(120),
    birthday date,
    exp int,
    discount int,
    age int
);
--a
create or replace procedure salary() as
$$
    Begin
        update employee
        set salary = (exp/2)*0.1*salary+salary,
            discount = (exp/2)*0.1*employee.discount + employee.discount,
            discount = (exp/5)*0.01 * employee.discount + employee.discount;
        commit;
    end;
    $$
language 'plpgsql';


--b
create or replace procedure salary_1() as
    $$
        BEGIN
            update employee
            set salary = salary*1.15
            where age >= 40;
            update employee
            set salary = salary*1.15*(exp/8);
            update employee
            set discount = 20 where exp >= 8;
            commit;
        end;
    $$
language 'plpgsql';