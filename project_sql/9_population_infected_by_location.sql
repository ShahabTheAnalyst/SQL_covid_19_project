
/* 
	Question:: What is the percentage of population infected by location?
*/


	--A. Percent of population infected by country

SELECT 
	location AS country, 
	MAX(CAST(total_cases AS INTEGER)/population)*100 AS Percent_pop_infected 
FROM 
	Covid_deaths
WHERE 
	continent IS NOT NULL AND
	total_cases IS NOT NULL AND
	population <> 0
GROUP BY
	location
ORDER BY 
	2 DESC
LIMIT 10;


/*
The output shows top 10 countries with the highest percentage of population infected by covid 19.
*/


	--B. Percent of population infected by continent 

SELECT 
	continent, 
	MAX(CAST(total_cases AS INTEGER)/population)*100 AS Percent_pop_infected
FROM 
	Covid_deaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	continent
ORDER BY
	2 DESC;

/* The output shows that the percentage of the population affected infected is the highest in the case of Europe, while it is the 
lowest in the case of Oceania*/ 


	--C. Percent of population infected by classification of countries by income

SELECT 
	location, 
	MAX(CAST(total_cases AS INTEGER)/population)*100 AS Percent_pop_infected
FROM 
	Covid_deaths
WHERE 
	continent IS NULL AND 
	location IN ('High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY 
	location
ORDER BY 
	2 DESC;

/* The output shows that the percentage of the population affected infected is the highest in the case of High-income countries,
while it is the lowest in the case of low-income countries.*/