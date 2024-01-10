CREATE OR REPLACE VIEW mesSucces AS
SELECT Titre, Description, Valeur, NoJoueur
FROM SUCCES_REALISE,SUCCES
UNION 
SELECT Titre, Description, Valeur, NoJoueur
FROM SUCCES_EN_COURS,SUCCES;
/

