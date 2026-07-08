create database if not EXISTS school;

show databases;
use school;

create table if not exists student (name text, email text, age int, isActive boolean);
create table if not exists student (name text, email VARCHAR(30), age int, isActive boolean, 
dob date
);
create table if not exists teacher (name text, email text, age int);
