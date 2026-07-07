create database if not EXISTS school;

show databases;
use school;

create table if not exists student (name text, email text);
create table if not exists teacher (name text, email text);


insert into student (name, email) values ("abc", "abc@gmail.com"),
("abc", "abc@gmail.com"),
("abc", "abc@gmail.com");