/*
Question: What is the death percentage by months of year?
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
    ROUND((AVG(CAST(total_deaths AS INTEGER) / CAST(total_cases AS INTEGER)) * 100), 2) AS Death_Percentage_monthwise
FROM 
	Covid_deaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	EXTRACT(MONTH FROM date)
ORDER BY 
	2 DESC;


/* 
The output shows that the likelihood of dying from COVID-19 is significantly higher in the first 
six months of the year.
*/