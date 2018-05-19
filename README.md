## Example Database for Student's SQL training
SQL is a standard language for storing, manipulating and retrieving data in databases.
These SQL statements teach us how to use SQL in a standard syntax that should work with all the popular SQL dialects like MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgres, and other database systems.

These queries have been tested on MySQL.

<!--ts-->
   * [Databases used](#databases-used)
        * [Student's courses](#students_courses)
        * [DB lorenzo](#)
   * [Operators](#operators)
   * [Queries](#queries)
        * [SELECT](#select)
            * [ORDER BY](#order-by)
        * [DISTINCT](#distinct)
        * [WHERE clause](#where)
            * [LIKE](#like)
            * [AND OR NOT](#and-or-not)
            * [COUNT](#count)
        * [JOINS](#joins)
        * [COUNT, MIN, MAX, AVG, SUM](#count-min-max-avg-sum)
<!--te-->

### Databases used
Description of databases and schemas.
- student courses: 3 tables (corso, studente, esame_sostenuto) with integrity reference between them.
- lorenzo qui aggiungi il tuo.

### Queries
Examplified Standard SQL queries.

### Operators

````
!= and <> means different (not equal to)
== and = means equal
| and OR means or
& and AND means and
ALL	TRUE if all of the subquery values meet the condition	
AND	TRUE if all the conditions separated by AND is TRUE	
ANY	TRUE if any of the subquery values meet the condition	
BETWEEN	TRUE if the operand is within the range of comparisons	
EXISTS	TRUE if the subquery returns one or more records	
IN	TRUE if the operand is equal to one of a list of expressions	
LIKE	TRUE if the operand matches a pattern	
NOT	Displays a record if the condition(s) is NOT TRUE	
OR	TRUE if any of the conditions separated by OR is TRUE	
SOME	TRUE if any of the subquery values meet the condition
````

#### SELECT

````
-- takes everything (* means wildcard) from studente table
SELECT * FROM studente;

-- takes only selected columns from studente table
SELECT cognome, matricola FROM studente;
````

##### ORDER BY
````
SELECT cognome, matricola FROM studente ORDER BY cognome ASC;
SELECT cognome, matricola FROM studente ORDER BY cognome DESC;
````


#### DISTINCT
It distinguishes all the values and returns everything but the duplicates.
````
-- it takes all the cognome values in studente tables
SELECT DISTINCT cognome FROM studente;
````

#### WHERE
WHERE is a condition and works like a filter on the selected fields.
Only the fields that corrispond to the WHERE clause will be returned, it works like an IF statement.
- "takes those that match this condition(s)"
- "takes these if they match this IF (where) statement"

````
SELECT cognome, matricola FROM studente WHERE cognome="de marco";

-- filter all the students without a matricola
SELECT * FROM studente WHERE matricola IS NULL OR matricola="";

-- filter all the students with a valid matricola
SELECT * FROM studente WHERE matricola IS NOT NULL AND matricola!="";

-- filter all the students without a name 
SELECT * FROM studente WHERE nome IS NULL OR nome="";
````
###### [Warning] *Mind that there's difference between NULL and ""!*


##### LIKE
````
-- takes only selected columns from studente table if cognome starts with "de(everything)"
SELECT cognome, matricola FROM studente WHERE cognome LIKE "de%";
````

##### AND OR NOT
````
SELECT cognome, matricola FROM studente WHERE cognome LIKE "de%" 
AND NOT cognome="de marco";

SELECT cognome, matricola FROM studente WHERE cognome NOT LIKE "w%"
AND NOT cognome="de marco";

SELECT cognome, matricola FROM studente WHERE cognome LIKE "w%"
OR cognome LIKE "d%";
````

##### JOINS
SELF JOIN: Standard JOIN
(INNER) JOIN: Returns records that have matching values in both tables
LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: Return all records when there is a match in either left or right table

````
-- JOIN (quite standard)
SELECT *
FROM corso AS C, esame_sostenuto AS E, studente AS S
WHERE C.id_corso = E.corso_id AND 
      S.id_studente = E.studente_id
      ORDER BY voto DESC;

-- INNER JOIN (same as previous)
SELECT *
FROM esame_sostenuto
INNER JOIN corso ON esame_sostenuto.corso_id=corso.id_corso
INNER JOIN studente ON esame_sostenuto.studente_id=studente.id_studente;
````

##### COUNT, MIN, MAX, AVG, SUM
````
-- takes only selected columns from studente table if cognome starts with "de(everything)"
SELECT cognome, COUNT(cognome) FROM studente WHERE cognome="de marco";



````


