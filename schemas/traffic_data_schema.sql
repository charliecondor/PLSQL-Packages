/* PLSQL blocks to create the traffic_data schema */
BEGIN
    /* Drop tables if they exist */
    BEGIN
		EXECUTE IMMEDIATE 'DROP TABLE traffic_count';
		EXECUTE IMMEDIATE 'DROP TABLE traffic_site';
		EXECUTE IMMEDIATE 'DROP TABLE traffic_peak';
		EXECUTE IMMEDIATE 'DROP TABLE traffic_project';
		EXECUTE IMMEDIATE 'DROP TABLE traffic_company';
		EXECUTE IMMEDIATE 'DROP TABLE traffic_interval';
		EXECUTE IMMEDIATE 'DROP TABLE traffic_classification';
		EXECUTE IMMEDIATE 'DROP TABLE traffic_movement';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN
                RAISE;
            END IF;
    END;

    /* Create schema tables */
    BEGIN
        EXECUTE IMMEDIATE 
        'CREATE TABLE traffic_movement (
            movement_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
            approach_name VARCHAR2(50),
            movement_name VARCHAR2(20),
            abbreviation VARCHAR2(10))';
        EXECUTE IMMEDIATE
        'CREATE TABLE traffic_classification (
            class_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
            class_name VARCHAR2(100),
            class_fhwa VARCHAR2(100))';

        EXECUTE IMMEDIATE
        'CREATE TABLE traffic_peak (
            peak_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
            hour_start NUMBER,
            minute_start NUMBER,
            hour_end NUMBER,
            minute_end NUMBER)';

        EXECUTE IMMEDIATE
        'CREATE TABLE traffic_company (
            company_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
            company_name VARCHAR2(100))';

        EXECUTE IMMEDIATE
        'CREATE TABLE traffic_project (
            project_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
            project_number NUMBER,
            project_name VARCHAR2(50),
            company_id NUMBER,
            CONSTRAINT fk_traffic_company
            FOREIGN KEY (company_id)
            REFERENCES traffic_company(company_id))';

        EXECUTE IMMEDIATE
        'CREATE TABLE traffic_interval (
            interval_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
            class_id NUMBER,
            movement_id NUMBER,
            count VARCHAR(9),
            length NUMBER,
            hour_start NUMBER,
            minute_start NUMBER,
            hour_end NUMBER,
            minute_end NUMBER,
            CONSTRAINT fk_traffic_class
            FOREIGN KEY (class_id)
            REFERENCES traffic_classification(class_id),
            CONSTRAINT fk_traffic_movement
            FOREIGN KEY (movement_id)
            REFERENCES traffic_movement(movement_id))';

        EXECUTE IMMEDIATE
        'CREATE TABLE traffic_site (
            site_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
            site_number NUMBER,    
            project_id NUMBER,
            peak_id NUMBER,
            coordinates SDO_GEOMETRY,
            southbound_name VARCHAR2(100),
            westbound_name VARCHAR2(100),
            northbound_name VARCHAR2(100),
            eastbound_name VARCHAR2(100),
            CONSTRAINT fk_traffic_project
            FOREIGN KEY (project_id)
            REFERENCES traffic_project(project_id),
            CONSTRAINT fk_traffic_peak
            FOREIGN KEY (peak_id)
            REFERENCES traffic_peak(peak_id))';

        EXECUTE IMMEDIATE
        'CREATE TABLE traffic_count (
            count_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
            site_id NUMBER,
            count_number NUMBER,
            CONSTRAINT fk_traffic_site
            FOREIGN KEY (site_id)
            REFERENCES traffic_site(site_id))';
    END;
END;
/