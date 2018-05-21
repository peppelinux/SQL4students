## Example Database for Student's SQL training
SQL is a standard language for storing, manipulating and retrieving data in databases.
These SQL statements teach us how to use SQL in a standard syntax that should work with all the popular SQL dialects like MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgres, and other database systems.

These queries have been tested on MySQL.

<!--ts-->
   * [Databases used](#databases-used)
        * [Address_book](#address_book)
   * [Operators](#operators)
   * [Queries](#queries)
        * [SELECT](#select)
            * [ORDER BY](#order-by)
            * [LIMIT](#limit)
            * [DISTINCT](#distinct)
        * [WHERE clause](#where)
            * [FROM](#in)
            * [IN](#in)
            * [LIKE](#like)
            * [AND OR NOT](#and-or-not)
            * [COUNT](#count)
        * [JOINS](#joins)
        * OCCOURENCES AND ANALISYS
            * [COUNT, MIN, MAX, AVG, SUM](#count-min-max-avg-sum)
        * [HAVING](#having)
        * SUBQUERIES
            * [EXISTS, ANY, ALL](#exists-any-all)
<!--te-->

### Databases used
Description of databases and schemas.
- address book: 5 tables (progetto_informatico, regione, province, città, indirizzi) with integrity reference between them.

### Queries
Examplified Standard SQL queries.

### Operators

````
!= and <> means different (not equal to)
== and = means equal
| and OR means or
& and AND means and

+=	Add equals
-=	Subtract equals
*=	Multiply equals
/=	Divide equals
%=	Modulo equals
&=	Bitwise AND equals
^-=	Bitwise exclusive equals
|*=	Bitwise OR equals

=	Equal to	
>	Greater than	
<	Less than	
>=	Greater than or equal to	
<=	Less than or equal to	
<>	Not equal to

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
-- takes everything (* means wildcard) from progetto_informatico table
SELECT * FROM progetto_informatico;

-- takes only selected columns from progetto_informatico table
SELECT cognome, numero_di_telefono FROM studente;
````

##### ORDER BY
````
SELECT cognome, numero_di_telefono FROM progetto_informatico ORDER BY cognome ASC;
SELECT nome, numero_di_telefono FROM progetto_informatico ORDER BY nome DESC;
````
##### LIMIT
Specifies the number of records to return.
````
SELECT nome, cognome, indirizzo FROM progetto_informatico LIMIT 2;
````

##### DISTINCT
It distinguishes all the values and returns everything but the duplicates.
````
-- it takes all the indirizzo values in progetto_informatico tables
SELECT DISTINCT indirizzo FROM progetto_informatico;
````

#### WHERE
WHERE is a condition and works like a filter on the selected fields.
Only the fields that corrispond to the WHERE clause will be returned, it works like an IF statement.
- "takes those that match this condition(s)"
- "takes these if they match this IF (where) statement"

````
SELECT cognome, nome FROM dati_anagrafici WHERE cognome="rossi";

-- filter all the worker without a numero_di_telefono
SELECT * FROM dati_anagrafici WHERE numero_di_telefono IS NULL OR numero_di_telefono="";

-- filter all the worker with a valid numero_di_telefono
SELECT * FROM dati_anagrafici WHERE numero_di_telefono IS NOT NULL AND numero_di_telefono!="";

-- filter all the worker without a indirizzo 
SELECT * FROM dati_anagrafici WHERE indirizzo IS NULL OR indirizzo="";
````
###### [Warning] *Mind that there's difference between NULL and ""!*

##### FROM
It is a method to search from a specific column the information thet you want. It is very useful if you want a specific information from the DB.

````
SELECT cognome, nome FROM dati_anagrafici;
````
##### IN
It's a shorthand for multiple OR conditions.
````
SELECT * FROM dati_anagrafici WHERE nome IN ("de marco", "rossi");
````

##### LIKE
````
-- takes only selected columns from studente table if cognome starts with "de(everything)"
SELECT cognome, numero_di_telefono FROM dati_anagrafici WHERE cognome LIKE "r%";
````

##### AND OR NOT
````
SELECT cognome, nome, indirizzo FROM dati_anagrafici WHERE indirizzo LIKE "v%" 
AND NOT indirizzo="viale";

SELECT cognome, nome, indirizzo FROM dati_anagrafici WHERE nome NOT LIKE "w%"
AND NOT nome="lorenzo";

SELECT cognome, nome, indirizzo FROM dati_anagrafici WHERE cognome LIKE "r%"
OR cognome LIKE "m%";
````

##### JOINS
- SELF JOIN: Standard JOIN, merge a table resultset with another standing to WHERE condition matching
- (INNER) JOIN: Returns records that have matching values in both tables (same result as SELF)
- LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
- RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
- FULL (OUTER) JOIN: Return all records when there is a match in either left or right table

````
-- JOIN
SELECT *
FROM progetto_informatico AS PI, regioni AS R, province AS P, città AS C, dati_anagrafici AS D
WHERE PI.idprogetto_informatico = R.idregioni AND 
      P.idprovince = C.idcittà AND
      PI.idprogetto_informatico = D.iddati_anagrafici
      ORDER BY progetto_informatico_desiderato DESC;

-- INNER JOIN (same result as previous)
SELECT *
FROM progetto_informatico_desiderato
INNER JOIN province ON progetto_informatico_desiderato.idprovince=province.idprovince
INNER JOIN dati_anagrafici ON progetto_informatico_desiderato.iddati_Anagrafici=dati_anagrafici.ididati_anagrafici;

-- more selective
SELECT progetto_informatico.progetto_informatico_desiderato, regioni.regioni_coinvolte, province.province_coinvolte, città.città_coinvolte, dati_anagrafici.nome, dati_anagrafici.cognome, dati_anagrafici.numero_di_telefono;
FROM progetto_informatico_desiderato
INNER JOIN province ON progetto_informatico_desiderato.idprovince=province.idprovince
INNER JOIN dati_anagrafici ON progetto_informatico_desiderato.iddati_Anagrafici=dati_anagrafici.ididati_anagrafici;
````

#### COUNT, MIN, MAX, AVG, SUM
````
-- takes only selected columns from studente table if cognome starts with "de(*everything)"
SELECT cognome, COUNT(cognome) FROM dati_anagrafici WHERE cognome="de marco";

-- how many time a project present a worker in a different country and we have to find his phone number in a DB
SELECT COUNT(progetto_informatico.progetto_informatico_desiderato), dati_anagrafici.nome, dati_anagrafici.cognome, dati_anagrafici.numero_di_telefono
FROM progetto_informatico
INNER JOIN province ON progetto_informatico_desiderato.idprovince=province.idprovince
INNER JOIN dati_anagrafici ON progetto_informatico_desiderato.iddati_Anagrafici=dati_anagrafici.ididati_anagrafici;
WHERE numero_di_telefono = "0%"
GROUP BY dati_anagrafici.cognome;

-- how many time a project present a worker in a different country and we have to find his phone number in a DB.
-- mind that: dati_anagrafici.numero_di_telefono have always the last vote registered
-- example, sql got lorenzo de marco like a worker and his phone number is 0001, so that is the result.

SELECT dati_anagrafici.nome AS dati_anagrafici, COUNT(dati_anagrafici.nome) AS occurrences, 
       dati_anagrafici.numero_di_telefono, 
       dati_anagrafici.nome, dati_anagrafici.cognome, progetto_informatico.progetto_informatico_desiderato
FROM dati_anagrafici
INNER JOIN province ON progetto_informatico_desiderato.idprovince=province.idprovince
INNER JOIN dati_anagrafici ON progetto_informatico_desiderato.iddati_Anagrafici=dati_anagrafici.ididati_anagrafici;
WHERE dati_anagrafici.numero_di_telefono = '0%'
GROUP BY progetto_informatico.progetto_informatic_desiderato, dati_anagrafici.nome, dati_anagrafici.cognome;

#### HAVING
Which employee works on a specific project.
````
SELECT progetto_informatico.progetto_informatico_desiderato, COUNT(dati_anagrafici.nome) AS occurrences, 
       dati_anagrafici.numero_di_telefono, 
       dati_anagrafici.nome, dati_anagrafici.cognome
FROM progetto_informatico, regioni, province, città, dati_anagrafici
WHERE progetto_informatico.idprogetto_informatico = regioni.idregioni AND 
      province.idprovince = città.idcittà AND
      progetto_informatico.idprogetto_informatico = dati_anagrafici.iddati_anagrafici
      AND dati_anagrafici.numero_di_telefono = '1%'
      GROUP BY dati_anagrafici.cognome, dati_anagrafici.numero_di_telefono
      HAVING occurrences > 1;
````

#### EXISTS, ANY, ALL
Exists filters out an answer by a subquery. 
It passes FROM variable (worker) to the subquery for WHERE statement
````
SELECT dati_anagrafici.nome, dati_anagrafici.congnome, dati_anagrafici_numero_di_telefono
FROM dati_anagrafici
WHERE EXISTS(
SELECT progetto_informatico_id
FROM progeto_informatico
WHERE progetto_informatico_id = dati_anagrafici.iddati_anagrafici;
````

The ANY operator returns true if any of the subquery values meet the condition.
The ALL operator returns true if all of the subquery values meet the condition.
They all works with subquery

````
SELECT studente.matricola, studente.nome, studente.cognome
FROM studente
WHERE id_studente= ANY (SELECT studente_id FROM esame_sostenuto WHERE esame_sostenuto.voto <= 18);
````
