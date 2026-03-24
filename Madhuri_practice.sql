create database Madhuri

drop database Madhuri

use Madhuri

create table suresh (
id int primary key not null,
s_name varchar(20) not null,
s_address varchar(50) not null,
Ph_number bit not null,
);

alter table suresh

alter column Ph_number bigint not null;

alter table suresh
add Is_Active bit not null;

select * from suresh;

insert into suresh values(1,'Suresh','KADAPA',6302539493,'false');

delete from suresh where id=1;