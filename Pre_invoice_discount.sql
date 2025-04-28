CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sales_preinv_discount` AS
    SELECT 
        `fsm`.`date` AS `date`,
        `fsm`.`fiscal_year` AS `fiscal_year`,
        `fsm`.`product_code` AS `product_code`,
        `fsm`.`customer_code` AS `customer_code`,
        `fsm`.`sold_quantity` AS `sold_quantity`,
        `dp`.`product` AS `product`,
        `dp`.`variant` AS `variant`,
        `fg`.`gross_price` AS `gross_price`,
        ROUND((`fg`.`gross_price` * `fsm`.`sold_quantity`),
                2) AS `gross_price_total`,
        `pre`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        `dm`.`market` AS `market`
    FROM
        ((((`fact_sales_monthly` `fsm`
        JOIN `dim_product` `dp` ON ((`dp`.`product_code` = `fsm`.`product_code`)))
        JOIN `fact_gross_price` `fg` ON (((`fsm`.`product_code` = `fg`.`product_code`)
            AND (`fg`.`fiscal_year` = `fsm`.`fiscal_year`))))
        JOIN `fact_pre_invoice_deductions` `pre` ON (((`pre`.`customer_code` = `fsm`.`customer_code`)
            AND (`pre`.`fiscal_year` = `fsm`.`fiscal_year`))))
        JOIN `dim_customer` `dm` ON ((`fsm`.`customer_code` = `dm`.`customer_code`)))