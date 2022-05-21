create database lab10
go
use lab10
go
create table product(
	id int primary key identity,
	name nvarchar(128) not null,
	price int,
	description nvarchar(128)
)
insert into product values('Laptop', 400,'Core i7'),('Wireless Mouse', 29,'Like New')
select * from product