use master;
go
if db_id(N'mgr') is not null
drop database mgr;
go
create database mgr;
go
--verify database files and sizez
select name, size, size*1.0/128as [Size_in_MBs]
from sys.master_files
where name = N'mgr';
go