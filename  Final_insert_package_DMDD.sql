 create or replace NONEDITIONABLE PACKAGE INSERT_DATA
AS
PROCEDURE INSERT_BBANK_MANAGEMENT_EMPLOYEE(BMSEMPLOYEE_ID in NUMBER, 
                            EMP_NAME in VARCHAR2,  
                            EMP_PHONENO in NUMBER, 
                            BLOODBANK_ID in NUMBER 
                            );
PROCEDURE INSERT_BLOODBANK(BLOODBANK_ID in NUMBER,
                                BLOODBANK_NAME in VARCHAR2,
                                LOCATION_ID in NUMBER
                                );
PROCEDURE INSERT_HOSPITAL(v_HOSPITAL_ID in NUMBER,
                            v_HOSPITAL_NAME in VARCHAR2,
                            v_LOCATION_ID in NUMBER
                            );
PROCEDURE INSERT_LOCATION(LOCATION_ID in NUMBER,
                        LOCATION_NAME in VARCHAR2,
                        LOC_PINCODE in NUMBER
                        );
PROCEDURE INSERT_PATIENT(PATIENT_ID in NUMBER,
                            PATIENT_NAME in VARCHAR2,
                            PATIENT_IDENT_NO in VARCHAR2,
                            MEDICAL_HISTORY in VARCHAR2
                            );
PROCEDURE INSERT_BMS_DOCTORS(DOCTOR_ID in NUMBER,
                                DOC_NAME in VARCHAR2
                                );
PROCEDURE INSERT_BLOODREQUEST(BLOODREQ_ID in NUMBER,
                                HOSPITAL_ID in NUMBER,
                                PATIENT_ID in NUMBER,
                                REQSTATUSNO in NUMBER,
                                QTYREQ in NUMBER,
                                REQUESTDATE in DATE,
                                REQPRIORITY in VARCHAR2,
                                BLOODGROUP_ID in NUMBER,
                                BMSEMPLOYEE_ID in NUMBER
                                );
PROCEDURE INSERT_SAMPLECHECKDETAILS(SCD_ID in NUMBER,
                                    SAMPLE_ID in NUMBER,
                                    DOCTOR_ID in NUMBER,
                                    RESULT in VARCHAR2
                                    );
PROCEDURE INSERT_REQSTATUSTYPE(REQSTATUSNO in NUMBER,
                                    STATUSTYPE in VARCHAR2
                                    );
PROCEDURE INSERT_BLOOD_MANAGEMENT_SYSINVENTORY(BLOODINVENTORY_ID in NUMBER,
                                                QTY in NUMBER,
                                                BLOODGROUP_ID in NUMBER,
                                                SAMPLINGDATE in DATE,
                                                SAMPLE_ID in NUMBER,
                                                DONOR_ID in NUMBER
                                                );
PROCEDURE INSERT_BLOODGROUP(BLOODGROUP_ID in NUMBER,
                                BLOODGROUP_NAME in VARCHAR2
                            );
PROCEDURE INSERT_SAMPLEDETAILS(SAMPLE_ID in NUMBER,
                                    DONOR_ID in NUMBER,
                                    SAMPLINGDATE in DATE,
                                    BLOODGROUP_ID in NUMBER,
                                    QTY in NUMBER
                                    );
PROCEDURE INSERT_DONORDETAILS(DONOR_ID in NUMBER,
                                DONOR_NAME in VARCHAR2,
                                DONOR_AGE in NUMBER,
                                DONOR_PHONENO in LONG,
                                MEDICAL_HISTORY in VARCHAR2,
                                LASTDONATION_DATE in DATE
                                );

END;     
/

create or replace NONEDITIONABLE PACKAGE BODY INSERT_DATA
AS
PROCEDURE INSERT_BBANK_MANAGEMENT_EMPLOYEE(BMSEMPLOYEE_ID in NUMBER, 
                            EMP_NAME in VARCHAR2,  
                            EMP_PHONENO in NUMBER, 
                            BLOODBANK_ID in NUMBER 
                        )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO BBANK_MANAGEMENT_EMPLOYEE (BMSEMPLOYEE_ID, EMP_NAME, EMP_PHONENO, BLOODBANK_ID) 
VALUES (BMSEMPLOYEE_ID, EMP_NAME, EMP_PHONENO, BLOODBANK_ID);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN BBANK_MANAGEMENT_EMPLOYEE TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN BBANK_MANAGEMENT_EMPLOYEE TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_BBANK_MANAGEMENT_EMPLOYEE;



--------------------------------- Insert BLOODBANK --------------------------------
PROCEDURE INSERT_BLOODBANK(BLOODBANK_ID in NUMBER,
                                BLOODBANK_NAME in VARCHAR2,
                                LOCATION_ID in NUMBER
                                )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO BLOODBANK (BLOODBANK_ID, BLOODBANK_NAME, LOCATION_ID) 
VALUES (BLOODBANK_ID, BLOODBANK_NAME, LOCATION_ID);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN BLOODBANK TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN BLOODBANK TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_BLOODBANK;



--------------------------------- Insert HOSPITAL --------------------------------
PROCEDURE INSERT_HOSPITAL(V_HOSPITAL_ID in NUMBER,
                            V_HOSPITAL_NAME in VARCHAR2,
                            V_LOCATION_ID in NUMBER
                            )
IS
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO HOSPITAL (HOSPITAL_ID, HOSPITAL_NAME, LOCATION_ID) 
VALUES (V_HOSPITAL_ID, V_HOSPITAL_NAME, V_LOCATION_ID) ;
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN HOSPITAL TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN HOSPITAL TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_HOSPITAL;



--------------------------------- Insert LOCATION --------------------------------
PROCEDURE INSERT_LOCATION(LOCATION_ID in NUMBER,
                        LOCATION_NAME in VARCHAR2,
                        LOC_PINCODE in NUMBER
                        )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO LOCATION (LOCATION_ID, LOCATION_NAME, LOC_PINCODE) 
VALUES (LOCATION_ID, LOCATION_NAME, LOC_PINCODE);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN LOCATION TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN LOCATION TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_LOCATION;



--------------------------------- Insert PATIENT --------------------------------
PROCEDURE INSERT_PATIENT(PATIENT_ID in NUMBER,
                            PATIENT_NAME in VARCHAR2,
                            PATIENT_IDENT_NO in VARCHAR2,
                            MEDICAL_HISTORY in VARCHAR2
                            )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO PATIENT (PATIENT_ID, PATIENT_NAME,PATIENT_IDENT_NO,MEDICAL_HISTORY)
VALUES (PATIENT_ID, PATIENT_NAME,PATIENT_IDENT_NO,MEDICAL_HISTORY);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN PATIENT TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN PATIENT TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_PATIENT;



--------------------------------- Insert BMS_DOCTORS --------------------------------
PROCEDURE INSERT_BMS_DOCTORS(DOCTOR_ID in NUMBER,
                                DOC_NAME in VARCHAR2
                                )
AS
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO BMS_DOCTORS (DOCTOR_ID, DOCTOR_NAME)
VALUES  (DOCTOR_ID, DOC_NAME);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN BMS_DOCTORS TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN BMS_DOCTORS TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_BMS_DOCTORS;



--------------------------------- Insert BLOODREQUEST --------------------------------
PROCEDURE INSERT_BLOODREQUEST(BLOODREQ_ID in NUMBER,
                                HOSPITAL_ID in NUMBER,
                                PATIENT_ID in NUMBER,
                                REQSTATUSNO in NUMBER,
                                QTYREQ in NUMBER,
                                REQUESTDATE in DATE,
                                REQPRIORITY in VARCHAR2,
                                BLOODGROUP_ID in NUMBER,
                                BMSEMPLOYEE_ID in NUMBER
                                )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO BLOODREQUEST (BLOODREQ_ID, HOSPITAL_ID, PATIENT_ID,REQSTATUSNO,QTYREQ,REQUESTDATE,REQPRIORITY,BLOODGROUP_ID,BMSEMPLOYEE_ID)
VALUES (BLOODREQ_ID, HOSPITAL_ID, PATIENT_ID,REQSTATUSNO,QTYREQ,REQUESTDATE,REQPRIORITY,BLOODGROUP_ID,BMSEMPLOYEE_ID);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN BLOODREQUEST TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN BLOODREQUEST TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_BLOODREQUEST;



--------------------------------- Insert SAMPLECHECKDETAILS --------------------------------
PROCEDURE INSERT_SAMPLECHECKDETAILS(SCD_ID in NUMBER,
                                    SAMPLE_ID in NUMBER,
                                    DOCTOR_ID in NUMBER,
                                    RESULT in VARCHAR2
                                    )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO SAMPLECHECKDETAILS (SCD_ID, SAMPLE_ID, DOCTOR_ID,RESULT)
VALUES (SCD_ID, SAMPLE_ID, DOCTOR_ID,RESULT);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN SAMPLECHECKDETAILS TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN SAMPLECHECKDETAILS TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_SAMPLECHECKDETAILS;



--------------------------------- Insert REQSTATUSREQTYPE --------------------------------

PROCEDURE INSERT_REQSTATUSTYPE(REQSTATUSNO in NUMBER,
                                    STATUSTYPE in VARCHAR2
                                    )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO REQSTATUSTYPE (REQSTATUSNO, STATUSTYPE)
VALUES (REQSTATUSNO, STATUSTYPE);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN REQSTATUSREQTYPE TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN REQSTATUSREQTYPE TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_REQSTATUSTYPE;



--------------------------------- Insert BLOOD_MANAGEMENT_SYSINVENTORY --------------------------------
PROCEDURE INSERT_BLOOD_MANAGEMENT_SYSINVENTORY(BLOODINVENTORY_ID in NUMBER,
                                                QTY in NUMBER,
                                                BLOODGROUP_ID in NUMBER,
                                                SAMPLINGDATE in DATE,
                                                SAMPLE_ID in NUMBER,
                                                DONOR_ID in NUMBER
                                                )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO BLOOD_MANAGEMENT_SYSINVENTORY (BLOODINVENTORY_ID, QTY, BLOODGROUP_ID, SAMPLINGDATE,SAMPLE_ID,DONOR_ID)
VALUES (BLOODINVENTORY_ID, QTY, BLOODGROUP_ID, SAMPLINGDATE,SAMPLE_ID,DONOR_ID);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN BLOOD_MANAGEMENT_SYSINVENTORY TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN BLOOD_MANAGEMENT_SYSINVENTORY TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_BLOOD_MANAGEMENT_SYSINVENTORY;



--------------------------------- Insert BLOODGROUP --------------------------------

PROCEDURE INSERT_BLOODGROUP(BLOODGROUP_ID in NUMBER,
                                BLOODGROUP_NAME in VARCHAR2
                            )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO BLOODGROUP (BLOODGROUP_ID, BLOODGROUP_NAME)
VALUES (BLOODGROUP_ID, BLOODGROUP_NAME);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN BLOODGROUP TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN BLOODGROUP TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_BLOODGROUP;



--------------------------------- Insert SAMPLE_DETAILS --------------------------------
PROCEDURE INSERT_SAMPLEDETAILS(SAMPLE_ID in NUMBER,
                                    DONOR_ID in NUMBER,
                                    SAMPLINGDATE in DATE,
                                    BLOODGROUP_ID in NUMBER,
                                    QTY in NUMBER
                                    )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO SAMPLEDETAILS (SAMPLE_ID, DONOR_ID, SAMPLINGDATE, BLOODGROUP_ID, QTY)
VALUES (SAMPLE_ID, DONOR_ID, SAMPLINGDATE, BLOODGROUP_ID, QTY);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN SAMPLE_DETAILS TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN SAMPLE_DETAILS TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_SAMPLEDETAILS;


------------------------------------Insert DONORDETAILS------------------------

PROCEDURE INSERT_DONORDETAILS(DONOR_ID in NUMBER,
                                DONOR_NAME in VARCHAR2,
                                DONOR_AGE in NUMBER,
                                DONOR_PHONENO in LONG,
                                MEDICAL_HISTORY in VARCHAR2,
                                LASTDONATION_DATE in DATE
                                )
AS 
BEGIN 
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
INSERT INTO donordetails (DONOR_ID, DONOR_NAME, DONOR_AGE, DONOR_PHONENO,MEDICAL_HISTORY,LASTDONATIONDATE)
VALUES (DONOR_ID, DONOR_NAME, DONOR_AGE, DONOR_PHONENO,MEDICAL_HISTORY,LASTDONATION_DATE);
DBMS_OUTPUT.PUT_LINE('ROW SUCCESSFULLY INSERTED IN DONORDETAIL TABLE!');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
COMMIT;
EXCEPTION
WHEN dup_val_on_index THEN
DBMS_OUTPUT.PUT_LINE('DUPLICATE VALUE FOUND, PLEASE INSERT A DIFFERENT VALUE!');
WHEN others THEN 
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED WHILE INSERTING DATA IN DONORDETAIL TABLE!');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('ERROR ENCOUNTERED IS : ');
DBMS_OUTPUT.PUT_LINE(dbms_utility.format_error_stack);
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
END INSERT_DONORDETAILS;

END;
/