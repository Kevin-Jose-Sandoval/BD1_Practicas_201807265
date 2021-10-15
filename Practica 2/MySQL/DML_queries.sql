
/* 1. Consulta que agrupe la cantidad actual de contagios por pais */
SELECT t1.country, t1.actual_cases
FROM (
         SELECT co.LOCATION country, SUM(cr.new_cases) actual_cases
         FROM CASE_REGISTER cr
                  INNER JOIN COUNTRY co ON co.iso_code = cr.iso_codeF
         WHERE co.LOCATION NOT IN
               ('Asia', 'Europe', 'Oceania', 'Africa', 'South America',
                'North America', 'World', 'European Union')
         GROUP BY co.LOCATION
     ) t1
WHERE t1.actual_cases != 0
;

/* 2. Función o método que reciba el nombre del país y nos muestre el acumulado mensual
de infectados, muertes y vacunados. */

CREATE PROCEDURE query2 (p_country varchar(50))
BEGIN

    SELECT YEAR(cr.date_) year_, MONTHNAME(cr.date_) month_, SUM(cr.new_cases) cases,
           SUM(dr.new_deaths) deaths, MAX(v.total_vaccinations) vaccinated

    FROM country
             INNER JOIN case_register cr on country.iso_code = cr.iso_codeF
             INNER JOIN death_register dr on country.iso_code = dr.iso_codeF
             INNER JOIN vaccination v on country.iso_code = v.iso_codeF

    WHERE (
            country.location = p_country

            AND cr.date_ = dr.date_
            AND cr.iso_codeF = dr.iso_codeF
            AND cr.date_ = v.date_
            AND cr.iso_codeF = v.iso_codeF
            AND cr.id = dr.id
            AND cr.id = v.id
          )
    GROUP BY YEAR(cr.date_), MONTHNAME(cr.date_);

END;

CALL query2('Spain');
DROP PROCEDURE query2;

/* 3. Consulta que agrupe la cantidad actual de contagios de los últimos 3 meses por
continente
*/

SELECT c.name continent_,YEAR(cr.date_) year, MONTHNAME(cr.date_) month, SUM(cr.new_cases) cases FROM country
    INNER JOIN continent c on country.codeF = c.code
    INNER JOIN case_register cr on country.iso_code = cr.iso_codeF

    WHERE (
            c.name != '' AND
            STR_TO_DATE(cr.date_, '%Y-%m-%d') BETWEEN
            -- min date
            (SELECT DATE_ADD(MAX(cr.date_), INTERVAL -3 MONTH) FROM case_register cr)
            AND
            -- max date
                (SELECT MAX(cr.date_) FROM case_register cr)
        )
    GROUP BY c.name, YEAR(cr.date_), MONTHNAME(cr.date_)
;

/* 4. Función o método muestre los países con mayor aceleración de contagios durante el
mes de diciembre 2020 y enero 2021. */


CREATE PROCEDURE query4 ()
BEGIN

    SELECT * FROM (
    SELECT  t1.location_ country FROM (
                      SELECT C2.LOCATION location_, SUM(CR.NEW_CASES)/COUNT(*) average_cases_
                      FROM CASE_REGISTER CR
                               INNER JOIN COUNTRY C2 on C2.ISO_CODE = CR.iso_codeF
                      WHERE ( STR_TO_DATE(CR.DATE_, '%Y-%m-%d')
                          BETWEEN
                           STR_TO_DATE('20-12-01', '%Y-%m-%d') AND  STR_TO_DATE('21-12-31', '%Y-%m-%d')
                                )

                      GROUP BY C2.LOCATION
                      ORDER BY SUM(CR.NEW_CASES)/COUNT(*) DESC
                  ) t1
    WHERE t1.average_cases_ IS NOT NULL AND
          t1.location_ NOT IN ('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America', 'World', 'European Union')
    ) t2
    LIMIT 10
    ;
END;

CALL query4();

/* 5. Promedio contagios durante el primer trimestre de la pandemia. */

SELECT AVG(new_cases) average_cases FROM case_register
    WHERE date_ <= (
        SELECT DATE_ADD(DATE_ADD(MIN(date_), INTERVAL +3 MONTH ), INTERVAL -1 DAY ) fecha_max
        FROM case_register
    )
;

/* 6. Función o método que reciba un rango de infectados por día y devuelva los países que
en algún momento tuvieron ese rango, con su fecha correspondiente */

CREATE PROCEDURE query6(lower INTEGER, higher INTEGER)
BEGIN

    SELECT t1.country, t1.date_, t1.cases
    FROM (
             SELECT C2.LOCATION country, cr.DATE_ date_, SUM(cr.NEW_CASES) cases
             FROM CASE_REGISTER cr
                      INNER JOIN COUNTRY C2 on C2.ISO_CODE = cr.iso_codeF
             GROUP BY C2.LOCATION, cr.DATE_
             HAVING SUM(cr.NEW_CASES) BETWEEN lower AND higher
         ) t1
    WHERE t1.country NOT IN
          ('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America', 'World', 'European Union');

END;

CALL query6(200000,300000);

/* 7. Función o método que muestre al top 10 de países con mayor cantidad de pruebas. */
CREATE PROCEDURE query7()
BEGIN

    SELECT t1.country, t1.tests
    FROM (
             SELECT C2.LOCATION country, SUM(tr.NEW_TESTS) tests
             FROM TEST_REGISTER tr
                      INNER JOIN COUNTRY C2 on C2.ISO_CODE = tr.iso_codeF
             GROUP BY C2.LOCATION
             ORDER BY tests DESC
         ) t1
    WHERE (
                  t1.tests IS NOT NULL
                  AND t1.country NOT IN
                      ('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America', 'World',
                       'European Union')
              )
    LIMIT 10;
END;

CALL query7();

/*  8. Función o método que reciba la fecha como parámetro y que muestre el país que
reporto más muertes en ese día. */

CREATE PROCEDURE query8(p_date VARCHAR(20))
BEGIN
    SELECT t1.date_, t1.country, t1.deaths
    FROM (
             SELECT dr.DATE_ date_, c2.LOCATION country, SUM(dr.NEW_DEATHS) deaths
             FROM DEATH_REGISTER dr
                      INNER JOIN COUNTRY C2 on C2.ISO_CODE = dr.iso_codeF
             WHERE STR_TO_DATE(dr.date_, '%Y-%m-%d') = STR_TO_DATE(p_date, '%Y-%m-%d')
             GROUP BY c2.LOCATION, dr.DATE_
             ORDER BY deaths DESC
         ) t1
    WHERE (t1.country NOT IN
           ('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America', 'World', 'European Union')
        AND t1.deaths IS NOT NULL)
    LIMIT 1;
END;

CALL query8('2020-03-13');

/* 9. Consulta que muestre los datos de Guatemala para un rango de fechas especifico. */
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
         INNER JOIN CASE_REGISTER cr ON cr.iso_codeF = co.iso_code
         INNER JOIN DEATH_REGISTER dr ON dr.iso_codeF = co.iso_code
         INNER JOIN VACCINATION va ON va.iso_codeF = co.iso_code
         INNER JOIN TEST_REGISTER tr ON tr.iso_codeF = co.iso_code

WHERE (
            co.location = 'Guatemala'
            AND cr.date_ = dr.date_
            AND cr.date_ = va.date_
            AND cr.date_ = tr.date_
            AND cr.id = dr.id
            AND cr.date_ BETWEEN STR_TO_DATE('2020-03-13', '%Y-%m-%d') AND STR_TO_DATE('2020-03-14', '%Y-%m-%d')
     )
;

/* 10. Consulta que muestre los paises de Latinoamerica ordenados de losmás infectados a
   los menos infectados para un rango de fechas en especifico */

SELECT t1.location_, t1.total_cases
FROM (
         SELECT co.location location_, SUM(cr.new_cases) total_cases
         FROM CONTINENT cont
                  INNER JOIN COUNTRY co ON co.codeF = cont.code
                  INNER JOIN CASE_REGISTER cr ON cr.iso_codeF = co.iso_code

         WHERE (cont.name = 'North America' or cont.name = 'South America')
           AND (cr.date_ BETWEEN STR_TO_DATE('2020-01-01', '%Y-%m-%d') AND STR_TO_DATE('2020-12-31', '%Y-%m-%d'))
         GROUP BY co.location
         ORDER BY SUM(cr.new_cases) DESC
     ) t1
WHERE t1.total_cases IS NOT NULL
  AND t1.location_ NOT IN ('United States', 'Canada')
;