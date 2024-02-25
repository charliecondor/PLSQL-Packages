create or replace PACKAGE csv_loader IS
/* Package for opening/reading/parsing CSV files */

    /* Name: list_dir
    Created: 2024-02-24
     Author: charliecondor
       Desc: Public method for printing directories user/schema has access to
    Call By: [schema.csv_loader.list_dir] */
    PROCEDURE list_dir;

    /* Name: process_file()
    Created: 2024-02-24
     Author: charliecondor
       Desc: Open/read/parse file and print contents to DBMS_OUTPUT
    Call By: [schema.process_file()] */
    PROCEDURE process_file (p_directory VARCHAR2,
                            p_filename  VARCHAR2);

END csv_loader;