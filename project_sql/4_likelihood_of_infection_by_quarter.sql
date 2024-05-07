/* 
Question: Which quarter of the year has the highest likelihood of contracting the infection?
*/

SELECT
    EXTRACT(QUARTER FROM date) AS quarter_year,
    ROUND((AVG(CAST(new_cases AS INTEGER) / CAST(total_cases AS INTEGER)) * 100), 3) AS infection_rate
FROM 
	Covid_deaths
WHERE 
	continent IS NOT NULL
GROUP BY
    EXTRACT(QUARTER FROM date) 
ORDER BY 
	1 ASC;

/* 
The output shows that the likelihood of contracting covid 19 is significantllly higher in the 
higher in the first two quarters.
*/
