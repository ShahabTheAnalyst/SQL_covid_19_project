/*
Question: What is the death percentage by quarters of year?
*/

SELECT
    EXTRACT(QUARTER FROM date) AS quarter_year,
    ROUND((AVG(CAST(total_deaths AS INTEGER) / CAST(total_cases AS INTEGER)) * 100), 2) AS Death_Percentage
FROM 
	Covid_deaths
WHERE 
	continent IS NOT NULL
GROUP BY 
     EXTRACT(QUARTER FROM date) 
ORDER BY 
	2 DESC;


/* 
The output shows that the likelihood of dying from COVID-19 is significantly higher in the second quarter of the year followed by the first quarter?
*/