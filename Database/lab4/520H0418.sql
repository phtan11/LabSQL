create database lab4
use lab4

create table department(
	DName varchar(50),
	DepNo varchar(4) primary key,
	MgrSSN varchar(4),
	MgrSDate DateTime
)
create table employee(
	Fname varchar(10),
	Minit varchar(10),
	Lname varchar(10),
	SSN varchar(4) primary key,
	Bdate date,
	Address varchar(20),
	Sex char(1),
	Salary int,
	SuperSSN varchar(4),
	DepNo varchar(4),
	constraint FK_employee_employee foreign key(SuperSSN) references employee(SSN),
	constraint FK_employee_department foreign key(DepNo) references department(DepNo)
)

-- add foreign key cho depart to employee
alter table department
add constraint FK_department_employee foreign key(MgrSSN) references employee(SSN)

create table Dept_Locations(
	DepNo varchar(4) not null,
	DLocation varchar(20),
	constraint PK_Dept_Locations primary key(DepNo,DLocation),
	constraint FK_Dept_Locations_department foreign key(DepNo) references department(DepNo)
)
create table Project (
	PNumber int primary key identity,
	PName Nvarchar(55),
	PLocation varchar(15),
	DepNo varchar(4),
	constraint FK_Project_department foreign key(DepNo) references department(DepNo)
)

create table Works_On(
	ESSN varchar(4),
	PNo int,
	Hours int,
	constraint PK_Works_On primary key(ESSN,PNo),
	constraint FK_Works_On_employee foreign key(ESSN) references employee(SSN),
	constraint FK_Works_On_Project foreign key(PNo) references Project(PNumber)
)

create table dependent(
	ESSN varchar(4),
	Dependent_Name Nvarchar(50),
	sex int,
	BDate datetime,
	Relationship Nvarchar(8),
	constraint PK_dependent primary key(ESSN,Dependent_Name),
	constraint FK_dependent_employee foreign key(ESSN) references employee(SSN)
)
--cach them khoa ngoai
--alter table employee
--add constraint FK_EMP_EMP foreign key(SuperSSN) references employee(SSN)

--insert

insert into Department values('Information','D01', null,'2019-03-18')  -- phai cho  MgrSSN null vi ben Employee chua co dc insert
insert into Department values('Security','D02',null,'2019-05-08')
insert into Department values('Administrative','D03',null,'2019-03-18')
insert into Department values('Bussiness','D04',null,'2022-06-17')
insert into Department values('Technical','D05',null,'2021-09-22')
insert into Department values('Consultant','D06','E06','1905-07-14')

insert into employee values('Tran','Van','Phuc','E01', '1990-2-20','Da Lat', 1, 2000, null, 'D01') --superSSN phai cho null vi no chua ddc tao
insert into employee values('Nguyen','Minh','Hung','E02', '1992-4-07','Ca Mau', 1, 1800, null, 'D02')
insert into employee values('Phan','Tuyet','Mai','E03', '1991-8-28','Ninh Binh', 0, 2200, null, 'D02')
insert into employee values('Phan','Quoc','Dung','E04', '1995-4-13','Nha Trang', 1, 700, 'E01', 'D03')
insert into employee values('Le','Thi','Rieng','E05', '1993-11-18','Ho Chi Minh', 0, 650, 'E02', 'D04')
insert into employee values('Pham','Van','Dong','E06', '1996-06-02','Ha Noi', 1, 1250, 'E03', 'D04')
insert into employee values('Pham','Van','Minh','E07', '1996-06-02','Ha Noi', 1, 1250, 'E03', 'D05')
insert into employee values('Pham','Van','Minh','E08', '1996-06-02','Russia', 1, 1250, 'E03', 'D06')

--update gtri cua department MgrSSN	
update department set MgrSSN = 'E01' where DepNo = 'D01'
UPDATE Department SET MgrSSN = 'E02' WHERE depNo = 'D02'
UPDATE Department SET MgrSSN = 'E03' WHERE depNo = 'D03'
UPDATE Department SET MgrSSN = 'E04' WHERE depNo = 'D04'
UPDATE Department SET MgrSSN = 'E05' WHERE depNo = 'D05'

insert into Dept_Locations values('D01','Ho Chi Minh')
insert into Dept_Locations values('D01','Da Nang')
insert into Dept_Locations values('D02','Binh Duong')
insert into Dept_Locations values('D03','Hai Phong')
insert into Dept_Locations values('D03','Ha Noi')
insert into Dept_Locations values('D03','Vu Han')
insert into Dept_Locations values('D04','Ukraine')
insert into Dept_Locations values('D05','Russia')
insert into Dept_Locations values('D06','Russia')

insert into project values(N'Website bán mỹ phẩm','Ha Noi','D02')
insert into project values(N'Website bán đồ điện tử','Binh Duong','D01')
insert into project values(N'Ứng dụng đặt món ăn','Vu Han','D03')
insert into project values(N'Ứng dụng giao hàng hóa','Hai Phong','D03')
insert into project values(N'Ứng dụng nhắn tin','Ho Chi Minh','D05')
insert into project values(N'Ứng dụng gọi điện','Dong Nai','D04')

insert into works_on values('E01',1,100)
insert into works_on values('E01',2,150)
insert into works_on values('E02',3,50)
insert into works_on values('E02',4,200)
insert into works_on values('E04',3,100)
insert into works_on values('E04',4,120)
insert into works_on values('E05',4,100)
insert into works_on values('E03',5,300)
insert into works_on values('E06',5,100)
insert into works_on values('E06',6,400)

insert into Dependent values('E01',N'Trần Phương Thảo',0,'2004-02-14',N'Con')
insert into Dependent values('E02',N'Phạm Ngọc Phương',0,'1993-05-14',N'Vợ')
insert into Dependent values('E02',N'Võ Văn Dũng',1,'2008-02-19',N'Con')
insert into Dependent values('E03',N'Nguyễn Quốc Tuấn',0,'1984-06-08',N'Chồng')
insert into Dependent values('E04',N'Phan Thị Phương',0,'2006-08-1',N'Con')
insert into Dependent values('E05',N'Lê Quốc Tuấn',1,'1971-04-28',N'Bố')
insert into Dependent values('E06',N'Võ Thị Xuân',0,'2976-11-16',N'Mẹ')

--select
select * from Dept_Locations
select * from Department
select * from project
select * from Dependent
select * from Employee
select * from works_on

--1
select department.DepNo, department.DName,count(Employee.SSN) as 'number_of_employee'
from department,employee
where department.DepNo = Employee.DepNo
group by department.DepNo,department.DName -- sai vi D06 hog co hien vì D06 khong có ở employ nên hog có hiện so làm cashc khác/
--cách đúng
select department.DepNo, department.DName,count(Employee.SSN) as 'number_of_employee'
from department LEFT JOIN employee ON department.DepNo = employee.DepNo
group by department.DepNo,department.DName

--2
select department.DepNo,department.DName, count(Employee.SSN) as 'number_of_employee > 2'
from department JOIN employee
ON department.DepNo = Employee.DepNo
group by department.DepNo, department.DName
having count(employee.SSN) >= 2  -- bảng count() là mình tự hình thành sau nên muốn xử lí trên đó thì phải having + condition()

--3
--cachs 1
select department.DName, D.DLocation
from department join Dept_Locations D
on ('D01' = D.DepNo and 'D01' = department.DepNo) or ('D03' = D.DepNo and 'D03' = department.DepNo)
 or ('D05' = D.DepNo and 'D05' = department.DepNo)

--cách 2
select department.DName, D.DLocation
from department join Dept_Locations D
on department.DepNo = D.DepNo
where D.DepNo in ('D01','D03','D05')

--4
select e.Fname + ' '+ e.Minit + ' ' + e.Lname as 'fullName' ,p.PName,count(p.PNumber) as 'number project'  from employee e
join Works_On w on e.SSN = w.ESSN
join Project p on p.PNumber = w.PNo
where e.sex = 0
group by e.Fname + ' '+ e.Minit + ' ' + e.Lname, p.PName

--5
select e.Fname + ' '+ e.Minit + ' ' + e.Lname as 'fullName'
from employee e,dependent d
where e.Sex = d.sex and e.SSN = d.ESSN

--6
select e.Fname + ' '+ e.Minit + ' ' + e.Lname as 'fullName' from employee e,Project p
where e.DepNo = p.DepNo and e.DepNo = 'D05'

--7
select e.Fname + ' '+ e.Minit + ' ' + e.Lname as 'fullName' from employee e,Project p
where e.DepNo not in (select e.DepNo from employee e,Project p
where e.DepNo = p.DepNo)

--8
select department.DepNo, count(employee.SSN) as 'Number of employee',avg(employee.Salary) as 'average salary'
from department LEFT JOIN employee 
ON department.DepNo = employee.DepNo
group by department.DepNo

--9
select department.DName, department.DepNo
from department  join employee
on department.DepNo = employee.DepNo 
group by department.DName, department.DepNo
having avg(employee.Salary) >=30000 and avg(employee.Salary) <= 60000

--10
select e.Fname + ' '+ e.Minit + ' ' + e.Lname as 'fullName' from employee e
where e.SSN not in (select e.SSN from employee e join dependent d
on e.SSN = d.ESSN)

--11 (not complete)
select * from employee e,Project p
where e.DepNo = p.DepNo 

--12
select d.DepNo,p.PNumber from department d left join Project p
on d.DepNo = p.DepNo

--13
select e.DepNo,sum(w.Hours) as 'hours of each employee' from employee e left join Works_On w
on e.SSN = w.ESSN
group by(e.DepNo)

--14
select e.Fname + ' '+ e.Minit + ' ' + e.Lname as 'fullName' from employee e 
where  e.SuperSSN is null

--15 -- em them input va gan address laf russia
select e.Fname + ' '+ e.Minit + ' ' + e.Lname as 'fullName', e.DepNo from employee e join Dept_Locations d
on e.Address like 'Russia' and d.DepNo = e.DepNo and d.DLocation like 'Russia'

--16 vidu 1993
select e.Fname + ' '+ e.Minit + ' ' + e.Lname as 'fullName' from employee e
where year(e.Bdate)-1993 <= 0
