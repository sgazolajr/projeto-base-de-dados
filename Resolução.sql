/* P1 Base de dados
Nome: Sidnei Gazola Junior, nºUSP:9378888 */

--1a
select roles.category, count(roles.personid) 
	from roles natural join movies 
	where movies.year =2019
	group by roles.category;

--1b
select staff.name 
	from movies natural join roles natural join staff
	where movies.year =2015 and
		movies.title like '%Looking Glass%';

--1c
select movies.title 
	from movies natural join roles natural join staff
	where staff.name='Frances Conroy' or 
		  staff.name='Edward Norton'
	group by movies.title
		having count(movies.title)>1;

--1d
select count(distinct(title)) from movies
	where title in(
		select title from movies
			group by title
				having count(title)>3
	);
	
--1e
select roles.category, movies.year, count(roles.personid) 
	from roles natural join movies
	group by roles.category,movies.year;
	
--3c
--Restricoes de Integridade da Chave:
select count (movieid) from movies
	group by movieid
		having count(movieid)>1;

select count (personid)	from staff
	group by personid
		having count(personid)>1;
		
--Restricoes de Integridade da Entidade
select count(movieid) from movies
	where movieid is null;

select count(personid) from staff
	where personid is null;
		
--Restricoes de Integridade Referencial
select * from roles
	where movieid not in(
		select movieid from movies
	)or
	personid not in(
		select personid from staff
	);