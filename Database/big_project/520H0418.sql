create database SuperMarket
go
use SuperMarket
go

create table Manufacturer(
	ManuID varchar(250) primary key,
	ManuName nvarchar(255) not null,
	Nationality nvarchar(255)
)
go

create table Supplier (
	SuppID varchar(250) primary key,
	Name nvarchar(255) not null,
	Address nvarchar(255)
)
go

create table Receipt(
	RectID varchar(250) primary key,
	SuppID varchar(250) not null,
	foreign key (SuppID) references Supplier(SuppID)
)
go

create table SaleCounter(
	CountID varchar(250) primary key,
	CountName nvarchar(255) not null,
	Location nvarchar(255) not null
)
go

create table Customer(
	CusID varchar(250) primary key,
	CusName nvarchar(255) not null,
	Address nvarchar(255) not null
)
go


create table Invoice(
	InvoiceID varchar(250) primary key,
	CusID varchar(250) not null,
	foreign key(CusID) references Customer(CusID)
)
go

create table Product(
	ProducID varchar(250) primary key,
	ProductName nvarchar(255) not null,
	Unit nvarchar(255) not null,
	Quantity int not null,
	Price int not null,
	ManuID varchar(250) not null,
	CountID varchar(250) not null,
	foreign key(ManuID) references Manufacturer(ManuID),
	foreign key(CountID) references SaleCounter(CountID)

)
go

create table InvoiceDetail(
	InvoiceDetail_ID varchar(250) primary key,
	ProducID varchar(250) not null,
	InvoiceID varchar(250) not null,
	Quantity int not null,
	Price int not null,
	foreign key(ProducID) references Product(ProducID),
	foreign key(InvoiceID) references Invoice(InvoiceID)
)

go


create table ReceiptDetail(
	RecDetail_ID int primary key,
	ProducID varchar(250) not null,
	RectID varchar(250) not null,
	Quantity int not null,
	Price int not null,
	Date date not null,
	foreign key(RectID) references Receipt(RectID),
	foreign key(ProducID) references Product(ProducID)
)
go

insert into ReceiptDetail values('RD01','PDT02','RPT01',10,5000000,''), ('RD02','PDT04','RPT03',4,3000000,''),
			('RD03','PDT06','RPT05',10,2000000,''), ('RD04','PDT08','RPT07',4,6000000,''), ('RD05','PDT10','RPT09',3,2000000,''),
			('RD06','PDT12','RPT11',7,6000000,''),('RD07','PDT14','RPT13',10,200000,''), ('RD08','PDT13','RPT14',6,3000000,''),
			('RD09','PDT11','RPT12',9,3000000,''), ('RD10','PDT09','RPT10',10,5000000,''),('RD11','PDT07','RPT08',3,2000000,''),
			 ('RD12','PDT05','RPT06',10,7000000,''),('RD13','PDT03','RPT04',8,2000000,''),('RD14','PDT01','RPT02',2,2000000,'')



insert into Manufacturer values('MF01',N'Huỳnh Nhật Hào','VN'), ('MF02',N'Trương Quốc Đại ','UK'),
('MF03',N'Trần Văn Sơn ','US'), ('MF04',N'Võ THị Hồng My ','VN'), ('MF05',N'Phạm Đăng Nhật Khoa ','Japan'),
 ('MF06',N'Dương Trùng Vương','Chinese'),('MF07',N'Trương Vô Kỵ','Canada'), ('MF08',N'Trương Vô Kỵ','VN'),
  ('MF09',N'Phạm Nhật Vượng','Australia'), ('MF10',N'Đỗ Trí Nhựt','VN')
go
select * from Manufacturer

insert into Supplier values('SP01',N'Võ Thị Bé Ba',N'Hà Nội'), ('SP02',N'Hồ Ngọc Hà',N'Hồ Chí Minh'),
('SP03',N'Lâm văn Sanh',N'Cao Bằng'), ('SP04',N'Trương Văn Quyết',N'Trương Văn Quyết'),
 ('SP05',N'Hồ Thị Hương',N'Cần Thơ'), ('SP06',N'Nguyễn Duy Nhất',N'Hồ Chí Minh'),('SP07',N'Huỳnh Anh Minh',N'Phan Thiết '),
  ('SP08',N'Huỳnh Ngữ Yên',N'Tiền Giang'), ('SP09',N'Võ Thị Hồng Thắm',N'Cà Mau'), ('SP10',N'Vương Ngữ Anh',N'Phú Yên')
go
select * from Supplier

insert into Receipt values('RPT01','SP01'), ('RPT02','SP10'),
('RPT03','SP06'), ('RPT04','SP07'), ('RPT05','SP01'), ('RPT06','SP08'),
('RPT07','SP04'), ('RPT08','SP03'), ('RPT09','SP04'), ('RPT10','SP02'),('RPT11','SP06'),
('RPT12','SP09'),('RPT13','SP07'),('RPT14','SP05')
go
select * from Receipt

insert into SaleCounter values('SC01',N'Trương Văn Phát',N'Hà Nội'), ('SC02',N'Hồ Tấn Tài',N'Hà Tiên'),
('SC03',N'Trương Tấn Phát',N'Sơn La'), ('SC04',N'Mạc Văn Giàu',N'Yên Bái'), ('SC05',N'Lại Thị Trúc Mai',N'Hà Nội'), ('SC06',N'Bùi Thị Như',N'Hồ Chí Minh'),
('SC07',N'Lâm văn Bến',N'Bến Tre'), ('SC08',N'La Văn Sơn',N'Trà Vinh'), ('SC09',N'Cao Thị Mỹ Lệ',N'Sóc Trăng'), ('SC10',N'Vương Anh Dương',N'Vũng Tàu')
go
select * from SaleCounter

insert into Customer values('Cus01',N'Hồ Ngọc Thái', N'Vũng Tàu'), ('Cus02',N'Phan văn Thiết', N'Đồng Tháp'),
('Cus03',N'Trần Văn Mau', N'Hà Nội'), ('Cus04',N'Phạm Trà Ngọc', N'Hậu Giang'), ('Cus05',N'Võ Quốc Cường', N'Trà Vinh'),
 ('Cus06',N'Vương Anh Tính', N'Đồng Nai'),('Cus07',N'Phạm Thị Anh Cô', N'Hồ Chí Minh'), ('Cus08',N'Trương Tam Phong', N'Tây Ninh'),
  ('Cus09',N'Trần Thị Hoàng Dung', N'Huế'), ('Cus10',N'Trần Thủy Hoàng', N'Vinh')
go
select * from Customer

insert into Invoice values('IVC01','Cus10'), ('IVC02','Cus03'),
('IVC03','Cus04'), ('IVC04','Cus06'), ('IVC05','Cus01'), ('IVC06','Cus10'),
('IVC07','Cus04'), ('IVC08','Cus02'), ('IVC09','Cus09'), ('IVC10','Cus02'),('IVC11','Cus10')
,('IVC12','Cus06'), ('IVC13','Cus07'),('IVC14','Cus05'),('IVC15','Cus10'),('IVC16','Cus08')
go
select * from Invoice


insert into Product values('PDT01',N'Nước Tương',N'Thùng',2,2000000,'MF09','SC02'), ('PDT02',N'Nước Mắn',N'Thùng',10,5000000,'MF01','SC03'),
('PDT03',N'Bột Ngọt',N'Thùng',8,2000000,'MF03','SC01'), ('PDT04',N'kẹo',N'Gói',4,3000000,'MF08','SC06'), ('PDT05',N'Nước Ngọt',N'Chai',10,7000000,'MF10','SC07'),
 ('PDT06',N'Đường',N'Gói',10,2000000,'MF10','SC02'),('PDT07',N'Muối',N'Gói',1,2000000,'MF03','SC08'), ('PDT08',N'Nước Suối',N'Chai',4,6000000,'MF04','SC09'),
  ('PDT09',N'Nước Tăng lực',N'Lon',10,5000000,'MF01','SC04'), ('PDT10',N'Bia',N'Thùng',3,2000000,'MF05','SC05'),('PDT11',N'Gạo',N'Bao',9,3000000,'MF02','SC10'),
  ('PDT12',N'Sữa',N'Thùng',7,6000000,'MF05','SC05'),('PDT13',N'Bột Mì',N'Gói',6,3000000,'MF06','SC04'),('PDT14',N'Mì',N'Gói',10,200000,'MF07','SC07')

go
select * from Product


insert into InvoiceDetail values('IVD01','PDT02','IVC01',2,10000000), ('IVD02','PDT04','IVC02',3,9000000),
		('IVD03','PDT07','IVC03',1,2000000), ('IVD04','PDT05','IVC04',5,35000000), ('IVD05','PDT10','IVC05',1,2000000),
		('IVD06','PDT12','IVC06',4,24000000),('IVD07','PDT14','IVC07',7,1400000), ('IVD08','PDT01','IVC08',1,2000000),
		('IVD09','PDT06','IVC09',6,12000000), ('IVD10','PDT03','IVC10',5,10000000),('IVD11','PDT09','IVC11',9,45000000),
		('IVD12','PDT11','IVC12',2,6000000),('IVD13','PDT13','IVC13',5,15000000),('IVD14','PDT08','IVC14',3,18000000),
		('IVD15','PDT02','IVC15',4,20000000),('IVD16','PDT11','IVC16',4,12000000)
go
select * from InvoiceDetail

insert into ReceiptDetail values('1','PDT02','RPT01',10,5000000,'04/12/2012'), ('2','PDT04','RPT03',4,3000000,'09/17/2012'),
		('3','PDT06','RPT05',10,2000000,'12/01/2010'), ('4','PDT08','RPT07',4,6000000,'11/09/2011'), ('5','PDT10','RPT09',3,2000000,'10/29/2014'),
		('6','PDT12','RPT11',7,6000000,'06/15/2015'),('7','PDT14','RPT13',10,200000,'08/04/2010'), ('8','PDT13','RPT14',6,3000000,'12/12/2012'),
		('9','PDT11','RPT12',9,3000000,'10/16/2016'), ('10','PDT09','RPT10',10,5000000,'07/27/2019'),('11','PDT07','RPT08',3,2000000,'04/12/2015'),
		('12','PDT05','RPT06',10,7000000,'02/28/2011'),('13','PDT03','RPT04',8,2000000,'08/09/2014'),('14','PDT01','RPT02',2,2000000,'08/29/2015')
go
select * from ReceiptDetail



-----------------------------------------------------------------------------------------------------------------------------------

--4: procedure: c: Add data to the product
go
create procedure dataProduct
	@ID varchar(250), @Name nvarchar(255), @Unit nvarchar(255), @numberOfProduct int, @Price int, @ManuID varchar(250), @CountID varchar(250)
as 
begin
	insert into Product values(@ID,@Name,@Unit,@numberOfProduct,@Price,@ManuID,@CountID)
end
go

exec dataProduct 'PDT15',N'Xúc Xích',N'Bịch',12,8000,'MF04','SC05'
go

-----------------------------------------------------------------------------------------------------------------------------------
--5: fuction: b: Indicate the total amount for a certain invoice

create function cauB (@InvoiceID varchar(250))
returns int
as
begin
	declare @ID varchar(250)= @InvoiceID
	declare @price int
	select @price= ivd.Price from InvoiceDetail ivd join Invoice i on ivd.InvoiceID = i.InvoiceID and i.InvoiceID = @InvoiceID
	return @price
end
go

select dbo.cauB('IVC04') as price
go

-----------------------------------------------------------------------------------------------------------------------------------
--6: trigger a: Update the quantity and price for the product when it is imported

go
create trigger cauA on ReceiptDetail
for insert,delete
as
begin
	declare @Number int
	declare @price int
	declare @id varchar(250)
	select @id = i.ProducID ,@Number =  i.Quantity + p.Quantity,@price= i.Price from inserted i join Product p on p.ProducID = i.ProducID
	update Product set Quantity = @Number where ProducID = @id
	update Product set Price = @price where ProducID = @id
end
go
insert into Receipt values('RPT15','SP04')
insert into ReceiptDetail values (15,'PDT11','RPT15',3,4000000,'05/12/2015')
go


--select * from Product
--select * from ReceiptDetail
--select * from Receipt
--select * from ReceiptDetail
--select * from Invoice
--select * from InvoiceDetail