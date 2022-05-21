CREATE DATABASE LAB6 
GO
USE LAB6
GO

CREATE TABLE SALEMAN
(
	salesman_id INT PRIMARY KEY,
	name NVARCHAR(128) NOT NULL,
	city NVARCHAR(128) NOT NULL,
	commission FLOAT
)

CREATE TABLE CUSTOMER
(
    customer_id INT PRIMARY KEY, 
    cust_name NVARCHAR(128) NOT NULL,
    city NVARCHAR(128) NOT NULL,
    grade INT,
    salesman_id INT, 
    FOREIGN KEY(salesman_id) REFERENCES SALEMAN(salesman_id)
)


CREATE TABLE ORDERS
(
    ord_no INT PRIMARY KEY,
    purch_amt FLOAT NOT NULL,
    ord_date DATETIME,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY(customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY(salesman_id) REFERENCES SALEMAN(salesman_id)
)


INSERT INTO SALEMAN VALUES
	(5001,'James Hoog','New York',0.15),
	(5002,'Nail Knite','Paris',0.13),
	(5005,'Pit Alex','London',0.11),
	(5006,'Mc Lyon','Paris',0.14),
	(5003,'Lauson Hen','New York',0.12),
	(5007,'Paul Adam','Rome',0.13)



INSERT INTO CUSTOMER VALUES 
    (3002,'Nick Rimando','New York',100,5001),
    (3005,'Graham Zusi','California',200,5002),
    (3001,'Brad Guzan','London',100,5005),
    (3004,'Fabian Johns','Paris',300,5006),
    (3007,'Brad Davis','New York',200,5001),
    (3009,'Geoff Camero','Berlin',100,5003),
    (3008,'Julian Green','London',300,5002),
    (3003,'Jozy Altidor','Moscow',200,5007)

	
INSERT INTO ORDERS VALUES
    (70001,150.5,'2017-10-05',3005,5002),
    (70009,270.65,'2017-09-10',3001,5005),
    (70002,65.26,'2017-10-05',3002,5001),
    (70004,110.5,'2017-08-17',3009,5003),
    (70007,948.5,'2017-09-10',3005,5002),
    (70005,2400.6,'2017-07-27',3007,5001),
    (70008,5760,'2017-09-10',3002,5001),
    (70010,1983.43,'2017-10-10',3004,5006),
    (70003,2480.4,'2017-10-10',3009,5003),
    (70012,250.45,'2017-06-27',3008,5002),
    (70011,75.29,'2017-08-17',3003,5007),
    (70013,3045.6,'2017-04-25',3002,5001)



SELECT * FROM CUSTOMER;
SELECT * FROM SALEMAN;
SELECT * FROM ORDERS;

--1
create view newyorkstaff
as select * from SALEMAN
where city = 'New York'

select * from newyorkstaff

--2

create view viewex2
as select salesman_id,name,city from SALEMAN

select * from viewex2


--3

create view viewex3
AS SELECT *
FROM SALEMAN
WHERE city = 'New York' and commission > 0.13

select * from viewex3

--4
create view viewex4
AS SELECT grade, count(c.customer_id) as 'number of customer who have level'
FROM CUSTOMER c
group by grade

select * from viewex4

--5
create view viewex5
AS select ord_date, count(o.customer_id) as 'number of custormer ordered',count(o.salesman_id) as 'number of saleman purchased',
count(o.ord_no) as 'average amount of orders',count(o.ord_no) as 'the total amount of orders'
from ORDERS o
group by ord_date

select * from viewex5

group by ord_date
--6
create view viewex6
AS select o.ord_no,c.cust_name, s.name
from ORDERS o, CUSTOMER c, SALEMAN s
where o.customer_id = c.customer_id and s.salesman_id = o.salesman_id

select * from viewex6

--7
create view viewex7
AS 
select * from SALEMAN s
where s.salesman_id = (
select o.salesman_id from ORDERS o
group by o.salesman_id
having count(o.customer_id) =(select max(countCustomer) from (select salesman_id, count(customer_id) as countCustomer from ORDERS
											group by salesman_id) as maxCustomer
											)
										)


select * from viewex7

--8
create view viewex8
AS 
select * from SALEMAN s
where s.salesman_id in (
		select o.salesman_id as countODRDER from ORDERS o
		group by o.salesman_id
		having COUNT(o.customer_id) >=3    )

select * from viewex8


--9
create view viewex9
AS 
select * from CUSTOMER c
where c.grade in (
select max(grade) from CUSTOMER)

select * from viewex9


--10
create view viewex10
AS 
select count(s.salesman_id) as 'the number of the salesman in each city',s.city from SALEMAN s
group by s.city

select * from viewex10

--11
create view viewex11
AS 
select o.salesman_id,avg(o.ord_no) as 'the average ',count(o.ord_no) as 'total orders'  from ORDERS o
group by o.salesman_id

select avg(count) as avg from (select o.salesman_id, count(o.ord_no) as count from ORDERS o group by o.salesman_id) as average

select * from viewex11


--12
create view viewex12
AS 
select * from SALEMAN s
where s.salesman_id in (
		select o.salesman_id as countODRDER from ORDERS o
		group by o.salesman_id
		having COUNT(o.customer_id)>=1)

select * from viewex12

--13
create view viewex13
AS 
select c.cust_name,s.name,c.city from ORDERS o, CUSTOMER c, SALEMAN s
where o.customer_id = c.customer_id and s.salesman_id = o.salesman_id and s.city = c.city

select * from viewex13

--14
create view viewex14
AS 
select o.ord_no,o.ord_date,s.name,s.salesman_id,s.city,s.commission from ORDERS o, SALEMAN s
where o.ord_date between '2017-08-17' and '2017-10-10' and s.salesman_id = o.salesman_id

select * from viewex14

SELECT * FROM CUSTOMER;
SELECT * FROM SALEMAN;
SELECT * FROM ORDERS;




