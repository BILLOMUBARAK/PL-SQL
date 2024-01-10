CREATE OR REPLACE TRIGGER Suivi_Abonnement_Reseau_TRG 
AFTER INSERT OR DELETE 
ON ABONNEMENT_RESEAU
FOR EACH ROW 
DECLARE
  code CHAR(3);
  codeReseau VARCHAR2(6);
  noJoueur INTEGER;
BEGIN 
  IF INSERTING THEN
    code := 'ABO';
    codeReseau := :NEW.CodeReseau;
    noJoueur := :NEW.NoJoueur;
  ELSIF DELETING THEN
    code := 'DSA';
    codeReseau := :OLD.CodeReseau;
    noJoueur := :OLD.NoJoueur;
  END IF;

  INSERT INTO SUIVI_RESEAU (IdSuivi, Moment, CodeReseau, DateSuivi, Action, NoJoueur)
  VALUES (SUIVI_RESEAU_SEQ.NEXTVAL, SYSTIMESTAMP, codeReseau, TRUNC(SYSDATE), code, noJoueur);
END;
/
