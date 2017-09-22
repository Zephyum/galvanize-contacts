alter table "User" add column is_human boolean;

update "User" set is_human = true  where id in(1,2,4);

update "User" set is_human = false  where id = 3;

delete from "User" where is_human = true;

drop table Contacts;
