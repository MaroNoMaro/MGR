--https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/server-memory-server-configuration-options
use mgr
go

sp_configure 'show advanced options', 0;  
GO