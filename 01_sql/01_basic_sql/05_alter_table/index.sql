create table student(name varchar(255), age int);
alter table student add column email varchar(255);
alter table student drop column email;
alter table student rename column email to _email;
