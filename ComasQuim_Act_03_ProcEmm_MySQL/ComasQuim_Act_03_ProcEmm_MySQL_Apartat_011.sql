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
