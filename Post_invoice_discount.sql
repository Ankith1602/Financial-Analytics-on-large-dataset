CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sales_postinv_discount` AS
    SELECT 
        `po`.`date` AS `date`,
        `ps`.`fiscal_year` AS `fiscal_year`,
        `po`.`product_code` AS `product_code`,
        `po`.`customer_code` AS `customer_code`,
        `ps`.`sold_quantity` AS `sold_quantity`,
        `ps`.`product` AS `product`,
        `ps`.`variant` AS `variant`,
        `ps`.`gross_price` AS `gross_price`,
        `ps`.`gross_price_total` AS `gross_price_total`,
        `ps`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        (`ps`.`gross_price_total` - (`ps`.`gross_price_total` * `ps`.`pre_invoice_discount_pct`)) AS `net_invoice_sales`,
        (`po`.`discounts_pct` + `po`.`other_deductions_pct`) AS `post_discount`,
        `ps`.`market` AS `market`
    FROM
        (`sales_preinv_discount` `ps`
        JOIN `fact_post_invoice_deductions` `po` ON (((`po`.`customer_code` = `ps`.`customer_code`)
            AND (`po`.`product_code` = `ps`.`product_code`)
            AND (`po`.`date` = `ps`.`date`))))