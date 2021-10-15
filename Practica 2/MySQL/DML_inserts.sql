USE bd1_practica2;

/* 123,319 */
SELECT COUNT(*) total_temporal FROM (
    SELECT * FROM temporal
) t;

SELECT * FROM continent;
SELECT * FROM country;

-- CONTINENT: 7 filas - 1.457 seg
INSERT INTO continent (name)
	SELECT t.continent FROM temporal t
	GROUP BY t.continent
;

-- COUNTRY: 233 - 1.812 seg
INSERT INTO country (iso_code, location, codeF)
    SELECT t.iso_code, t.location, co.code FROM temporal t
    LEFT JOIN continent co ON co.name = t.continent
    GROUP BY t.iso_code, t.location, co.code
;

-- CASE_REGISTER: 123,319 - 31.409 seg
INSERT INTO case_register (date_, new_cases, new_cases_smoothed, new_cases_per_million, new_cases_smoothed_per_million,
	total_cases, total_cases_per_million, iso_codeF)

        SELECT STR_TO_DATE(t.date, '%Y-%m-%d') ,
            IF(t.new_cases = '', NULL, t.new_cases),
            IF(t.new_cases_smoothed = '', NULL, t.new_cases_smoothed ),
            IF(t.new_cases_per_million = '', NULL, t.new_cases_per_million),
            IF(t.new_cases_smoothed_per_million = '', NULL, t.new_cases_smoothed_per_million ),
            IF( t.total_cases = '', NULL,  t.total_cases),
            IF(t.total_cases_per_million = '', NULL, t.total_cases_per_million),
            co.iso_code

        FROM temporal t
        INNER JOIN country co ON co.iso_code = t.iso_code
;


-- DEATH_REGISTER: 123,319 - 40.164 seg
INSERT INTO death_register (date_, new_deaths, new_deaths_smoothed, new_deaths_per_million,
	new_deaths_smoothed_per_million, total_deaths, total_deaths_per_million, iso_codeF)

    SELECT STR_TO_DATE(t.date, '%Y-%m-%d'),
        IF(t.new_deaths = '', NULL, t.new_deaths),
        IF(t.new_deaths_smoothed = '', NULL, t.new_deaths_smoothed),
        IF(t.new_deaths_per_million = '', NULL, t.new_deaths_per_million),
        IF(t.new_deaths_smoothed_per_million = '', NULL, t.new_deaths_smoothed_per_million),
        IF(t.total_deaths = '', NULL, t.total_deaths),
        IF(t.total_deaths_per_million = '', NULL, t.total_deaths_per_million),
        co.iso_code

    FROM temporal t
    INNER JOIN country co ON co.iso_code = t.iso_code
;

-- INTENSIVE_PATIENTS: 123,319 - 26.157 seg
INSERT INTO intensive_patients (date_, icu_patients, icu_patients_per_million,
        weekly_icu_admissions, weekly_icu_admissions_per_million, iso_codeF)

    SELECT STR_TO_DATE(t.date, '%Y-%m-%d'),
        IF(t.icu_patients = '', NULL, t.icu_patients),
        IF(t.icu_patients_per_million = '', NULL, t.icu_patients_per_million),
        IF(t.weekly_icu_admissions = '', NULL, t.weekly_icu_admissions),
        IF(t.weekly_icu_admissions_per_million = '', NULL, t.weekly_icu_admissions_per_million),
        co.iso_code

    FROM temporal t
    INNER JOIN country co ON co.iso_code = t.iso_code
;


-- HOSPITALIZED: 123,319 -  28.204 seg
INSERT INTO hospitalized (date_, hosp_patients, hosp_patients_per_million,
    weekly_hosp_admissions, weekly_hosp_admissions_per_million, iso_codeF)

    SELECT STR_TO_DATE(t.date, '%Y-%m-%d'),
        IF(t.hosp_patients = '', NULL, t.hosp_patients),
        IF(t.hosp_patients_per_million = '', NULL, t.hosp_patients_per_million),
        IF(t.weekly_hosp_admissions = '', NULL, t.weekly_hosp_admissions),
        IF(t.weekly_hosp_admissions_per_million = '', NULL, t.weekly_hosp_admissions_per_million),
        co.iso_code

    FROM temporal t
    INNER JOIN country co ON co.iso_code = t.iso_code
;

-- TEST_UNIT: 5 - 1.675 seg
INSERT INTO test_unit (name)
    SELECT t.tests_units FROM temporal t
    GROUP BY t.tests_units
;


-- TEST_REGISTER: 123,319 - 36.951 seg
INSERT INTO test_register (date_, new_tests, total_tests, total_tests_per_thousand,
        new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand,
        tests_per_case, positive_rate, iso_codeF, test_UnitF)

    SELECT STR_TO_DATE(t.date, '%Y-%m-%d'),
		IF(t.new_tests = '', NULL, t.new_tests),
		IF(t.total_tests = '', NULL, t.total_tests),
		IF(t.total_tests_per_thousand = '', NULL, t.total_tests_per_thousand),
		IF(t.new_tests_per_thousand = '', NULL, t.new_tests_per_thousand),
		IF(t.new_tests_smoothed = '', NULL, t.new_tests_smoothed),
		IF(t.new_tests_smoothed_per_thousand = '', NULL, t.new_tests_smoothed_per_thousand),
		IF(t.tests_per_case = '', NULL, t.tests_per_case),
		IF(t.positive_rate = '', NULL, t.positive_rate),
		co.iso_code,
		IF(tu.code = '', NULL, tu.code)
    FROM temporal t

    INNER JOIN country co ON co.iso_code = t.iso_code
    LEFT JOIN test_unit tu ON tu.name = t.tests_units
;

-- VACCINATION: 123,319 - 28.110 seg
INSERT INTO vaccination (date_, total_vaccinations, people_vaccinated,
        people_fully_vaccinated, total_boosters, new_vaccinations, new_vaccinations_smoothed,
        total_vaccinations_per_hundred, people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred,
        total_boosters_per_hundred, new_vaccinations_smoothed_per_million, iso_codeF)

    SELECT STR_TO_DATE(t.date, '%Y-%m-%d'),
        IF(t.total_vaccinations = '', NULL, t.total_vaccinations),
        IF(t.people_vaccinated = '', NULL, t.people_vaccinated),
        IF(t.people_fully_vaccinated = '', NULL, t.people_fully_vaccinated),
        IF(t.total_boosters = '', NULL, t.total_boosters),
        IF(t.new_vaccinations = '', NULL, t.new_vaccinations),
        IF(t.new_vaccinations_smoothed = '', NULL, t.new_vaccinations_smoothed),
        IF(t.total_vaccinations_per_hundred = '', NULL, t.total_vaccinations_per_hundred),
        IF(t.people_vaccinated_per_hundred = '', NULL, t.people_vaccinated_per_hundred),
        IF(t.people_fully_vaccinated_per_hundred = '', NULL, t.people_fully_vaccinated_per_hundred),
        IF(t.total_boosters_per_hundred = '', NULL, t.total_boosters_per_hundred),
        IF(t.new_vaccinations_smoothed_per_million = '', NULL, t.new_vaccinations_smoothed_per_million),
        co.iso_code

    FROM temporal t
    INNER JOIN country co ON co.iso_code = t.iso_code
;


-- COUNTRY_DETAIL: 123,319 - 41.566 seg
INSERT INTO country_detail (date_, reproduction_rate, stringency_index,
        population, population_density, median_age, aged_65_older, aged_70_older,
        gdp_per_capita, extreme_poverty, cardiovasc_death_rate, diabetes_prevalence,
        female_smokers, male_smokers, handwashing_facilities, hospital_beds_per_thousand,
        life_expectancy, human_development_index, excess_mortality_cumulative_absolute,
        excess_mortality_cumulative, excess_mortality,excess_mortality_cumulative_per_million, iso_codeF)

    SELECT STR_TO_DATE(t.date, '%Y-%m-%d'),
        IF(t.reproduction_rate = '', NULL, t.reproduction_rate),
        IF(t.stringency_index = '', NULL, t.stringency_index),
        IF(t.population = '', NULL, t.population),
        IF(t.population_density = '', NULL, t.population_density),
        IF(t.median_age = '', NULL, t.median_age),
        IF(t.aged_65_older = '', NULL, t.aged_65_older),
        IF(t.aged_70_older = '', NULL, t.aged_70_older),
        IF(t.gdp_per_capita = '', NULL, t.gdp_per_capita),
        IF(t.extreme_poverty = '', NULL, t.extreme_poverty),
        IF(t.cardiovasc_death_rate = '', NULL, t.cardiovasc_death_rate),
        IF(t.diabetes_prevalence = '', NULL, t.diabetes_prevalence),
        IF(t.female_smokers = '', NULL, t.female_smokers),
        IF(t.male_smokers = '', NULL, t.male_smokers),
        IF(t.handwashing_facilities = '', NULL, t.handwashing_facilities),
        IF(t.hospital_beds_per_thousand = '', NULL, t.hospital_beds_per_thousand),
        IF(t.life_expectancy = '', NULL, t.life_expectancy),
        IF(t.human_development_index = '', NULL, t.human_development_index),
        IF(t.excess_mortality_cumulative_absolute = '', NULL, t.excess_mortality_cumulative_absolute),
        IF(t.excess_mortality_cumulative = '', NULL, t.excess_mortality_cumulative),
        IF(t.excess_mortality = '', NULL, t.excess_mortality),
        IF(t.excess_mortality_cumulative_per_million = '', NULL, t.excess_mortality_cumulative_per_million),
        co.iso_code

    FROM temporal t
    INNER JOIN country co ON co.iso_code = t.iso_code
;

SELECT * FROM temporal;
SELECT * FROM country_detail;

SELECT * FROM death_register;
SELECT COUNT(*) total_temporal FROM (
    SELECT * FROM country_detail
) t;
