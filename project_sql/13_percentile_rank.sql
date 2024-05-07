-- 15. Calculating the percentile rank based on the ratio of fully vaccinated people to the population for each location

WITH VaccinationData AS (
    SELECT
        vacci.location,
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)) AS max_fully_vaccinated,
        death.population
    FROM 
        covid_vacci AS vacci
    JOIN covid_deaths AS death
        ON vacci.location = death.location AND vacci.date = death.date
    WHERE 
        death.continent is not null
	GROUP BY 
        vacci.location, death.population
)
SELECT
    location,
    PERCENT_RANK() OVER (
        ORDER BY (max_fully_vaccinated / population) * 100) as Percentile_Rank
FROM 
    VaccinationData
ORDER BY 
    Percentile_Rank DESC;
