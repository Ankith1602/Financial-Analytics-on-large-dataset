-- to generate a report of individual product sales for croma india customers 
-- for fiscal year 2021 so that we can track individual product sales and run further 
-- product analysis.
-- the report should contain the following fields 
-- 1.months
-- 2.product name
-- 3.variant
-- 4.sold quantity
-- 5.gross price per item
-- 6.gross price total

select fsm.date,fsm.product_code,fsm.sold_quantity,dp.product,
dp.variant,fg.gross_price,
round(fg.gross_price*fsm.sold_quantity,2) as gross_price_total
from fact_sales_monthly fsm
join dim_product dp on 
dp.product_code=fsm.product_code
join fact_gross_price fg on
fsm.product_code=fg.product_code and fg.fiscal_year=get_fiscal_year(fsm.date)
where customer_code=90002002 and  get_fiscal_year(date) = 2021 
order by date 
limit 5
