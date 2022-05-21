create database midterm
go 
use midterm
go

CREATE table LoaiNGK 
(
	MaLoai varchar(50) PRIMARY key , 
	TenLoai nvarchar(50) UNIQUE
)

go
create table NGK 
(
	MaNGK varchar(50) primary key,
	TenNGK nvarchar(50) UNIQUE,
	DVT nvarchar(50),
	Soluong int , 
	Dongia int,
	MaLoaiNGK varchar(50),
	constraint FK_NGK_LoaiNGK FOREIGN key(MaLoaiNGK) references LoaiNGK(MaLoai),
	check(Soluong > 0),
	check(Dongia > 0),
	check(DVT ='chai' or DVT ='lon' or DVT = N'thùng' or DVT=N'kết')
)

go
create table KhachHang
(
	MsKH varchar(50) primary KEY,
	hoten nvarchar(50),
	diachi nvarchar(50),
	dienthoai varchar(50) DEFAULT 'chua co'
)
go
create table HoaDon
(
	Sohd varchar(50) PRIMARY key , 
	MsKH varchar(50) ,
	nhavien varchar(50) , 
	ngaylap date DEFAULT (getdate()),
	CONSTRAINT FK_HoaDon_KhachHang FOREIGN key (MsKH) references KhachHang(MsKH)
)
go
create table CTHD 
(
  soHD varchar(50) ,
  MaNGK varchar(50),
  SoLuong int ,
  Dongia int,
  PRIMARY key (soHD,MaNGK),
  CHECK(SoLuong > 0)
)
--f
go
alter table CTHD add thanhtien int
go
alter table CTHD
	add constraint FK_CTHD_HoaDon foreign key(soHD) references HoaDon(soHD)
go
alter table CTHD
	add constraint FK_CTHD_NGK foreign key(MaNGK) references NGK(MaNGK)
--h
go
alter table CTHD add check(Dongia>0)

--g



--2 		(Truy Van)
--a
select n.TenNGK
from NGK n
where n.DVT = 'lon'


--b
select *
from KhachHang
where KhachHang.diachi like '%TPHCM%'
--c.
select n.tenNGK
from CTHD c join NGK n on c.MaNGK = n.MaNGK
	join Hoadon h on c.SoHD = h.SoHD
where MONTH(Ngaylap) >= 7 and MONTH(Ngaylap) <= 9 and YEAR(Ngaylap) = 2018


--d.
select g.TenNGK,sum(c.Soluong) as soluong
from NGK g left join CTHD c
on g.MaNGK = c.MaNGK
group by(g.TenNGK)

--e.
select c.SoHD
from 
NGK n join CTHD c on c.MaNGK = n.MaNGK
	
	join LoaiNGK L on n.MaLoaiNGK = L.Maloai

where L.Tenloai = 'Nước có ga' and 
		L.Tenloai = 'Nước ngọt'
		