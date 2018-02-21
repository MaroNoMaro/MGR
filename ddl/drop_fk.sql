use mgr;
go

-- invoice item
ALTER TABLE invoice_item
    DROP CONSTRAINT FK_invoice_item_to_header,
    CONSTRAINT FK_invoice_item_to_tax_code,
    CONSTRAINT FK_invoice_item_to_product;
GO

--product
ALTER TABLE product
    DROP CONSTRAINT FK_product_to_product_category;
go

-- parent category
ALTER TABLE product_category
    DROP CONSTRAINT FK_parent_product_category
;
GO

-- vendor
alter TABLE vendor
    DROP CONSTRAINT FK_vendor_extends_bp 
;
go

-- customer
alter TABLE customer
    DROP CONSTRAINT FK_customer_extends_bp,
        CONSTRAINT FK_cutomer_to_credit_group
;
go

-- business partner
ALTER TABLE business_partner
    DROP CONSTRAINT FK_bp_has_address
;
go

--address
ALTER TABLE address
    DROP CONSTRAINT FK_address_references_region
;
go

--product_vendor_supply
ALTER TABLE product_vendor_supply
    drop CONSTRAINT FK_product_supp_to_vendor,
        CONSTRAINT FK_product_supp_to_prod
;
go

--lista FK
select * from sys.foreign_keys
;