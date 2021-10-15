/*
Tabla TEMPORAL:
  113111 Filas cargadas correctamente.
*/

SELECT COUNT(*) total_records FROM (
    SELECT * FROM TEMPORAL
)
;

/* CONTINENT */
INSERT INTO CONTINENT (name)
    SELECT t.continent FROM TEMPORAL t
    GROUP BY t.continent
;

/* COUNTRY */
INSERT INTO COUNTRY (iso_code, location, code_) (

    SELECT t.iso_code, t.location_, co.code FROM TEMPORAL t
    LEFT JOIN CONTINENT co ON co.name = t.continent
    GROUP BY t.iso_code, t.location_, co.code
)
;

/* CASE REGISTER */
INSERT INTO CASE_REGISTER (date_, new_cases, new_cases_smoothed, new_cases_per_million, 
    new_cases_smoothed_per_million, total_cases, total_cases_per_million, iso_code_)

    SELECT TO_DATE(t.date_, 'YYYY-MM-DD') date_, t.new_cases, t.new_cases_smoothed, t.new_cases_per_million,
        t.new_cases_smoothed_per_million, t.total_cases, t.total_cases_per_million, co.iso_code
    FROM TEMPORAL t
    
    INNER JOIN COUNTRY co ON co.iso_code = t.iso_code
;

/* DEATH_REGISTER */
INSERT INTO DEATH_REGISTER (date_, new_deaths, new_deaths_smoothed, new_deaths_per_million,
        new_deaths_smoothed_per_million, total_deaths, total_deaths_per_million, iso_code_)

    SELECT TO_DATE(t.date_, 'YYYY-MM-DD') date_, t.new_deaths, t.new_deaths_smoothed, t.new_deaths_per_million,
        t.new_deaths_smoothed_per_million, t.total_deaths, t.total_deaths_per_million, co.iso_code
    FROM TEMPORAL t
    
    INNER JOIN COUNTRY co ON co.iso_code = t.iso_code
;


/* INTENSIVE_PATIENTS */
INSERT INTO INTENSIVE_PATIENTS (date_, icu_patients, icu_patients_per_million, 
        weekly_icu_admissions, weekly_icu_admissions_per_million, iso_code_)
        
    SELECT TO_DATE(t.date_, 'YYYY-MM-DD') date_, t.icu_patients, t.icu_patients_per_million, 
        t.weekly_icu_admissions, t.weekly_icu_admissions_per_million, co.iso_code
    FROM TEMPORAL t
    
    INNER JOIN COUNTRY co ON co.iso_code = t.iso_code
;

/* HOSPITALIZED */
INSERT INTO HOSPITALIZED (date_, hosp_patients, hosp_patients_per_million, 
    weekly_hosp_admissions, weekly_hosp_admissions_per_million, iso_code_)
    
    SELECT TO_DATE(t.date_, 'YYYY-MM-DD') date_, t.hosp_patients, t.hosp_patients_per_million,
        t.weekly_hosp_admissions, t.weekly_hosp_admissions_per_million, co.iso_code
    FROM TEMPORAL t
    
    INNER JOIN COUNTRY co ON co.iso_code = t.iso_code
;    

/* TEST_UNIT */
INSERT INTO TEST_UNIT (name)
    SELECT t.tests_units FROM TEMPORAL t
    GROUP BY t.tests_units
;

/* TEST_REGISTER */
INSERT INTO TEST_REGISTER (date_, new_tests, total_tests, total_tests_per_thousand,
        new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand,
        tests_per_case, positive_rate, iso_code_, code_testunit_)
        
    SELECT TO_DATE(t.date_, 'YYYY-MM-DD') date_, t.new_tests, t.total_tests, 
        t.total_tests_per_thousand, t.new_tests_per_thousand, t.new_tests_smoothed,
        t.new_tests_smoothed_per_thousand, t.tests_per_case, t.positive_rate,
        co.iso_code, tu.code
    FROM TEMPORAL t
    
    INNER JOIN COUNTRY co ON co.iso_code = t.iso_code
    LEFT JOIN TEST_UNIT tu ON tu.name = t.tests_units 
;

/* VACCINATION */
INSERT INTO VACCINATION (date_, total_vaccinations, people_vaccinated,
        people_fully_vaccinated, total_boosters, new_vaccinations, new_vaccinations_smoothed,
        total_vaccinations_per_hundred, people_vaccinated_per_hundred, total_boosters_per_hundred,
        new_vaccinations_smoothed_per_million, iso_code_)

    SELECT TO_DATE(t.date_, 'YYYY-MM-DD') date_, t.total_vaccinations, t.people_vaccinated,
        t.people_fully_vaccinated, t.total_boosters, t.new_vaccinations, t.new_vaccinations_smoothed,
        t.total_vaccinations_per_hundred, t.people_vaccinated_per_hundred, t.total_boosters_per_hundred,
        t.new_vaccinations_smoothed_per_million, co.iso_code
    FROM TEMPORAL t
    INNER JOIN COUNTRY co ON co.iso_code = t.iso_code
;

/* COUNTRY_DETAIL */
INSERT INTO COUNTRY_DETAIL (date_, reproduction_rate, stringency_index, 
        population, population_density, median_age, aged_65_older, aged_70_older,
        gdp_per_capita, extreme_poverty, cardiovasc_death_rate, diabetes_prevalence,
        female_smokers, male_smokers, handwashing_facilities, hospital_beds_per_thousand,
        life_expectancy, human_development_index, excess_mortality_cumulative_absolute,
        excess_mortality_cumulative, excess_mortality, excess_mortality_cumulative_per_million,
        iso_code_)
        
    SELECT TO_DATE(t.date_, 'YYYY-MM-DD') date_, t.reproduction_rate, t.stringency_index, 
        t.population, t.population_density, t.median_age, t.aged_65_older, t.aged_70_older,
        t.gdp_per_capita, t.extreme_poverty, t.cardiovasc_death_rate, t.diabetes_prevalence,
        t.female_smokers, t.male_smokers, t.handwashing_facilities, t.hospital_beds_per_thousand,
        t.life_expectancy, t.human_development_index, t.excess_mortality_cumulative_absolute,
        t.excess_mortality_cumulative, t.excess_mortality, t.excess_mortality_cumulative_per_million,
        co.iso_code
    FROM TEMPORAL t

    INNER JOIN COUNTRY co ON co.iso_code = t.iso_code
;

SELECT COUNT(t.date_) FROM TEMPORAL t
GROUP BY t.date_
;

DROP TABLE COUNTRY;
DROP TABLE CONTINENT;

SELECT * FROM TEMPORAL;
SELECT * FROM CONTINENT;


