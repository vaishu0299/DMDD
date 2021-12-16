---trigger for update on number of units 
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

update blood_management_sysinventory set qty = 9 where bloodinventory_id = 102;

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
    SELECT SUM(qty) INTO n FROM blood_management_sysinventory where bloodgroup_id = 1;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || n ||
        ' units of A positive');
    SELECT SUM(qty) INTO a FROM blood_management_sysinventory where bloodgroup_id = 2;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || a ||
        ' units of B positive');
    SELECT SUM(qty) INTO b FROM blood_management_sysinventory where bloodgroup_id = 3;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || b ||
        ' units of O positive');
    SELECT SUM(qty) INTO c FROM blood_management_sysinventory where bloodgroup_id = 4;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || c ||
        ' units of O negative');
    SELECT SUM(qty) INTO d FROM blood_management_sysinventory where bloodgroup_id = 5;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || d ||
        ' units of A negative');
    SELECT SUM(qty) INTO e FROM blood_management_sysinventory where bloodgroup_id = 6;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || e ||
        ' units of B negative');
    SELECT SUM(qty) INTO g FROM blood_management_sysinventory where bloodgroup_id = 7;
    DBMS_OUTPUT.PUT_LINE(' There are now ' || g ||
        ' units of AB negative');
    SELECT SUM(qty) INTO h FROM blood_management_sysinventory where bloodgroup_id = 8;
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

update hospital set hospital_name = 'pabloo hospitals' where hospital_id = 317;


---trigger for max of qty requested and its priority 
CREATE or replace trigger trig_bloodrequest
After insert or update on bloodrequest 
declare 
iqty number;
t_bloodreq_id bloodrequest.bloodreq_id%TYPE;
t_hospital_id bloodrequest.hospital_id%TYPE;
t_patient_id bloodrequest.patient_id%TYPE;
t_bloodgroup_id bloodrequest.bloodgroup_id%TYPE;
t_requestdate bloodrequest.requestdate%TYPE;
t_reqpriority bloodrequest.reqpriority%TYPE;
t_bmsemployee_id bloodrequest.bmsemployee_id%TYPE;
BEGIN
SELECT max(qtyreq) into iqty from bloodrequest;
select bloodreq_ID, HOSPITAL_ID, PATIENT_ID, BLOODGROUP_ID, REQUESTDATE, REQPRIORITY, BMSEMPLOYEE_ID into 
T_bloodreq_ID, T_HOSPITAL_ID, T_PATIENT_ID, T_BLOODGROUP_ID, T_REQUESTDATE, T_REQPRIORITY, T_BMSEMPLOYEE_ID
from BLOODREQUEST where qtyreq = iqty;

        DBMS_OUTPUT.PUT_LINE('Maximum blood quantity requested is:' || iqty);
        DBMS_OUTPUT.PUT_LINE('From hospital id: ' || t_hospital_id);
        DBMS_OUTPUT.PUT_LINE('For patient whose ID is:' || t_patient_id);
        DBMS_OUTPUT.PUT_LINE('Request priority for the patient: ' || T_reqpriority);

END;
/
update bloodrequest set hospital_id = 305 where bloodreq_id =111;

--trigger for modifying blood group table
create or replace trigger trig_bloodgroup
after delete on bloodgroup
Declare
t_bloodgroup_name bloodgroup.bloodgroup_name%TYPE;
BEGIN
if deleting then 
    
    raise_application_error(-20001, 'You cannot delete a row from blood groups table');
end if;
END;
/

delete from bloodgroup where bloodgroup_id =2;
select * from bloodgroup;
drop trigger trig_bloodgroup;
