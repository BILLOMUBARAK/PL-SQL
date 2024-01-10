CREATE OR REPLACE TRIGGER Suivi_Ami_TRG AFTER
UPDATE OR INSERT OR DELETE 
ON AMI
FOR EACH ROW 
DECLARE
code CHAR(3);
descriptionS VARCHAR2(25);
    BEGIN 
  IF INSERTING OR UPDATING THEN
    code:=:NEW.CodeStatut;
    ELSIF DELETING THEN
        code:=:OLD.CodeStatut;
  END IF;

   INSERT  INTO SUIVI_AMITIE  (IdSuivi,Moment,NoJoueurInvitant,
 NoJoueurInvite,DateSuivi,CodeStatut	)
    VALUES(SUIVI_AMITIE_SEQ.NEXTVAL,SYSTIMESTAMP, :NEW.NoJoueurInvitant,
    :NEW.NoJoueurInvite,SYSDATE,code);
END;
/