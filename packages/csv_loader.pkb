CREATE OR REPLACE PACKAGE BODY csv_loader AS

    -- Comment Template
    --    Name: 
    -- Created: 
    --  Author: 
    --    Desc: 
    -- Call By: 

    --    Name: print()
    -- Created: 2024-02-24
    --  Author: charliecondor
    --    Desc: Private method for printing a line to DBMS_OUTPUT
    -- Call By: [schema.csv_loader]
    PROCEDURE print (p_line IN VARCHAR2)
    IS
        DBMS_OUTPUT.PUT_LINE(p_line);
    END print;

    -- 
    PROCEDURE list_directories
    IS
    BEGIN
        print('Test');
    END list_directories;

END csv_loader;
/