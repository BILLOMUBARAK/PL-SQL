CREATE OR REPLACE PROCEDURE suppressionJeu (
    NomJeu IN VARCHAR,
    Resultat OUT NUMBER
)
IS
    NbJeux INT;
BEGIN
COMMIT;

    SELECT COUNT(*) INTO NbJeux
    FROM JEU
    WHERE Nom = NomJeu;

    IF NbJeux = 0 THEN
        Resultat := 1; 
        RETURN;
    END IF;
    
    -- Vérifions  si deux jeux ont le même nom
    IF NbJeux > 1 THEN
        Resultat := 2; 
        RETURN;
    END IF;

 
    BEGIN
        -- Supprimons les sous-genres du jeu
        DELETE FROM SOUS_GENRE_JEU
        WHERE IdJeu = (SELECT IdJeu FROM JEU WHERE Nom = NomJeu);
        
        -- Supprimons tous les éléments de contenu du jeu
        DELETE FROM CONTENU
        WHERE IdJeu = (SELECT IdJeu FROM JEU WHERE Nom = NomJeu);
        
        -- Supprimons tous les succès du jeu
        DELETE FROM SUCCES
        WHERE IdContenu IN (SELECT IdContenu FROM CONTENU WHERE IdJeu = (SELECT IdJeu FROM JEU WHERE Nom = NomJeu));
        
        -- Supprimons le jeu 
        DELETE FROM JEU WHERE Nom = NomJeu;
        
        Resultat := 0;
        -- Commit transaction
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
           
            ROLLBACK;
            Resultat := 3;
    END;
END suppressionJeu;
/
