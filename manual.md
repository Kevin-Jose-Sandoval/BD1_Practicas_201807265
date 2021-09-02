### Universidad de San Carlos de Guatemala

### Facultad de Ingeniería

### Escuela de Ciencias y Sistemas

### Sistemas de Bases de Datos 1 Sección A

### Catedrático: Otto Amilcar Rodriguez Acosta

### Tutor Académico: Andrés Alejandro Montúfar Cordero

### Práctica 1

<p align="center"><img src="./images/USAC_logo.png" width="300" height="300"/></p>

### **Estudiante:** Kevin José Sandoval Catalán

### **Registro académico:** 201807265

### <p align="center">Guatemala 05 de Septiembre 2021</p>

<br/>
<br/>
<br/>
<br/>

---

## Contenido

- [**Marco Teórico**](#marco-teórico)
- [**Modelo Conceptual:**](#modelo-conceptual)
  - [**🌍 CONTINENT:**](#-continent)
  - [**🗺️ COUNTRY:**](#️-country)
  - [**📈 CASE_REGISTER:**](#-case_register)
  - [**💀 DEATH_REGISTER:**](#-death_register)
  - [**🚑 INTENSIVE_PATIENTS:**](#-intensive_patients)
  - [**🏥 HOSPITALIZED:**](#-hospitalized)
  - [**📓 TEST_REGISTER:**](#-test_register)
  - [**📜 TEST_UNIT:**](#-test_unit)
  - [**💉 VACCINATION:**](#-vaccination)
  - [**📊 COUNTRY_DETAIL:**](#-country_detail)
- [**Modelo Lógico**](#modelo-lógico)
    - [**CONTINENT**](#continent)
    - [**COUNTRY**](#country)
    - [**CASE_REGISTER**](#case_register)
    - [**DEATH_REGISTER**](#death_register)
    - [**INTENSIVE_PATIENTS**](#intensive_patients)
    - [**HOSPITALIZED**](#hospitalized)
    - [**TEST_UNIT**](#test_unit)
    - [**TEST_REGISTER**](#test_register)
    - [**VACCINATION**](#vaccination)
    - [**COUNTRY_DETAIL**](#country_detail)
- [**Modelo Físico**](#modelo-físico)
- [**Glosario**](#glosario)

<br/>
<br/>

# **Marco Teórico**

**<h1 align="center">Modelos de datos</h1>**

<div style="text-align: justify">
Los modelos de datos definen cómo se modela la estructura lógica de una base de datos, estos son entidades fundamentales para introducir la abstracción en una base de datos y definen cómo los datos se conectan entre sí y cómo se procesan y almacenan dentro del sistema.
</div>
</br>
<div style="text-align: justify">
El primer modelo de datos fue el modelo de datos planos, donde todos los datos utilizados se mantendrían en el mismo plano. Los primeros modelos de datos no eran tan científicos, por lo tanto, eran propensos a introducir muchas anomalías de duplicación y actualización.
Un modelo de datos puede ser concreto o abstracto, y están representados por la notación de modelado de datos, que a menudo se presenta en formato gráfico. Su enfoque principal es apoyar y ayudar a los sistemas de información mostrando el formato y la definición de los diferentes datos involucrados. También ayudan a evitar la redundancia de datos. La información almacenada en los modelos de datos es de gran importancia para las empresas porque dicta las relaciones entre las tablas de la base de datos, las claves externas y los eventos involucrados.  
</div>
</br>

<div style="text-align: justify">
Un modelo de datos puede ser concreto o abstracto, y están representados por la notación de modelado de datos, que a menudo se presenta en formato gráfico. Su enfoque principal es apoyar y ayudar a los sistemas de información mostrando el formato y la definición de los diferentes datos involucrados. También ayudan a evitar la redundancia de datos. La información almacenada en los modelos de datos es de gran importancia para las empresas porque dicta las relaciones entre las tablas de la base de datos, las claves externas y los eventos involucrados.  
</div>


Los tres tipos básicos de modelo de datos son:
- Modelos de datos conceptuales
- Modelos de datos físicos
- Modelos de datos lógicos

***

**<h2 align="center">Modelo conceptual</h2>**

<div style="text-align: justify">

Un modelo conceptual de datos identifica las relaciones de más alto nivel entre las diferentes entidades. Las características del modelo conceptual de datos incluye las entidades importantes y las relaciones entre ellas, en este modelo no se especifica ningún atributo y tampoco se especifica ninguna clave principal.
</div>

<p align="center">
<img src="./images/image1.png">
</p>

**✔️ENTIDADES:** Una entidad es “algo” con significado del cual se necesita llevar información.  
**✔️ ATRIBUTOS:** Los atributos identifican, cualifican, o cuantifican o describen a una entidad.  
**✔️ INSTANCIAS DE UNA ENTIDAD:** Una entidad tiene múltiples ocurrencias o instancias que consisten en valores específicos para los atributos de una entidad.   
**✔️  TIPOS DE ATRIBUTOS:**
- IDENTIFICADORES UNICOS: Cada instancia debe ser identificada de forma única de otras instancias de la misma entidad. Un identificador único (UID) es cualquier combinación de atributos que sirven para identificar de forma única a una instancia de una Entidad.
- ATRIBUTOS OPCIONALES Y OBLIGATORIOS: Un atributo es opcional si para una instancia cualquiera de la entidad existe la posibilidad de que no tenga valor. Un atributo es obligatorio si para cualquier instancia el atributo siempre debe tener valor.  

**✔️ DIAGRAMACION DE ENTIDADES:** Existen diferentes notaciones para representar las entidades, la notación más utilizada es de barkers.  
**✔️ RELACIONES:** Una relación es una asociación bidireccional entre dos o mas entidades o entre una entidad y ella misma. Existen tres tipos de relaciones:
- Uno a Muchos 1:M 1:*
- Uno a uno 1:1 
- Muchos a Muchos M:M *:*  

**✔️ CARDINALIDAD:** La cardinalidad define con cuantas instancias de otra entidad puede está relacionada una instancia. La cardinalidad puede ser: Uno y solo uno ó de uno a muchos.  
**✔️ OPCIONALIDAD:** La opcionalidad indica si existe la posibilidad de que una instancia no esté relacionada con ninguna otra instancia en la relación.  

</br>

***

**<h2 align="center">Modelo lógico</h2>**

Un modelo de datos lógicos describe los datos con el mayor detalle posible, independientemente de cómo se implementarán físicamente en la base de datos. Las características de un modelo de datos lógicos incluyen:    
</br>

- Incluye todas las entidades y relaciones entre ellos.  
- Todos los atributos para cada entidad están especificados.  
- La clave principal para cada entidad está especificada.  
- Se especifican las claves externas (claves que identifican la relación entre diferentes entidades).  
- La normalización ocurre en este nivel.  

Mape o transformación hacia el modelo lógico.
<table table border="3">
    <thead>
        <tr>
            <th align="left">Modelo de datos</th>
            <th align="left">Se convierte en</th>
            <th align="left">Modelo relacional</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>Entidades</code></td>
            <th align="left">➜</th>
            <td align="left">Tablas</td>
        </tr>
        <tr>
            <td align="left"><code>Atributos</code></td>
            <th align="left">➜</th>
            <td align="left">Columnas de la tabla</td>
        </tr>
        <tr>
            <td align="left"><code>Si el atributo es: Identificador Unico #</code></td>
            <th align="left">➜</th>
            <td align="left">Llave Primaria (PK)</td>
        </tr>
        <tr>
            <td align="left"><code>Si el atributo es:  Obligatorio *</code></td>
            <th align="left">➜</th>
            <td align="left">NOT NULL</td>
        </tr>
        <tr>
            <td align="left"><code>Si el atributo es: Opcional o</code></td>
            <th align="left">➜</th>
            <td align="left">NULL</td>
        </tr>
        <tr>
            <td align="left"><code>Si el atributo es: Llave candidata (#)</code></td>
            <th align="left">➜</th>
            <td align="left">Unique</td>
        </tr>         
    </tbody>
</table> 

</br>

**<h2>Ejemplo:</h2>**
</br>
<p align="center">
    <img src="./images/image2.png">
</p>

***

**<h2 align="center">Modelo físico</h2>**

<div style="text-align: justify">
El modelo de datos físicos representa cómo se construirá el modelo en la base de datos. Un modelo de base de datos física muestra todas las estructuras de tabla, incluidos el nombre de columna, el tipo de datos de columna, las restricciones de columna, la clave principal, la clave externa y las relaciones entre las tablas.
</div>
</br>


Las características de un modelo de datos físicos incluyen:

- Especificación de todas las tablas y columnas.
- Las claves externas se usan para identificar relaciones entre tablas.
- La desnormalización puede ocurrir según los requisitos del usuario.
- Las consideraciones físicas pueden hacer que el modelo de datos físicos sea bastante diferente del modelo de datos lógicos.

<div style="text-align: justify">
El modelo de datos físicos será diferente para diferentes Sistemas de Gestión de Base de datos. Por ejemplo, el tipo de datos para una columna puede ser diferente entre MySQL y SQL Server. Los pasos básico para el diseño del modelo de datos físicos son los siguientes:
</div>
</br>

- Convertir entidades en tablas.
- Convertir relaciones en claves externas.
- Convertir atributos en columnas.
- Modificar el modelo de datos físicos en función de las restricciones.

**<h2>Ejemplo:</h2>**  
**DDL**
```sql
CREATE TABLE departments
( dept_id INT NOT NULL,
  dept_name VARCHAR(50) NOT NULL,
  CONSTRAINT departments_pk PRIMARY KEY (dept_id)
);

CREATE TABLE employees
( employee_number INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  salary INT,
  dept_id INT,
  CONSTRAINT employees_pk PRIMARY KEY (employee_number)
);
```

**DML**

```sql
INSERT INTO departments (dept_id, dept_name) VALUES (30, 'Accounting');
INSERT INTO departments (dept_id, dept_name) VALUES (45, 'Sales');

INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (12009, 'Sutherland', 'Barbara', 54000, 45);
INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (34974, 'Yates', 'Fred', 80000, 45);
INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (34987, 'Erickson', 'Neil', 42000, 45);
INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (45001, 'Parker', 'Salary', 57500, 30);
INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (75623, 'Gates', 'Steve', 65000, 30);
```
***
</br>




# **Modelo Conceptual:**

<br/>
<p align="center">
    <img src="./images/conceptual_model.png">
</p>
<br/>

Explicación de las entidades y sus atributos:
## **🌍 CONTINENT:**  
Es una entidad que se encarga de almacenar los distintos continentes que se registren durante el proceso de análisis de COVID-19.
<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>code</code></td>
            <td align="left">Código único que identifica a cada continente</td>
        </tr>
        <tr>
            <td align="left"><code>name</code></td>
            <td align="left">Continente de la ubicación geográfica</td>
        </tr>
    </tbody>
</table>  

## **🗺️ COUNTRY:**  
Entidad que almacena el iso_code y el nombre de un país en específico.
<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>iso_code</code></td>
            <td align="left">Código cada país de tres letras</td>
        </tr>
        <tr>
            <td align="left"><code>location</code></td>
            <td align="left">Localización geográfica</td>
        </tr>
    </tbody>
</table>


## **📈 CASE_REGISTER:**  
Entidad encargada de registrar la información relacionada con los casos de COVID-19 en determinada fecha.
<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>date</code></td>
            <td align="left">Fecha de análisis</td>
        </tr>    
        <tr>
            <td align="left"><code>new_cases</code></td>
            <td align="left">Nuevos casos confirmados de COVID-19</td>
        </tr>
        <tr>
            <td align="left"><code>new_cases_smoothed</code></td>
            <td align="left">Nuevos casos confirmados de COVID-19 (suavizado durante 7 días)</td>
        </tr>
        <tr>
            <td align="left"><code>new_cases_per_million</code></td>
            <td align="left">Nuevos casos confirmados de COVID-19 por cada 1.000.000 de personas</td>
        </tr>
        <tr>
            <td align="left"><code>new_cases_smoothed_per_million</code></td>
            <td align="left">Nuevos casos confirmados de COVID-19 (suavizado en 7 días) por cada 1.000.000 de personas</td>
        </tr>
        <tr>
            <td align="left"><code>total_cases</code></td>
            <td align="left">Total de casos confirmados de COVID-19</td>
        </tr>
        <tr>
            <td align="left"><code>total_cases_per_million</code></td>
            <td align="left">Total de casos confirmados de COVID-19 por cada 1.000.000 de personas</td>
        </tr>         
    </tbody>
</table>

  
## **💀 DEATH_REGISTER:**
Entidad encargada de registrar la información relacionada con las muertes que ocasionó el COVID-19 en determinada fecha.

<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>date</code></td>
            <td align="left">Fecha de análisis</td>
        </tr> 
        <tr>
            <td align="left"><code>new_deaths</code></td>
            <td align="left">Nuevas muertes atribuidas al COVID-19</td>
        </tr>
        <tr>
            <td align="left"><code>new_deaths_smoothed</code></td>
            <td align="left">Nuevas muertes atribuidas al COVID-19 (suavizado durante 7 días)</td>
        </tr>
        <tr>
            <td align="left"><code>new_deaths_per_million</code></td>
            <td align="left">Nuevas muertes atribuidas al COVID-19 por cada 1,000,000 de personas</td>
        </tr>
        <tr>
            <td align="left"><code>new_deaths_smoothed_per_million</code></td>
            <td align="left">Nuevas muertes atribuidas al COVID-19 (suavizado en 7 días) por cada 1,000,000 de personas</td>
        </tr>
        <tr>
            <td align="left"><code>total_deaths</code></td>
            <td align="left">Total de muertes atribuidas al COVID-19</td>
        </tr>
        <tr>
            <td align="left"><code>total_deaths_per_million</code></td>
            <td align="left">Total de muertes atribuidas al COVID-19 por cada 1,000,000 de personas</td>
        </tr>         
    </tbody>
</table>

## **🚑 INTENSIVE_PATIENTS:**  
Entidad que registra información sobre los pacientes que están en unidades de cuidados intensivos, como sus admisiones semanales o indicadores más generales como: weekly_icu_admissions_per_million.

<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>date</code></td>
            <td align="left">Fecha de análisis</td>
        </tr>     
        <tr>
            <td align="left"><code>icu_patients</code></td>
            <td align="left">Número de pacientes con COVID-19 en unidades de cuidados intensivos (UCI) en un día determinado</td>
        </tr>
        <tr>
            <td align="left"><code>icu_patients_per_million</code></td>
            <td align="left">Número de pacientes con COVID-19 en unidades de cuidados intensivos (UCI) en un día determinado por cada 1.000.000 de personas</td>
        </tr>
        <tr>
            <td align="left"><code>weekly_icu_admissions</code></td>
            <td align="left">Número de pacientes COVID-19 recién admitidos en unidades de cuidados intensivos (UCI) en una semana determinada</td>
        </tr>
        <tr>
            <td align="left"><code>weekly_icu_admissions_per_million</code></td>
            <td align="left">Número de pacientes COVID-19 recién admitidos en unidades de cuidados intensivos (UCI) en una semana determinada por cada 1,000,000 de personas</td>
        </tr>        
    </tbody>
</table>

## **🏥 HOSPITALIZED:**  
Entidad encargada de almacenar información de pacientes que estuvieron en un hospital en determinado día, así como indicadores que comparan datos por millón de personas.
<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>date</code></td>
            <td align="left">Fecha de análisis</td>
        </tr>     
        <tr>
            <td align="left"><code>hosp_patients</code></td>
            <td align="left">Número de pacientes con COVID-19 en el hospital en un día determinado</td>
        </tr>
        <tr>
            <td align="left"><code>hosp_patients_per_million</code></td>
            <td align="left">Número de pacientes con COVID-19 en el hospital en un día determinado por cada 1.000.000 de personas</td>
        </tr>
        <tr>
            <td align="left"><code>weekly_hosp_admissions</code></td>
            <td align="left">Número de pacientes con COVID-19 recién admitidos en hospitales en una semana determinada</td>
        </tr>
        <tr>
            <td align="left"><code>weekly_hosp_admissions_per_million</code></td>
            <td align="left">Número de pacientes con COVID-19 recién admitidos en hospitales en una semana determinada por cada 1,000,000 de personas</td>
        </tr>
    </tbody>
</table>


## **📓 TEST_REGISTER:**
Entidad encargada de almacenar información referente a las pruebas de COVID-19 realizadas a personas, como pruebas por día o también el total acumulado de pruebas realizadas para determinado país.
<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>date</code></td>
            <td align="left">Fecha de análisis</td>
        </tr>     
        <tr>
            <td align="left"><code>new_tests</code></td>
            <td align="left">Nuevas pruebas para COVID-19 (solo calculadas para días consecutivos)</td>
        </tr>
        <tr>
            <td align="left"><code>total_tests</code></td>
            <td align="left">Pruebas totales para COVID-19</td>
        </tr>
        <tr>
            <td align="left"><code>total_tests_per_thousand</code></td>
            <td align="left">Pruebas totales para COVID-19 por cada 1000 personas</td>
        </tr>
        <tr>
            <td align="left"><code>new_tests_per_thousand</code></td>
            <td align="left">Nuevas pruebas para COVID-19 por cada 1000 personas</td>
        </tr>        
        <tr>
            <td align="left"><code>new_tests_smoothed</code></td>
            <td align="left">Nuevas pruebas para COVID-19 (suavizado durante 7 días). Para los países que no informan los datos de las pruebas a diario, asumimos que las pruebas cambiaron por igual todos los días durante cualquier período en el que no se informaron datos</td>
        </tr>
        <tr>
            <td align="left"><code>new_tests_smoothed_per_thousand</code></td>
            <td align="left">Nuevas pruebas para COVID-19 (suavizado de 7 días) por cada 1,000 personas</td>
        </tr>
        <tr>
            <td align="left"><code>tests_per_case</code></td>
            <td align="left">Pruebas realizadas por cada nuevo caso confirmado de COVID-19, dado como un promedio móvil de 7 días (esto es el inverso de positive_rate)</td>
        </tr>
        <tr>
            <td align="left"><code>positive_rate</code></td>
            <td align="left">La proporción de pruebas de COVID-19 que son positivas, dada como un promedio móvil de 7 días (esto es lo contrario de las pruebas por caso)</td>
        </tr>                  
    </tbody>
</table>

## **📜 TEST_UNIT:**
Entidad creada con el objetivo de almacenar un catálogo del tipo de pruebas unitarias que se relizan.
<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>code</code></td>
            <td align="left">Identificador único de cada test</td>
        </tr>
        <tr>
            <td align="left"><code>name</code></td>
            <td align="left">Unidades utilizadas por la ubicación para informar sus datos de prueba</td>
        </tr>       
    </tbody>
</table>

## **💉 VACCINATION:**
Entidad que se encarga de almacenar toda información relacionada con las vacunas de COVID-19 administradas, entre algunos campos que registra están: total de dosis administradas, personas que recibieron por lo menos una dosis, entre otros. 
<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>date</code></td>
            <td align="left">Fecha de análisis</td>
        </tr>     
        <tr>
            <td align="left"><code>total_vaccinations</code></td>
            <td align="left">Número total de dosis de vacuna COVID-19 administradas</td>
        </tr>
        <tr>
            <td align="left"><code>people_vaccinated</code></td>
            <td align="left">Número total de personas que recibieron al menos una dosis de vacuna</td>
        </tr>
        <tr>
            <td align="left"><code>people_fully_vaccinated</code></td>
            <td align="left">Número total de personas que recibieron todas las dosis prescritas por el protocolo de vacunación</td>
        </tr>
        <tr>
            <td align="left"><code>total_boosters</code></td>
            <td align="left">Número total de dosis de refuerzo de la vacuna COVID-19 administradas (dosis administradas más allá del número prescrito por el protocolo de vacunación)</td>
        </tr> 
        <tr>
            <td align="left"><code>new_vaccinations</code></td>
            <td align="left">Nuevas dosis de vacuna COVID-19 administradas (solo calculadas para días consecutivos)</td>
        </tr>
        <tr>
            <td align="left"><code>new_vaccinations_smoothed</code></td>
            <td align="left">Se administran nuevas dosis de vacuna COVID-19 (suavizado de 7 días). Para los países que no informan los datos de vacunación a diario, asumimos que la vacunación cambió por igual a diario durante cualquier período en el que no se informaron datos </td>
        </tr>
        <tr>
            <td align="left"><code>total_vaccinations_per_hundred</code></td>
            <td align="left">Número total de dosis de vacuna COVID-19 administradas por cada 100 personas en la población total</td>
        </tr>
        <tr>
            <td align="left"><code>people_vaccinated_per_hundred<code></code></td>
            <td align="left">Número total de personas que recibieron al menos una dosis de vacuna por cada 100 personas en la población total</td>
        </tr>
        <tr>
            <td align="left"><code>people_fully_vaccinated_per_hundred<code></code></td>
            <td align="left">Número total de personas que recibieron todas las dosis prescritas por el protocolo de vacunación por cada 100 personas en la población total</td>
        </tr>  
        <tr>
            <td align="left"><code>total_boosters_per_hundred<code></code></td>
            <td align="left">Número total de dosis de refuerzo de la vacuna COVID-19 administradas por cada 100 personas en la población total</td>
        </tr>  
        <tr>
            <td align="left"><code>new_vaccinations_smoothed_per_million<code></code></td>
            <td align="left">Nuevas dosis de vacuna COVID-19 administradas (suavizado de 7 días) por cada 1.000.000 de personas en la población total</td>
        </tr>
    </tbody>
</table>

## **📊 COUNTRY_DETAIL:**
Entidad que almacena campos más generales de la información que puede necesitar determinado país, como su población, experanza de vida y algunos índices referentes al análisis del COVID-19.
<table table border="3">
    <thead>
        <tr>
            <th align="left">Atributo</th>
            <th align="left">Descripción</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"><code>date</code></td>
            <td align="left">Fecha de análisis</td>
        </tr> 
        <tr>
            <td align="left"><code>reproduction_rate</code></td>
            <td align="left">Estimación en tiempo real de la tasa de reproducción efectiva (R) de COVID-19</td>
        </tr>             
        <tr>
            <td align="left"><code>stringency_index</code></td>
            <td align="left">Índice de rigurosidad de respuesta del gobierno: medida compuesta basada en 9 indicadores de respuesta que incluyen cierres de escuelas, cierres de lugares de trabajo y prohibiciones de viaje, reescalado a un valor de 0 a 100 (100 = respuesta más estricta)</td>
        </tr>
        <tr>
            <td align="left"><code>population</code></td>
            <td align="left">Población en 2020</td>
        </tr>
        <tr>
            <td align="left"><code>population_density</code></td>
            <td align="left">Número de personas dividido por área de tierra, medido en kilómetros cuadrados, año más reciente disponible</td>
        </tr>
        <tr>
            <td align="left"><code>median_age</code></td>
            <td align="left">Edad media de la población, proyección de la ONU para 2020</td>
        </tr> 
        <tr>
            <td align="left"><code>aged_65_older</code></td>
            <td align="left">Proporción de la población de 65 años o más, año más reciente disponible</td>
        </tr>
        <tr>
            <td align="left"><code>aged_70_older</code></td>
            <td align="left">Proporción de la población de 70 años o más en 2015</td>
        </tr>
        <tr>
            <td align="left"><code>gdp_per_capita</code></td>
            <td align="left">Producto interno bruto a paridad del poder adquisitivo (dólares internacionales constantes de 2011), año más reciente disponible</td>
        </tr>
        <tr>
            <td align="left"><code>extreme_poverty</code></td>
            <td align="left">Proporción de la población que vive en pobreza extrema, último año disponible desde 2010</td>
        </tr>
        <tr>
            <td align="left"><code>cardiovasc_death_rate</code></td>
            <td align="left">Tasa de mortalidad por enfermedad cardiovascular en 2017 (número anual de muertes por cada 100.000 personas)</td>
        </tr>  
        <tr>
            <td align="left"><code>diabetes_prevalence</code></td>
            <td align="left">Prevalencia de diabetes (% de la población de 20 a 79 años) en 2017</td>
        </tr>  
        <tr>
            <td align="left"><code>female_smokers</code></td>
            <td align="left">Proporción de mujeres que fuman, año más reciente disponible</td>
        </tr>
        <tr>
            <td align="left"><code>male_smokers</code></td>
            <td align="left">Proporción de hombres que fuman, año más reciente disponible</td>
        </tr>  
        <tr>
            <td align="left"><code>handwashing_facilities</code></td>
            <td align="left">Proporción de la población con instalaciones básicas para lavarse las manos en las instalaciones, año más reciente disponible</td>
        </tr>
        <tr>
            <td align="left"><code>hospital_beds_per_thousand</code></td>
            <td align="left">Camas de hospital por cada 1,000 personas, año más reciente disponible desde 2010</td>
        </tr>  
        <tr>
            <td align="left"><code>life_expectancy</code></td>
            <td align="left">Esperanza de vida al nacer en 2019</td>
        </tr>
        <tr>
            <td align="left"><code>human_development_index</code></td>
            <td align="left">Índice compuesto que mide el logro promedio en tres dimensiones básicas del desarrollo humano: una vida larga y saludable, conocimientos y un nivel de vida decente. Valores para 2019</td>
        </tr> 
        <tr>
            <td align="left"><code>excess_mortality</code></td>
            <td align="left">Puntajes de exceso de mortalidad para todas las edades</td>
        </tr>
    </tbody>
</table>
</br>
</br>

# **Modelo Lógico**  

### **CONTINENT**

<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td  align="left">COLUMNAS</td>
            <td align="left">code</td>
            <td align="left">name</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left">NN</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">1</td>
            <td align="left">Asia</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2</td>
            <td align="left">Europe</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">3</td>
            <td align="left">Africa</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">4</td>
            <td align="left">North America</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">5</td>
            <td align="left">South America</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">6</td>
            <td align="left">Oceania</td>
        </tr>        
    </tbody>
</table>

</br>

### **COUNTRY**

<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td  align="left">COLUMNAS</td>
            <td align="left">iso_code</td>
            <td align="left">location</td>
            <td align="left">code (CONTINENT)</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left">NN</td>
            <td align="left">FK</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">HUN</td>
            <td align="left">Hungary</td>
            <td align="left">2</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">HKG</td>
            <td align="left">Hong Kong</td>
            <td align="left">1</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">BHS</td>
            <td align="left">Bahamas</td>
            <td align="left">4</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">ZWE</td>
            <td align="left">Zimbabwe</td>
            <td align="left">3</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">SLB</td>
            <td align="left">Solomon Islands</td>
            <td align="left">6</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">ESP</td>
            <td align="left">Spain</td>
            <td align="left">2</td>
        </tr>        
    </tbody>
</table>
</br>

</br>

### **CASE_REGISTER**

<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td  align="left">COLUMNAS</td>
            <td align="left">date</td>
            <td align="left">new_cases</td>
            <td align="left">new_cases_smoothed</td>
            <td align="left">new_cases_per_million</td>
            <td align="left">new_cases_smoothed_per_million</td>
            <td align="left">total_cases</td>
            <td align="left">total_cases_per_million</td>
            <td align="left">iso_code (COUNTRY)</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left">NN</td>
            <td align="left"></td>
            <td align="left">NN</td>
            <td align="left"></td>
            <td align="left">NN</td>
            <td align="left">NN</td>
            <td align="left">FK</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">2020/01/28</td>
            <td align="left">0</td>
            <td align="left">1.143</td>
            <td align="left">0</td>
            <td align="left">0.151</td>
            <td align="left">8</td>
            <td align="left">1.059</td>
            <td align="left">HKG</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/03/16</td>
            <td align="left">7</td>
            <td align="left">4.286</td>
            <td align="left">0.727</td>
            <td align="left">0.445</td>
            <td align="left">39</td>
            <td align="left">4.048</td>
            <td align="left">HUN</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/04/06</td>
            <td align="left">1</td>
            <td align="left">2.143</td>
            <td align="left">2.519</td>
            <td align="left">5.399</td>
            <td align="left">29</td>
            <td align="left">73.064</td>
            <td align="left">BHS</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/10/18</td>
            <td align="left">0</td>
            <td align="left">0.429</td>
            <td align="left">0</td>
            <td align="left">0.609</td>
            <td align="left">3</td>
            <td align="left">4.261</td>  
            <td align="left">SLB</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2021/05/03</td>
            <td align="left">16353</td>
            <td align="left">7423</td>
            <td align="left">349.833</td>
            <td align="left">158.797</td>
            <td align="left">3540430</td>
            <td align="left">75738.882</td>
            <td align="left">ESP</td>
        </tr>         
        <tr>
            <td align="left"></td>
            <td align="left">2021/08/13</td>
            <td align="left">754</td>
            <td align="left">580.429</td>
            <td align="left">49.96</td>
            <td align="left">38.459</td>
            <td align="left">119508</td>
            <td align="left">7918.543</td>
            <td align="left">ZWE</td>       
        </tr>                
    </tbody>
</table>

</br>

### **DEATH_REGISTER**
<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td  align="left">COLUMNAS</td>
            <td align="left">date</td>
            <td align="left">new_deaths</td>
            <td align="left">new_deaths_smoothed</td>
            <td align="left">new_deaths_per_million</td>
            <td align="left">new_deaths_smoothed_per_million</td>
            <td align="left">total_deaths</td>
            <td align="left">total_deaths_per_million</td>
            <td align="left">iso_code (COUNTRY)</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">FK</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">2020/01/28</td>
            <td align="left"></td>
            <td align="left">0</td>
            <td align="left"></td>
            <td align="left">0</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">HKG</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/03/16</td>
            <td align="left">0</td>
            <td align="left">0.143</td>
            <td align="left">0</td>
            <td align="left">0.015</td>
            <td align="left">1</td>
            <td align="left">0.104</td>
            <td align="left">HUN</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/04/06</td>
            <td align="left">1</td>
            <td align="left">0.714</td>
            <td align="left">2.519</td>
            <td align="left">1.8</td>
            <td align="left">5</td>
            <td align="left">12.597</td>
            <td align="left">BHS</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/10/18</td>
            <td align="left"></td>
            <td align="left">0</td>
            <td align="left"></td>
            <td align="left">0</td>
            <td align="left"></td>
            <td align="left"></td>  
            <td align="left">SLB</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2021/05/03</td>
            <td align="left">77</td>
            <td align="left">79.286</td>
            <td align="left">1.647</td>
            <td align="left">1.696</td>
            <td align="left">78293</td>
            <td align="left">1674.888</td>
            <td align="left">ESP</td>
        </tr>         
        <tr>
            <td align="left"></td>
            <td align="left">2021/08/13</td>
            <td align="left">26</td>
            <td align="left">38.286</td>
            <td align="left">1.723</td>
            <td align="left">2.537</td>
            <td align="left">4073</td>
            <td align="left">269.875</td>
            <td align="left">ZWE</td>       
        </tr>                
    </tbody>
</table>
</br>

### **INTENSIVE_PATIENTS**
<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td align="left">COLUMNAS</td>
            <td align="left">date</td>
            <td align="left">icu_patients</td>
            <td align="left">icu_patients_per_million</td>
            <td align="left">weekly_icu_admissions</td>
            <td align="left">weekly_icu_admissions_per_million</td>
            <td align="left">iso_code (COUNTRY)</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">FK</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">2020/01/28</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">HKG</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/03/16</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">HUN</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/04/06</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">BHS</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/10/18</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">SLB</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2021/05/03</td>
            <td align="left">2323</td>
            <td align="left">49.695</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">ESP</td>
        </tr>         
        <tr>
            <td align="left"></td>
            <td align="left">2021/08/13</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">ZWE</td>       
        </tr>                
    </tbody>
</table>

</br>


### **HOSPITALIZED**
<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td align="left">COLUMNAS</td>
            <td align="left">date</td>
            <td align="left">hosp_patients</td>
            <td align="left">hosp_patients_per_million</td>
            <td align="left">weekly_hosp_admissions</td>
            <td align="left">weekly_hosp_admissions_per_million</td>
            <td align="left">iso_code (COUNTRY)</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">FK</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">2020/01/28</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">HKG</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/03/16</td>
            <td align="left">36</td>
            <td align="left">3.737</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">HUN</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/04/06</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">BHS</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/10/18</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">SLB</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2021/05/03</td>
            <td align="left">9747</td>
            <td align="left">208.513</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">ESP</td>
        </tr>         
        <tr>
            <td align="left"></td>
            <td align="left">2021/08/13</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">ZWE</td>       
        </tr>                
    </tbody>
</table>

</br>


### **TEST_UNIT**

<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td  align="left">COLUMNAS</td>
            <td align="left">code</td>
            <td align="left">name</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left">NN</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">1</td>
            <td align="left">tests performed</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2</td>
            <td align="left">units unclear</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">3</td>
            <td align="left">samples tested</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">4</td>
            <td align="left">people tested</td>
        </tr>       
    </tbody>
</table>

</br>

### **TEST_REGISTER**
<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td align="left">COLUMNAS</td>
            <td align="left">date</td>
            <td align="left">new_tests</td>
            <td align="left">total_tests</td>
            <td align="left">total_tests_per_thousan</td>
            <td align="left">new_tests_per_thousand</td>
            <td align="left">new_tests_smoothed</td>
            <td align="left">new_tests_smoothed_per_thousand</td>
            <td align="left">tests_per_case</td>      
            <td align="left">positive_rate</td>
            <td align="left">code (TEST_UNIT)</td>
            <td align="left">iso_code (COUNTRY)</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">FK</td>            
            <td align="left">FK NN</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">2020/01/28</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left">HKG</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/03/16</td>
            <td align="left">234</td>
            <td align="left">1240</td>
            <td align="left">0.129</td>
            <td align="left">0.024</td>
            <td align="left">146</td>
            <td align="left">0</td>
            <td align="left">34.1</td>
            <td align="left">0.029</td>
            <td align="left">1</td>            
            <td align="left">HUN</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/04/06</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left">BHS</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/10/18</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left">SLB</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2021/05/03</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">122115</td>
            <td align="left">2.612</td>
            <td align="left">16.5</td>
            <td align="left">0.061</td>   
            <td align="left">1</td>
            <td align="left">ESP</td>
        </tr>         
        <tr>
            <td align="left"></td>
            <td align="left">2021/08/13</td>
            <td align="left">7026</td>
            <td align="left">1046386</td>
            <td align="left">69.333</td>
            <td align="left">0.466</td>
            <td align="left">5496</td>
            <td align="left">0.364</td>
            <td align="left">9.5</td>
            <td align="left">0.106</td>
            <td align="left">1</td>            
            <td align="left">ZWE</td>       
        </tr>                
    </tbody>
</table>


### **VACCINATION**
<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td align="left">COLUMNAS</td>
            <td align="left">date</td>
            <td align="left">total_vaccinations</td>
            <td align="left">people_vaccinated</td>
            <td align="left">people_fully_vaccinated</td>
            <td align="left">total_boosters</td>
            <td align="left">new_vaccinations</td>
            <td align="left">new_vaccinations_smoothed</td>
            <td align="left">total_vaccinations_per_hundred</td>      
            <td align="left">people_vaccinated_per_hundred</td>
            <td align="left">people_fully_vaccinated_per_hundred</td>
            <td align="left">total_boosters_per_hundred</td>
            <td align="left">new_vaccinations_smoothed_per_million</td>
            <td align="left">iso_code (COUNTRY)</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left">FK NN</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">2020/01/28</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left"></td>
            <td align="left">HKG</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/03/16</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">HUN</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/04/06</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">BHS</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/10/18</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">SLB</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2021/05/03</td>
            <td align="left">17430810</td>
            <td align="left">12381213</td>
            <td align="left">5202297</td>
            <td align="left"></td>
            <td align="left">252244</td>
            <td align="left">348020</td>
            <td align="left">37.29</td>
            <td align="left">26.49</td>            
            <td align="left">11.13</td>
            <td align="left"></td>
            <td align="left">7445</td>   
            <td align="left">ESP</td>
        </tr>         
        <tr>
            <td align="left"></td>
            <td align="left">2021/08/13</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left">56484</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">3743</td>
            <td align="left">ZWE</td>       
        </tr>                
    </tbody>
</table>


### **COUNTRY_DETAIL**
<table border="3">
    <thead>
        <tr style="background: #86324C;">
            <td align="left">COLUMNAS</td>
            <td align="left">date</td>
            <td align="left">reproduction_rate</td>
            <td align="left">stringency_index</td>
            <td align="left">population</td>
            <td align="left">population_density</td>
            <td align="left">median_age</td>
            <td align="left">aged_65_older</td>
            <td align="left">aged_70_older</td>      
            <td align="left">gdp_per_capita</td>
            <td align="left">extreme_poverty</td>
            <td align="left">cardiovasc_death_rate</td>
            <td align="left">diabetes_prevalence</td>
            <td align="left">female_smokers</td>
            <td align="left">male_smokers</td>
            <td align="left">handwashing_facilities</td>
            <td align="left">hospital_beds_per_thousand</td>
            <td align="left">life_expectancy</td>      
            <td align="left">human_development_index</td>
            <td align="left">excess_mortality</td>         
            <td align="left">iso_code (COUNTRY)</td>
        </tr>
        <tr style="background: #0F224E">
            <td align="left">RESTRICCIONES</td>
            <td align="left">PK</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>                        
            <td align="left">FK NN</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left"></td>
            <td align="left">2020/01/28</td>
            <td align="left"></td>
            <td align="left">45.37</td>
            <td align="left">7552800</td>
            <td align="left">7039.714</td>
            <td align="left">44.8</td>
            <td align="left">16.303</td>
            <td align="left">10.158</td>
            <td align="left">56054.92</td>
            <td align="left"></td>
            <td align="left"></td>            
            <td align="left">8.33</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">84.86</td>
            <td align="left">0.949</td>
            <td align="left"></td>            
            <td align="left">HKG</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/03/16</td>
            <td align="left"></td>
            <td align="left">67.59</td>
            <td align="left">9634162</td>
            <td align="left">108.043</td>
            <td align="left">43.4</td>
            <td align="left">18.577</td>
            <td align="left">11.976</td>
            <td align="left">26777.561</td>            
            <td align="left">0.5</td>
            <td align="left">278.296</td>
            <td align="left">7.55</td>
            <td align="left">26.8</td>
            <td align="left">34.8</td>
            <td align="left"></td>
            <td align="left">7.02</td>
            <td align="left">76.88</td>
            <td align="left">0.854</td>
            <td align="left"></td>            
            <td align="left">HUN</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/04/06</td>
            <td align="left"></td>
            <td align="left">96.3</td>
            <td align="left">396914</td>
            <td align="left">39.497</td>
            <td align="left">34.3</td>
            <td align="left">8.996</td>
            <td align="left">5.2</td>
            <td align="left">27717.847</td>            
            <td align="left"></td>
            <td align="left">235.954</td>
            <td align="left">13.17</td>
            <td align="left">3.1</td>
            <td align="left">20.4</td>
            <td align="left"></td>
            <td align="left">2.9</td>
            <td align="left">73.92</td>
            <td align="left">0.814</td>
            <td align="left"></td>            
            <td align="left">BHS</td>
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2020/10/18</td>
            <td align="left"></td>
            <td align="left">43.52</td>
            <td align="left">703995</td>
            <td align="left">21.841</td>
            <td align="left">20.8</td>
            <td align="left">3.507</td>
            <td align="left">2.043</td>
            <td align="left">2205.923</td>            
            <td align="left">25.1</td>
            <td align="left">459.78</td>
            <td align="left">18.68</td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left">35.89</td>
            <td align="left">1.4</td>
            <td align="left">73</td>
            <td align="left">0.567</td>
            <td align="left"></td>            
            <td align="left">SLB</td>       
        </tr>
        <tr>
            <td align="left"></td>
            <td align="left">2021/05/03</td>
            <td align="left">0.91</td>
            <td align="left">69.44</td>
            <td align="left">46745211</td>
            <td align="left">93.105</td>
            <td align="left">45.5</td>
            <td align="left">19.436</td>
            <td align="left">13.799</td>
            <td align="left">34272.36</td>            
            <td align="left">1</td>
            <td align="left">99.403</td>
            <td align="left">7.15</td>
            <td align="left">27.4</td>
            <td align="left">31.4</td>
            <td align="left"></td>
            <td align="left">2.97</td>
            <td align="left">83.56</td>
            <td align="left">0.904</td>
            <td align="left"></td>               
            <td align="left">ESP</td>
        </tr>         
        <tr>
            <td align="left"></td>
            <td align="left">2021/08/13</td>
            <td align="left">0.64</td>
            <td align="left">73.15</td>
            <td align="left">15092171</td>
            <td align="left">42.729</td>
            <td align="left">19.6</td>            
            <td align="left">2.822</td>
            <td align="left">1.882</td>
            <td align="left">1899.775</td>
            <td align="left">21.4</td>
            <td align="left">307.846</td>
            <td align="left">1.82</td>
            <td align="left">1.6</td>
            <td align="left">30.7</td>
            <td align="left">36.791</td>
            <td align="left">1.7</td>
            <td align="left">61.49</td>
            <td align="left">0.571</td>
            <td align="left"></td>            
            <td align="left">ZWE</td>       
        </tr>                
    </tbody>
</table>

# **Modelo Físico**

# **Glosario**
