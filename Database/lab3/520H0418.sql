create database EmployeeManage 
go
use EmployeeManage
go
--ex1 
create table department(
	Dept_id char(3) primary key,
	Dept_name Nvarchar(40),
	address nvarchar(50),
	TEL char(10) 
)
create table language(
	Lang_id char(2) primary key,
	language nvarchar(20),
)
create table employee(
	Emp_id char(5) primary key,
	name nvarchar(40),
	gender char(3),
	bdate Date,
	salary int,
	Dept_id char(3),
	tel char(10),
	BeRegular date,
	constraint fk_employee_department foreign key(Dept_id) references department(Dept_id)
)
create table skills(
	Emp_id char(5),
	Lang_id char(2),
	skill char(1),
	primary key(Emp_id, Lang_id),
	constraint fk_skills_employee foreign key(Emp_id) references employee(Emp_id),
	constraint fk_skills_language foreign key(Lang_id) references language(Lang_id)
)
--ex2
insert into department values('HCA','Personel administration','19 Nguyen Huu Tho, HCM','04 8585793'),
('KDA','Marketing','19 Nguyen Huu Tho, HCM','04 8574943'),
('KTA','Techical0','19 Nguyen Huu Tho, HCM','04 9480485'),
('QTA','Equipment','19 Nguyen Huu Tho, HCM','04 8508585')

insert into language values('01','English'),
('02','Russian'),('03','French'),('04','Japanese'),
('05','Chinese'),('06','Korean')

INSERT INTO EMPLOYEE(EMP_ID, NAME, GENDER, BDATE, SALARY, DEPT_ID, BEREGULAR) VALUES 
        ('HC001', N'Nguyễn Thị Hà', N'Nữ', '8/27/1950', 2500000, 'HCA', '2/8/1975'),
        ('HC002', N'Trần Văn NAM', N'Nữ', '6/12/1975', 3000000, 'HCA', '6/8/1997'),
        ('HC003', N'Nguyễn Thanh Huyền', N'NAM', '7/3/1978', 1500000, 'HCA', '9/24/1999'),
        ('KD001', N'Lê Tuyết Anh', N'Nữ', '2/3/1977', 2500000, 'KDA', '10/2/2001'),
        ('KD002', N'Nguyễn Anh Tú', N'Nữ', '7/4/1942', 2600000, 'KDA', '9/24/1999'),
        ('KD003', N'Phạm An Thái', N'NAM', '5/9/1977', 1600000, 'KDA', '9/24/1999'),
        ('KD004', N'Lê Văn Hải', N'NAM', '1/2/1976', 2700000, 'KDA', '6/8/1997'),
        ('KD005', N'Nguyễn Phương Minh', N'NAM', '1/2/1980', 2000000, 'KDA', '10/2/2001'),
        ('KT001', N'Trần Đình Khâm', N'NAM', '12/2/1981', 2700000, 'KTA', '1/1/2005'),
        ('KT002', N'Nguyễn Mạnh Hùng', N'NAM', '8/16/1980', 2300000, 'KTA', '1/1/2005'),
        ('KT003', N'Phạm Thanh Sơn', N'NAM', '8/20/1984', 2000000, 'KTA', '1/1/2005'),
        ('KT004', N'Vũ Thị Hoài', N'Nữ', '12/5/1980', 2500000, 'KTA', '10/2/2001'),
        ('KT005', N'Nguyễn Thu Lan', N'Nữ', '10/5/1977', 3000000, 'KTA', '10/2/2001'),
        ('KT006', N'Trần Hoài NAM', N'NAM', '7/2/1978', 2800000, 'KTA', '6/8/1997'),
        ('KT007', N'Hoàng NAM Sơn', N'NAM', '12/3/1940', 3000000, 'KTA', '7/2/1965'),
        ('KT008', N'Lê Thu Trang', N'Nữ', '7/6/1950', 2500000, 'KTA', '8/2/1968'),
        ('KT009', N'Khúc NAM Hải', N'NAM', '7/22/1980', 2000000, 'KTA', '1/1/2005'),
        ('KT010', N'Phùng Trung Dũng', N'NAM', '8/28/1978', 2200000, 'KTA', '9/24/1999')

insert into skills values('HC001','01','A'),('HC001','02','B'),('HC002','01','C'),('HC002','03','C'),
('HC003','01','D'),('KD001','01','C'),('KD001','02','B'),('KD002','01','D'),('KD002','02','A'),('KD003','01','B'),
('KD003','02','C'),('KD004','01','C'),('KD004','04','A'),('KD004','05','A'),('KD005','01','B'),('KD005','02','D'),
('KD005','03','B'),('KD005','04','B'),('KT001','01','D'),('KT001','04','E'),('KT002','01','C'),('KT002','02','B'),
('KT003','01','D'),('KT003','03','C'),('KT004','01','D'),('KT005','01','C')

--ex3
insert into EMPLOYEE values('QT001',N'Phước Tấn',N'NAM','12/11/2002',150000,'QTA',null,'7/2/1965')
insert into skills values('QT001','01','C'),('QT001','04','A')

--ex4
--1
select * from employee where EMP_ID='KT001'
--2
drop table skills
truncate table EMPLOYEE

alter table EMPLOYEE
alter column gender Nvarchar(3) not null

--3
select * from employee
where gender like N'Nữ'

--4
select * from employee
where name like N'Nguyễn%'

--5
select * from employee
where name like N'%Văn%'

--6
-- year la take year ra, getdate() la take ngay thang nam at now, 
--year(getdate()) la take year at now, year(bdate) la take year cua variable bdate
select *,year(GETDATE()) - year(bdate) age from employee 
where year(GETDATE()) - year(bdate) <= 30

--7
select *,year(GETDATE()) - year(bdate) age from employee 
where (year(GETDATE()) - year(bdate) >= 25) and (year(GETDATE()) - year(bdate) <= 30)

--8
select * from employee e,skills s
where e.EMP_ID = s.EMP_ID and s.Lang_id = '01' and (s.skill = 'C' or s.skill = 'D')

--9
select *,year(BeRegular) yearOfRegular from employee
where year(BeRegular) < 2000

--10
select *,year(getdate()) - year(BeRegular) yearOfRegular from employee
where year(getdate()) - year(BeRegular) > 10

