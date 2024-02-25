create or replace PACKAGE csv_loader IS
/* Package for opening/reading/parsing CSV files */

    /* Name: list_dir
    Created: 2024-02-24
     Author: charliecondor
       Desc: Public method for printing directories user/schema has access to
    Call By: [schema.csv_loader.list_dir] */
    PROCEDURE list_dir;

END csv_loader;