/* task 1 */
/*
Large objects (photos, videos, CAD files, etc.) are stored as a large object:
blob: binary large object --object is a large collection of uninterpreted binary data
(whose interpretation is left to an application outside of the database system)
clob: character large object --object is a large collection of character data
When a query returns a large object, a pointer is returned rather than the large object itself.
*/
/* task 2*/
create role administrator;
create role accountant;
create role support;
---drop role administrator;
---drop role accountant;
---drop role support;

grant all privileges on all tables in schema public to administrator;
grant update, delete on accounts to accountant;
grant update, insert, delete on all tables in schema public to support;

create user "num1";
create user "num2";
create user "num3";

---drop user "num1";
---drop user "num2";
---drop user "num3";

grant administrator to num1;
grant accountant to num2;
grant support to num3;

revoke update,delete on accounts from accountant;
revoke all privileges on all tables in schema public from administrator;
revoke update, insert, delete on all tables in schema public from support;
/* task 3 */
---alter table accounts alter column "limit" float not null;
/* task 5 */
create unique index cur on accounts(account_id,currency);
create index ind1 on accounts(currency,balance);
/* task 6*/
----
