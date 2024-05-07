/*
    Question: What is the reporduction rate during the pandemic?
*/



	--A. Top 10 Countries 

SELECT 
	location, 
	AVG(CAST(reproduction_rate AS FLOAT)) AS avg_reproduction_rate
FROM 
	covid_deaths
WHERE 
	continent IS NOT NULL AND
    reproduction_rate IS NOT NULL
GROUP BY 
	location
ORDER BY 
	2 DESC
LIMIT 10;

/* Spain has the highest reproduction rate, while United States has the lowest reproduction rate
during the pandemic.*/

	--B. By continent

SELECT 
	continent, 
    AVG(CAST(reproduction_rate AS FLOAT)) AS avg_reproduction_rate
FROM
	covid_deaths
WHERE 
	continent IS NOT NULL AND 
    reproduction_rate IS NOT NULL
GROUP BY
	continent
ORDER BY 
	2 DESC;

/* Europe has the highest reproduction rate while Oceania has the lowest*/

	--C. By Income Group

SELECT 
	location, 
    AVG(CAST(reproduction_rate AS FLOAT)) AS avg_reproduction_rate
FROM 
	covid_deaths
WHERE 
	continent IS NULL AND  
	location IN ('Lower middle income', 'Low income', 'Upper middle income', 'High income')
GROUP BY 
    location;

/* There is no data on reproduction rate in the case of classification of countries by income*/ 

    -- For confirmation
        select 
            location, 
            reproduction_rate
        from 
            covid_deaths
        where 
            reproduction_rate is not null and 
            location in ('Lower middle income', 'Low income', 'Upper middle income','High income')