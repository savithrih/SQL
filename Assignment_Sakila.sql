/*1. What query would you run to get all the customers inside city_id = 312? 
Your query should return customer first name, last name, email, and address.*/

select customer.first_name,customer.last_name,customer.email,address.address
from sakila.customer
join sakila.address
on sakila.address.address_id = sakila.customer.address_id
join sakila.city
on sakila.city.city_id = sakila.address.city_id
where  sakila.city.city_id =312;

/*2. What query would you run to get all comedy films? 
Your query should return film title, description, release year, rating, special features, and genre.*/
select sakila.film.title,sakila.film.description,sakila.film.release_year,
sakila.film.rating,sakila.film.special_features, sakila.category.name  as genre
from sakila.film 
join sakila.film_category
on sakila.film.film_id= sakila.film_category.film_id
join sakila.category
on sakila.category.category_id = sakila.film_category.category_id
where sakila.category.name ='comedy';

/*3. What query would you run to get all the films joined by actor_id=5?
 Your query should return the film title, description, and release year.*/
 select sakila.film.title,sakila.film.description,sakila.film.release_year
from sakila.film 
join sakila.film_actor
on sakila.film.film_id =  sakila.film_actor.film_id
where sakila.film_actor.actor_id=5;

/*4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)?
 Your query should return customer first name, last name, email, and address.*/
 select customer.first_name,customer.last_name,customer.email,address.address
from sakila.customer
join sakila.store
on customer.store_id = store.store_id
join sakila.address
on sakila.address.address_id = sakila.customer.address_id
join sakila.city
on sakila.city.city_id = sakila.address.city_id
where store.store_id =1 and 
sakila.city.city_id in (1,42,312,459);

/*5. What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", 
joined by actor_id = 15? Your query should return the film title, description, release year, rate, and special feature. 
Hint: You may use LIKE function in getting the 'behind the scenes' part.*/
select sakila.film.title,sakila.film.description,sakila.film.release_year,
sakila.film.rating,sakila.film.special_features
from sakila.film 
join sakila.film_actor
on sakila.film.film_id =  sakila.film_actor.film_id
where sakila.film_actor.actor_id=15
and sakila.film.rating ='G' and sakila.film.special_features like '%behind the scenes';

/*6.What query would you run to get all the actors that joined in the film_id = 369? 
Your query should return the film_id, title, actor_id, and actor_name.*/
select sakila.film.film_id,sakila.film.title,sakila.film_actor.actor_id,concat_ws(' ',sakila.actor.first_name,sakila.actor.last_name) as actor_name
from sakila.film 
join sakila.film_actor
on sakila.film.film_id =  sakila.film_actor.film_id
join sakila.actor
on sakila.film_actor.actor_id = sakila.actor.actor_id
where sakila.film_actor.film_id=369;

/*7. What query would you run to get all drama films with a rental rate of 2.99? 
Your query should return film title, description, release year, rating, special features, and genre.*/
select sakila.film.title,sakila.film.description,sakila.film.release_year,
sakila.film.rating,sakila.film.special_features,sakila.category.name  as genre
from sakila.film_category
join sakila.category
on sakila.category.category_id = sakila.film_category.category_id
join sakila.film
on sakila.film.film_id = sakila.film_category.film_id
where sakila.category.name ='drama'
and sakila.film.rental_rate = 2.99 ;

/*8. What query would you run to get all the action films which are joined by SANDRA KILMER? 
Your query should return film title, description, release year, rating, special features, genre, and actor's first name and last name.*/

select sakila.film.title,sakila.film.description,sakila.film.release_year,
sakila.film.rating,sakila.film.special_features,sakila.category.name  as genre 
,concat_ws(' ',sakila.actor.first_name,sakila.actor.last_name) as actor_name
from sakila.film
join sakila.film_category
on sakila.film.film_id = sakila.film_category.film_id
join sakila.category
on sakila.category.category_id = sakila.film_category.category_id
join sakila.film_actor
on sakila.film_actor.film_id = sakila.film_category.film_id
join sakila.actor
on sakila.film_actor.actor_id = sakila.actor.actor_id
where sakila.category.name ='action'
and sakila.actor.first_name = 'SANDRA'
and sakila.actor.last_name = 'KILMER';