CREATE OR REPLACE FUNCTION succesPlusRealise
RETURN VARCHAR2
IS TitreSucces VARCHAR(50);
BEGIN
    SELECT Titre INTO TitreSucces
    FROM SUCCES
    WHERE ROWNUM =1;
    
    RETURN TitreSucces;
 END succesPlusRealise;
/
