create database exercise2
go
use exercise2
go
CREATE table products(
	product_ID varchar(20) primary key,
	pro_name Nvarchar(50),
	quatity int,
)
CREATE table Build(
	product_ID varchar(20),
	component_ID varchar(20),
	number_of_produce int,
	primary key(product_ID,component_ID),
	constraint FK_Build_products foreign key(product_ID) references products(product_ID),
	constraint FK_Build_Component foreign key(component_ID) references Component(component_ID)
)
CREATE table Component(
	component_ID varchar(20) primary key,
	name Nvarchar(50),
	description Nvarchar(50)
)
CREATE table CompSupplier(
	component_ID varchar(20),
	IDsupplier VARCHAR(20),
	primary key(component_ID,IDsupplier),
	constraint FK_CompSupplier_Component foreign key(component_ID) references Component(component_ID),
	constraint FK_CompSupplier_suppliers foreign key(IDsupplier) references suppliers(IDsupplier)
)
CREATE table suppliers(
	IDsupplier VARCHAR(20) primary key,
	name Nvarchar(50),
	age int
)