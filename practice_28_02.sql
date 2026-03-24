create database Products

use Products

create table users(
Id int primary key not null,
u_name varchar(25) not null,
ph_number bigint not null,
u_address varchar(100) ,
u_dob date not null
);

select u_name as Name from users

insert into users values(1,'Suresh@123',6302539493,'#445,MJ kings pg','02/06/2001');

alter table users
add CONSTRAINT check_username UNIQUE (u_name);
