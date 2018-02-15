use mgr;
GO
if not exists (select * from sysobjects where name='invoice_header' and xtype='U')
    create table invoice_header (
        invoice_id int primary key
    )
go

select * from invoice_header;
