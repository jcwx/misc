misc
====

This repo contains a perl script that opens a port to receive netflow data then write those flows to a PostgreSQL database. There are also a few SQL scripts to create the initial database and create a function.  The README file contains the commands used to create the users required in PostgreSQL.

It's a bit rough presently, as I really need to do some documentation regarding the script itself.  I converted the MySQL script I found that Luca Deri had written.  As I had only used it myself there really wasn't any reason to write any notes.

##NOTE

The PostgreSQL data base could really use an autoincremented primary key.  I use a database connector to allow splunk to access and index the netflow data in the database, but have encountered problems where the data field is way off on one of the records, such as in the future.  Splunk won't show any data until that date has passed.  Strange, but it must key on the date field.

The database uses the date field as the primary key now.  

I've used this script over the last few years without any problems.  Thought someone out there might be able to use it.
