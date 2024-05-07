/* 
Question: Which months has the highest likelihood of contracting the infection?
*/

SELECT
   CASE
        WHEN EXTRACT(MONTH FROM date) = 1 THEN 'Jan'
        WHEN EXTRACT(MONTH FROM date) = 2 THEN 'Feb'
        WHEN EXTRACT(MONTH FROM date) = 3 THEN 'Mar'
        WHEN EXTRACT(MONTH FROM date) = 4 THEN 'Apr'
        WHEN EXTRACT(MONTH FROM date) = 5 THEN 'May'
        WHEN EXTRACT(MONTH FROM date) = 6 THEN 'Jun'
        WHEN EXTRACT(MONTH FROM date) = 7 THEN 'Jul'
        WHEN EXTRACT(MONTH FROM date) = 8 THEN 'Aug'
        WHEN EXTRACT(MONTH FROM date) = 9 THEN 'Sep'
        WHEN EXTRACT(MONTH FROM date) = 10 THEN 'Oct'
        WHEN EXTRACT(MONTH FROM date) = 11 THEN 'Nov'
        ELSE 'Dec'
        END AS month,
    EXTRACT(MONTH FROM date) AS month_number,
    ROUND((AVG(CAST(new_cases AS INTEGER) / CAST(total_cases AS INTEGER)) * 100), 3) AS infection_rate_monthwise
FROM 
	Covid_deaths
WHERE 
	continent IS NOT NULL
GROUP BY
	EXTRACT(MONTH FROM date)
ORDER BY 
	2 ASC;

/* 
The output shows that the likelihood of contracting covidd 19 is significantllly higher in the 
first four months of the year.
*/
