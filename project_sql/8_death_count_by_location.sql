/* 
    Question: Which locations had the highest death count? 
*/

	--A. By Country

SELECT 
	Location AS country, 
	MAX(CAST(total_deaths AS INTEGER)) AS Total_death_count
FROM 
	Covid_deaths
WHERE
	continent IS NOT NULL AND
    total_deaths IS NOT NULL
GROUP BY 
	Location
ORDER BY 
	Total_death_count DESC
LIMIT 10;

/* The output shows that the United States has the highest death count.*/ 

	
    --B. By Continent

SELECT 
	Location as continent, 
	MAX(CAST(total_deaths AS INTEGER)) AS Total_death_count
FROM
	Covid_deaths
WHERE 
	continent IS NULL AND 
    total_deaths IS NOT NULL AND
	location IN ('Africa', 'Asia', 'Europe', 'North America', 'Oceania', 'South America')
GROUP BY
	location
ORDER BY 
	2 DESC;

/* Europe has  the highest death count while Oceania has the lowest.*/

	--C. By Income Group

SELECT 
	Location, 
	MAX(CAST(total_deaths AS INTEGER)) AS Total_death_count
FROM
	Covid_deaths
WHERE 
	continent IS NULL AND
    total_deaths IS NOT NULL AND 
	location IN ('High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY
	location
ORDER BY 
	2 desc;

/* High-income countries have the highest death count while Low-income countries have the lowest.*/