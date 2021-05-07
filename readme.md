# Correcció exercicis

Revisió dels exercicis de la **unitat formativa 3** del **mòdul professional 2**.

|Enunciat|Fitxer|Comentari|Nota|
|--------|------|---------|----|
|**Enunciat 9**||FET|?????|
|**Enunciat 11**|FET|?????|?????|
|**Enunciat 12**|FET|?????|?????|
|**Enunciat 13**|?????|?????|?????|


# Exemple de correcció

Cal que ompliu el fitxer **```README.md```** del vostre repositori amb la següent informació per a cadascun dels enunciats.

# **Enunciat 8**:

## Emprant l’**activitat 6**, dissenya un cursor que llisti els mateixos camps per a totes les pel·lícules.

**1. Enllaç al fitxer**

[Act08.sql](https://github.com/joanpardogine/exercicis_mp02_uf03/blob/master/Cursors/Act08.sql)

**2. Contingut del fitxer**

```sql
use videoclub;
drop procedure if exists act8;
delimiter //
create procedure act8()
begin
   declare recaptat bigint default 0;
   declare pressu bigint default 0;
   declare titol varchar(40);
   declare rendibilitat varchar(15);
   declare final int default false;
   
   declare elcursor cursor for
      select titol_peli, recaudacio_peli, pressupost_peli
      from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into titol, recaptat, pressu;
      
      if final = 1 then
         leave elbucle;
      end if;
      
      if (pressu>recaptat) then
         set rendibilitat = "Deficitari";
      elseif (pressu*2 > recaptat) then
         set rendibilitat = "Suficient";
      else
         set rendibilitat = "Bona";
      end if;
      
      select titol, rendibilitat;
   
   end loop elbucle; 
   close elcursor;
end//

delimiter ;

-- call act8();
```

**3. Sortida de la creació del procediment**
```sql
mysql> use videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> drop procedure if exists act8;
Query OK, 0 rows affected (1.69 sec)

mysql> delimiter //
mysql> create procedure act8()
    -> begin
    ->    declare recaptat bigint default 0;
    ->    declare pressu bigint default 0;
    ->    declare titol varchar(40);
    ->    declare rendibilitat varchar(15);
    ->    declare final int default false;
    ->    
    ->    declare elcursor cursor for
    ->       select titol_peli, recaudacio_peli, pressupost_peli
    ->       from PELLICULES;
    -> 
    ->    declare continue handler for not found set final = 1;
    ->    open elcursor;
    ->    elbucle:loop
    ->       fetch elcursor into titol, recaptat, pressu;
    ->       
    ->       if final = 1 then
    ->          leave elbucle;
    ->       end if;
    ->       
    ->       if (pressu>recaptat) then
    ->          set rendibilitat = "Deficitari";
    ->       elseif (pressu*2 > recaptat) then
    ->          set rendibilitat = "Suficient";
    ->       else
    ->          set rendibilitat = "Bona";
    ->       end if;
    ->       
    ->       select titol, rendibilitat;
    ->    
    ->    end loop elbucle; 
    ->    close elcursor;
    -> end//
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> delimiter ;
mysql> 
```

**4. Sortida de l'execució del procediment**
```sql
mysql> call act8();
+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA BUSQUEDA | Suficient    |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA TERMINAL | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| Mar adentro | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-----------+--------------+
| titol     | rendibilitat |
+-----------+--------------+
| Colateral | Bona         |
+-----------+--------------+
1 row in set (0.00 sec)

+--------------------+--------------+
| titol              | rendibilitat |
+--------------------+--------------+
| Los 4 fantásticos  | Suficient    |
+--------------------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| Sin City | Suficient    |
+----------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| IRON MAN | Bona         |
+----------+--------------+
1 row in set (0.00 sec)

+----------------+--------------+
| titol          | rendibilitat |
+----------------+--------------+
| Los Vengadores | Bona         |
+----------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| Los Vengadores: La era de Ultron | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| La busqueda 2: El diario secreto | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| IRON MAN 2 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| Iron Man 3 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+---------------------------------------+--------------+
| titol                                 | rendibilitat |
+---------------------------------------+--------------+
| Capitán América: El primer vengador   | Bona         |
+---------------------------------------+--------------+
1 row in set (0.00 sec)

+-------------------------------------------+--------------+
| titol                                     | rendibilitat |
+-------------------------------------------+--------------+
| Capitán América: El Soldado de Invierno   | Bona         |
+-------------------------------------------+--------------+
1 row in set (0.01 sec)

+------------------------------+--------------+
| titol                        | rendibilitat |
+------------------------------+--------------+
| Capitán América: Civil War   | Bona         |
+------------------------------+--------------+
1 row in set (0.01 sec)

+-------+--------------+
| titol | rendibilitat |
+-------+--------------+
| Joker | Deficitari   |
+-------+--------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)
```

---

# **Enunciat 9**:

## Emprant l’**activitat 7**, dissenya un cursor que llisti els mateixos camps per a tots els intèrprets.

**1. Enllaç al fitxer**
[Act09.sql](https://github.com/qcomas02/exercicis_mp02_uf03/blob/master/ComasQuim_Act_03_ProcEmm_MySQL/ComasQuim_Act_03_ProcEmm_MySQL_Apartat_009.sql)

**2. Contingut del fitxer**
```sql
   use videoclub;
drop procedure if exists act9;
delimiter //
create procedure act9()
begin
   declare edatActor bigint;
   declare nomActor varchar(30);
   declare sexeActor varchar(6);
   declare final int default false;
   declare po_tipusDePaper varchar(6);

   declare elcursor cursor for
      SELECT ACTORS.sexe_actor, YEAR(CURDATE())-ACTORS.anynaix_actor, ACTORS.nom_actor
   FROM ACTORS;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into sexeActor, edatActor, nomActor;

      if final = 1 then
         leave elbucle;
      end if;

         IF edatActor < 15 THEN
    SET po_tipusDePaper ="nen";
    ELSEIF edatActor > 15 AND edatActor < 25 THEN
    SET po_tipusDePaper ="jove";
    ELSEIF edatActor > 26 AND edatActor < 40 THEN
    SET po_tipusDePaper ="adult";
    ELSEIF edatActor > 41 AND edatActor < 60 THEN
    SET po_tipusDePaper ="madur";
    ELSEIF edatActor > 61 THEN
    SET po_tipusDePaper ="gran";
    END IF;

    SELECT nomActor, sexeActor, edatActor, po_tipusDePaper;

   end loop elbucle; 
   close elcursor;
end//

delimiter ;

call act9();
```

**3. Sortida de la creació del procediment**
```sql
   use videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> drop procedure if exists act9;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> delimiter //
mysql> create procedure act9()
    -> begin
    ->    declare edatActor bigint;
    ->    declare nomActor varchar(30);
    ->    declare sexeActor varchar(6);
    ->    declare final int default false;
    ->    declare po_tipusDePaper varchar(6);
    ->
    ->    declare elcursor cursor for
    ->       SELECT ACTORS.sexe_actor, YEAR(CURDATE())-ACTORS.anynaix_actor, ACTORS.nom_actor
    ->    FROM ACTORS;
    ->
    ->    declare continue handler for not found set final = 1;
    ->    open elcursor;
    ->    elbucle:loop
    ->       fetch elcursor into sexeActor, edatActor, nomActor;
    ->
    ->       if final = 1 then
    ->          leave elbucle;
    ->       end if;
    ->
    ->          IF edatActor < 15 THEN
    ->     SET po_tipusDePaper ="nen";
    ->     ELSEIF edatActor > 15 AND edatActor < 25 THEN
    ->     SET po_tipusDePaper ="jove";
    ->     ELSEIF edatActor > 26 AND edatActor < 40 THEN
    ->     SET po_tipusDePaper ="adult";
    ->     ELSEIF edatActor > 41 AND edatActor < 60 THEN
    ->     SET po_tipusDePaper ="madur";
    ->     ELSEIF edatActor > 61 THEN
    ->     SET po_tipusDePaper ="gran";
    ->     END IF;
    ->
    ->     SELECT nomActor, sexeActor, edatActor, po_tipusDePaper;
    ->
    ->    end loop elbucle;
    ->    close elcursor;
    -> end//
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> delimiter ;
mysql>
```

**4. Sortida de l'execució del procediment**
```sql
  mysql> call act9();
+--------------+-----------+-----------+-----------------+
| nomActor     | sexeActor | edatActor | po_tipusDePaper |
+--------------+-----------+-----------+-----------------+
| Nicolas Cage | home      |        57 | madur           |
+--------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+--------------+-----------+-----------+-----------------+
| nomActor     | sexeActor | edatActor | po_tipusDePaper |
+--------------+-----------+-----------+-----------------+
| Diane Kruger | dona      |        45 | madur           |
+--------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+-----------+-----------+-----------+-----------------+
| nomActor  | sexeActor | edatActor | po_tipusDePaper |
+-----------+-----------+-----------+-----------------+
| Tom Hanks | home      |        65 | gran            |
+-----------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+----------------------+-----------+-----------+-----------------+
| nomActor             | sexeActor | edatActor | po_tipusDePaper |
+----------------------+-----------+-----------+-----------------+
| Catherine Zeta-Jones | dona      |        52 | madur           |
+----------------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+---------------+-----------+-----------+-----------------+
| nomActor      | sexeActor | edatActor | po_tipusDePaper |
+---------------+-----------+-----------+-----------------+
| Javier Bardem | home      |        52 | madur           |
+---------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+------------+-----------+-----------+-----------------+
| nomActor   | sexeActor | edatActor | po_tipusDePaper |
+------------+-----------+-----------+-----------------+
| Tom Cruise | home      |        59 | madur           |
+------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+------------+-----------+-----------+-----------------+
| nomActor   | sexeActor | edatActor | po_tipusDePaper |
+------------+-----------+-----------+-----------------+
| Jamie Foxx | home      |        54 | madur           |
+------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+--------------+-----------+-----------+-----------------+
| nomActor     | sexeActor | edatActor | po_tipusDePaper |
+--------------+-----------+-----------+-----------------+
| Jessica Alba | dona      |        40 | madur           |
+--------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+---------------+-----------+-----------+-----------------+
| nomActor      | sexeActor | edatActor | po_tipusDePaper |
+---------------+-----------+-----------+-----------------+
| Ioan Gruffudd | home      |        48 | madur           |
+---------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+-------------------+-----------+-----------+-----------------+
| nomActor          | sexeActor | edatActor | po_tipusDePaper |
+-------------------+-----------+-----------+-----------------+
| Robert Downey Jr. | home      |        56 | madur           |
+-------------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+-----------------+-----------+-----------+-----------------+
| nomActor        | sexeActor | edatActor | po_tipusDePaper |
+-----------------+-----------+-----------+-----------------+
| Gwyneth Paltrow | dona      |        49 | madur           |
+-----------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+-----------------+-----------+-----------+-----------------+
| nomActor        | sexeActor | edatActor | po_tipusDePaper |
+-----------------+-----------+-----------+-----------------+
| Chris Hemsworth | home      |        38 | adult           |
+-----------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+--------------+-----------+-----------+-----------------+
| nomActor     | sexeActor | edatActor | po_tipusDePaper |
+--------------+-----------+-----------+-----------------+
| Mark Ruffalo | home      |        54 | madur           |
+--------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+-------------+-----------+-----------+-----------------+
| nomActor    | sexeActor | edatActor | po_tipusDePaper |
+-------------+-----------+-----------+-----------------+
| Chris Evans | home      |        40 | madur           |
+-------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+--------------------+-----------+-----------+-----------------+
| nomActor           | sexeActor | edatActor | po_tipusDePaper |
+--------------------+-----------+-----------+-----------------+
| Scarlett Johansson | dona      |        37 | adult           |
+--------------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+---------------+-----------+-----------+-----------------+
| nomActor      | sexeActor | edatActor | po_tipusDePaper |
+---------------+-----------+-----------+-----------------+
| Jeremy Renner | home      |        40 | adult           |
+---------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+--------------+-----------+-----------+-----------------+
| nomActor     | sexeActor | edatActor | po_tipusDePaper |
+--------------+-----------+-----------+-----------------+
| James Spader | home      |        61 | adult           |
+--------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+-----------------+-----------+-----------+-----------------+
| nomActor        | sexeActor | edatActor | po_tipusDePaper |
+-----------------+-----------+-----------+-----------------+
| Michael Chiklis | home      |        52 | madur           |
+-----------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+---------------+-----------+-----------+-----------------+
| nomActor      | sexeActor | edatActor | po_tipusDePaper |
+---------------+-----------+-----------+-----------------+
| Hayley Atwell | dona      |        39 | adult           |
+---------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+----------------+-----------+-----------+-----------------+
| nomActor       | sexeActor | edatActor | po_tipusDePaper |
+----------------+-----------+-----------+-----------------+
| Sebastian Stan | home      |        39 | adult           |
+----------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+---------------+-----------+-----------+-----------------+
| nomActor      | sexeActor | edatActor | po_tipusDePaper |
+---------------+-----------+-----------+-----------------+
| Andrew Howard | home      |        52 | madur           |
+---------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+------------------+-----------+-----------+-----------------+
| nomActor         | sexeActor | edatActor | po_tipusDePaper |
+------------------+-----------+-----------+-----------------+
| Clémence Poésy   | dona      |        39 | adult           |
+------------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+------------------+-----------+-----------+-----------------+
| nomActor         | sexeActor | edatActor | po_tipusDePaper |
+------------------+-----------+-----------+-----------------+
| Caroline Goodall | dona      |        62 | gran            |
+------------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+--------------+-----------+-----------+-----------------+
| nomActor     | sexeActor | edatActor | po_tipusDePaper |
+--------------+-----------+-----------+-----------------+
| Daniel Creig | home      |        53 | madur           |
+--------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+------------------+-----------+-----------+-----------------+
| nomActor         | sexeActor | edatActor | po_tipusDePaper |
+------------------+-----------+-----------+-----------------+
| Clémence Poésy   | dona      |        39 | adult           |
+------------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+------------------+-----------+-----------+-----------------+
| nomActor         | sexeActor | edatActor | po_tipusDePaper |
+------------------+-----------+-----------+-----------------+
| Caroline Goodall | dona      |        62 | gran            |
+------------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+--------------+-----------+-----------+-----------------+
| nomActor     | sexeActor | edatActor | po_tipusDePaper |
+--------------+-----------+-----------+-----------------+
| Daniel Creig | home      |        53 | madur           |
+--------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+-----------------+-----------+-----------+-----------------+
| nomActor        | sexeActor | edatActor | po_tipusDePaper |
+-----------------+-----------+-----------+-----------------+
| Joaquin Phoenix | home      |        47 | madur           |
+-----------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+----------------+-----------+-----------+-----------------+
| nomActor       | sexeActor | edatActor | po_tipusDePaper |
+----------------+-----------+-----------+-----------------+
| Robert de Niro | home      |        78 | gran            |
+----------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

+-------------+-----------+-----------+-----------------+
| nomActor    | sexeActor | edatActor | po_tipusDePaper |
+-------------+-----------+-----------+-----------------+
| Zazie Beetz | dona      |        30 | adult           |
+-------------+-----------+-----------+-----------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

```

---

# **Enunciat 11**:

## Dissenya una funció que rebent un codi de pel·lícula torni el nombre d’usuaris que l’han vist.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom de l’usuari.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
  USE videoclub;
DROP FUNCTION IF EXISTS act11;

DELIMITER //
CREATE FUNCTION act11(peCodiPeli SMALLINT UNSIGNED) 
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC

BEGIN
   DECLARE QtatPrestecs SMALLINT UNSIGNED;
   SELECT   COUNT(*)
        INTO QtatPrestecs
   FROM     PRESTECS
   WHERE    id_peli = peCodiPeli;

   RETURN QtatPrestecs;
END//
DELIMITER ;
 SELECT  titol_peli Titol, act11(1) "Quantitat exemplars"
   FROM    PELLICULES
   WHERE   id_peli = 1;

```

**3. Sortida de la creació del procediment**
```sql
    CREATE FUNCTION act11(peCodiPeli SMALLINT UNSIGNED)
    ->        RETURNS SMALLINT UNSIGNED
    ->        DETERMINISTIC
    ->
    -> BEGIN
    ->    DECLARE QtatPrestecs SMALLINT UNSIGNED;
    ->    SELECT   COUNT(*)
    ->         INTO QtatPrestecs
    ->    FROM     PRESTECS
    ->    WHERE    id_peli = peCodiPeli;
    ->
    ->    RETURN QtatPrestecs;
    -> END//
Query OK, 0 rows affected (0.00 sec)

```

**4. Sortida de l'execució del procediment**
```sql
   SELECT  titol_peli Titol, act11(1) "Quantitat exemplars"
    ->    FROM    PELLICULES
    ->    WHERE   id_peli = 1;
+-------------+---------------------+
| Titol       | Quantitat exemplars |
+-------------+---------------------+
| La busqueda |                   3 |
+-------------+---------------------+
1 row in set (0.00 sec)

```

---

# **Enunciat 12**:

## Dissenya una funció que rebi el codi d’una pel·lícula i torni el nom i cognoms del seu actor principal.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom i cognoms del seu actor principal.

**1. Enllaç al fitxer**
[Act012.sql](https://github.com/qcomas02/exercicis_mp02_uf03/blob/master/ComasQuim_Act_03_ProcEmm_MySQL/ComasQuim_Act_03_ProcEmm_MYSQL_Apartat_012.sql)

**2. Contingut del fitxer**
```sql
USE videoclub;
DROP FUNCTION IF EXISTS act12;
DELIMITER //
CREATE FUNCTION act12(CodiPeli SMALLINT UNSIGNED) 
       RETURNS Smallint
       DETERMINISTIC
BEGIN
   DECLARE idActor Smallint UNSIGNED;
DECLARE final int default false;
 
DECLARE elcursor cursor for
       SELECT   id_actor
   FROM     ACTORS_PELLICULES
   WHERE    id_peli = CodiPeli
   AND principal = 1;
   
 DECLARE continue handler for not found SET final = 1;
   open elcursor;
   bucle:loop
      fetch elcursor into idActor;

      if final = 1 then
         leave bucle;
      end if;
	
	RETURN idActor;
   END loop bucle;
   close elcursor;
   
END//
DELIMITER ;

SELECT ACTORS.nom_actor, PELLICULES.titol_peli
FROM ACTORS , PELLICULES
WHERE id_actor = act12(2) AND id_peli = 2;
```

**3. Sortida de la creació del procediment**
```sql
   CREATE FUNCTION act12(CodiPeli SMALLINT UNSIGNED)
    ->        RETURNS Smallint
    ->        DETERMINISTIC
    -> BEGIN
    ->    DECLARE idActor Smallint UNSIGNED;
    -> DECLARE final int default false;
    ->
    -> DECLARE elcursor cursor for
    ->        SELECT   id_actor
    ->    FROM     ACTORS_PELLICULES
    ->    WHERE    id_peli = CodiPeli
    ->    AND principal = 1;
    ->
    ->  DECLARE continue handler for not found SET final = 1;
    ->    open elcursor;
    ->    bucle:loop
    ->       fetch elcursor into idActor;
    ->
    ->       if final = 1 then
    ->          leave bucle;
    ->       end if;
    ->
    -> RETURN idActor;
    ->    END loop bucle;
    ->    close elcursor;
    ->
    -> END//
Query OK, 0 rows affected (0.00 sec)

```

**4. Sortida de l'execució del procediment**
```sql
    SELECT ACTORS.nom_actor, PELLICULES.titol_peli
    -> FROM ACTORS , PELLICULES
    -> WHERE id_actor = act12(2) AND id_peli = 2;
+-----------+-------------+
| nom_actor | titol_peli  |
+-----------+-------------+
| Tom Hanks | La terminal |
+-----------+-------------+
1 row in set (0.00 sec)

```

---

# **Enunciat 13**:

## Fes una funció que torni el codi de pel·lícula que més ha recaptat.<br>Emprant la funció anterior i la funció de l’**activitat 12**, llista el títol, actor principal i recaptació de la pel·lícula que més ha recaptat.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---