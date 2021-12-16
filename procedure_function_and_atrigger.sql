 create or replace NONEDITIONABLE function fun_totqty(P_Blood_type varchar2)
return number
AS
V_bloodgroup_id number(10);
V_QTY NUMBER(10);
BEGIN
    BEGIN
    SELECT bloodgroup_id into V_bloodgroup_id from BLOODGROUP where BLOODGROUP_NAME=P_Blood_type
    and rownum=1;
    EXCEPTION when others then
    V_bloodgroup_id:=1;

    END;
    BEGIN
     select sum(QTY) into V_QTY from BLOOD_MANAGEMENT_SYSINVENTORY where bloodgroup_id = V_bloodgroup_id
        and to_date(samplingdate,'DD/MM/YYYY') >= TO_DATE((SYSDATE-90),'DD/MM/YYYY');
EXCEPTION when others then
        v_qty:=0;
    END;
     return v_qty;

END;
/
create or replace NONEDITIONABLE PROCEDURE p_sampledetialtentry(P_Donorname VARCHAR2, P_QTY NUMBER)
AS

V_DONOR_ID number(10);
BEGIN

    BEGIN
    SELECT DONOR_ID into V_DONOR_ID from donordetails where DONOR_NAME=P_Donorname
    and rownum=1;
    END;


INSERT INTO SAMPLEDETAILS values(SEQ_SAMPLE_ID.nextval,v_donor_id,SYSDATE,1,P_QTY);
commit;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Not Inserted in SAMPLEDETAILS');
END;

/
create or replace NONEDITIONABLE PROCEDURE p_bloodrequestentry(P_Patient_Ident_No varchar2,P_Hospital_name VARCHAR2,P_BLOODGROUP_NAME VARCHAR2,P_QTYREQ NUMBER,P_REQPRIORITY VARCHAR2,P_BMSEMPLOYEE_ID NUMBER)
AS

V_HOSPITAL_ID hospital.hospital_id%Type;
V_PATIENT_ID number(10);
V_BLOODGROUP_ID number(10);
BEGIN

    BEGIN
    SELECT HOSPITAL_ID into V_HOSPITAL_ID from hospital where hospital_name=P_Hospital_name
    and rownum=1;
    END;
    BEGIN 
    SELECT PATIENT_ID into V_PATIENT_ID from PATIENT where patient_ident_no=P_Patient_Ident_No
    and rownum=1;
    END;
    BEGIN 
    SELECT BLOODGROUP_ID into V_BLOODGROUP_ID from BLOODGROUP where BLOODGROUP_NAME=P_BLOODGROUP_NAME
    and rownum=1;
    END;
INSERT INTO bloodrequest values(SEQ_BLOOD_ID.nextval,V_HOSPITAL_ID,V_PATIENT_ID,1,V_BLOODGROUP_ID,P_QTYREQ,SYSDATE,P_REQPRIORITY,P_BMSEMPLOYEE_ID);
commit;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Not Inserted in bloodrequest');
END;

create or replace NONEDITIONABLE PROCEDURE p_bloodrequestupdate(P_Patient_Ident_No number,P_Hospital_name VARCHAR2,P_reqstatus varchar2)
AS

V_HOSPITAL_ID hospital.hospital_id%Type;
V_PATIENT_ID number(10);
V_REQSTATUSNO number(10);
BEGIN

    BEGIN
    SELECT HOSPITAL_ID into V_HOSPITAL_ID from hospital where hospital_name=P_Hospital_name
    and rownum=1;
    END;
    BEGIN 
    SELECT PATIENT_ID into V_PATIENT_ID from PATIENT where patient_ident_no=P_Patient_Ident_No
    and rownum=1;
    END;
    BEGIN
    SELECT reqstatusno into V_REQSTATUSNO from reqstatustype where statustype= P_reqstatus
    and rownum=1;
END;

Update bloodrequest SET REQSTATUSNO= V_REQSTATUSNO
where patient_id=v_patient_id
and hospital_id=v_hospital_id;
commit;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Not updated in bloodrequest');
END;
/

create or replace NONEDITIONABLE Trigger TRG_SAMPLE_AUDIT
AFTER INSERT 
ON SAMPLEDETAILS
FOR EACH ROW
BEGIN
 INSERT into samplecheckdetails values(SEQ_SCO_ID.nextval,:new.sample_id,1,:new.qty);
 COMMIT;
EXCEPTION
      WHEN OTHERS THEN
        NULL;
 END;