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
/*
if exists (select *
from sysobjects
where name = 'tax_code' and xtype='U')
    drop TABLE tax_code    
go
create table tax_code
(
    tax_code int primary key,
    tax_value decimal(7,3),
    description nvarchar(50)
)
go
--insert sample data to check everything is fine
insert into  tax_code ( tax_code, tax_value, description )
    VALUES (2, 5.00, N'123')

select * from tax_code;
*/
/*
if exists (select *
from sysobjects
where name = 'product' and xtype='U')
    drop TABLE product    
go
create table product
(
    product_id int primary key,
    product_name nvarchar(100),
    product_category int,
    created_on date,
    unit_of_measure int, --tu muszę dorobić foreign key w schemacie
    weight decimal(6,3),
    price decimal(7,3)
)
go
--insert sample data to check everything is fine
insert into  product ( product_id, product_name, product_category,created_on,
        unit_of_measure, weight, price )
    VALUES (2, N'snickers', 3, '20180302', 4, 50.54, 2.59)

select * from product;
*/

if exists (select *
from sysobjects
where name = 'product_category' and xtype='U')
    drop TABLE product_category    
go
create table product_category
(
    product_category int primary key,
    parent_category int, --fk
    category_name nvarchar(100)
)
go
--insert sample data to check everything is fine
insert into  product_category ( product_category, parent_category, category_name )
    VALUES (2, 3, N'Batony')

select * from product_category;



-- select TABLE_NAME from mgr.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'
-- ;