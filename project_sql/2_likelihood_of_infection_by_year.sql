/* 
Question: Which months has the highest likelihood of contracting the infection?
*/

SELECT
    EXTRACT(YEAR FROM date) AS year,
    ROUND((AVG(CAST(new_cases AS INTEGER) / CAST(total_cases AS INTEGER)) * 100), 3) AS infection_rate_year
FROM 
	Covid_deaths
WHERE 
	continent IS NOT NULL
GROUP BY
    EXTRACT(YEAR FROM date)
ORDER BY 
	2 DESC;

/* 
The output shows that the likelihood of contracting covidd 19 is significantllly higher in the 
first four months of the year.
*/
