#to find out the top customer based on net sales
select customer,round(sum(net_sales)/1000000,2) as net_sales
 from net_sales n
 join dim_customer dc
 on dc.customer_code=n.customer_code
 where fiscal_year=2021
 group by customer
order by net_sales desc
limit 5
