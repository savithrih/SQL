
/*1. What query would you run to get all the countries that speak Slovene? 
Your query should return the name of the country, language and language percentage. 
You query should arrange the result by language percentage in descending order. (1)*/

select countries.name, languages.language, languages.percentage
from countries
join  languages
on countries.code =languages.country_code
and languages.language ='Slovene'
order by languages.percentage desc;

/*3. What query would you run to get all the cities in Mexico with a population of greater than 500,000? 
Your query should arrange the result by population in descending order. (1)
select cities.name as cities_in_mexico,cities.population ,countries.name from cities*/

select cities.name as cities_in_mexico,cities.population ,countries.name from countries
join cities 
on countries.code =cities.country_code
where countries.name = 'mexico'
and cities.population > 500000
order by cities.population desc;


/*4. What query would you run to get all languages in each country with a percentage greater than 89%? 
Your query should arrange the result by percentage in descending order. (1)*/
select  languages.language, languages.percentage
from languages 
join  countries
on countries.code =languages.country_code
and languages.percentage > 89
group by countries.name
order by languages.percentage desc;


/*6. What query would you run to get countries with only Constitutional Monarchy 
with a capital greater than 200 and a life expectancy greater than 75 years? (1)*/
SELECT name FROM world.countries 
where government_form ='Constitutional Monarchy'
and  capital >200 
and life_expectancy > 75 ;


/*5. What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000? (2)*/
SELECT name,surface_area,population FROM world.countries where surface_area < 501 and  population > 100000 ;

/*7. What query would you run to get all the cities of Argentina inside the Buenos Aires district and have population greater than 500, 000?
 The query should return the Country Name, City Name, District and Population. (2)*/
 select countries.name as country_name,cities.name as city_name, cities.district,cities.population from
cities join countries on 
countries.code =cities.country_code
where countries.name='argentina' and cities.district = 'Buenos Aires'
and cities.population >500000;

/*8. What query would you run to summarize the number of countries in each region? 
The query should display the name of the region and the number of countries. 
Also, the query should arrange the result by number of countries in descending order. (2)*/

select count(name) as number_countries,region from world.countries
group by region
order by number_countries;

/*2. What query would you run to display the total number of cities for each country? 
Your query should return the name of the country and the total number of cities. 
You query should arrange the result by number of cities in descending order. (3)*/
select count(cities.name) as number_cities, countries.name as country_name from world.countries
join world.cities on countries.code = cities.country_code
group by country_name
order by number_cities desc;
