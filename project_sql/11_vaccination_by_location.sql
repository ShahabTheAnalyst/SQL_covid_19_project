
/* 
	Question: What is the percentage of population fully vaccinated?
*/

    -- Top 10 Countries

	SELECT 
		death.location AS country, 
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)/population)*100 AS pecentage-pop_vaccinated
	FROM 
		Covid_deaths AS death
	INNER JOIN 
		Covid_vacci AS vacci
		ON 
		death.location = vacci.location AND death.date =vacci.date
	WHERE 
		death.continent IS NOT NULL AND
        vacci.people_fully_vaccinated IS NOT NULL
    GROUP BY
	    death.location
    ORDER BY
        MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)/population)*100 DESC
    LIMIT 10;


-- Bottom 10 Countries

	SELECT 
		death.location AS country, 
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)/population)*100 AS people_fully_vaccinated
	FROM 
		Covid_deaths AS death
	INNER JOIN 
		Covid_vacci AS vacci
		ON 
		death.location = vacci.location AND death.date =vacci.date
	WHERE 
		death.continent IS NOT NULL AND
        vacci.people_fully_vaccinated IS NOT NULL
    GROUP BY
	    death.location
    ORDER BY
        MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)/population)*100 ASC
    LIMIT 10;



    -- By Continent

	SELECT 
		death.location AS continent, 
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)/population)*100 AS people_fully_vaccinated
	FROM 
		Covid_deaths AS death
	INNER JOIN 
		Covid_vacci AS vacci
		ON 
		death.location = vacci.location AND death.date =vacci.date
	WHERE 
		death.continent IS NULL AND
        vacci.people_fully_vaccinated IS NOT NULL AND
        death.location NOT IN ('Low income', 'Lower middle income', 'World', 'European Union', 'Upper middle income', 'High income')
    GROUP BY
	    death.location
    ORDER BY
        MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)/population)*100 DESC
    LIMIT 10;


-- By Income
    
	SELECT 
		death.location, 
		MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)/population)*100 AS people_fully_vaccinated
	FROM 
		Covid_deaths AS death
	INNER JOIN 
		Covid_vacci AS vacci
		ON 
		death.location = vacci.location AND death.date =vacci.date
	WHERE 
		death.continent IS NULL AND
        vacci.people_fully_vaccinated IS NOT NULL AND
        death.location NOT IN ('Africa', 'Asia', 'Europe', 'European Union', 'North America', 'Oceania', 'South America', 'World')
    GROUP BY
	    death.location
    ORDER BY
        MAX(CAST(vacci.people_fully_vaccinated AS BIGINT)/population)*100 DESC
    LIMIT 10;