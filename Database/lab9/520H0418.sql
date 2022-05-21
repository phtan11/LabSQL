use WorldEvents
GO



create table countryLog (
	id int primary key identity,
	name nvarchar(255) not null,
	action nvarchar(255),
	TheTime date
)
go


--ex1
CREATE TRIGGER ex1 on tblCountry
for insert,delete, update -- la ca insert va delete
as
begin
	insert into countryLog(name, action,TheTime)
	select CountryName,'OLD VALUE',GETDATE() from deleted

	insert into countryLog(name, action,TheTime)
	select CountryName,'NEW VALUE',GETDATE() from INSERTED 
end
go
insert into tblCountry values('VN', 8)
select * from countryLog


---------------------------------------------------------------------------------------------------------
--ex3
create trigger ex3 on tblEvent
instead of delete
as
begin
	 declare @id int = 7
	 if EXISTS (select * from deleted d where d.CountryID = @id)
	 begin
		raiserror('You do not remove!!', 16,1)
		rollback tran
	 end
end
go 

----------------------------------------------------------------------------------------------------------
--ex4
use Bank
go
create table Logs(
	LogId int primary key identity,
	AccountID int,
	OldSum MONEY,
	NewSum MONEY,
	constraint FK_Logs_Accounts foreign key(AccountID) references Accounts(id)
)
go
create trigger ex4 on Accounts
after update -- update là bao gồm cã 2
as
begin
	insert into Logs(AccountID,OldSum ,NewSum)
	select d.Id,d.Balance,i.Balance from deleted d, inserted i
	-- id thì delete hay insert đều đc,
	--oldSum là cái cũ, mà cái cũ thì là ở deleted
	--newSum là cái mới, mà cái mới là inserted
end
go
select * from Logs
update Accounts set Balance = 1255.02 where Id = 1
go


---------------------------------------------------------------------------------------------------------
--ex5
create table NotificationEmails(
	id int identity primary key,
	Recipient int, -- accountId
	Subject varchar(250),
	body text,
	constraint Fk_NotificationEmails_Accounts foreign key(Recipient) references Accounts(id)
)
go

create trigger ex5 on Logs
after insert
as
begin
	insert into NotificationEmails(Recipient,Subject, body)
	select AccountID,'Balance change for account: ' + cast(AccountID as varchar),
				'On ' + cast(getdate() as varchar) + ' your balance was changed from ' + 
						cast(OldSum as varchar) + ' to ' +cast(NewSum as varchar)
	 from inserted  
end
go

update Accounts set Balance =999 where Id = 14

select * from Logs
select * from NotificationEmails


--ex6




select * from Accounts
select  * from AccountHolders

select * from tblCountry 
select * from tblEvent 