CREATE OR REPLACE PROCEDURE prolongationForfait (
CodeForfait IN CHAR,
nb_joueur_touche out number)
IS
BEGIN
--Tous les joueurs avec ce forfait actif ont une prolongation de 
--deux mois (ajouter deux mois � la date d�achat)
    UPDATE PERIODE_FORFAIT_JOUEUR
    SET DateAchat=DateAchat+ INTERVAL '2' MONTH
    WHERE IdPeriode IN  (SELECT IdPeriode FROM PERIODE WHERE CodeForfait=CodeForfait
    AND DateFin> SYSDATE);
--  Tous les forfaits ont une dur�e d�un an � partir de la date d�achat
    
    UPDATE PERIODE   
    SET DateFin=GREATEST((SELECT DateAchat FROM PERIODE_FORFAIT_JOUEUR WHERE IdPeriode = PERIODE.IdPeriode)+ INTERVAL '1' YEAR,DateFin)
    WHERE IdPeriode IN(SELECT IdPeriode FROM PERIODE WHERE CodeForfait=CodeForfait
    AND DateFin> SYSDATE);
    
    --le nonmbre de joueur touch�
    SELECT COUNT(*) INTO nb_joueur_touche 
        FROM PERIODE_FORFAIT_JOUEUR
        WHERE IdPeriode IN (SELECT IdPeriode FROM PERIODE WHERE CodeForfait=CodeForfait
    AND DateFin> SYSDATE);
    
    END prolongationForfait;
    /
    