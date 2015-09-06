/*1. What query would you run to get the total revenue for March of 2012?*/
SELECT sum(amount) FROM lead_gen_business.billing
where date_format(charged_datetime, '%b') = 'mar'
and date_format(charged_datetime, '%Y') = 2012;