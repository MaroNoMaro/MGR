--crate triggers
use mgr;
GO

-- invoice_hd
IF OBJECT_ID ('Invoice_hd_created_tmsp', 'TR') IS NOT NULL
   DROP TRIGGER Invoice_hd_created_tmsp;
GO
CREATE TRIGGER Invoice_hd_created_tmsp
ON invoice_header
INSTEAD OF INSERT 
AS
    BEGIN
        INSERT INTO invoice_header
            SELECT  invoice_id,
                    date_created,
                    invoice_date ,
                    invoice_type ,
                    currency ,
                    business_partner_number_id ,
                    invoice_status ,
                    SYSDATETIME()  as created_on,
                    SYSDATETIME() as changed_on 
    FROM inserted
    END
GO