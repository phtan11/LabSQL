create database lab1
use lab1

create table Department(
	Dep_id int primary key,
	Dep_name Nvarchar(50),
	Year int
)
create table Student(
	Name nvarchar(50),
	St_id nvarchar(15) primary key,
	Birth date,
	Dep_id int,				
	constraint FK_Student_Department foreign key(Dep_id) references Department(Dep_id)
)
create table Course(
	coursename nvarchar(50),
	course_id varchar(15) primary key,
	credit varchar(45),
	Dep_id int,
	constraint FK_Course_Department foreign key(Dep_id) references Department(Dep_id)
)
create table Condition(
	course_id varchar(15),
	precourse_id varchar(15) primary key,
	constraint FK_Condition_Course foreign key(course_id) references Course(course_id)
)

create table Result(
	St_id nvarchar(15) primary key,
	course_id varchar(15),
	mark float,
	constraint FK_Result_Student foreign key(St_id) references Student(St_id),
	constraint FK_Result_Course foreign key(course_id) references Course(course_id)
)
select * from Department
select * from Student
select * from Course
select * from Condition
select * from Result

insert into Department values (1,N'Hào',2002),(2,N'Tính',2002),(3,N'Tấn',2002)
insert into Student values (N'Hào','520H0531','2002/10/12',2),(N'Tấn','520H0418','2002/12/11',1),(N'Tính','520H0011','2002/04/04',3)
insert into Course values ('Programming','50304','W3school.com',1),('economic law','E0107','sex.com',2),('How to bussiness','503785','webeconomic.com',3)
insert into Condition values ('50304','50303'),('503785','503784'),('E0107','E0106')
insert into Result values ('520H0531','E0107',7.6),('520H0418','50304',9.7),('520H0011','50304',5.6)
update Department
set Dep_name = 'CNTT' where Dep_id = 1
update Department
set Dep_name = 'Law' where Dep_id = 2
update Department
set Dep_name = 'Economic' where Dep_id = 3