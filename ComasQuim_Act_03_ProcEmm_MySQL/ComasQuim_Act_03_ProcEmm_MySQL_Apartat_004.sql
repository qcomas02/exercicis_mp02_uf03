DELIMITER // 
USE videoclub //
DROP PROCEDURE IF EXISTS mostrarCodiActorPrincipal //
CREATE PROCEDURE mostrarCodiActorPrincipal(
IN pe_codi smallint
) BEGIN
DECLARE actor smallint unsigned;
SELECT id_actor
INTO @actor
FROM ACTORS_PELLICULES
WHERE ACTORS_PELLICULES.id_peli=pe_codi AND ACTORS_PELLICULES.principal=1;
END //
DELIMITER ;
CALL mostrarCodiActorPrincipal(1);
SELECT @actor;