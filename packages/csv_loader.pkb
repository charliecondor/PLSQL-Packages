create or replace PACKAGE BODY csv_loader IS
/* Package for opening/reading/parsing CSV files */

    /* Name: print()
    Created: 2024-02-24
     Author: charliecondor
       Desc: Private method for printing a line to DBMS_OUTPUT
    Call By: [print()] */
    PROCEDURE print (p_line IN VARCHAR2)
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(p_line);
    END print;

    /* Name: list_dir
    Created: 2024-02-24
     Author: charliecondor
       Desc: Public method for printing directories user/schema has access to
    Call By: [schema.csv_loader.list_dir] */
    PROCEDURE list_dir
    IS
        CURSOR c_all_dir IS
            SELECT directory_name d_name, directory_path d_path
              FROM all_directories;
    BEGIN
        print('User/Schema: ' || SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'));
        print('"NAME": "PATH"');

        FOR record IN c_all_dir LOOP        
            print('"' || record.d_name || '": "' || record.d_path || '"');
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            print('No directories accessible to user.');
        WHEN OTHERS THEN
            print(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    END list_dir;

END csv_loader;

    /* Name: 
    Created: 2024-02-24
     Author: charliecondor
       Desc: 
    Call By:  */