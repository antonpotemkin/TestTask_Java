-- create database test
create database test;
-- for cmd write use test;
use test;
-- create table User
create table User (id int(8) AUTO_INCREMENT,
name varchar(25) NOT NULL,
age int NOT NULL,
isAdmin bit NOT NULL,
createdDate timestamp,
PRIMARY KEY (id));