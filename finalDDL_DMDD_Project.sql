---ALTER SESSION SET CURRENT_SCHEMA = Admin;

----  DDL for Table BBANK_MANAGEMENT_SYSINVENTORY--------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_BBANK_MANAGEMENT_EMPLOYEE is table_name varchar2(4000);
BEGIN
---CREATING TABLE QUERY

    table_name := 'CREATE TABLE BBANK_MANAGEMENT_EMPLOYEE
                    (
                        BMSEMPLOYEE_ID NUMBER(10) NOT NULL, 
                        EMP_NAME VARCHAR2(100) NOT NULL,  
                        EMP_PHONENO NUMBER(10) NOT NULL, 
                        BLOODBANK_ID NUMBER(10) NOT NULL,
                        
                        CONSTRAINT BBANK_MANAGEMENT_EMPLOYEE_PK PRIMARY KEY
                        (
                            BMSEMPLOYEE_ID
                        )
                                              
                        ENABLE
                    )';
    EXECUTE IMMEDIATE table_name;
END p_BBANK_MANAGEMENT_EMPLOYEE

;
/

-------------------DONORDETAILS------------------------------------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_donordetails is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE DONORDETAILS
                (
                    DONOR_ID NUMBER(10) NOT NULL,
                    DONOR_NAME VARCHAR2(50) NOT NULL, 
                    DONOR_AGE NUMBER(10) NOT NULL,
                    DONOR_PHONENO  NUMBER(10) NOT NULL,
                    MEDICAL_HISTORY VARCHAR2(50) NOT NULL,
                    LASTDONATIONDATE DATE NOT NULL,

                    CONSTRAINT DONORDETAILS_PK PRIMARY KEY
                    (
                        DONOR_ID 
                    )
                    
                    ENABLE 
                )';

    EXECUTE IMMEDIATE table_name;
END p_donordetails;
/

--COMMIT;


--COMMIT;
--------------------------------- SAMPLEDETAILS Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_sampledetails is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE SAMPLEDETAILS 
                (
                    SAMPLE_ID NUMBER(10) NOT NULL,
                    DONOR_ID NUMBER(10) NOT NULL, 
                    SAMPLINGDATE DATE NOT NULL,
                    BLOODGROUP_ID NUMBER(10) NOT NULL,
                    QTY NUMBER(10) NOT NULL,

                    CONSTRAINT PRICE_PK PRIMARY KEY
                    (
                        SAMPLE_ID
                    ),
                    FOREIGN KEY
                    (
                        DONOR_ID
                    )
					REFERENCES DONORDETAILS
                    (
                        DONOR_ID 
                    )
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_sampledetails;
/

----------------BLOOD MANAGEMENT SYSTEM INVENTORY------------------
----  DDL for Table BLOOD MANAGEMENT SYSTEM INVENTORY--------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_blood_management_sysinventory is table_name varchar2(4000);
BEGIN
---CREATING TABLE QUERY
    table_name := 'CREATE TABLE BLOOD_MANAGEMENT_SYSINVENTORY
                    (
                        BLOODINVENTORY_ID NUMBER(10) NOT NULL,  
                        QTY NUMBER(10) NOT NULL, 
                        BLOODGROUP_ID NUMBER(10) NOT NULL,
                        SAMPLINGDATE DATE NOT NULL,
                        SAMPLE_ID NUMBER(10) NOT NULL,
                        DONOR_ID NUMBER(10) NOT NULL,
                        
                        CONSTRAINT BLOOD_MANAGEMENT_SYSINVENTORY_PK PRIMARY KEY
                        (
                            BLOODINVENTORY_ID
                        ),
                        FOREIGN KEY
                        (
                        SAMPLE_ID
                        )
						REFERENCES SAMPLEDETAILS
						(
                        SAMPLE_ID 
						),
                        FOREIGN KEY
                        (
                        DONOR_ID
                        )
						REFERENCES DONORDETAILS
						(
                        DONOR_ID 
						)
                        ENABLE
                    )';
    EXECUTE IMMEDIATE table_name;
END p_blood_management_sysinventory;
/


--COMMIT;
--------------------------------- LOCATION Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_location is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE LOCATION
                (
                    LOCATION_ID NUMBER(10) NOT NULL,
                    LOCATION_NAME VARCHAR2(40) NOT NULL,
                    LOC_PINCODE NUMBER(10) NOT NULL, 

                    CONSTRAINT LOCATION_PK PRIMARY KEY
                    (
                        LOCATION_ID
                    )
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_location;
/

--COMMIT;


--------------------------------- BLOODBANK Table --------------------------------
----  DDL for Table BLOODBANK-----------------------------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_bloodbank is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE BLOODBANK 
                (
                    BLOODBANK_ID NUMBER(10) NOT NULL,
                    BLOODBANK_NAME VARCHAR2(50) NOT NULL, 
                    LOCATION_ID NUMBER(10) NOT NULL,

                    CONSTRAINT BLOODBANK_PK PRIMARY KEY
                    (
                        BLOODBANK_ID 
                    ),
                    FOREIGN KEY
                    (
                        LOCATION_ID 
                    )
					REFERENCES LOCATION
                    (
                        LOCATION_ID 
                    )
                    ENABLE 
                )';

    EXECUTE IMMEDIATE table_name;
END p_bloodbank;
/


--COMMIT;

--------------------------------- BLOODGROUP Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_bloodgroup is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE BLOODGROUP 
                (
                    BLOODGROUP_ID NUMBER(5) NOT NULL,
                    BLOODGROUP_NAME VARCHAR2(20) NOT NULL,

                    CONSTRAINT BLOODGROUP_PK PRIMARY KEY
                    (
                        BLOODGROUP_ID
                    )
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_bloodgroup;
/

--COMMIT;
--------------------------------- HOSPITAL Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_hospital is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE HOSPITAL 
                (
                    HOSPITAL_ID NUMBER(10) NOT NULL,
                    HOSPITAL_NAME VARCHAR2(40) NOT NULL,
                    LOCATION_ID NUMBER(10) NOT NULL, 

                    CONSTRAINT HOSPITAL_PK PRIMARY KEY
                    (
                        HOSPITAL_ID
                    ),
                    FOREIGN KEY
                    (
                        LOCATION_ID
                    )
					REFERENCES LOCATION
                    (
                        LOCATION_ID 
                    )
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_hospital;
/

--COMMIT;

--------------------------------- PATIENT Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_patient is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE PATIENT 
                (
                    PATIENT_ID NUMBER(10) NOT NULL,
                    PATIENT_NAME VARCHAR2(40) NOT NULL,
                    PATIENT_IDENT_NO VARCHAR2(20) NOT NULL,
                    MEDICAL_HISTORY VARCHAR2(40) NOT NULL,

                    CONSTRAINT PATIENT_PK PRIMARY KEY
                    (
                        PATIENT_ID
                    )
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_patient;
/

--COMMIT;




--------------------------------- REQSTATUSTYPE Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_reqstatustype is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE REQSTATUSTYPE
                (
                    REQSTATUSNO NUMBER(10) NOT NULL,
                    STATUSTYPE VARCHAR2(40) NOT NULL,
                   
                    CONSTRAINT REQSTATUSNO_PK PRIMARY KEY
                    (
                        REQSTATUSNO
                    )
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_reqstatustype;
/

--COMMIT;

--------------------------------- BLOOD REQUEST Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_bloodrequest is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE BLOODREQUEST 
                (
                    BLOODREQ_ID NUMBER(10) NOT NULL,
                    HOSPITAL_ID NUMBER(10) NOT NULL, 
                    PATIENT_ID NUMBER(10) NOT NULL,
                    REQSTATUSNO NUMBER(10,0)NOT NULL,
                    BLOODGROUP_ID NUMBER(10,0) NOT NULL,
                    QTYREQ NUMBER(10,0) NOT NULL,
                    REQUESTDATE DATE NOT NULL,
                    REQPRIORITY VARCHAR2(20) NOT NULL,
                    BMSEMPLOYEE_ID NUMBER(10,0) NOT NULL,

                    CONSTRAINT BLOODREQUEST_PK PRIMARY KEY
                    (
                        BLOODREQ_ID
                    ),
                    FOREIGN KEY
                    (
                        HOSPITAL_ID
                    )
					REFERENCES HOSPITAL
                    (
                        HOSPITAL_ID 
                    ),
                    FOREIGN KEY
                    (
                        PATIENT_ID
                    )
					REFERENCES PATIENT
                    (
                        PATIENT_ID 
                    ),
                    FOREIGN KEY
                    (
                        REQSTATUSNO
                    )
					REFERENCES REQSTATUSTYPE
                    (
                        REQSTATUSNO 
                    ),
                    FOREIGN KEY
                    (
                        BLOODGROUP_ID
                    )
					REFERENCES BLOODGROUP
                    (
                        BLOODGROUP_ID 
                    ),
                    FOREIGN KEY
                    (
                        BMSEMPLOYEE_ID
                    )
					REFERENCES BBANK_MANAGEMENT_EMPLOYEE
                    (
                        BMSEMPLOYEE_ID 
                    )
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_bloodrequest;
/
--COMMIT;


--------------------------------- BMS DOCTORS Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_bms_doctors is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE BMS_DOCTORS 
                (
                    DOCTOR_ID NUMBER(10) NOT NULL,
                    DOCTOR_NAME VARCHAR2(50) NOT NULL,

                    CONSTRAINT BMS_DOCTORS_PK PRIMARY KEY
                    (
                        DOCTOR_ID
                    )                    
					
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_bms_doctors;
/

--COMMIT;


--------------------------------- SAMPLECHECKDETAILS Table --------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_samplecheckdetails is table_name varchar2(4000);
BEGIN
--- Create Table Query
    table_name := 'CREATE TABLE SAMPLECHECKDETAILS 
                (
                    SCD_ID NUMBER(10) NOT NULL,
                    SAMPLE_ID NUMBER(10) NOT NULL, 
                    DOCTOR_ID NUMBER(10) NOT NULL, 
                    RESULT VARCHAR2(40) NOT NULL,

                    CONSTRAINT SCO_PK PRIMARY KEY
                    (
                         SCD_ID
                    ),
                    FOREIGN KEY
                    (
                        SAMPLE_ID
                    )
					REFERENCES SAMPLEDETAILS
					(
                        SAMPLE_ID 
					),
                    FOREIGN KEY
                    (
                        DOCTOR_ID
                    )
					REFERENCES BMS_DOCTORS
                    (
                        DOCTOR_ID 
                    )
                    ENABLE
                )';

    EXECUTE IMMEDIATE table_name;
END p_samplecheckdetails;
/

--COMMIT;

DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'BBANK_MANAGEMENT_EMPLOYEE';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE BBANK_MANAGEMENT_EMPLOYEE ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
            p_bbank_management_employee;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE BBANK_MANAGEMENT_EMPLOYEE CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE BBANK_MANAGEMENT_EMPLOYEE CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_bbank_management_employee;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/


DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'DONORDETAILS';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE DONOR DETAILS ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
            p_donordetails;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE DONOR DETAILS CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE DONOR DETAILS CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_donordetails;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/

DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'SAMPLEDETAILS';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE SAMPLEDETAILS ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
        p_sampledetails;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE SAMPLEDETAILS CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE SAMPLEDETAILS CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_sampledetails;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/
COMMIT;


DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'BLOOD_MANAGEMENT_SYSINVENTORY';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE BLOOD_MANAGEMENT_SYSINVENTORY ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
            p_blood_management_sysinventory;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE BLOOD_MANAGEMENT_SYSINVENTORY CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE BLOOD_MANAGEMENT_SYSINVENTORY CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_blood_management_sysinventory;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/
DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'LOCATION';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE LOCATION ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
        p_location;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE LOCATION CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE LOCATION CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_location;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/

DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'BLOODBANK';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE BLOODBANK ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
            p_bloodbank;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE BLOODBANK CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE BLOODBANK CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_bloodbank;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/


DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'BLOODGROUP';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE BLOODGROUP ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
            p_bloodgroup;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE BLOODGROUP CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE BLOODGROUP CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_bloodgroup;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/
DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'HOSPITAL';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE HOSPITAL ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
        p_hospital;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE HOSPITAL CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE HOSPITAL CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_hospital;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/

DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'PATIENT';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE PATIENT ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
        p_patient;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE PATIENT CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE PATIENT CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_patient;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/

DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'REQSTATUSTYPE';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE REQSTATUSTYPE ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
        p_reqstatustype;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE REQSTATUSTYPE CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE REQSTATUSTYPE CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_reqstatustype;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/


DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'BLOODREQUEST';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE BLOODREQUEST ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
            p_bloodrequest;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE BLOODREQUEST CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE BLOODREQUEST CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_bloodrequest;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/


DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'BMS_DOCTORS';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE BMS_DOCTORS ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
            p_bms_doctors;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE BMS_DOCTORS CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE BMS_DOCTORS CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_bms_doctors;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/

DECLARE
    t_name varchar(50);
    cnt NUMBER;
BEGIN
    t_name := 'SAMPLECHECKDETAILS';
    SELECT COUNT(*) INTO cnt FROM user_tables where table_name = t_name;
    IF(cnt>0) THEN
        DBMS_OUTPUT.PUT_LINE('TABLE SAMPLECHECKDETAILS ALREADY EXISTS!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    ELSE
        BEGIN
        p_samplecheckdetails;
        END;
        DBMS_OUTPUT.PUT_LINE('TABLE SAMPLECHECKDETAILS CREATED SUCCESSFULLY!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('TABLE SAMPLECHECKDETAILS CREATED SUCCESSFULLY!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
    BEGIN
        p_samplecheckdetails;
    END;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG!');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END;
/

-------------------------------------------------- INSERT DATA (PACKAGE) SCRIPT - DML -----------------------------------------------


