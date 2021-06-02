What is the population of the US? (HINT: 278357000)
     select name, population
    from country
    where name='United States'

What is the area of the US? (HINT: 9.36352e+06)
    select name, surfacearea
    from country
    where name='United States'

Which countries gained their independence before 1963?
     select name, indepyear
    from country
    where indepyear < '1963'
List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)
    select name, population, lifeexpectancy
    from country
    where population < 30000000
    and lifeexpectancy > 45
    and continent ='Africa'
Which countries are something like a republic? (HINT: Are there 122 or 143?)
    select name, governmentform
    from country
    where governmentform
    like '%Republic'
Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)
select name, governmentform, indepyear
    from country
    where governmentform 
    like '%Republic'
    and indepyear > 1945
Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)
select name, governmentform, indepyear
    from country
    where governmentform 
    not like '%Republic'
    and indepyear > 1945

Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)
    select name, lifeexpectancy
    from country
    where lifeexpectancy is not null
    order by lifeexpectancy 
    limit 15 
Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
    select name, lifeexpectancy
    from country
    where lifeexpectancy is not null
    order by lifeexpectancy desc
    limit 15 
Which five countries have the lowest population density (density = population / surfacearea)? (HINT:    starts with Greenland)
    select name, population, surfacearea,
    population / surfacearea as density
    from country
    where population > 0
    order by density
    limit 5
Which countries have the highest population density?(HINT: starts with Macao)
    select name, population, surfacearea,
    population / surfacearea as density
    from country
    where population > 0
    order by density desc
    limit 5	
Which is the smallest country by area? (HINT: .4)
    select name, surfacearea
    from country
    where surfacearea > 0
    order by surfacearea
    limit 1	
Which is the smallest country by population? (HINT: 50)?
    select name, population
    from country
    where population > 0
    order by population
    limit 1	
Which is the biggest country by area? (HINT: 1.70754e+07)
    select name, surfacearea
    from country
    where surfacearea > 0
    order by surfacearea desc
    limit 1
Which is the biggest country by population? (HINT: 1277558000)
    select name, population
    from country
    where population > 0
    order by population desc
l   imit 1
Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
    with smallest_gnp as (select name, population, gnp
					  from country
					  where gnp > 0
					  order by gnp desc
					  limit 10)
					  select *
					  from smallest_gnp
					  order by population
					  limit 1
Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
    WITH smallest_pop AS(SELECT name, population, surfacearea
    FROM country
    WHERE population > 0					 
    ORDER BY population 
    limit 10					 
    )
    SELECT name, population, surfacearea
    FROM smallest_pop
    ORDER BY surfacearea desc 
    LIMIT 10
Which region has the highest average gnp? (HINT: North America)
Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
What is the average life expectancy for all continents?
What are the most common forms of government? (HINT: use count(*))
How many countries are in North America?
What is the total population of all continents?
Which countries have the letter ‘z’ in the name? How many?
Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
Of the smallest 10 countries by population, which has the biggest per capita gnp?
Of the biggest 10 countries by area, which has the biggest gnp?
Of the biggest 10 countries by population, which has the biggest per capita gnp?
What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
What year is this country database from? Cross reference various pieces of information to determine the age of this database.
