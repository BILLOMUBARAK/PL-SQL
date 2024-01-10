
CREATE OR REPLACE FUNCTION joueurLePlusPopulaire RETURN VARCHAR2
IS
SurnomP VARCHAR2(50);
 BEGIN
 
    SELECT Surnom INTO SurnomP
    FROM ( SELECT  J.Surnom FROM JOUEUR J
    JOIN AMI A ON J.NoJoueur=A.NoJoueurInvitant OR J.NoJoueur=A.NoJoueurInvite
    WHERE 
    J.ACTIF ='1' 
    AND J.Nom IS NOT NULL
    AND J.Prenom IS NOT NULL
        GROUP BY J.Surnom ORDER BY COUNT(*) DESC)
        WHERE ROWNUM = 1;
        
        RETURN SurnomP;
  END joueurLePlusPopulaire;
  /

    
