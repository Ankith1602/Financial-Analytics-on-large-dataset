-- create  a stored proc that can determine
--  the market badge based on following logic

-- if total sold quantity>5 million that market is considered gold
--  else it is silver

-- my input will be 
-- 1.market 
-- 2.fiscal year

-- output 
-- market badge 

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_procedure`(
in fiscal_years year,
in market_place varchar(45),
out market_badge varchar(45) )
BEGIN
declare qty  int default 0;
#reterive the data of the sold quantity
select sum(sold_quantity) into qty  from fact_sales_monthly fm
join dim_customer dc on fm.customer_code=dc.customer_code
where get_fiscal_year(fm.date)=fiscal_years
 and market=market_place
group  by market ;
#determine the market badge 
if qty>5000000 then
set  market_badge="gold";
else 
set  market_badge="silver";
end if ;
END