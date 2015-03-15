Database code for:
Jason Ho
Akash Puri
Austin Woehrle
Annie Tao



////////////
//SQL Code//
////////////

buildTables.sql
Creates the empty database and tables

constraints.sql
Adds constraints to tables

functions.sql
creates user defined functions

populateTables.sql
runs some inserts to add dummy data
This is what we used at first to insert some data and it worked fine then
Foreign key ID's had to be foud manually though, so we created a python script to do the inserts.
As such this file will currently not work, some of the ID's referenced do not exist in the current database.

storedProcedures.sql
creates the stored procedures

views.sql
creates views



///////////////
//Python Code//
///////////////

We didn't like finding ID's by hand to satify foreign key references so we use a python script to handle inserts.
It's slow and ugly and hacky code written in a single night, but it works for our purposes.

/autogen/*.txt
contains text files used in the generation of random dummy data
Just lists of names/words etc.

populateTables.py
main python script, populates tables with n users. All other inserts based on the n users added

insert.py
contains all the insert functions

generate.py
contains random user and group generation functions