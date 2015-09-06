/*1. What query would you run to get the total revenue for March of 2012?*/
SELECT sum(amount) FROM lead_gen_business.billing
where date_format(charged_datetime, '%b') = 'mar'
and date_format(charged_datetime, '%Y') = 2012;

/*2. What query would you run to get total revenue collected from client=2 ?*/
select sum(BLL.amount) from lead_gen_business.billing BLL
join lead_gen_business.clients CLT
on BLL.client_id = CLT.client_id
where CLT.client_id =2;

/*3. What query would you run to get all the sites that client=10 owns?*/
select SIT.domain_name from lead_gen_business.sites SIT
join lead_gen_business.clients CLT
on SIT.client_id = CLT.client_id
where CLT.client_id =10;

/*4. What query would you run to get total # of sites created each month for client=1 ? What about for client=20?*/
select count(SIT.domain_name) as no_sites,date_format(created_datetime, '%M') as month_name 
from lead_gen_business.sites SIT
join lead_gen_business.clients CLT
on SIT.client_id = CLT.client_id
where CLT.client_id =20
group by month_name;

select count(SIT.domain_name) as no_sites,date_format(created_datetime, '%M') as month_name 
from lead_gen_business.sites SIT
join lead_gen_business.clients CLT
on SIT.client_id = CLT.client_id
where CLT.client_id =1
group by month_name;

/*5. What query would you run to get the total # of leads we've generated for each of our sites between January 1st 2011 to February 15th 2011?*/
select count(LED.leads_id) as no_leads,SIT.domain_name 
from lead_gen_business.sites SIT
join lead_gen_business.leads LED
on SIT.site_id = LED.site_id
where LED.registered_datetime >= '2011-01-01 00:00:00' and 
 LED.registered_datetime <= '2011-02-15 00:00:00'
group by SIT.domain_name;

/*6. What query would you run to get a list of client name and the total # of leads we've generated for each 
of our clients between January 1st 2011 to December 31st 2011?*/
select concat_ws(' ',CLT.first_name,CLT.last_name) as client_name,count(LED.leads_id) as no_leads
from lead_gen_business.clients CLT 
join lead_gen_business.sites SIT
on SIT.client_id = CLT.client_id
join lead_gen_business.leads LED
on SIT.site_id = LED.site_id
where LED.registered_datetime >= '2011-01-01 00:00:00' and 
 LED.registered_datetime <= '2011-12-31 00:00:00'
group by client_name;

/*7. What query would you run to get a list of client name and the total # 
of leads we've generated for each client each month between month 1 - 6 of Year 2011?*/
select concat_ws(' ',CLT.first_name,CLT.last_name) as client_name,count(LED.leads_id) as no_leads, date_format(LED.registered_datetime,'%M') as month_generated
from lead_gen_business.clients CLT 
join lead_gen_business.sites SIT
on SIT.client_id = CLT.client_id
join lead_gen_business.leads LED
on SIT.site_id = LED.site_id
where LED.registered_datetime >= '2011-01-01 00:00:00' and 
 LED.registered_datetime <= '2011-06-31 00:00:00'
group by client_name,month_generated;

/*8. What query would you run to get a list of client name and the total # of leads we've generated for 
each of our client's sites between January 1st 2011 to December 31st 2011? Come up with a second query 
that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.*/
select concat_ws(' ',CLT.first_name,CLT.last_name) as client_name,
count(LED.leads_id) as no_leads, SIT.domain_name
from lead_gen_business.clients CLT 
join lead_gen_business.sites SIT
on SIT.client_id = CLT.client_id
join lead_gen_business.leads LED
on SIT.site_id = LED.site_id
where LED.registered_datetime >= '2011-01-01 00:00:00' and 
 LED.registered_datetime <= '2011-12-31 00:00:00'
group by client_name,SIT.domain_name;

select concat_ws(' ',CLT.first_name,CLT.last_name) as client_name,
count(LED.leads_id) as no_leads, SIT.domain_name
from lead_gen_business.clients CLT 
join lead_gen_business.sites SIT
on SIT.client_id = CLT.client_id
join lead_gen_business.leads LED
on SIT.site_id = LED.site_id
group by SIT.domain_name;

/* 9. Write a single query that retrieves total revenue collected from each client each month of the year.*/
SELECT concat_ws(' ',CLT.first_name,CLT.last_name) as client_name,
sum(BLL.amount) as total_amount, date_format(charged_datetime, '%M') as month_name, date_format(charged_datetime, '%Y') as year_number  
FROM lead_gen_business.billing BLL
JOIN lead_gen_business.clients CLT
on CLT.client_id = BLL.client_id
group by month_name,year_number,client_name
order by client_name ;

SELECT concat_ws(' ',CLT.first_name,CLT.last_name) as client_name,
sum(BLL.amount) as total_amount, date_format(charged_datetime, '%M') as month_name, date_format(charged_datetime, '%Y') as year_number  
FROM lead_gen_business.billing BLL
,lead_gen_business.clients CLT
where CLT.client_id = BLL.client_id
group by month_name,year_number,client_name
order by client_name ;

/*10. Write a single query that retrieves all the sites that each client owns. Group the results so that each row shows a new client 
and have a new field called 'sites' that has all the sites that the client owns. (HINT: use GROUP_CONCAT) */
select concat_ws(' ',CLT.first_name,CLT.last_name) as client_name,
GROUP_CONCAT(DISTINCT SIT.domain_name ORDER BY SIT.domain_name  SEPARATOR ' / ') as sites
from lead_gen_business.clients CLT 
join lead_gen_business.sites SIT
on SIT.client_id = CLT.client_id
group by client_name;

