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
 
 
 set serveroutput on;
CREATE OR REPLACE TRIGGER display_quantity_changes
BEFORE DELETE OR INSERT OR UPDATE ON blood_management_sysinventory 
FOR EACH ROW 
WHEN (NEW.bloodinventory_id > 0) 
DECLARE 
   qtydif number; 
BEGIN 

   qtydif := :NEW.qty  - :OLD.qty; 
   dbms_output.put_line('Previous quantity: ' || :OLD.qty); 
   dbms_output.put_line('Updated quantity: ' || :NEW.qty); 
   dbms_output.put_line('Change in blood units for bloodinventory_id: ' || :old.bloodinventory_id || ' is :' || qtydif); 
END; 
/ 

---insert into blood_management_sysinventory (bloodinventory_id, qty, bloodgroup_id, samplingdate, sample_id, donor_id) values (1201,2,4001,'01-JAN-2020','mm/dd/yyyy'),1401,7001);
update blood_management_sysinventory set qty = 9 where bloodinventory_id = 1202;

---- total number of blood units 
set serveroutput on;
CREATE OR REPLACE TRIGGER bloodcount
AFTER INSERT OR UPDATE OR DELETE ON blood_management_sysinventory
DECLARE
    n INTEGER;
    a INTEGER;
    b INTEGER;
    c INTEGER;
    d INTEGER;
    e integer;
    f integer;
    g integer;
    h integer;
BEGIN
    SELECT SUM(qty) INTO n FROM blood_management_sysinventory where bloodgroup_id = 4001;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || n ||
        ' units of A positive');
    SELECT SUM(qty) INTO a FROM blood_management_sysinventory where bloodgroup_id = 4002;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || a ||
        ' units of B positive');
    SELECT SUM(qty) INTO b FROM blood_management_sysinventory where bloodgroup_id = 4003;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || b ||
        ' units of O positive');
    SELECT SUM(qty) INTO c FROM blood_management_sysinventory where bloodgroup_id = 4004;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || c ||
        ' units of O negative');
    SELECT SUM(qty) INTO d FROM blood_management_sysinventory where bloodgroup_id = 4005;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || d ||
        ' units of A negative');
    SELECT SUM(qty) INTO e FROM blood_management_sysinventory where bloodgroup_id = 4006;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || e ||
        ' units of B negative');
    SELECT SUM(qty) INTO g FROM blood_management_sysinventory where bloodgroup_id = 4008;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || g ||
        ' units of AB negative');
    SELECT SUM(qty) INTO h FROM blood_management_sysinventory where bloodgroup_id = 4007;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || h ||
        ' units of AB positive'); 
END;
/

---trigger on hospital
CREATE OR REPLACE TRIGGER trig_hos 
AFTER INSERT OR UPDATE ON hospital
DECLARE
id1 number;
t_hospital_name hospital.hospital_name%TYPE;
t_location_id hospital.location_id%TYPE;
BEGIN
SELECT max(hospital_id) into id1 from hospital;
select hospital_name, location_id into t_hospital_name, t_LOCATION_id from hospital where hospital_id = id1;

        DBMS_OUTPUT.PUT_LINE('Congrats on working on new hospital');
        DBMS_OUTPUT.PUT_LINE('Hospital ID:' || id1);
        DBMS_OUTPUT.PUT_LINE('Hospital Name:' || t_hospital_name );
        DBMS_OUTPUT.PUT_LINE('LOCATION ID:' || t_location_id);

END;
/

update hospital set hospital_name = 'pabloo hospitals' where hospital_id = 3015;


