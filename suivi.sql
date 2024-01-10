CREATE OR REPLACE VIEW suiviReseau AS
SELECT
    SUIVI_RESEAU.Moment,
    SUIVI_RESEAU.Action,
    SUIVI_RESEAU.CodeReseau,
    RESEAU.Nom
FROM
    SUIVI_RESEAU
 JOIN  RESEAU ON SUIVI_RESEAU.CodeReseau = RESEAU.Code
WHERE
    SUIVI_RESEAU.NoJoueur IS NULL
ORDER BY
    SUIVI_RESEAU.Moment;

/
CREATE OR REPLACE VIEW suiviReseauJoueur AS
SELECT
    SUIVI_RESEAU.Moment,
    SUIVI_RESEAU.Action,
    SUIVI_RESEAU.CodeReseau,
    JOUEUR.Surnom
FROM
    SUIVI_RESEAU
INNER JOIN
    JOUEUR ON SUIVI_RESEAU.NoJoueur = JOUEUR.NoJoueur
WHERE
    SUIVI_RESEAU.NoJoueur IS NOT NULL
ORDER BY
    SUIVI_RESEAU.Moment;
/    

CREATE OR REPLACE VIEW suiviAmitieInvitation AS
SELECT
    SUIVI_AMITIE.Moment,
    JOUEUR.Surnom AS SurnomJoueurInvitant,
    SUIVI_AMITIE.NoJoueurInvitant,
    SUIVI_AMITIE.NoJoueurInvite,
    SUIVI_AMITIE.DateSuivi,
    SUIVI_AMITIE.CodeStatut
FROM
    SUIVI_AMITIE
INNER JOIN
    JOUEUR ON SUIVI_AMITIE.NoJoueurInvitant = JOUEUR.NoJoueur
ORDER BY
    SUIVI_AMITIE.Moment;
/