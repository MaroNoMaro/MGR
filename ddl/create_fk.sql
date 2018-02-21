
use mgr
GO

--create foreign keys

--drop data from all tables
-- select TABLE_NAME from mgr.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'
-- ;

-- DELETE tax_code;
-- DELETE product;
-- DELETE product_category;
-- DELETE business_partner;
-- DELETE vendor;
-- DELETE customer;
-- delete product_vendor_supply;
-- DELETE credit_group;
-- DELETE address;
-- DELETE region;
-- DELETE invoice_header;
-- DELETE invoice_item;
-- go

-- invoice item
ALTER TABLE invoice_item 
    ADD CONSTRAINT FK_invoice_item_to_header FOREIGN KEY (invoice_id)
        REFERENCES invoice_header (invoice_id),
        CONSTRAINT FK_invoice_item_to_tax_code FOREIGN KEY ( tax_code )
        REFERENCES tax_code ( tax_code ),
        CONSTRAINT FK_invoice_item_to_product FOREIGN KEY ( product_number )
        REFERENCES product (product_id)
;       
go

--product
ALTER TABLE product
    ADD CONSTRAINT FK_product_to_product_category FOREIGN KEY (product_category)
        REFERENCES product_category (product_category)
;
go

-- parent category
ALTER TABLE product_category
    ADD CONSTRAINT FK_parent_product_category FOREIGN KEY (parent_category)
        REFERENCES product_category (product_category)
;
GO

-- vendor
alter TABLE vendor
    ADD CONSTRAINT FK_vendor_extends_bp FOREIGN KEY (business_partner_id)
        REFERENCES business_partner (business_partner_id)
;
go

-- customer
alter TABLE customer
    ADD CONSTRAINT FK_customer_extends_bp FOREIGN KEY (business_partner_id)
            REFERENCES business_partner (business_partner_id),
        CONSTRAINT FK_cutomer_to_credit_group FOREIGN KEY (credit_group)
            REFERENCES credit_group (credit_groupI_id)
;
go

-- business partner
ALTER TABLE business_partner
    ADD CONSTRAINT FK_bp_has_address FOREIGN KEY (address_id)
            REFERENCES address(address_id)
;
go

--address
ALTER TABLE address
    ADD CONSTRAINT FK_address_references_region FOREIGN KEY (region_id)
            REFERENCES region(region_id)
;
go

--product_vendor_supply
ALTER TABLE product_vendor_supply
    ADD CONSTRAINT FK_product_supp_to_vendor FOREIGN KEY (vendor_id)
            REFERENCES vendor(business_partner_id),
        CONSTRAINT FK_product_supp_to_prod FOREIGN KEY (product_id)
            REFERENCES product(product_id)
;
go

select * from sys.foreign_keys
;