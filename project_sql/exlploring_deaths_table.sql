-- Checking the Location column

SELECT 
	DISTINCT(location)
FROM
	covid_deaths
ORDER BY 
	location;
	
/* The output reveals that the locations column has information on countries and continents, as well as high-income,
low-income, and middle-income. */


-- Isolating the information in the location other than country names

SELECT
	DISTINCT(location)
FROM
	Covid_deaths
WHERE 
	continent IS NULL;

/* The output confirms that besides the name of countries, the location column contains information on continents,
Lower middle income, Low income, European Union,  Upper middle income,  High income */


-- Isolating information on Lower middle income, Low income, Upper middle income, and High Income

SELECT
	DISTINCT(location)
FROM 
	Covid_deaths
WHERE 
	continent IS NULL AND 
	location NOT IN ('Asia', 'Africa', 'Europe', 'Oceania', 'North America', 'South America', 'World', 'European Union');


	-- The same result can be achieved by executing the following query.
    
    SELECT
        DISTINCT(location)
    FROM 
        Covid_deaths
    WHERE 
        continent IS NULL AND 
        location IN ('High income', 'Upper middle income', 'Lower middle income', 'Low income');

/* The output shows that there are four categories of countries by income*/


-- Checking out the continent column

SELECT 
	DISTINCT(continent)
FROM 
	covid_deaths
WHERE continent IS NOT NULL;

/* The output shows that the continent column has information on continents only.*/

/* NOTE: There are groups of countries like European Union, High-income Low income, Lower middle income, Upper middle income, 
World. One thing that we have to consider is that if a country, let's say France, has separate information, 
also the information on France will be included in World, High income, and  European Union, etc. Therefore, we should be careful in 
our analysis to avoid bias or error while utilizing the information in the Location column.*/


-- Checking the location, date, COVID cases, deaths, and population and ordering by Location and date 
-- in ascending order

SELECT 
	Location, 
	date, 
	total_cases, 
	new_cases, 
	total_deaths, 
	new_deaths, 
	population
FROM
	Covid_deaths
ORDER BY 
	1, 2;