SELECT * FROM temporal;

/* 1. Consulta que agrupe la cantidad actual de contagios por pais */

SELECT t1.country, t1.actual_cases
FROM (
         SELECT co.LOCATION country, SUM(cr.new_cases) actual_cases
         FROM CASE_REGISTER cr
                  INNER JOIN COUNTRY co ON co.iso_code = cr.iso_code_
         WHERE co.LOCATION NOT IN
               ('Asia', 'Europe', 'Oceania', 'Africa', 'South America',
                'North America', 'World', 'European Union')
         GROUP BY co.LOCATION
     ) t1
WHERE t1.actual_cases != 0
;


/* 2. Funcion o metodo que reciba el nombre el pais y nos muestre el 
acumulado mensual de infectados, muertes y vacunados */

CREATE OR REPLACE PROCEDURE proc_query2 (
    name_country IN VARCHAR2,
    c1 IN OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN c1 FOR
    
    SELECT EXTRACT(YEAR FROM cr.date_) year_, EXTRACT(MONTH FROM cr.date_) month_,
        SUM(cr.new_cases) cases,
        SUM(dr.new_deaths) deaths,
        MAX(v.total_vaccinations) vaccinated

    FROM country
             INNER JOIN case_register cr on country.iso_code = cr.iso_code_
             INNER JOIN death_register dr on country.iso_code = dr.iso_code_
             INNER JOIN vaccination v on country.iso_code = v.iso_code_

    WHERE (
            country.location = name_country

            AND cr.date_ = dr.date_
            AND cr.iso_code_ = dr.iso_code_
            AND cr.date_ = v.date_
            AND cr.iso_code_ = v.iso_code_
            AND cr.id_ = dr.id_
            AND cr.id_ = v.id_
          )
    GROUP BY EXTRACT(YEAR FROM cr.date_), EXTRACT(MONTH FROM cr.date_);    

END;
         
/* 3. Consulta que agrupe la cantidad actual de contagios de los ultimos
3 meses por continente */

SELECT cont.name,
       EXTRACT(YEAR FROM cr.date_)  year_,
       EXTRACT(MONTH FROM cr.date_) month_,
       SUM(cr.new_cases)            total_casos
FROM CASE_REGISTER cr

         INNER JOIN COUNTRY co ON co.iso_code = cr.iso_code_
         INNER JOIN CONTINENT cont ON cont.code = co.code_

WHERE (TO_DATE(cr.date_, 'DD/MM/YYYY')
    BETWEEN
    -- min_date
    (SELECT ADD_MONTHS(TO_DATE(MAX(cr.date_), 'DD/MM/YYYY'), -3) FROM CASE_REGISTER cr)
    AND
    -- max_date
        (SELECT MAX(cr.date_) FROM CASE_REGISTER cr)
          )

GROUP BY cont.name, EXTRACT(YEAR FROM cr.date_), EXTRACT(MONTH FROM cr.date_)
;

/* 4. Funci�n o m�todo muestre los pa�ses con mayor aceleraci�n de contagios durante el
mes de diciembre 2020 y enero 2021. */

CREATE OR REPLACE PROCEDURE proc_query4 (
    cursor2 IN OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN cursor2 FOR

    SELECT * FROM (
    SELECT  t1.location_ country FROM (
                      SELECT C2.LOCATION location_, ROUND(SUM(CR.NEW_CASES)/COUNT(*), 2) average_cases_
                      FROM CASE_REGISTER CR
                               INNER JOIN COUNTRY C2 on C2.ISO_CODE = CR.ISO_CODE_
                      WHERE (TO_DATE(CR.DATE_, 'DD/MM/YY')
                          BETWEEN
                          TO_DATE('01/12/20', 'DD/MM/YY') AND TO_DATE('31/12/21', 'DD/MM/YY')
                                )

                      GROUP BY C2.LOCATION
                      ORDER BY ROUND(SUM(CR.NEW_CASES)/COUNT(*), 2) DESC
                  ) t1
    WHERE t1.average_cases_ IS NOT NULL AND
          t1.location_ NOT IN ('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America', 'World', 'European Union')
    )
    WHERE ROWNUM <= 10
    ;
END;



/* 5. Promedio contagios durante el primer trimestre de la pandemia */
-- first trimester: 01/01/20 - 31/03/20 
SELECT ROUND(AVG(new_cases), 2) average_cases FROM CASE_REGISTER cr
WHERE cr.date_ <= 
    (
        SELECT TO_DATE(ADD_MONTHS(TO_DATE(MIN(cr.date_),'DD/MM/YYYY'), +3) -1, 'DD/MM/YY') fecha_max 
        FROM CASE_REGISTER cr 
    )
;  

/* 6. Funci�n o m�todo que reciba un rango de infectados por d�a y devuelva los pa�ses que
en alg�n momento tuvieron ese rango, con su fecha correspondiente */

-- rango de infectados: 100 - 200

CREATE OR REPLACE PROCEDURE proc_query6(
    lower IN INTEGER,
    higher IN INTEGER,
    cursor3 IN OUT SYS_REFCURSOR
)
    IS
BEGIN
    OPEN cursor3 FOR
        SELECT t1.country, t1.date_, t1.cases
        FROM (
                 SELECT C2.LOCATION country, cr.DATE_ date_, SUM(cr.NEW_CASES) cases
                 FROM CASE_REGISTER cr
                          INNER JOIN COUNTRY C2 on C2.ISO_CODE = cr.ISO_CODE_
                 HAVING SUM(cr.NEW_CASES) BETWEEN lower AND higher
                 GROUP BY C2.LOCATION, cr.DATE_
             ) t1
        WHERE t1.country NOT IN ('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America', 'World', 'European Union');
END;

/* 7. Funci�n o m�todo que muestre al top 10 de pa�ses con mayor cantidad de pruebas.  */

CREATE OR REPLACE PROCEDURE proc_query7(
    cursor4 IN OUT SYS_REFCURSOR
)
    IS
BEGIN
    OPEN cursor4 FOR
        SELECT t1.country, t1.tests
        FROM (
                 SELECT C2.LOCATION country, SUM(tr.NEW_TESTS) tests
                 FROM TEST_REGISTER tr
                          INNER JOIN COUNTRY C2 on C2.ISO_CODE = tr.ISO_CODE_
                 GROUP BY C2.LOCATION
                 ORDER BY tests DESC
             ) t1
        WHERE t1.tests IS NOT NULL
          AND t1.country NOT IN ('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America', 'World', 'European Union')
          AND ROWNUM <= 10;
END;

/* 8. Funci�n o m�todo que reciba la fecha como par�metro y que muestre el pa�s que
reporto m�s muertes en ese d�a. */
--01/12/20

CREATE OR REPLACE PROCEDURE proc_query8(
    p_date IN VARCHAR2,
    cursor5 IN OUT SYS_REFCURSOR
)
    IS
BEGIN
    OPEN cursor5 FOR
        SELECT t1.date_, t1.country, t1.deaths
        FROM (
                 SELECT dr.DATE_ date_, c2.LOCATION country, SUM(dr.NEW_DEATHS) deaths
                 FROM DEATH_REGISTER dr
                          INNER JOIN COUNTRY C2 on C2.ISO_CODE = dr.ISO_CODE_
                 WHERE TO_DATE(dr.DATE_, 'DD/MM/YY') = TO_DATE(p_date, 'DD/MM/YY')
                 GROUP BY c2.LOCATION, dr.DATE_
                 ORDER BY deaths DESC
             ) t1
        WHERE t1.country NOT IN
              ('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America', 'World', 'European Union')
          AND t1.deaths IS NOT NULL
          AND ROWNUM < 2;
END;

/* 9. Consulta que muestre los datos de Guatemala para un rango de fechas
especifico */

SELECT co.iso_code,
       cr.date_,
       cr.new_cases,
       cr.total_cases,
       dr.new_deaths,
       dr.total_deaths,
       tr.new_tests,
       tr.total_tests,
       va.new_vaccinations,
       va.total_vaccinations
FROM COUNTRY co
         INNER JOIN CASE_REGISTER cr ON cr.iso_code_ = co.iso_code
         INNER JOIN DEATH_REGISTER dr ON dr.iso_code_ = co.iso_code
         INNER JOIN VACCINATION va ON va.iso_code_ = co.iso_code
         INNER JOIN TEST_REGISTER tr ON tr.iso_code_ = co.iso_code

WHERE (
            co.location = 'Guatemala'
            AND cr.date_ = dr.date_
            AND cr.date_ = va.date_
            AND cr.date_ = tr.date_
            AND cr.id_ = dr.id_
            AND cr.date_ BETWEEN TO_DATE('13/03/20', 'DD/MM/YY') AND TO_DATE('14/03/20', 'DD/MM/YY')
     )
;

/* 10. Consulta que muestre los paises de Latinoamerica ordenados de losmás infectados a
   los menos infectados para un rango de fechas en especifico */

SELECT t1.location_, t1.total_cases
FROM (
         SELECT co.location location_, SUM(cr.new_cases) total_cases
         FROM CONTINENT cont
                  INNER JOIN COUNTRY co ON co.code_ = cont.code
                  INNER JOIN CASE_REGISTER cr ON cr.iso_code_ = co.iso_code

         WHERE (cont.name = 'North America' or cont.name = 'South America')
           AND (cr.date_ BETWEEN TO_DATE('01/01/20', 'DD/MM/YY') AND TO_DATE('31/12/20', 'DD/MM/YY'))
         GROUP BY co.location
         ORDER BY SUM(cr.new_cases) DESC
     ) t1
WHERE t1.total_cases IS NOT NULL
  AND t1.location_ NOT IN ('United States', 'Canada')
;