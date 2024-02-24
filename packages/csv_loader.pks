CREATE OR REPLACE PACKAGE csv_loader AS

    -- Comment Template
    --    Name: 
    -- Created: 
    --  Author: 
    --    Desc: 
    -- Call By: 

    --    Name: list_directories
    -- Created: 2024-02-04
    --  Author: charliecondor
    --    Desc: Print a list of all directories the schema as access to DBMS_OUTPUT
    -- Call By: [schema.csv_loader.list_directories]
    PROCEDURE list_directories;

END csv_loader;
/