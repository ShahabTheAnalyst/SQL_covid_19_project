

COPY covid_deaths
FROM 'E:\Data Analysis\Portfolio\SQL\SQL_covid_19\Data\covid_deaths.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY covid_vacci
FROM 'E:\Data Analysis\Portfolio\SQL\SQL_covid_19\Data\covid_vacci.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
