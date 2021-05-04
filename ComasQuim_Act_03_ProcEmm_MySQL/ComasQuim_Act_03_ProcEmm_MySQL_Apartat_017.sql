use videoclub;

DELIMITER //

DROP TRIGGER act_17//
    AFTER INSERT
    ON VISUALITZACIONS;

FOR EACH ROW

BEGIN
    DECLARE pa_VisComplertes smallint unsigned;
    DECLARE pa_VisParcials smallint unsigned;
    
    SELECT COUNT(*)
        INTO pa_VisComplertes
    FROM VISUALITZACIONS
    WHERE temps IS NOT NULL AND
        id_peli = new.id_peli;

    UPDATE PELLICULES
        SET qtatVisualComp = pa_VisComplertes;
    WHERE id_peli = new.id_peli;

    UPDATE PELLICULES
        SET qtatVisualParc = pa_VisParcials;
    WHERE id_peli = new.id_peli;

    END//

DELIMITER ;