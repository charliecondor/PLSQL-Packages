CREATE TABLE movement (
    movement_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    approach_name VARCHAR2(50),
    movement_name VARCHAR2(20),
    abbreviation VARCHAR2(10)
);

CREATE TABLE classification (
    class_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    class_name VARCHAR2(100),
    class_fhwa VARCHAR2(100)
);

CREATE TABLE peak (
    peak_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    hour_start NUMBER,
    minute_start NUMBER,
    hour_end NUMBER,
    minute_end NUMBER
);

CREATE TABLE company (
    company_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    company_name VARCHAR2(100)
);

CREATE TABLE project (
    project_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    project_number NUMBER,
    project_name VARCHAR2(50),
    company_id NUMBER,
    CONSTRAINT fk_company
    FOREIGN KEY (company_id)
    REFERENCES company(company_id)
);

CREATE TABLE interval (
    interval_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    class_id NUMBER,
    movement_id NUMBER,
    count VARCHAR(9),
    length NUMBER,
    hour_start NUMBER,
    minute_start NUMBER,
    hour_end NUMBER,
    minute_end NUMBER,
    CONSTRAINT fk_class
    FOREIGN KEY (class_id)
    REFERENCES classification(class_id),
    CONSTRAINT fk_movement
    FOREIGN KEY (movement_id)
    REFERENCES movement(movement_id)
);

CREATE TABLE site (
    site_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    site_number NUMBER,    
    project_id NUMBER,
    peak_id NUMBER,
    coordinates SDO_GEOMETRY,
    southbound_name VARCHAR2(100),
    westbound_name VARCHAR2(100),
    northbound_name VARCHAR2(100),
    eastbound_name VARCHAR2(100),
    CONSTRAINT fk_project
    FOREIGN KEY (project_id)
    REFERENCES project(project_id),
    CONSTRAINT fk_peak
    FOREIGN KEY (peak_id)
    REFERENCES peak(peak_id)
);
    

CREATE TABLE count (
    count_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    site_id NUMBER,
    count_number NUMBER,
    CONSTRAINT fk_site
    FOREIGN KEY (site_id)
    REFERENCES site(site_id)
);
