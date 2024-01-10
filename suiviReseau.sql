CREATE OR REPLACE TRIGGER Suivi_Reseau_TRG
AFTER INSERT OR UPDATE ON Reseau
FOR EACH ROW
DECLARE
  code CHAR(3);
BEGIN
  IF INSERTING THEN
    -- Insertion : le code est "CRE"
    code := 'CRE';
  ELSIF UPDATING THEN
    -- Mise à jour : le code dépend de l'état du réseau
    IF :NEW.Actif = 'O' THEN
      code := 'ACT'; -- Réseau actif : le code est "ACT"
    ELSE
      code := 'DES'; -- Réseau inactif : le code est "DES"
    END IF;
  END IF;
  
  -- Insertion dans la table SUIVI_RESEAU
  INSERT INTO SUIVI_RESEAU (IdSuivi, Moment, CodeReseau, DateSuivi, Action, NoJoueur)
  VALUES (SUIVI_RESEAU_SEQ.NEXTVAL, SYSTIMESTAMP, :NEW.Code, TRUNC(SYSDATE), code, NULL);
END;
/
