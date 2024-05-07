/* Question: What is the likelihood of dying if infected by covid-19

*/


-- By Country

SELECT
    location AS country,
    MAX(CAST(total_cases AS INTEGER)) AS total_cases,
    MAX(CAST(total_deaths AS INTEGER)) AS total_deaths,
    MAX(CAST(total_deaths AS FLOAT)) * 100 / MAX(CAST(total_cases AS FLOAT)) AS death_percentage_country
FROM
    covid_deaths
WHERE
    continent IS NOT NULL AND 
	total_deaths IS NOT NULL
GROUP BY
    location
ORDER BY
    4 DESC
LIMIT 10;


/* 
The output shows that Yemen has highest probability of dying if infected with covid 19 
of 18 percent.
*/

-- By Continent

SELECT
    continent,
    MAX(CAST(total_cases AS INTEGER)) AS total_cases,
    MAX(CAST(total_deaths AS INTEGER)) AS total_deaths,
    MAX(CAST(total_deaths AS float)) * 100 / max(CAST(total_cases AS float)) AS Death_Percentage_Country
FROM
    Covid_deaths
WHERE
    continent IS NOT NULL
GROUP BY 
    continent
ORDER BY
    4 DESC;

/*
The result shows that Africa has the highest probability of dying if infected with covid 19
of 2.5 percent while Oceania has the lowest (0.19 percent).
*/

-- By Countries by income

SELECT
    location,
    MAX(CAST(total_cases AS INTEGER)) AS total_cases,
    MAX(CAST(total_deaths AS INTEGER)) AS total_deaths,
    MAX(CAST(total_deaths AS FLOAT)) * 100 / MAX(CAST(total_cases AS FLOAT)) AS Death_Percentage_Country
FROM
    Covid_deaths
WHERE
    continent IS NULL AND 
	location IN ('High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY 
    location
ORDER BY
    4 DESC;

/* 
The result shows that the likelihood of dying if infected with covid 19 is the highest 
in case of Low Income Countries (2.07 percent) while it is the lowest in case of High Income 
countries (0.7 percent).
*/