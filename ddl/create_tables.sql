use mgr;
GO
/*

if exists (select *
from sysobjects
where name='invoice_header' and xtype='U')
    drop TABLE invoice_header    
go
create table invoice_header
(
    invoice_id int primary key,
    date_created DATE,
    invoice_date DATE,
    invoice_type nvarchar,
    currency nvarchar,
    business_partner_number_id int,
    invoice_status nvarchar
)
go
--insert sample data to check everything is fine
insert into  invoice_header ( invoice_id, date_created, invoice_date, invoice_type, currency,
        business_partner_number_id, invoice_status )
    VALUES (1, '20180215', '20180215', 'F2', 'PLN', 1000, 'NEW')

select * from invoice_header;

*/
/*
if exists (select *
from sysobjects
where name = 'invoice_item' and xtype='U')
    drop TABLE invoice_item    
go
create table invoice_item
(
    invoice_id int,
    item_number int,
    product_number int,
    item_amount decimal(10,3),
    net_value money,
    tax_code int,
    primary key( invoice_id, item_number )
)
go
--insert sample data to check everything is fine
insert into  invoice_item ( invoice_id, item_number, product_number, item_amount, net_value, tax_code )
    VALUES (1, 10, 1000001, 54.5, 456.33, 3)

select * from invoice_item;

*/


-- select TABLE_NAME from mgr.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'
-- ;