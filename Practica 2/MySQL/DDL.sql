USE bd1_practica2;

CREATE TABLE TEMPORAL (
	iso_code					            VARCHAR(50),
	continent					            VARCHAR(50),
    location					            VARCHAR(50),
    date						            VARCHAR(50),
    total_cases		                        VARCHAR(50),
    new_cases	                            VARCHAR(50),
    new_cases_smoothed	                    VARCHAR(50),
    total_deaths	                        VARCHAR(50),
    new_deaths	                            VARCHAR(50),
    new_deaths_smoothed	                    VARCHAR(50),
    total_cases_per_million	                VARCHAR(50),
    new_cases_per_million	                VARCHAR(50),
    new_cases_smoothed_per_million	        VARCHAR(50),
    total_deaths_per_million	            VARCHAR(50),
    new_deaths_per_million	                VARCHAR(50),
    new_deaths_smoothed_per_million	        VARCHAR(50),
    reproduction_rate	                    VARCHAR(50),
    icu_patients	                        VARCHAR(50),
    icu_patients_per_million	            VARCHAR(50),
    hosp_patients	                        VARCHAR(50),
    hosp_patients_per_million	            VARCHAR(50),
    weekly_icu_admissions	                VARCHAR(50),
    weekly_icu_admissions_per_million	    VARCHAR(50),
    weekly_hosp_admissions	                VARCHAR(50),
    weekly_hosp_admissions_per_million	    VARCHAR(50),
    new_tests	                            VARCHAR(50),
    total_tests	                            VARCHAR(50),
    total_tests_per_thousand	            VARCHAR(50),
    new_tests_per_thousand	                VARCHAR(50),
    new_tests_smoothed	                    VARCHAR(50),
    new_tests_smoothed_per_thousand	        VARCHAR(50),
    positive_rate	                        VARCHAR(50),
    tests_per_case	                        VARCHAR(50),
    tests_units	                            VARCHAR(50),
    total_vaccinations	                    VARCHAR(50),
	people_vaccinated	                    VARCHAR(50),
    people_fully_vaccinated	                VARCHAR(50),
    total_boosters	                        VARCHAR(50),
    new_vaccinations	                    VARCHAR(50),
    new_vaccinations_smoothed	            VARCHAR(50),
    total_vaccinations_per_hundred	        VARCHAR(50),
    people_vaccinated_per_hundred	        VARCHAR(50),
    people_fully_vaccinated_per_hundred	    VARCHAR(50),
    total_boosters_per_hundred	            VARCHAR(50),
    new_vaccinations_smoothed_per_million	VARCHAR(50),
    stringency_index	                    VARCHAR(50),
    population	                            VARCHAR(50),
    population_density	                    VARCHAR(50),
    median_age	                            VARCHAR(50),
    aged_65_older	                        VARCHAR(50),
    aged_70_older	                        VARCHAR(50),
    gdp_per_capita	                        VARCHAR(50),
    extreme_poverty	                        VARCHAR(50),
    cardiovasc_death_rate	                VARCHAR(50),
    diabetes_prevalence	                    VARCHAR(50),
    female_smokers	                        VARCHAR(50),
    male_smokers	                        VARCHAR(50),
    handwashing_facilities	                VARCHAR(50),
    hospital_beds_per_thousand	            VARCHAR(50),
    life_expectancy	                        VARCHAR(50),
    human_development_index	                VARCHAR(50),
    excess_mortality_cumulative_absolute    VARCHAR(50),
    excess_mortality_cumulative             VARCHAR(50),
    excess_mortality 	                    VARCHAR(50),
    excess_mortality_cumulative_per_million VARCHAR(50)
);

CREATE TABLE CONTINENT (
    code INT AUTO_INCREMENT,
    name VARCHAR(50),

    PRIMARY KEY(code)
);

CREATE TABLE COUNTRY (
    iso_code VARCHAR(10),
    location VARCHAR(50),
    codeF INT,

    PRIMARY KEY (iso_code),
    FOREIGN KEY (codeF) REFERENCES CONTINENT(code)
);

CREATE TABLE CASE_REGISTER (
    id  INT AUTO_INCREMENT,
    date_ DATE NOT NULL,
    new_cases INT,
    new_cases_smoothed DECIMAL(10,3),
    new_cases_per_million DECIMAL(10,3),
    new_cases_smoothed_per_million DECIMAL(10,3),
    total_cases INT,
    total_cases_per_million DECIMAL(10,3),
    iso_codeF VARCHAR(10),

    PRIMARY KEY(id),
    FOREIGN KEY (iso_codeF) REFERENCES COUNTRY(iso_code)
);

CREATE TABLE DEATH_REGISTER (
    id  INT AUTO_INCREMENT,
    date_ DATE NOT NULL,
    new_deaths INT,
    new_deaths_smoothed DECIMAL(10,3),
    new_deaths_per_million DECIMAL(10,3),
    new_deaths_smoothed_per_million DECIMAL(10,3),
    total_deaths INT,
    total_deaths_per_million DECIMAL(10,3),

    iso_codeF VARCHAR(10),

    PRIMARY KEY(id),
    FOREIGN KEY (iso_codeF) REFERENCES COUNTRY(iso_code)
);

CREATE TABLE INTENSIVE_PATIENTS (
    id  INT AUTO_INCREMENT,
    date_ DATE NOT NULL,
    icu_patients INT,
    icu_patients_per_million DECIMAL(10,3),
    weekly_icu_admissions DECIMAL(10,3),
    weekly_icu_admissions_per_million DECIMAL(10,3),
    iso_codeF VARCHAR(10),

    PRIMARY KEY(id),
    FOREIGN KEY (iso_codeF) REFERENCES COUNTRY(iso_code)
);

CREATE TABLE HOSPITALIZED (
    id  INT AUTO_INCREMENT,
    date_ DATE NOT NULL,
    hosp_patients INT,
    hosp_patients_per_million DECIMAL(10,3),
    weekly_hosp_admissions DECIMAL(10,3),
    weekly_hosp_admissions_per_million DECIMAL(10,3),
    iso_codeF VARCHAR(10),

    PRIMARY KEY(id),
    FOREIGN KEY (iso_codeF) REFERENCES COUNTRY(iso_code)
);

CREATE TABLE TEST_UNIT (
    code INT AUTO_INCREMENT,
    name VARCHAR(50),

    PRIMARY KEY(code)
);

CREATE TABLE TEST_REGISTER (
    id  INT AUTO_INCREMENT,
    date_ DATE NOT NULL,
    new_tests INT,
    total_tests INT,
    total_tests_per_thousand DECIMAL(10,3),
    new_tests_per_thousand DECIMAL(10,3),
    new_tests_smoothed INT,
    new_tests_smoothed_per_thousand DECIMAL(10,3),
    tests_per_case DECIMAL(10,3),
    positive_rate DECIMAL(10,3),

    iso_codeF VARCHAR(10),
    test_UnitF INT,

    PRIMARY KEY(id),
    FOREIGN KEY (iso_codeF) REFERENCES COUNTRY(iso_code),
    FOREIGN KEY (test_UnitF) REFERENCES TEST_UNIT(code)
);

CREATE TABLE VACCINATION (
    id  INT AUTO_INCREMENT,
    date_ DATE NOT NULL,
    total_vaccinations BIGINT,
    people_vaccinated BIGINT,
    people_fully_vaccinated BIGINT,
    total_boosters BIGINT,
    new_vaccinations BIGINT,
    new_vaccinations_smoothed BIGINT,
    total_vaccinations_per_hundred DECIMAL(10,3),
    people_vaccinated_per_hundred DECIMAL(10,3),
    people_fully_vaccinated_per_hundred DECIMAL(10,3),
    total_boosters_per_hundred DECIMAL(10,3),
    new_vaccinations_smoothed_per_million BIGINT,

    iso_codeF VARCHAR(10),
    PRIMARY KEY(id),
    FOREIGN KEY (iso_codeF) REFERENCES COUNTRY(iso_code)
);

CREATE TABLE COUNTRY_DETAIL (
    id  INT AUTO_INCREMENT,
    date_ DATE NOT NULL,
    reproduction_rate DECIMAL(10,3),
    stringency_index DECIMAL(10,3),
    population BIGINT,
    population_density DECIMAL(10,3),
    median_age DECIMAL(10,3),
    aged_65_older DECIMAL(10,3),
    aged_70_older DECIMAL(10,3),
    gdp_per_capita DECIMAL(10,3),
    extreme_poverty DECIMAL(10,3),
    cardiovasc_death_rate DECIMAL(10,3),
    diabetes_prevalence DECIMAL(10,3),
    female_smokers DECIMAL(10,3),
    male_smokers DECIMAL(10,3),
    handwashing_facilities DECIMAL(10,3),
    hospital_beds_per_thousand DECIMAL(10,3),
    life_expectancy DECIMAL(10,3),
    human_development_index DECIMAL(10,3),
    excess_mortality_cumulative_absolute    DECIMAL(10,3),
    excess_mortality_cumulative             DECIMAL(10,3),
    excess_mortality 	                    DECIMAL(10,3),
    excess_mortality_cumulative_per_million DECIMAL(30,15),
    iso_codeF VARCHAR(10),

    PRIMARY KEY(id),
    FOREIGN KEY (iso_codeF) REFERENCES COUNTRY(iso_code)
);

/* DELETE TABLES */
DROP TABLE COUNTRY_DETAIL;
DROP TABLE VACCINATION;
DROP TABLE TEST_REGISTER;
DROP TABLE TEST_UNIT;
DROP TABLE HOSPITALIZED;
DROP TABLE INTENSIVE_PATIENTS;
DROP TABLE DEATH_REGISTER;
DROP TABLE CASE_REGISTER;
DROP TABLE country;
DROP TABLE continent;
DROP TABLE temporal;