USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS videoclub//

CREATE PROCEDURE videoclub(
BEGIN
SELECT nom_actor Actriu, 
        anynaix_actor "Any Naix.",
        YEAR(CURDATE())-anynaix_actor edat
FROM ACTORS
WHERE sexe_actor="home";
END //

DELIMITER ;