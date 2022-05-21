create database Lab10
go
use Lab10
go

create table Product(
	id int primary key identity,
	name nvarchar(255),
	price int,
	color nvarchar(255),
	descrip nvarchar(255)
)

insert into Product values('IP 7','7000000','White', 'New'),
('IP 11','12000000','blue', 'old'),('Xiaomi Mi8','6000000','black', 'Second hand')

select * from Product