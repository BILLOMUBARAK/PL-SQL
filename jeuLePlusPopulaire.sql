CREATE OR REPLACE FUNCTION jeuLePlusPopulaire ( Code IN CHAR)
RETURN  VARCHAR2
IS 
    nomP VARCHAR2(100);
BEGIN

      SELECT nomJeu INTO nomP
    FROM (SELECT J.Nom AS nomJeu, COUNT(DISTINCT CP.NoJoueur) AS nbJoueurs
          FROM JEU J
          JOIN CONTENU C ON J.IdJeu=C.IdJeu
          JOIN SUCCES_REALISE SR ON C.IdContenu=SR.IdContenu
          JOIN CONTENU_POSSEDE CP ON CP.IdContenu=SR.IdContenu
          JOIN JOUEUR JO ON CP.NoJoueur=JO.NoJoueur
          WHERE J.CodeESRB=Code
          AND C.TypeContenu='J'
          AND JO.Actif='1'
          AND CP.NoJoueur IS NOT NULL
          GROUP BY J.Nom
          ORDER BY nbJoueurs DESC)
    WHERE ROWNUM = 1;
    
    RETURN nomP;
        
END jeuLePlusPopulaire;
/
