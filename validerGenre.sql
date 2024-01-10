CREATE OR REPLACE FUNCTION validerGenre (Code IN CHAR) RETURN CHAR
IS
    CodeRetour CHAR(3);
   
    BEGIN
    
    SELECT Code INTO CodeRetour  FROM GENRE 
    WHERE Code=Code AND ROWNUM = 1;
       
    IF CodeRetour IS NULL THEN
    SELECT CodeGenreParent INTO CodeRetour  FROM GENRE 
    WHERE Code=Code  AND ROWNUM = 1;

    END IF;
    RETURN CodeRetour;
END validerGenre;
/
    
    
    
    
    
