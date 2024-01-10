CREATE OR REPLACE PROCEDURE ajoutForfait(Code IN CHAR,
Nom IN VARCHAR2,
Description IN VARCHAR2,
Prix IN NUMBER)
is
    DateDebut DATE;
    DateFin DATE;
    NomForfait VARCHAR(100);
    
BEGIN

-- ON VA INITIALISER A LA DATE ACTUELLE
    DateDebut := SYSDATE;
    
--ON MET LA DATE DE FIN POUR 1 AN 
 DateFin := DateDebut + INTERVAL '1' YEAR;
--ON PLACE LA CODITION POUR VERIFIER LE NOM
IF Nom IS NULL THEN
    NomForfait:='Aucun Forfait';
    
Else
    NomForfait:=Nom;
END IF;
    
--ON INSERE DANS LA TABLE FORFAIT
    INSERT INTO FORFAIT(Code,Nom,Description)
    values(Code,NomForfait,Description);
--PUIS DANS LA TABLE PERIODE
    INSERT INTO PERIODE(IdPeriode,DateDebut,DateFin,Prix,CodeForfait)
    values(DateDebut,DateFin,Prix,Code);

   
END ajoutForfait;
/


    