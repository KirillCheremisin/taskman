USE [MySuperDuperProject];
GO
insert into Condition
(ConditionName)
values ('0'), 
('10'),
('20'),
('30'),
('40'),
('50'),
('60'),
('70'),
('80'),
('90'),
('100')

insert into [Status]
(StatusName)
values ('Created'),
('Assigned'),
('Closed')

insert into UserRole
(RoleName)
values ('user'),
('adm')
go

insert into [User]
(UserName, UserSurname, UserRoleID, Password, Login, Email)
values 
('-', '-', 1, '-', '-', '-'),
('Kirill', 'Cheremisin', 2, '19A2854144B63A8F7617A6F225019B12', 'Kirill.Cheremisin', 'admin@mail.ru'),
('Roman', 'Tuktarov', 2, '19A2854144B63A8F7617A6F225019B12', 'Roman.Tuktarov', 'admin@mail.ru'),
('Gennadiy', 'Koveschnokov', 2, '19A2854144B63A8F7617A6F225019B12', 'Gennadiy.Koveschnikov', 'admin@mail.ru')
go

insert into [Project]
(Name, [Description], CrateDate,	 AuthorID)
values ('FPrj', 'This is our first project', '20140516', 1)
go

insert into Task
values ('Do some dids', 'Here should be some description', '20140516', NULL, 1, 1, 2, 2, 1)
go
