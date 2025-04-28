#to find out the top markets based on net sales
select product,round(sum(net_sales)/1000000,2) as net_sales
 from net_sales n
 where fiscal_year=2021
 group by product
order by net_sales desc
limit 5
