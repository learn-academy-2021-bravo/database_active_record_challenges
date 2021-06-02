-- WHERE
-- What is the population of the US? (HINT: 278357000)

SELECT name, population, region 

FROM country

WHERE name = 'United States'

-- What is the area of the US? (HINT: 9.36352e+06)

SELECT name, surfacearea, region 

FROM country

WHERE name = 'United States'

-- Which countries gained their independence before 1963?

SELECT name, indepyear

FROM country

WHERE indepyear < 1963

-- List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)

SELECT name, population, lifeexpectancy

FROM country

WHERE population < 30000000 AND lifeexpectancy > 45

-- Which countries are something like a republic? (HINT: Are there 122 or 143?)

SELECT name, governmentform

FROM country

WHERE governmentform LIKE '%epublic%'

-- Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)

SELECT name, governmentform, indepyear

FROM country

WHERE governmentform LIKE '%epublic%' AND indepyear > 1945

-- Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)
SELECT name, governmentform, indepyear

FROM country

WHERE governmentform NOT LIKE '%epublic%' AND indepyear > 1945

-- ORDER BY
-- Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)
SELECT name, lifeexpectancy

FROM country

order by lifeexpectancy

limit 15

-- Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
SELECT name, lifeexpectancy
FROM country
where lifeexpectancy is not null
order by lifeexpectancy desc
limit 15

-- Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)


-- Which countries have the highest population density?(HINT: starts with Macao)


-- Which is the smallest country by area? (HINT: .4)
SELECT name, population, surfacearea
FROM country
order by surfacearea
limit 1

-- Which is the smallest country by population? (HINT: 50)?
select name, population
from country
where population > 0
order by population
limit 1

-- Which is the biggest country by area? (HINT: 1.70754e+07)
select name, population, surfacearea
from country
order by surfacearea desc
limit 100

-- Which is the biggest country by population? (HINT: 1277558000)
select name, population, surfacearea
from country
order by population desc
limit 1

-- Subqueries: WITH
-- Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)

WITH top_ten AS (SELECT name, gnp, population
FROM country 
where gnp > 0
order by gnp desc
limit 10)
select * from top_ten
order by population limit 1

-- Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)

WITH top_ten AS (SELECT name, surfacearea, population
FROM country 
where population > 0
order by population asc
limit 10)
select * from top_ten
order by surfacearea desc 
limit 1

-- Aggregate Functions: GROUP BY
-- Which region has the highest average gnp? (HINT: North America)



-- Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
-- Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
-- What is the average life expectancy for all continents?
-- What are the most common forms of government? (HINT: use count(*))
-- How many countries are in North America?
-- What is the total population of all continents?
