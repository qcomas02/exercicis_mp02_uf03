
USE videoclub;


DELIMITER //

DROP PROCEDURE IF EXISTS  act_05//

CREATE PROCEDURE  act_05(
IN codi_peli smallint unsigned)

  BEGIN
  DECLARE codi_actor smallint unsigned;
  DECLARE p_nomActor varchar(30);
  DECLARE p_anyActor smallint unsigned;

     SELECT id_actor
     INTO codi_actor
     FROM ACTORS_PELLICULES
     WHERE id_peli = codi_peli
     AND principal = 1;

     SELECT nom_actor
     INTO @p_nomActor
     FROM ACTORS
     WHERE id_actor = codi_actor;

     SELECT year(curdate()) - anynaix_actor
     INTO @p_anyActor
     FROM ACTORS
     WHERE id_actor = codi_actor;

  END //

DELIMITER ;

CALL act_05(1);