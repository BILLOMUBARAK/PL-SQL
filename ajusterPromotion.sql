CREATE OR REPLACE PROCEDURE ajusterPromotion (
CodeForfait OUT CHAR,
 OUT NUMBER)
IS 
PrixMax NUMBER;
NouveauPrix NUMBER ;
BEGIN
    SELECT  MAX(p.Prix)
    into PrixMax FROM PERIODE p
    JOIN ABONNEMENT_RESEAU a ON p.CodeForfait=a.CodeReseau
    WHERE a.CodeReseau=(SELECT CodeReseau FROM(SELECT CodeReseau,COUNT(*)
    AS C FROM ABONNEMENT_RESEAU GROUP BY CodeReseau ORDER BY C DESC)
    WHERE ROWNUM=1);

    SELECT CodeForfait,Prix
    INTO CodeForfait,NouveauPrix FROM PERIODE p WHERE p.Prix =PrixMAx AND ROWNUM=1;
    
    IF NouveauPrix<PrixMax THEN NouveauPrix :=NouveauPrix * 1.1;
    END IF;
    
    END ajusterPromotion;
    /