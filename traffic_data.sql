CREATE TABLE movement (
    movement_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    approach_name VARCHAR2(50),
    movement_name VARCHAR2(20),
    abbreviation VARCHAR2(10)
);