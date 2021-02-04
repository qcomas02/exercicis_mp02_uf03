/* Canviem a la base de dades LLIBRERIA per
* assegurar-nos que és la base de dades seleccionada. */
USE LLIBRERIA;
-- Modifiquem el delimitador de sentències a //
DELIMITER //
/* Procedim a esborrar el procediment que volem
* crear per assegurar-nos que el creem des de zero. */
DROP PROCEDURE IF EXISTS sp01_Llibre_Aprop_Estoc//
/* Procedim a crear el nou procediment amb la
* clàusula CREATE PROCEDURE seguida del nom del procediment
* i la definició de paràmetres si cal. En aquest cas no cal. */
CREATE PROCEDURE sp01_Llibre_Aprop_Estoc()
-- La clàusula BEGIN indica l'inici del procediment.
BEGIN
-- A partir d'aquí desenvolupem el procediment en si.
SELECT TITOL, EDITORIAL, ESTOC
FROM LLIBRES
WHERE ESTOC <= 5;
-- La clàusula END indica el final del procediment.
END //
-- Modifiquem el delimitador de sentències a l'estàndard que és ;
DELIMITER ;
