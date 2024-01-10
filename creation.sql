set echo on
spool creation.log

ALTER SESSION SET NLS_DATE_FORMAT='YYYY/MM/DD';

@creation_tables.sql
@creation_contraintes.sql
@creation_scripts.sql
@creation_donnees.sql

spool off
set echo off
