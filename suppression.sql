set echo on
spool suppression.log

@suppression_contraintes.sql
@suppression_scripts.sql
@suppression_donnees.sql
@suppression_tables.sql

spool off
set echo off
