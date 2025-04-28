CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `net_sales` AS
    SELECT 
        `pos`.`date` AS `date`,
        `pos`.`fiscal_year` AS `fiscal_year`,
        `pos`.`product_code` AS `product_code`,
        `pos`.`customer_code` AS `customer_code`,
        `pos`.`sold_quantity` AS `sold_quantity`,
        `pos`.`product` AS `product`,
        `pos`.`variant` AS `variant`,
        `pos`.`gross_price` AS `gross_price`,
        `pos`.`gross_price_total` AS `gross_price_total`,
        `pos`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        `pos`.`net_invoice_sales` AS `net_invoice_sales`,
        `pos`.`post_discount` AS `post_discount`,
        `pos`.`market` AS `market`,
        ((1 - `pos`.`post_discount`) * `pos`.`net_invoice_sales`) AS `net_sales`
    FROM
        `sales_postinv_discount` `pos`