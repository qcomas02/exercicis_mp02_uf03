
/*      Exercici 2
** Crea el procediment sp06_comptaPelisPerActors
** que compti totes les pel·lícules (de la base
** de dades videoclub) que ha fet un actor, el
** nom (exacte) del qual li passarem com a paràmetre. */
/* mysql> desc ACTORS;
+---------------+----------------------+------+-----+---------+-------+
| Field         | Type                 | Null | Key | Default | Extra |
| id_actor      | smallint(5) unsigned | NO   | PRI | NULL    |       |
| nom_actor     | varchar(30)          | YES  | MUL | NULL    |       |
| nacio_actor   | varchar(20)          | YES  |     | NULL    |       |
| anynaix_actor | smallint(5) unsigned | YES  |     | NULL    |       |
| sexe_actor    | varchar(6)           | YES  |     | NULL    |       |
** mysql> desc ACTORS_PELLICULES;
| Field     | Type                 | Null | Key | Default | Extra |
+-----------+----------------------+------+-----+---------+-------+
| id_peli   | smallint(5) unsigned | NO   | PRI | 0       |       |
| id_actor  | smallint(5) unsigned | NO   | PRI | 0       |       |
| papel     | varchar(40)          | YES  |     | NULL    |       |
| principal | tinyint(1)           | YES  |     | NULL    |       |

** Simulacre: si ens passen com a paràmetre el nom_actor="Nicolas Cage";
** Llavors busquem el seu id_actor a la taula ACTORS
**      SELECT id_actor
**      FROM   ACTORS
**      WHERE  nom_actor="Nicolas Cage";
**      +----------+
**      | id_actor |
**      +----------+
**      |        1 |
**      +----------+
** amb aquest id_actor = 1, llavors podem comptar
** quantes pel·lícules ha fet aquest actor.
**      SELECT COUNT(id_actor)
**      FROM   ACTORS_PELLICULES
**      WHERE  id_actor=1; //id_actor=codi_Actor;
**      +-----------------+
**      | COUNT(id_actor) |
**      +-----------------+
**      |               2 |
**      +-----------------+ */

/* Canviem a la base de dades videoclub per
** assegurar-nos que és la base de dades seleccionada. */
USE videoclub;

-- Modifiquem el delimitador de sentències a //
DELIMITER //

/* Procedim a esborrar el procediment que volem
** crear per assegurar-nos que el creem des de zero. */
DROP PROCEDURE IF EXISTS sp06_comptaPelisPerActors//

/* Procedim a crear el nou procediment amb la 
** clàusula CREATE PROCEDURE seguida del nom del procediment
** i la definició de paràmetres si cal. En aquest cas
** creem un paràmetre d'entrada (IN) que anomenem
** p_nomActor que és el tipus varchar(30). */
CREATE PROCEDURE sp06_comptaPelisPerActors(
       IN p_nomActor varchar(30))
-- La clàusula BEGIN indica l'inici del procediment.
  BEGIN
-- A partir d'aquí desenvolupem el procediment en si.
-- Declaració de variables.
     DECLARE codi_Actor smallint;
     DECLARE qtat_Pelis smallint;

/* Primera sentència SQL amb la que obtenim el nom de l'actor
** fent servir el parametre p_nomActorque ens han passat.
** I el guardem a la variable codi_Actor que hem declarat. */
     SELECT id_actor INTO codi_Actor
     FROM ACTORS
     WHERE nom_actor = p_nomActor;
/* Segona sentència SQL amb la que comptem la quantitat
** de registres que hi ha a la taula ACTORS_PELLICULES
** que tenen l'id_actor. Fent servir en el filtre (WHERE) 
** el parametre codi_Actor que hem guardat. D'aquesta
** manera comptarem només les pel·lícules del "nostre" actor. */

     SELECT COUNT(id_peli) INTO qtat_Pelis
     FROM ACTORS_PELLICULES
     WHERE id_actor=codi_Actor;

     SELECT CONCAT( "L'actor " , p_nomActor , " ha fet ", qtat_Pelis, " pelicules!") AS Pel·lícules;


-- La clàusula END indica el final del procediment.
  END //

-- Modifiquem el delimitador de sentències a l'estàndard que és ;
DELIMITER ;
sp06_comptaPelisPerActors.sql
sp06_comptaPelisPerActors.sql s'està mostrant.