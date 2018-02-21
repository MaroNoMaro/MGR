use mgr;
GO

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
    invoice_type nvarchar(2),
    currency nvarchar(3),
    business_partner_number_id int,
    invoice_status nvarchar(6),
    created_on DATETIME2,
    changed_on DATETIME2
)
go
--insert sample data to check everything is fine
insert into  invoice_header ( invoice_id, date_created, invoice_date, invoice_type, currency,
        business_partner_number_id, invoice_status )
    VALUES (2, '20180215', '20180215', 'F2', 'PLN', 1000, 'NEW')

select * from invoice_header;


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
    primary key( invoice_id, item_number ),
    created_on DATETIME2,
    changed_on DATETIME2
)
go
--insert sample data to check everything is fine
insert into  invoice_item ( invoice_id, item_number, product_number, item_amount, net_value, tax_code )
    VALUES (1, 10, 1000001, 54.5, 456.33, 3)

select * from invoice_item;


if exists (select *
from sysobjects
where name = 'tax_code' and xtype='U')
    drop TABLE tax_code    
go
create table tax_code
(
    tax_code int primary key,
    tax_value decimal(7,3),
    description nvarchar(50),
    created_on DATETIME2,
    changed_on DATETIME2
)
go
--insert sample data to check everything is fine
insert into  tax_code ( tax_code, tax_value, description )
    VALUES (2, 5.00, N'123')

select * from tax_code;



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
    price decimal(7,3),
    created_tmstp DATETIME2,
    changed_on DATETIME2
)
go
--insert sample data to check everything is fine
insert into  product ( product_id, product_name, product_category,created_on,
        unit_of_measure, weight, price )
    VALUES (2, N'snickers', 3, '20180302', 4, 50.54, 2.59)

select * from product;



if exists (select *
from sysobjects
where name = 'product_category' and xtype='U')
    drop TABLE product_category    
go
create table product_category
(
    product_category int primary key,
    parent_category int, --fk
    category_name nvarchar(100),
    created_on DATETIME2,
    changed_on DATETIME2
)
go
--insert sample data to check everything is fine
insert into  product_category ( product_category, parent_category, category_name )
    VALUES (2, 3, N'Batony')

select * from product_category;



if exists (select *
from sysobjects
where name = 'business_partner' and xtype='U')
    drop TABLE business_partner    
go
create table business_partner
(
    business_partner_id int primary key,
    bank_account nvarchar(28) not null,
    tax_id nvarchar(10) unique,
    bp_name nvarchar(100) not null,
    address_id int, --fk
    created_on DATETIME2,
    changed_on DATETIME2
)
go
--insert sample data to check everything is fine
insert into  business_partner ( business_partner_id, bank_account, tax_id,
                                bp_name, address_id )
    VALUES ( 123, 'PL08228704366941028058934851', '7682124038',
            'Agnieszka Witkowska sp. z o.o.', 100 )

select * from business_partner;


if exists (select *
from sysobjects
where name = 'vendor' and xtype='U')
    drop TABLE vendor    
go
create table vendor
(
    business_partner_id int primary key,
    preferred_currency nvarchar(3) not null,
    created_on DATETIME2,
    changed_on DATETIME2
)
go
--insert sample data to check everything is fine
insert into  vendor ( business_partner_id, preferred_currency )
    VALUES ( 123, 'PLN' )

select * from vendor;


IF OBJECT_ID('customer', 'U') IS NOT NULL
DROP TABLE customer
GO
-- Create the table in the specified schema
CREATE TABLE customer
(
    business_partner_id INT PRIMARY KEY, -- primary key column
    credit_group int,--fk
    created_on DATETIME2,
    changed_on DATETIME2
);
GO

insert into customer (business_partner_id, credit_group)
    values (100, 12);

select * from customer;


-- Create a new table called 'product_vendor_supply' in schema ''
-- Drop the table if it already exists
IF OBJECT_ID('product_vendor_supply', 'U') IS NOT NULL
DROP TABLE product_vendor_supply
GO
-- Create the table in the specified schema
CREATE TABLE product_vendor_supply
(
    vendor_id INT not null, --fk
    product_id int not null, --fk
    priority int not null
    primary key ( vendor_id, product_id ),
    created_on DATETIME2,
    changed_on DATETIME2
);
GO

insert into product_vendor_supply (vendor_id, product_id, priority )
    values (100, 1, 10);
select * from product_vendor_supply;



IF OBJECT_ID('credit_group', 'U') IS NOT NULL
DROP TABLE .credit_group
GO
-- Create the table in the specified schema
CREATE TABLE credit_group
(
    credit_groupI_id INT NOT NULL PRIMARY KEY, -- primary key column
    description nvarchar(50) NOT NULL,
    credit_value money NOT NULL,
    created_on DATETIME2,
    changed_on DATETIME2
);
GO

INSERT into credit_group (credit_groupI_id, [description], credit_value)
    VALUES (1001,'new customers', 1000);
SELECT * FROM credit_group;


IF OBJECT_ID('address', 'U') IS NOT NULL
DROP TABLE address
GO
-- Create the table in the specified schema
CREATE TABLE address
(
    address_id INT NOT NULL PRIMARY KEY, -- primary key column
    street nvarchar(100) not null,
    postal_code nvarchar(6) not null,
    city nvarchar(25) not null,
    region_id int not null,
    created_on DATETIME2,
    changed_on DATETIME2
);
GO

insert into address (address_id, street, postal_code, city, region_id)
    VALUES (100001, 'Wiatraczna 5', '01-716', 'Warszawa', 201);

select * from address;


-- Create a new table called 'region' in schema ''
-- Drop the table if it already exists
IF OBJECT_ID('region', 'U') IS NOT NULL
DROP TABLE region
GO
-- Create the table in the specified schema
CREATE TABLE region
(
    region_id INT NOT NULL PRIMARY KEY, -- primary key column
    region_name nvarchar(50),
    created_on DATETIME2,
    changed_on DATETIME2
);
GO

INSERT into region (region_id, region_name)
    VALUES (201, 'Mazowieckie');
SELECT * from region;

-- select TABLE_NAME from mgr.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'
-- ;