create database if not EXISTS school;

show databases;
use school;

create table if not exists student (name text, email text, age int);
create table if not exists teacher (name text, email text, age int);

-- Create
insert into student (name, email, age) values ("abc", "abc@gmail.com", 9),
("xyz", "abc@gmail.com", 9),
("kbc", "abc@gmail.com", 9);

-- Read
select * from student;

-- update 
update student set age = 8;


select * from student;
-- delete
delete from student;
