CREATE OR REPLACE PACKAGE BODY csv_loader AS

    -- Record for storing row from ALL_DIRECTORIES
    TYPE dir_record IS RECORD (
        name "PUBLIC".ALL_DIRECTORIES.DIRECTORY_NAME%TYPE,
        path "PUBLIC".ALL_DIRECTORIES.DIRECTORY_PATH%TYPE
    );

    -- Nested table for storing list of directories
    TYPE dir_table IS TABLE OF dir_record;

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
    -- Call By: [print()]
    PROCEDURE print (p_line IN VARCHAR2)
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(p_line);
    END print;

    --    Name: list_dir
    -- Created: 2024-02-24
    --  Author: charliecondor
    --    Desc: Public method for printing directories user/schema has access to
    -- Call By: [schema.csv_loader.list_dir]
    PROCEDURE list_dir
    IS
        v_current_schema  VARCHAR(30) := SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA');  -- Current name of user/schema
        v_dir_name        "PUBLIC".ALL_DIRECTORIES.DIRECTORY_NAME%TYPE;
        v_dir_path        "PUBLIC".ALL_DIRECTORIES.DIRECTORY_PATH%TYPE;

        CURSOR c_all_dir IS
            SELECT directory_name, directory_path
              FROM all_directories;
    BEGIN
        print('Current User/Schema: ' || v_current_schema);

        
        FOR dir_record IN c_all_dir LOOP
            print(dir_record.directory_name);
        END LOOP;
        CLOSE c_all_dir;
    END list_dir;

END csv_loader;
/