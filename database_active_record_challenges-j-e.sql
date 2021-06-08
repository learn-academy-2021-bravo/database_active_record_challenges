-- Challenges: SQL Country Database
-- Save your queries in a file if you want to keep them for posterity.

-- WHERE
    
-- What is the population of the US? (HINT: 278357000)
    SELECT name, population
    FROM country
    WHERE name = 'United States'
-- What is the area of the US? (HINT: 9.36352e+06)
    SELECT name, population, surfacearea
    FROM country
    WHERE name = 'United States'
    
-- Which countries gained their independence before 1963?
    SELECT name, population, surfacearea, indepyear
    FROM country
    WHERE indepyear < 1963

-- List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)
    SELECT name, population, surfacearea, indepyear, 
    lifeexpectancy	
    FROM country
    WHERE population < 30e6
    AND lifeexpectancy > 45
    AND continent = 'Africa'

-- Which countries are something like a republic? (HINT: Are there 122 or 143?)
    SELECT name, population, surfacearea, indepyear, 
    lifeexpectancy, governmentform
    FROM country
    WHERE governmentform = 'Republic'  --could also be '%Republic%'?

-- Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)
    SELECT name, population, surfacearea, indepyear, 
    lifeexpectancy, governmentform
    FROM country
    WHERE governmentform = 'Republic'
    AND indepyear > 1945
    

-- Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)
    SELECT name, population, surfacearea, indepyear, 
    lifeexpectancy, governmentform
    FROM country
    WHERE NOT (governmentform = 'Republic')
    AND indepyear > 1945

-- ORDER BY
-- Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)
    SELECT name, lifeexpectancy
    FROM country
    ORDER by lifeexpectancy
    LIMIT 15

-- Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
    SELECT name, lifeexpectancy
    FROM country
    WHERE lifeexpectancy IS NOT NULL
    ORDER by lifeexpectancy desc
    LIMIT 15

-- Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)
    SELECT name, population/surfacearea AS density
    FROM country
    WHERE population > 0
    ORDER by density
    LIMIT 5
    -- density > 0 did not work for some reason

-- Which countries have the highest population density?(HINT: starts with Macao)
    SELECT name, population/surfacearea AS density
    FROM country
    ORDER by density desc

-- Which is the smallest country by area? (HINT: .4)
    SELECT name, surfacearea
    FROM country
    ORDER by surfacearea 

-- Which is the smallest country by population? (HINT: 50)?
    SELECT name, surfacearea, population
    FROM country
    WHERE population > 0
    ORDER by population 

-- Which is the biggest country by area? (HINT: 1.70754e+07)
    SELECT name, surfacearea, population
    FROM country
    ORDER by surfacearea desc

-- Which is the biggest country by population? (HINT: 1277558000)
    SELECT name, surfacearea, population
    FROM country
    ORDER by population desc

-- Subqueries: WITH
-- Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
    WITH least_population AS (
    SELECT name, gnp, population
    FROM country
    WHERE population > 0
    AND gnp > 0
    ORDER BY gnp desc
    LIMIT 10
    )
    SELECT name, gnp, population
    FROM least_population
    ORDER by population 


-- Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
    WITH least_population AS (
    SELECT name, surfacearea, population
    FROM country
    WHERE population > 0
    AND surfacearea > 0
    ORDER BY population 
    LIMIT 10
    )
    SELECT name, surfacearea, population
    FROM least_population
    ORDER by surfacearea desc    

-- Aggregate Functions: GROUP BY
-- Which region has the highest average gnp? (HINT: North America)
    SELECT region, AVG(gnp)
    FROM country 
    GROUP by region 
    ORDER by AVG(gnp) desc 

-- Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
    SELECT headofstate, SUM(population)
    FROM country 
    GROUP by headofstate
    ORDER by SUM(population) desc

-- Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
    SELECT headofstate, SUM(surfacearea)
    FROM country 
    GROUP by headofstate
    ORDER by SUM(surfacearea) desc

-- What is the average life expectancy for all continents?
    SELECT continent, AVG(lifeexpectancy)
    FROM country 
    GROUP by continent
    ORDER by AVG(lifeexpectancy) desc

    --Null appeared and could not figure out how to not have it appear

-- What are the most common forms of government? (HINT: use count(*))
    SELECT governmentform, COUNT(*)
    FROM country 
    GROUP by governmentform
    ORDER by count desc


-- How many countries are in North America?
    SELECT region, COUNT(*)
    FROM country 
    WHERE region= 'North America'
    GROUP by region

-- What is the total population of all continents?
    SELECT continent, SUM(population)
    FROM country 
    GROUP by continent
    ORDER by SUM(population) desc
-- Stretch Challenges
-- Which countries have the letter ‘z’ in the name? How many?
    SELECT name
    FROM country 
    WHERE name 
    LIKE '%z%'

-- Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
    WITH smallest_surface_area AS (
    SELECT name, gnp, surfacearea
    FROM country
    WHERE surfacearea > 0
    AND gnp > 0
    ORDER BY surfacearea 
    LIMIT 10 
    )
    SELECT name, gnp, surfacearea
    FROM smallest_surface_area
    ORDER by gnp desc

-- Of the smallest 10 countries by population, which has the biggest per capita gnp?
      WITH biggest_per_capita AS (
        SELECT name, gnp/population AS avg_gnp, surfacearea
        FROM country
        WHERE surfacearea > 0
        AND population > 0
        AND GNP > 0
        ORDER BY surfacearea 
        LIMIT 10 
        )
        SELECT name, avg_gnp, surfacearea
        FROM biggest_per_capita
        ORDER by avg_gnp desc


-- Of the biggest 10 countries by area, which has the biggest gnp?
    WITH largest_surface_area AS (
    SELECT name, gnp, surfacearea
    FROM country
    WHERE surfacearea > 0
    AND gnp > 0
    ORDER BY surfacearea desc
    LIMIT 10 
    )
    SELECT name, gnp, surfacearea
    FROM largest_surface_area
    ORDER by gnp desc

-- Of the biggest 10 countries by population, which has the biggest per capita gnp?
    WITH biggest_per_capita AS (
    SELECT name, gnp/population AS avg_gnp, population
    FROM country
    WHERE population > 0
	AND GNP > 0
    ORDER BY population desc
    LIMIT 10 
    )
    SELECT name, avg_gnp, population
    FROM biggest_per_capita
    ORDER by avg_gnp desc

-- What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?

    --10 biggest
    WITH surface_area_sum AS(SELECT name, surfacearea
    FROM country 
    ORDER BY surfacearea desc
    LIMIT 10)
    SELECT SUM(surfacearea)
    FROM surface_area_sum

    --10 smallest
    WITH surface_area_sum AS(SELECT name, surfacearea
    FROM country 
    ORDER BY surfacearea 
    LIMIT 10)
    SELECT SUM(surfacearea)
    FROM surface_area_sum
    
-- What year is this country database from? Cross reference various pieces of information to determine the age of this database.
SELECT name, population
FROM country
ORDER BY population desc
LIMIT 10

    --2001
