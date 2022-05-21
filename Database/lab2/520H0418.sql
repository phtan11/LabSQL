create database lab2
go
use lab2
create table FILMS(
	film_id int primary key,
	title nvarchar(50) not null unique,
	year int not null,
	duration int
)
create table Actors(
	actor_id int primary key,
	name nvarchar(50) not null unique,
	sex char(1)
)
create table act_film(
	actor_id int,
	film_id int,
	role nvarchar(50),
	constraint PK_act_film primary key(actor_id,film_id), --tao 2 khoa chinh
	constraint FK_act_film_FILMS foreign key(film_id) references FILMS(film_id),
	constraint FK_act_film_Actors foreign key(actor_id) references Actors(actor_id)
)
insert into FILMS values(1,'Minority Report', 2002,145),
	(2,'About a boy', 2002,101),
	(3,'Bourne identity, The', 2002,118),
	(4,'Notting Hill', 1999,124),
	(5,'Nine Months', 1995,103),
	(6,'Lola Rennt', 1998,81)
insert into Actors values(1,'Damon Matt','m'),
	(2,'Protente, Franka','f'),
	(3,'Cruise, Tom','m'),
	(4,'Grant, Hugh','m'),
	(5,'Roberts, Julia','f'),
	(6,'Moore, Julianne','f'),
	(7,'Bleibtreu, Moritz','m')
insert into act_film values(3,1,'Detective John Anderton'),
	(4,2,'Will'),(2,3,'Marie Kreutz'),
	(1,3,'Jason Bourne'),
	(4,4,'William Thacker'),
	(5,4,'Anna Scott'),
	(4,5,'Samuel "sam" Faulkner, MD., P.C'),
	(2,6,'Lola'),
	(7,6,'Manni')

select * from FILMS
select * from Actors
select * from act_film

--2
--a
select title 
from FILMS

--b
select name
from Actors
where sex = 'f'

--c
select name
from Actors,act_film,FILMS
where title like 'Bourne identity, The' and FILMS.film_id = act_film.film_id and act_film.actor_id = Actors.actor_id

--d
select title
from FILMS,act_film,Actors
where sex = 'f' and Actors.actor_id = act_film.actor_id and act_film.film_id = FILMS.film_id

--e
select FILMS.film_id
from FILMS,act_film,Actors
where sex = 'f' and Actors.actor_id = act_film.actor_id and act_film.film_id = FILMS.film_id  -- lay id film tu bang film co dien vien nu

--hoan chinh cau e
select title      --nghich dao cac' film co dien vien nu (ko co n
from FILMS
where film_id not in (select FILMS.film_id
						from FILMS,act_film,Actors
						where sex = 'f' and Actors.actor_id = act_film.actor_id and act_film.film_id = FILMS.film_id)