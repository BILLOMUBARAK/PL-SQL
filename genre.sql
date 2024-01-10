CREATE OR REPLACE TRIGGER Genre_TRG
AFTER UPDATE OF CodeGenre ON Jeu
FOR EACH ROW
BEGIN
    -- Suppression des sous-genres si le genre a été modifié
    IF :OLD.CodeGenre <> :NEW.CodeGenre THEN
         DELETE FROM  SOUS_GENRE_JEU WHERE IdJeu = :OLD.IdJeu;
        
        -- Mise à jour des sous-genres avec le nouveau genre
         UPDATE Sous_Genre_Jeu
         SET CodeSousGenre = :NEW.CodeGenre
         WHERE IdJeu = :OLD.IdJeu;
    END IF;
END;
/
