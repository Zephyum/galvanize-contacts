SELECT first_name, last_name FROM "User" WHERE date_of_birth>'2000-JAN-01' order by "User".first_name desc;

select biography from "User" where biography like '%man%';

Select first_name from "User" where id IN(1, 3);

select first_name, last_name, count(User_id) from "User" join contact on contact.user_id = "User".id group by "User".first_name, "User".last_name;
