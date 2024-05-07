-- Create covid_deaths table

CREATE TABLE public.covid_deaths
(
    iso_code VARCHAR(255),
    continent VARCHAR(255),
    location VARCHAR(255),
    date TIMESTAMP,
    population FLOAT,
    total_cases VARCHAR(255),
    new_cases FLOAT,
    new_cases_smoothed FLOAT,
    total_deaths VARCHAR(255),
    new_deaths FLOAT,
    new_deaths_smoothed FLOAT,
    total_cases_per_million VARCHAR(255),
    new_cases_per_million FLOAT,
    new_cases_smoothed_per_million FLOAT,
    total_deaths_per_million FLOAT,
    new_deaths_per_million VARCHAR(255),
    new_deaths_smoothed_per_million FLOAT,
    reproduction_rate VARCHAR(255),
    icu_patients VARCHAR(255),
    icu_patients_per_million VARCHAR(255),
    hosp_patients VARCHAR(255),
    hosp_patients_per_million VARCHAR(255),
    weekly_icu_admissions VARCHAR(255),
    weekly_icu_admissions_per_million VARCHAR(255),
    weekly_hosp_admissions VARCHAR(255),
    weekly_hosp_admissions_per_million VARCHAR(255)
);



-- Create covid_vacci table

CREATE TABLE public.covid_vacci
(
    iso_code VARCHAR(255),
    continent VARCHAR(255),
    location VARCHAR(255),
    date TIMESTAMP,
    total_tests	VARCHAR(255),
    new_tests VARCHAR(255),
    total_tests_per_thousand VARCHAR(255),	
    new_tests_per_thousand VARCHAR(255),
    new_tests_smoothed VARCHAR(255),
    new_tests_smoothed_per_thousand	VARCHAR(255),
    positive_rate VARCHAR(255),
    tests_per_case VARCHAR(255),	
    tests_units	VARCHAR(255),
    total_vaccinations VARCHAR(255),	
    people_vaccinated VARCHAR(255),	
    people_fully_vaccinated VARCHAR(255),
    total_boosters VARCHAR(255),
    new_vaccinations VARCHAR(255),
    new_vaccinations_smoothed VARCHAR(255),
    total_vaccinations_per_hundred VARCHAR(255),
    people_vaccinated_per_hundred VARCHAR(255),
    people_fully_vaccinated_per_hundred	VARCHAR(255),
    total_boosters_per_hundred VARCHAR(255),
    new_vaccinations_smoothed_per_million VARCHAR(255),
    new_people_vaccinated_smoothed VARCHAR(255),
    new_people_vaccinated_smoothed_per_hundred VARCHAR(255),
    stringency_index FLOAT,
    population_density FLOAT,
    median_age FLOAT,
    aged_65_older FLOAT,
    aged_70_older FLOAT,
    gdp_per_capita FLOAT,
    extreme_poverty VARCHAR(255),
    cardiovasc_death_rate FLOAT,
    diabetes_prevalence FLOAT,
    female_smokers VARCHAR(255),
    male_smokers VARCHAR(255),
    handwashing_facilities FLOAT,
    hospital_beds_per_thousand FLOAT,
    life_expectancy FLOAT,
    human_development_index FLOAT,
    excess_mortality_cumulative_absolute VARCHAR(255),
    excess_mortality_cumulative	VARCHAR(255),
    excess_mortality VARCHAR(255),
    excess_mortality_cumulative_per_million VARCHAR(255)
);


-- Set ownership of the tables to the postgres user
ALTER TABLE public.covid_deaths OWNER to postgres;
ALTER TABLE public.covid_vacci OWNER to postgres;


