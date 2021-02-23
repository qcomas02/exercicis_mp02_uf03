USE videoclub;

DELIMITER //
USE videoclub //
DROP PROCEDURE IF EXISTS Act_03_Apartat_003 //

CREATE PROCEDURE Act_03_Apartat_003(
)
  BEGIN
    DECLARE titol smallint unsigned;
    DECLARE recaudacio smallint unsigned;
    SELECT  titol_peli, recaudacio_peli
      INTO @titol, @recaudacio
    FROM PELLICULES
    WHERE  recaudacio_peli = (SELECT MAX(recaudacio_peli)
    FROM PELLICULES);
  END //

DELIMITER ;

CALL Act_03_Apartat_003;
SELECT @titol, @recaudacio_peli;