-- 14. Checking average rolling people vaccinated by year
	
	--A. By country (Using CTE)

WITH CTE AS
	(
	SELECT 
		death.continent, 
		death.location, 
		death.date, 
		death.population, 
		vacci.people_fully_vaccinated, 
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)) 
		Over (
			PARTITION BY death.location 
			ORDER BY death.location, death.date) AS rolling_people_vaccinated
	FROM 
		Covid_deaths AS death
	INNER JOIN 
		Covid_vacci AS vacci
		ON 
		death.location = vacci.location AND death.date =vacci.date
	WHERE 
		death.continent IS NOT NULL
	)
SELECT 
	location, 
	EXTRACT(YEAR FROM date) AS year, 
	AVG((rolling_people_vaccinated/population)*100) AS Rolling_percent_people_vaccinated
FROM
	CTE
WHERE 
	continent IS NOT NULL AND
	rolling_people_vaccinated IS NOT NULL AND
	EXTRACT(YEAR FROM date) IS NOT NULL
GROUP BY
	location,
	EXTRACT(YEAR FROM date)
ORDER BY
	location,
	EXTRACT(YEAR FROM date);

-- The same result can be obtained by using sub-query;
	
SELECT 
	location, 
	EXTRACT(YEAR FROM date) AS year, 
	AVG((rolling_people_vaccinated/population)*100) AS Rolling_percent_people_vaccinated
FROM
	(
	SELECT 
		death.continent, 
		death.location, 
		death.date, 
		death.population, 
		vacci.people_fully_vaccinated, 
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)) 
		Over (
			PARTITION BY death.location 
			ORDER BY death.location, death.date) AS rolling_people_vaccinated
	FROM 
		Covid_deaths AS death
	INNER JOIN 
		Covid_vacci AS vacci
		ON 
		death.location = vacci.location AND death.date =vacci.date
	WHERE 
		death.continent IS NOT NULL
	)
WHERE 
	continent IS NOT NULL AND
	rolling_people_vaccinated IS NOT NULL
GROUP BY
	location,
	EXTRACT(YEAR FROM date)
ORDER BY
	location,
	EXTRACT(YEAR FROM date)


--B. By continent


WITH CTE AS (
	SELECT
	death.continent, 
	death.location, 
	death.date, 
	death.population, 
	vacci.people_fully_vaccinated, 
	max(CAST(vacci.people_fully_vaccinated AS BIGINT))
		OVER (
			PARTITION BY 
			death.location
			ORDER BY death.location, death.date) AS rolling_people_vaccinated
	FROM 
		Covid_deaths AS death
	JOIN
		Covid_vacci AS vacci
		ON
		death.location = vacci.location AND death.date =vacci.date
		)
SELECT 
	continent, 
	EXTRACT(year FROM date) AS Year, 
	AVG((Rolling_people_vaccinated/population)*100) AS Percent_pop_vaccinated 
FROM 
	CTE
WHERE 
	continent IS NOT NULL AND
	Rolling_people_vaccinated IS NOT NULL
GROUP BY 
	EXTRACT(YEAR FROM date), 
	continent
ORDER BY
	1, 
	2;

/* The output shows that the vaccinated percentage of the population on each continent has increased over the years.*/

	--C. For by income group


SELECT
	location, 
	EXTRACT(YEAR FROM date) AS Year, 
	AVG((Rolling_people_vaccinated/population)*100) AS Rolling_people_Vaccinated_percent_pop
FROM 
	(
	SELECT 
		death.continent, 
		death.location, 
		death.date, 
		death.population, 
		vacci.people_fully_vaccinated, 
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT))
	OVER (
		PARTITION BY 
			death.location
		ORDER BY 
			death.location, 
			death.date
				) AS Rolling_people_vaccinated
	FROM 
		Covid_deaths AS death
	INNER JOIN 
		Covid_vacci AS vacci
	ON 
		death.location = vacci.location AND
		death.date =vacci.date
)
WHERE 
	location IN ('World', 'High income', 'Upper middle income', 'Lower middle income', 'Low income') AND
	rolling_people_vaccinated IS NOT NULL
GROUP BY 
	EXTRACT(YEAR FROM date), 
	location
ORDER BY 
	1, 
	2;