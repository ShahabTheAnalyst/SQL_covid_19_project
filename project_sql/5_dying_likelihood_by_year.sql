/*
    Question: What is the the probability of dying of covid?
*/ 

-- Checking distinct years and months

    SELECT 
        DISTINCT(EXTRACT(YEAR FROM date)) AS YEAR
    FROM 
        covid_deaths;



    SELECT 
        DISTINCT(EXTRACT(MONTH FROM date)) AS month
    FROM 
        covid_deaths
    ORDER BY 
        month;


-- Probability of dying if infected with covid 19;

    SELECT
        EXTRACT(YEAR FROM date) AS year,
        ROUND(AVG(CAST(total_deaths AS INTEGER) / CAST(total_cases AS INTEGER) * 100), 2) AS Death_Percentage_2020
    FROM 
        Covid_deaths
    WHERE 
        continent IS NOT NULL
    GROUP BY 
        EXTRACT(YEAR FROM date)        
    ORDER BY 
        2 DESC;
 
/*
The output shows that the probability of dying is the highest in 2020. It may be due to the 
fact that it was the start of the pandemic and the public was not aware of the precautions and
treatment necessary for covid 19.
*/