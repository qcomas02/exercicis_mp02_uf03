
USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS  act_07//

CREATE PROCEDURE  act_07(
       IN p_codiActor smallint unsigned )

  BEGIN

     SELECT nom_actor, year(curdate()) - anynaix_actor"anys", anynaix_actor, sexe_actor,
     /*home*/
     if(sexe_actor="home",
     if(year(curdate()) - anynaix_actor<15,"nen",
     if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"home adolescent i jove",
     if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "home adult",
     if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "home madur",
     if(year(curdate()) - anynaix_actor>61, "home gran",""))))),

     /*dona*/
     if(year(curdate()) - anynaix_actor<15,"nena",
     if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"dona adolescent i jove",
     if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "dona adult",
     if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "dona madura",
     if(year(curdate()) - anynaix_actor>61, "dona gran","")))))) as "Paper que pot interpretar"
     FROM ACTORS
     WHERE ACTORS.id_actor = p_codiActor;

  END //

DELIMITER ;
CALL act_07(5);