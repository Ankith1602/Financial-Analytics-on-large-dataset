
#to find the total contribution of the customer in percentge

with cte1 as (select dc.customer,round(sum(net_sales)/1000000,2) as net_sale from net_sales n
join dim_customer dc
on dc.customer_code = n.customer_code
where fiscal_year=2021
group by customer
order by net_sale desc)
select *,net_sale*100/sum(net_sale)   over() as pct from cte1
limit 10