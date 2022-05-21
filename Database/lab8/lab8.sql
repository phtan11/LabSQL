create database Truonghoc
go
use Truonghoc
go

create table Khoa(
makhoa int primary key identity,
tenkhoa nvarchar(255))

create table SinhVien(
maso int primary key identity,
hoten nvarchar(255),
ngaysinh date,
gioitinh bit,
makhoa int,
constraint FK_SV_Khoa foreign key(makhoa) references Khoa(makhoa))

create table MonHoc
(
mamon int primary key identity,
tenmon nvarchar(255),
sotiet int)

create table KetQua
(
masv int,
mamon int,
lanthi int check(lanthi >= 1),
diem float)

alter table KetQua
add 
constraint FK_KQ_SV foreign key(masv) references SinhVien(maso),
constraint FK_KQ_MH foreign key(mamon) references MonHoc(mamon)



insert into khoa values (N'Công nghệ thông tin')
insert into khoa values (N'Quản trị kinh doanh')
insert into khoa values (N'Ngoại ngữ')

insert into SinhVien values (N'Nguyễn Xuân Hiếu','1999-03-02',1,1)
insert into SinhVien values (N'Phạm Thị Diệu','1998-02-21',0,1)
insert into SinhVien values (N'Trần Minh Trí','2000-07-19',1,1)
insert into SinhVien values (N'Vũ Thùy Dương','2000-11-22',0,2)
insert into SinhVien values (N'Quách Xuân Hợp','1998-12-28',1,2)
insert into SinhVien values (N'Tô Vĩnh Khang','1998-08-07',1,2)
insert into SinhVien values (N'Trần Trọng Vinh','1999-02-14',1,3)
insert into SinhVien values (N'Võ Ngọc Linh','1997-01-19',0,3)
insert into SinhVien values (N'Hồ Thị Dung','2000-05-18',0,3)



insert into monhoc values(N'Hệ cơ sở dữ liệu', 4)
insert into monhoc values(N'Lập trình hướng đối tượng', 3)
insert into monhoc values(N'Lập trình web và ứng dụng', 3)
insert into monhoc values(N'Kinh tế vi mô', 3)
insert into monhoc values(N'Kinh tế vĩ mô', 4)
insert into monhoc values(N'Pháp luật đại cương', 4)
insert into monhoc values(N'Tiếng Anh 3', 2)
insert into monhoc values(N'Tiếng Trung', 3)
insert into monhoc values(N'Kỹ năng làm việc nhóm', 3)

insert into ketqua values(1,1,1,8.2)
insert into ketqua values(1,2,1,4.5)
insert into ketqua values(1,2,2,5.9)
insert into ketqua values(1,3,1,7.5)
insert into ketqua values(2,1,1,6.5)
insert into ketqua values(2,3,1,5.5)
insert into ketqua values(3,1,1,3.0)
insert into ketqua values(3,1,2,4.5)
insert into ketqua values(3,1,3,5.0)
insert into ketqua values(3,2,1,6.0)
insert into ketqua values(3,3,1,6.5)

insert into ketqua values(4,4,1,6.0)
insert into ketqua values(4,5,1,7.0)
insert into ketqua values(4,6,1,6.5)
insert into ketqua values(5,4,1,6.0)
insert into ketqua values(5,5,1,5.0)
insert into ketqua values(5,6,1,7.0)
insert into ketqua values(6,4,1,5.0)
insert into ketqua values(6,5,1,8.0)

insert into ketqua values(7,7,1,7.0)
insert into ketqua values(7,8,1,4.5)
insert into ketqua values(7,8,2,5.0)
insert into ketqua values(7,9,1,5.0)
insert into ketqua values(8,7,1,7.0)
insert into ketqua values(8,9,1,5.0)
insert into ketqua values(9,8,1,6.5)
insert into ketqua values(9,9,1,5.5)


select * from khoa
select * from sinhvien
select * from monhoc
select * from ketqua
		

		
		
		
		--bai1(store procedure)
--ex1
go
create proc insertNewStu @hoten nvarchar(255),@ngaysinh date,@gioitinh bit,@makhoa int
as
begin 
	insert into sinhvien values(@hoten,@ngaysinh,@gioitinh,@makhoa)
end  
go
exec insertNewStu @hoten = N'Phạm Phước Tấn', @ngaysinh = '2002-12-11', @gioitinh = 1, @makhoa = 2

--ex2
go
create proc insertNewStu2 @hoten nvarchar(255),@ngaysinh date,@gioitinh bit,@makhoa int
as
begin 
	if @hoten is null
		print N'you are an incorrect the name!!'
	else 
	begin
		declare @yearOfStudent int
		declare @tuoi int
		set @yearOfStudent = DATEPART(year,@ngaysinh)
		set @tuoi = year(getdate()) - @yearOfStudent
		if @tuoi < 18 or @tuoi >= 40
			print 'you are not 18 year old or are so old'
		else
			begin
				if @makhoa not in (select makhoa from Khoa)
					print 'makhoa is not invalid'
				else
					insert into sinhvien values(@hoten,@ngaysinh,@gioitinh,@makhoa)
			end
		
	end
end  
go
exec insertNewStu2 @hoten = N'Phạm Phước Tấn', @ngaysinh = '2002-12-11', @gioitinh = 1, @makhoa = 5 --makhoa sai
exec insertNewStu2 @hoten = N'Phạm Phước Tấn', @ngaysinh = '2012-12-11', @gioitinh = 1, @makhoa = 3 -- tuoi < 18


--ex3
go
create proc insertKQ @masv int, @mamon int,@lanthi int,@diem float
as
begin 
	if @masv not in (select maso from SinhVien)
		print 'maSV is not invalid'
	else
		begin
			if @mamon not in (select mamon from MonHoc)
				print 'maMONHOC is not invalid'
			else
				insert into KetQua values(@masv,@mamon,@lanthi,@diem)
		end
end  
go
exec insertKQ @masv = 2, @mamon = 8, @lanthi = 3, @diem = 7.6



--ex4
go
create proc showNumberOfStudent @makhoa int
as
begin 
	declare @quantity int
	select @quantity = count(makhoa) from SinhVien where makhoa = @makhoa
	print @quantity
end  
go
exec showNumberOfStudent 3

--ex5
go
create proc showListOfStudent @makhoa int
as
begin 
	select * from SinhVien where makhoa = @makhoa
end  
go
exec showListOfStudent 3


--ex6
go
create proc showNumberOfStudentOfEachFal 
as
begin  
	select k.tenkhoa ,count(s.makhoa) as quantityOfEachFalcuty
	from SinhVien s, khoa k 
	where s.makhoa = k.makhoa
	group by k.tenkhoa
end  
go
exec showNumberOfStudentOfEachFal 


--ex7
go
create proc showResultOfStudent @maso int
as
begin  
	select lanthi, diem
	from KetQua 
	where @maso = masv
end  
go
exec showResultOfStudent 1
 


--ex8
go
create proc findStudent
as
begin  
	select s.hoten, m.tenmon, k.lanthi
	from KetQua k, SinhVien s, MonHoc m
	where k.lanthi > 1 and s.maso = k.masv and k.mamon = m.mamon
end  
go
exec findStudent 
 
 
--ex9
go
create proc findMaxofLanthi
as
begin  
	select m.tenmon, k.diem
	from KetQua k,  MonHoc m
	where k.mamon = m.mamon and k.diem >= all (select diem from KetQua)
end  
go
exec findMaxofLanthi 

 
--ex10
go
create proc findstudentThilaiNhiuNhat
as
begin  
	select distinct m.tenmon
	from KetQua k,MonHoc m
	where k.mamon = m.mamon and k.mamon in (select k.mamon
												from KetQua k
												group by k.mamon 
												having count(k.masv)>= all(select count(k1.masv)
												from KetQua k1 group by k1.mamon ))
end
go
exec findstudentThilaiNhiuNhat 



		--baitap2(function)

--ex1
go
create function ex1(@diem float)
returns nvarchar(50)
as
begin
	declare @check nvarchar(50)
	if @diem >= 5
		set @check = N'đạt'
	else
		set @check = N'không đạt'

	return @check
end
go
select dbo.ex1(2.3)
select dbo.ex1(5.1)


--ex2
go
create function ex2(@makhoa int)
returns int
as
begin
	declare @c int
	select @c =count(s.maso) from SinhVien s where s.makhoa = @makhoa group by s.makhoa
	return @c
end
go	
select dbo.ex2(2)


--ex3
go
create function ex3(@makhoa int)
returns table
as
return select s.maso, s.hoten, s.gioitinh, s.ngaysinh,s.makhoa  from sinhvien s where s.makhoa = @makhoa

go	
select * from dbo.ex3(2)


--ex4
go
create function ex4()
returns table
as
return select s.makhoa, k.tenkhoa, count(s.maso) as 'number of student' 
from SinhVien s, khoa k 
where s.makhoa = k.makhoa 
group by s.makhoa,k.tenkhoa
go	
select * from dbo.ex4()

--ex5
go
create function ex5(@masv int)
returns table
as
return 
select k.mamon, k.diem
from KetQua k
where @masv = k.masv
go	
select * from dbo.ex5(1)


--ex6
go
create function ex6()
returns table
as
return 
select s.hoten, m.tenmon
from KetQua k,sinhvien s,MonHoc m
where k.lanthi > 1 and k.masv = s.maso and k.mamon = m.mamon
group by s.hoten, m.tenmon
go	
select * from dbo.ex6()


--ex7
go
create function ex7()
returns table
as
return 
select m.tenmon, k.diem
from KetQua k, MonHoc m
where k.mamon = m.mamon and k.diem >= all (select k1.diem from KetQua k1)
go	
select * from dbo.ex7()

--ex8
go
create function ex8()
returns table
as
return
select *
from MonHoc m
where m.mamon = (select k.mamon
				from KetQua k
				group by k.mamon
				having count(k.masv) = (select max(c) from(select count(k1.masv) as 'c' 
															from ketqua k1 group by k1.mamon) as Maxx)) 
go	
select * from dbo.ex8()
