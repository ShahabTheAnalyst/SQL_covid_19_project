/* 
	Question: Which column should be used for anlyzing vaccination?
*/
	

	--A. To investigate which column contains information on vaccination that I can use for our analysis 

WITH CTE  AS (
	
	SELECT 
		death.location, 
		death.population,
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)) AS fully_vaccinated,
		SUM(CAST(vacci.people_vaccinated AS BIGINT)) AS people_vaccinated
	FROM 
		covid_vacci AS vacci
	LEFT JOIN
		covid_deaths AS death
	ON
		vacci.location = death.location AND vacci.date = death.date
	GROUP BY 
		death.location,
		population
)
SELECT 
	location, 
	((fully_vaccinated/population)*100) AS percentage_fully_vaccinated,
	((people_vaccinated/population)*100) AS percentage_people_vaccinated
FROM 
	CTE
ORDER BY 
	2 DESC;

/* The output shows that the column people_fully_vaccinated contains information on the number of 
people fully vaccinated. Thus, I will use it.*/