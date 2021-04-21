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