## Example Database for Student's SQL training
SQL is a standard language for storing, manipulating and retrieving data in databases.
These SQL statements teach us how to use SQL in a standard syntax that should work with all the popular SQL dialects like MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgres, and other database systems.

These queries have been tested on MySQL.

<!--ts-->
   * [Databases used](#databases-used)
        * [Student's courses](#students_courses)
        * [DB lorenzo](#)
   * [Queries](#queries)
        * [SELECT](#select)
            * [ORDER BY](#order-by)
        * [DISTINCT](#distinct)
        * [WHERE clause](#where)
            * [LIKE](#like)
            * [AND OR NOT](#and-or-not)
            * [COUNT](#count)
        * [Count](#count)
<!--te-->

### Databases used
Description of databases and schemas.
- student courses: 3 tables (corso, studente, esame_sostenuto) with integrity reference between them.
- lorenzo qui aggiungi il tuo.

### Queries
Examplified Standard SQL queries.

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
- "takes these that match to this condition(s)"
- "takes these if they match to this IF (where) statement"

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

##### COUNT
````
-- takes only selected columns from studente table if cognome starts with "de(everything)"
SELECT cognome, COUNT(cognome) FROM studente WHERE cognome="de marco";
````
