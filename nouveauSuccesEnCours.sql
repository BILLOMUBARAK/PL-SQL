CREATE OR REPLACE TRIGGER nouveauSuccesEnCours
BEFORE INSERT  
ON SUCCES_EN_COURS 
FOR EACH ROW
DECLARE 
    nbSucces NUMBER;
    CURSOR cSuccesRealises IS
        SELECT COUNT(*) AS nbSucces
        FROM SUCCES_REALISE
        WHERE IdSucces = :NEW.IdSucces AND NoJoueur = :NEW.NoJoueur;
BEGIN
    OPEN cSuccesRealises;
    FETCH cSuccesRealises INTO nbSucces;
    CLOSE cSuccesRealises;

    IF nbSucces > 0 THEN
        raise_application_error(-20000, 'Le succès est déjà réalisé.');
    END IF;
END;
/
