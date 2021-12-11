DECLARE  totalno  NUMBER;
BEGIN  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'BBANK_MANAGEMENT_EMPLOYEE';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE BBANK_MANAGEMENT_EMPLOYEE CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE BBANK_MANAGEMENT_EMPLOYEE
    (BMSEMPLOYEE_ID NUMBER(10,0), 
	EMP_NAME VARCHAR2(40 BYTE), 
	EMP_PHONENO NUMBER(10,0), 
	BLOODBANK_ID NUMBER(10,0)
   )';
    ELSE IF (totalno = 0) THEN
    EXECUTE IMMEDIATE 'CREATE TABLE BBANK_MANAGEMENT_EMPLOYEE
    (BMSEMPLOYEE_ID NUMBER(10,0), 
	EMP_NAME VARCHAR2(40 BYTE), 
	EMP_PHONENO NUMBER(10,0), 
	BLOODBANK_ID NUMBER(10,0)
   )';
END IF;
END IF;
   --EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX BBANK_MANAGEMENT_EMPLOYEE_PK ON BBANK_MANAGEMENT_EMPLOYEE(BMSEMPLOYEE_ID) '; 

totalno := null;
  
SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'BLOODBANK';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE BLOODBANK CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE BLOODBANK
    (BLOODBANK_ID NUMBER(10,0), 
	BLOODBANK_NAME VARCHAR2(40 BYTE) , 
	LOCATION_ID NUMBER(10,0)
   )';
   ELSE IF (totalno = 0) THEN
    EXECUTE IMMEDIATE 'CREATE TABLE BLOODBANK
    (BLOODBANK_ID NUMBER(10,0), 
	BLOODBANK_NAME VARCHAR2(40 BYTE) , 
	LOCATION_ID NUMBER(10,0)
   )';
END IF;
END IF;
   --EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX BLOODBANK_PK ON BLOODBANK (BLOODBANK_ID)'; 
   
 ---DECLARE BLOODGROUP
  totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'BLOODGROUP';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE BLOODGROUP  CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE BLOODGROUP  
   ("BLOODGROUP_ID" NUMBER(10,0), 
	"BLOODGROUP_NAME" VARCHAR2(40 BYTE) 
   )  ';
   ELSE IF (totalno = 0) THEN
   EXECUTE IMMEDIATE 'CREATE TABLE BLOODGROUP 
   (	"BLOODGROUP_ID" NUMBER(10,0), 
	"BLOODGROUP_NAME" VARCHAR2(40 BYTE) 
   )  ';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX BLOODGROUP_PK ON BLOODGROUP(BLOODGROUP_ID)';
    
 
---DECLARE  totalno  NUMBER;

totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'BLOODREQUEST';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE BLOODREQUEST CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE BLOODREQUEST
    (BLOODREQ_ID NUMBER(10,0), 
	HOSPITAL_ID NUMBER(10,0), 
	PATIENT_ID NUMBER(10,0), 
	REQSTATUSNO NUMBER(10,0),
    BLOODGROUP_ID NUMBER(10,0),
	QTYREQ NUMBER(10,0), 
	REQUESTDATE DATE, 
	REQPRIORITY VARCHAR2(40 BYTE) , 
	BMSEMPLOYEE_ID NUMBER(10,0)
   )';
    ELSE IF (totalno = 0) THEN
    EXECUTE IMMEDIATE 'CREATE TABLE BLOODREQUEST
    (BLOODREQ_ID NUMBER(10,0), 
	HOSPITAL_ID NUMBER(10,0), 
	PATIENT_ID NUMBER(10,0), 
	REQSTATUSNO NUMBER(10,0),
    BLOODGROUP_ID NUMBER(10,0),
	QTYREQ NUMBER(10,0), 
	REQUESTDATE DATE, 
	REQPRIORITY VARCHAR2(40 BYTE) , 
	BMSEMPLOYEE_ID NUMBER(10,0)
   )';
END IF;
END IF;
   EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX BLOODREQUEST_PK ON BLOODREQUEST (BLOODREQ_ID)'; 
   
-----DECLARE  totalno  NUMBER;
totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'BLOOD_MANAGEMENT_SYSINVENTORY';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE BLOOD_MANAGEMENT_SYSINVENTORY CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE BLOOD_MANAGEMENT_SYSINVENTORY
    (BLOODINVENTORY_ID NUMBER(10,0), 
	BLOODTYPE VARCHAR2(40 BYTE) , 
	QTY NUMBER(10,0), 
    BLOODGROUP_ID NUMBER(10,0),
	SAMPLINGDATE DATE, 
	SAMPLE_ID NUMBER(10,0), 
	DONOR_ID NUMBER(10,0)
   )';
    ELSE IF (totalno = 0) THEN
    EXECUTE IMMEDIATE 'CREATE TABLE BLOOD_MANAGEMENT_SYSINVENTORY
    (BLOODINVENTORY_ID NUMBER(10,0), 
	BLOODTYPE VARCHAR2(40 BYTE) , 
	QTY NUMBER(10,0), 
    BLOODGROUP_ID NUMBER(10,0),
	SAMPLINGDATE DATE, 
	SAMPLE_ID NUMBER(10,0), 
	DONOR_ID NUMBER(10,0)
   )';
END IF;
END IF;
   EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX BLOOD_MANAGEMENT_SYSINVENTORY_PK ON BLOOD_MANAGEMENT_SYSINVENTORY (BLOODINVENTORY_ID)';



------DECLARE  totalno  NUMBER;
totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'BMS_DOCTORS';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE BMS_DOCTORS CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE BMS_DOCTORS 
   (DOCTOR_ID NUMBER(10,0), 
	DOCTOR_NAME VARCHAR2(40 BYTE)
   ) ';
       ELSE IF (totalno = 0) THEN
    EXECUTE IMMEDIATE 'CREATE TABLE BMS_DOCTORS 
   (DOCTOR_ID NUMBER(10,0), 
	DOCTOR_NAME VARCHAR2(40 BYTE)
   ) ';
END IF;
END IF;
   EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX BMS_DOCTORS_PK ON BMS_DOCTORS (DOCTOR_ID)';
  


-------DECLARE  totalno  NUMBER;
totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'DONORDETAILS';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE DONORDETAILS CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE DONORDETAILS 
   (	DONOR_ID NUMBER(10,0),
	DONOR_NAME VARCHAR2(40 BYTE) , 
	DONOR_AGE NUMBER(10,0), 
	DONOR_PHONENO LONG , 
	LASTDONATIONDATE DATE
   )';
    ELSE IF (totalno = 0) THEN
      EXECUTE IMMEDIATE 'CREATE TABLE DONORDETAILS 
   (	DONOR_ID NUMBER(10,0),
	DONOR_NAME VARCHAR2(40 BYTE) , 
	DONOR_AGE NUMBER(10,0), 
	DONOR_PHONENO LONG , 
	LASTDONATIONDATE DATE
   )';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX DONORDETAILS_PK ON DONORDETAILS (DONOR_ID)';
      


---DECLARE  totalno  NUMBER;
totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'HOSPITAL';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE HOSPITAL CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE HOSPITAL 
   (	HOSPITAL_ID NUMBER(10,0), 
	HOSPITAL_NAME VARCHAR2(40 BYTE) , 
	LOCATION_ID NUMBER(10,0)
   )';
       ELSE IF (totalno = 0) THEN
      EXECUTE IMMEDIATE 'CREATE TABLE HOSPITAL 
   (	HOSPITAL_ID NUMBER(10,0), 
	HOSPITAL_NAME VARCHAR2(40 BYTE) , 
	LOCATION_ID NUMBER(10,0)
   )';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX HOSPITAL_PK ON HOSPITAL (HOSPITAL_ID)';
      


---DECLARE  totalno  NUMBER;
totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'LOCATION';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE LOCATION CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE LOCATION 
   (	LOCATION_ID NUMBER(10,0), 
	LOCATION_NAME VARCHAR2(40 BYTE), 
	LOC_PINCODE NUMBER(10,0)
   )';
          ELSE IF (totalno = 0) THEN
     EXECUTE IMMEDIATE 'CREATE TABLE LOCATION 
   (	LOCATION_ID NUMBER(10,0), 
	LOCATION_NAME VARCHAR2(40 BYTE), 
	LOC_PINCODE NUMBER(10,0)
   )';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX LOCATION_PK ON LOCATION (LOCATION_ID)';
      


----DECLARE  totalno  NUMBER;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'PATIENT';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE PATIENT CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE PATIENT 
   (	PATIENT_ID NUMBER(10,0), 
	PATIENT_NAME VARCHAR2(40 BYTE), 
	MEDICAL_HISTORY VARCHAR2 (4000 BYTE)
   ) ';
  ELSE IF (totalno = 0) THEN
     EXECUTE IMMEDIATE 'CREATE TABLE PATIENT 
  (	PATIENT_ID NUMBER(10,0), 
	PATIENT_NAME VARCHAR2(40 BYTE), 
	MEDICAL_HISTORY VARCHAR2 (4000 BYTE)
   ) ';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX PATIENT_PK ON PATIENT (PATIENT_ID)';
      


----DECLARE  totalno  NUMBER;
totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'REQSTATUSTYPE';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE REQSTATUSTYPE CASCADE CONSTRAINTS ';
      EXECUTE IMMEDIATE 'CREATE TABLE REQSTATUSTYPE   
   (REQSTATUSNO NUMBER(10,0), 
	STATUSTYPE VARCHAR2(40 BYTE) 
   )';
   ELSE IF (totalno = 0) THEN
     EXECUTE IMMEDIATE 'CREATE TABLE REQSTATUSTYPE 
   (REQSTATUSNO NUMBER(10,0), 
	STATUSTYPE VARCHAR2(40 BYTE) 
   )';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX REQSTATUSTYPE_PK ON REQSTATUSTYPE (REQSTATUSNO)';
      


-----DECLARE  totalno  NUMBER;
totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'SAMPLECHECKDETAILS';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE SAMPLECHECKDETAILS CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE SAMPLECHECKDETAILS 
   (	SCD_ID NUMBER(10,0), 
	SAMPLE_ID NUMBER(10,0), 
	DOCTOR_ID NUMBER(10,0), 
	RESULT VARCHAR2(40 BYTE) 
   ) ';
   ELSE IF (totalno = 0) THEN
     EXECUTE IMMEDIATE 'CREATE TABLE SAMPLECHECKDETAILS 
   (	SCD_ID NUMBER(10,0), 
	SAMPLE_ID NUMBER(10,0), 
	DOCTOR_ID NUMBER(10,0), 
	RESULT VARCHAR2(40 BYTE) 
   ) ';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX SAMPLECHECKDETAILS_PK ON SAMPLECHECKDETAILS(SCD_ID)';
 
/* 
 totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'BLOODGROUP';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE BLOODGROUP  CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE BLOODGROUP  
   (	"BLOODGROUP_ID" NUMBER(10,0), 
	"BLOODGROUP_NAME" VARCHAR2(40 BYTE) 
   )  ';
   ELSE IF (totalno = 0) THEN
   EXECUTE IMMEDIATE 'CREATE TABLE BLOODGROUP 
   (	"BLOODGROUP_ID" NUMBER(10,0), 
	"BLOODGROUP_NAME" VARCHAR2(40 BYTE) 
   )  ';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX BLOODGROUP_PK ON BLOODGROUP(BLOODGROUP_ID)';
    
*/

-----DECLARE  totalno  NUMBER;
totalno:=null;
  
  SELECT count(*) INTO totalno FROM user_tables WHERE table_name = 'SAMPLEDETAILS';
  IF totalno > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABlE  SAMPLEDETAILS CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE 'CREATE TABLE SAMPLEDETAILS 
   (	SAMPLE_ID NUMBER(10,0), 
	DONOR_ID NUMBER(10,0), 
	SAMPLINGDATE DATE, 
	BLOODTYPE VARCHAR2(40 BYTE), 
    BLOODGROUP_ID NUMBER(10,0),
	QTY NUMBER(10,0)
   )';
    ELSE IF (totalno = 0) THEN
     EXECUTE IMMEDIATE 'CREATE TABLE SAMPLEDETAILS 
   (	SAMPLE_ID NUMBER(10,0), 
	DONOR_ID NUMBER(10,0), 
	SAMPLINGDATE DATE, 
	BLOODTYPE VARCHAR2(40 BYTE), 
    BLOODGROUP_ID NUMBER(10,0),
	QTY NUMBER(10,0)
   )';
END IF;
END IF;
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX SAMPLEDETAILS_PK ON SAMPLEDETAILS (SAMPLE_ID)';



Insert into BBANK_MANAGEMENT_EMPLOYEE (BMSEMPLOYEE_ID,EMP_NAME,EMP_PHONENO,BLOODBANK_ID) values (901,'Sansa','8889997777',201);
Insert into BBANK_MANAGEMENT_EMPLOYEE (BMSEMPLOYEE_ID,EMP_NAME,EMP_PHONENO,BLOODBANK_ID) values (902,'Cersei','1112223333',202);
Insert into BBANK_MANAGEMENT_EMPLOYEE (BMSEMPLOYEE_ID,EMP_NAME,EMP_PHONENO,BLOODBANK_ID) values (903,'Jon','8889997799',203);
Insert into BBANK_MANAGEMENT_EMPLOYEE (BMSEMPLOYEE_ID,EMP_NAME,EMP_PHONENO,BLOODBANK_ID) values (904,'Den','8889992121',204);
Insert into BBANK_MANAGEMENT_EMPLOYEE (BMSEMPLOYEE_ID,EMP_NAME,EMP_PHONENO,BLOODBANK_ID) values (905,'Tyrion','8889991111',205);

Insert into BLOODBANK (BLOODBANK_ID,BLOODBANK_NAME,LOCATION_ID) values (201,'Azx',101);
Insert into BLOODBANK (BLOODBANK_ID,BLOODBANK_NAME,LOCATION_ID) values (202,'Aqwd',102);
Insert into BLOODBANK (BLOODBANK_ID,BLOODBANK_NAME,LOCATION_ID) values (203,'Loki',103);
Insert into BLOODBANK (BLOODBANK_ID,BLOODBANK_NAME,LOCATION_ID) values (204,'Sedr',104);
Insert into BLOODBANK (BLOODBANK_ID,BLOODBANK_NAME,LOCATION_ID) values (205,'Kvrv',105);

Insert into BLOODGROUP (BLOODGROUP_ID,BLOODGROUP_NAME) values (1,'A');
Insert into BLOODGROUP (BLOODGROUP_ID,BLOODGROUP_NAME) values (2,'B');
Insert into BLOODGROUP (BLOODGROUP_ID,BLOODGROUP_NAME) values (3,'O');
Insert into BLOODGROUP (BLOODGROUP_ID,BLOODGROUP_NAME) values (4,'A+');
Insert into BLOODGROUP (BLOODGROUP_ID,BLOODGROUP_NAME) values (5,'B-');


Insert into BLOODREQUEST (BLOODREQ_ID,HOSPITAL_ID,PATIENT_ID,REQSTATUSNO,QTYREQ,REQUESTDATE,REQPRIORITY,BMSEMPLOYEE_ID,BLOODGROUP_ID) values (2,301,801,601,2,to_date('09-SEP-21','DD-MON-RR'),'High',901,1);
Insert into BLOODREQUEST (BLOODREQ_ID,HOSPITAL_ID,PATIENT_ID,REQSTATUSNO,QTYREQ,REQUESTDATE,REQPRIORITY,BMSEMPLOYEE_ID,BLOODGROUP_ID) values (111,301,801,601,4,to_date('01-FEB-00','DD-MON-RR'),'HIGH',901,2);
Insert into BLOODREQUEST (BLOODREQ_ID,HOSPITAL_ID,PATIENT_ID,REQSTATUSNO,QTYREQ,REQUESTDATE,REQPRIORITY,BMSEMPLOYEE_ID,BLOODGROUP_ID) values (112,302,802,602,5,to_date('12-MAR-12','DD-MON-RR'),'PRIOR',902,3);
Insert into BLOODREQUEST (BLOODREQ_ID,HOSPITAL_ID,PATIENT_ID,REQSTATUSNO,QTYREQ,REQUESTDATE,REQPRIORITY,BMSEMPLOYEE_ID,BLOODGROUP_ID) values (113,303,803,603,6,to_date('06-JUN-18','DD-MON-RR'),'MEDIUM',903,4);
Insert into BLOODREQUEST (BLOODREQ_ID,HOSPITAL_ID,PATIENT_ID,REQSTATUSNO,QTYREQ,REQUESTDATE,REQPRIORITY,BMSEMPLOYEE_ID,BLOODGROUP_ID) values (114,304,804,604,7,to_date('07-DEC-19','DD-MON-RR'),'CAN WAIT',904,5);
Insert into BLOODREQUEST (BLOODREQ_ID,HOSPITAL_ID,PATIENT_ID,REQSTATUSNO,QTYREQ,REQUESTDATE,REQPRIORITY,BMSEMPLOYEE_ID,BLOODGROUP_ID) values (115,305,805,605,1,to_date('09-SEP-21','DD-MON-RR'),'HIGH PRIORITY',905,5);

Insert into BLOOD_MANAGEMENT_SYSINVENTORY (BLOODINVENTORY_ID,QTY,SAMPLINGDATE,SAMPLE_ID,DONOR_ID,BLOODGROUP_ID) values (101,2,to_date('01-JAN-20','DD-MON-RR'),131,701,1);
Insert into BLOOD_MANAGEMENT_SYSINVENTORY (BLOODINVENTORY_ID,QTY,SAMPLINGDATE,SAMPLE_ID,DONOR_ID,BLOODGROUP_ID) values (102,3,to_date('02-MAR-20','DD-MON-RR'),132,702,2);
Insert into BLOOD_MANAGEMENT_SYSINVENTORY (BLOODINVENTORY_ID,QTY,SAMPLINGDATE,SAMPLE_ID,DONOR_ID,BLOODGROUP_ID) values (103,4,to_date('06-FEB-20','DD-MON-RR'),133,703,3);
Insert into BLOOD_MANAGEMENT_SYSINVENTORY (BLOODINVENTORY_ID,QTY,SAMPLINGDATE,SAMPLE_ID,DONOR_ID,BLOODGROUP_ID) values (104,5,to_date('04-APR-20','DD-MON-RR'),134,704,4);
Insert into BLOOD_MANAGEMENT_SYSINVENTORY (BLOODINVENTORY_ID,QTY,SAMPLINGDATE,SAMPLE_ID,DONOR_ID,BLOODGROUP_ID) values (105,6,to_date('05-JUN-20','DD-MON-RR'),135,705,5);

Insert into BMS_DOCTORS (DOCTOR_ID,DOCTOR_NAME) values (501,'John');
Insert into BMS_DOCTORS (DOCTOR_ID,DOCTOR_NAME) values (502,'Alex');
Insert into BMS_DOCTORS (DOCTOR_ID,DOCTOR_NAME) values (503,'George');
Insert into BMS_DOCTORS (DOCTOR_ID,DOCTOR_NAME) values (504,'White');
Insert into BMS_DOCTORS (DOCTOR_ID,DOCTOR_NAME) values (505,'Brian');

Insert into DONORDETAILS (DONOR_ID,DONOR_NAME,DONOR_AGE,DONOR_PHONENO,LASTDONATIONDATE) values (701,'Rachel',20,'1112223333',to_date('01-FEB-20','DD-MON-RR'));
Insert into DONORDETAILS (DONOR_ID,DONOR_NAME,DONOR_AGE,DONOR_PHONENO,LASTDONATIONDATE) values (702,'Ross',21,'3332224444',to_date('10-DEC-19','DD-MON-RR'));
Insert into DONORDETAILS (DONOR_ID,DONOR_NAME,DONOR_AGE,DONOR_PHONENO,LASTDONATIONDATE) values (703,'Joey',24,'1112222121',to_date('04-APR-19','DD-MON-RR'));
Insert into DONORDETAILS (DONOR_ID,DONOR_NAME,DONOR_AGE,DONOR_PHONENO,LASTDONATIONDATE) values (704,'Pheebs',25,'1112224433',to_date('01-FEB-00','DD-MON-RR'));
Insert into DONORDETAILS (DONOR_ID,DONOR_NAME,DONOR_AGE,DONOR_PHONENO,LASTDONATIONDATE) values (705,'Monica',23,'1112234433',to_date('01-SEP-12','DD-MON-RR'));

Insert into HOSPITAL (HOSPITAL_ID,HOSPITAL_NAME,LOCATION_ID) values (301,'cambridge hospital',101);
Insert into HOSPITAL (HOSPITAL_ID,HOSPITAL_NAME,LOCATION_ID) values (302,'somerville hospital',102);
Insert into HOSPITAL (HOSPITAL_ID,HOSPITAL_NAME,LOCATION_ID) values (303,'Forest Hills hospital',103);
Insert into HOSPITAL (HOSPITAL_ID,HOSPITAL_NAME,LOCATION_ID) values (304,'Downtown hospital',104);
Insert into HOSPITAL (HOSPITAL_ID,HOSPITAL_NAME,LOCATION_ID) values (305,'Longwood hospital',105);

Insert into LOCATION (LOCATION_ID,LOCATION_NAME,LOC_PINCODE) values (101,'cambridge',2114);
Insert into LOCATION (LOCATION_ID,LOCATION_NAME,LOC_PINCODE) values (102,'Somerville',2115);
Insert into LOCATION (LOCATION_ID,LOCATION_NAME,LOC_PINCODE) values (103,'Forest Hills',2116);
Insert into LOCATION (LOCATION_ID,LOCATION_NAME,LOC_PINCODE) values (104,'Downtown',2117);
Insert into LOCATION (LOCATION_ID,LOCATION_NAME,LOC_PINCODE) values (105,'Longwood',2118);

Insert into PATIENT (PATIENT_ID,PATIENT_NAME) values (802,'Shan');
Insert into PATIENT (PATIENT_ID,PATIENT_NAME) values (801,'Aryan');
Insert into PATIENT (PATIENT_ID,PATIENT_NAME) values (803,'John');
Insert into PATIENT (PATIENT_ID,PATIENT_NAME) values (804,'Arya');
Insert into PATIENT (PATIENT_ID,PATIENT_NAME) values (805,'Jack');

Insert into REQSTATUSTYPE (REQSTATUSNO,STATUSTYPE) values (601,'open');
Insert into REQSTATUSTYPE (REQSTATUSNO,STATUSTYPE) values (602,'closed');
Insert into REQSTATUSTYPE (REQSTATUSNO,STATUSTYPE) values (603,'open');
Insert into REQSTATUSTYPE (REQSTATUSNO,STATUSTYPE) values (604,'open');
Insert into REQSTATUSTYPE (REQSTATUSNO,STATUSTYPE) values (605,'open');

Insert into SAMPLECHECKDETAILS (SCD_ID,SAMPLE_ID,DOCTOR_ID,RESULT) values (121,131,501,'Contaminated');
Insert into SAMPLECHECKDETAILS (SCD_ID,SAMPLE_ID,DOCTOR_ID,RESULT) values (122,132,502,'Not Contaminated');
Insert into SAMPLECHECKDETAILS (SCD_ID,SAMPLE_ID,DOCTOR_ID,RESULT) values (123,133,503,'Not Contaminated');
Insert into SAMPLECHECKDETAILS (SCD_ID,SAMPLE_ID,DOCTOR_ID,RESULT) values (124,134,504,'Contaminated');
Insert into SAMPLECHECKDETAILS (SCD_ID,SAMPLE_ID,DOCTOR_ID,RESULT) values (125,135,505,'Contaminated');

Insert into SAMPLEDETAILS (SAMPLE_ID,DONOR_ID,SAMPLINGDATE,QTY,BLOODGROUP_ID) values (131,701,to_date('01-JAN-21','DD-MON-RR'),2,1);
Insert into SAMPLEDETAILS (SAMPLE_ID,DONOR_ID,SAMPLINGDATE,QTY,BLOODGROUP_ID) values (132,702,to_date('02-FEB-21','DD-MON-RR'),3,2);
Insert into SAMPLEDETAILS (SAMPLE_ID,DONOR_ID,SAMPLINGDATE,QTY,BLOODGROUP_ID) values (133,703,to_date('03-MAR-21','DD-MON-RR'),4,3);
Insert into SAMPLEDETAILS (SAMPLE_ID,DONOR_ID,SAMPLINGDATE,QTY,BLOODGROUP_ID) values (134,704,to_date('04-APR-21','DD-MON-RR'),6,4);
Insert into SAMPLEDETAILS (SAMPLE_ID,DONOR_ID,SAMPLINGDATE,QTY,BLOODGROUP_ID) values (135,705,to_date('05-MAY-21','DD-MON-RR'),8,5);

END;
/
---- procedure to add edit and delete records in the blood request table---
----This is an example procedure so created for only one table-------------
CREATE OR REPLACE EDITIONABLE PROCEDURE ADDEDITBLOODREQUEST 
(
p_bloorequestid number
,p_hospitalid number
,p_patientid number
,p_Requeststatusno number
,p_bloodgroup_id number
,p_qtyreq number
,p_requestdate Date
,p_prio varchar2
,p_empid number
,p_action varchar2
)
AS
BEGIN

If p_action = 'add'
Then
insert into bloodrequest
(hospital_id,patient_id,reqstatusno,bloodgroup_id,qtyreq,requestdate,reqpriority,bmsemployee_id)
values
(p_hospitalid,p_patientid,p_Requeststatusno,p_bloodgroup_id,p_qtyreq,p_requestdate,p_prio,p_empid);
End if;

If p_action = 'edit'
then
update bloodrequest set 
hospital_id=p_hospitalid,
patient_id=p_patientid,
reqstatusno=p_Requeststatusno,
bloodgroup_id=p_bloodgroup_id,
qtyreq=p_qtyreq,
requestdate=p_requestdate,
reqpriority=p_prio,
bmsemployee_id=p_empid
where bloodreq_id = p_bloorequestid;
end if;

if p_action = 'delete'
then
delete from bloodrequest where bloodreq_id=p_bloorequestid; 
end if;

END;

-----view to see all the blood requests that are open----
create view openrequestss as 
 select h.hospital_name,p.patient_name,bl.bloodgroup_name,br.REQUESTDATE,rs.statustype from bloodrequest br inner join hospital h on h.hospital_id=br.hospital_id 
 inner join patient p on p.patient_id=br.patient_id 
 inner join reqstatustype rs 
 on rs.reqstatusno=br.reqstatusno 
 inner join bloodgroup bl on bl.bloodgroup_ID=br.bloodgroup_ID
 where rs.statustype='open';
 
 select count(*) from openrequestss;
 
- ------------No of blood requets that are closed----------------------------------------
 create view closerequestss as 
 select h.hospital_name,p.patient_name,bl.bloodgroup_name,br.REQUESTDATE,rs.statustype from bloodrequest br inner join hospital h on h.hospital_id=br.hospital_id 
 inner join patient p on p.patient_id=br.patient_id 
 inner join reqstatustype rs 
 on rs.reqstatusno=br.reqstatusno 
 inner join bloodgroup bl on bl.bloodgroup_ID=br.bloodgroup_ID
 where rs.statustype='closed';
 
 select count(*) from closerequestss;
 
-------------view to see all the blood availble in the inventory that is not contaminated-
 create view Bloodavavailble_not_contaminated as
 select bloodgroup_name,sum(qty) availableQty from BLOOD_MANAGEMENT_SYSINVENTORY bmsi 
 inner join bloodgroup bl on bl.bloodgroup_ID=bmsi.bloodgroup_ID 
 inner join samplecheckdetails s on s.sample_ID=bmsi.sample_ID where result='Not Contaminated' group by bl.bloodgroup_name;

select * from Bloodavavailble_not_contaminated;

--------------donor details of the blood that is not contaminated-------------------------
create view donordetails_of_samples_not_contaminated as
select d.donor_name,d.donor_age,bl.bloodgroup_name,bmsi.SAMPLINGDATE,bmsi.Qty from BLOOD_MANAGEMENT_SYSINVENTORY bmsi  inner join bloodgroup bl on bl.bloodgroup_ID=bmsi.bloodgroup_ID 
 inner join donordetails d on d.donor_ID=bmsi.donor_ID
 inner join samplecheckdetails s on s.sample_ID=bmsi.sample_ID where result='Not Contaminated';
 
select * from donordetails_of_samples_not_contaminated;

---------------Donor details who are eligible to donate------------------------------------
create view available_donors as 
select dd.donor_id, dd.donor_name, dd.donor_phoneno from  donordetails dd
where round(sysdate - TRUNC(dd.lastdonationdate)) >= 56;

select * from available_donors;

---------------blood request quantity by each hospital--------------------------------------
select sum(br.qtyreq),h.hospital_name from bloodrequest br inner join hospital h on br.hospital_id=h.hospital_id group by h.hospital_name ;

---Total blood quantity available in the inventory both contaminated and not contaminated----
select sum(bmsi.qty),bg.bloodgroup_name from BLOOD_MANAGEMENT_SYSINVENTORY bmsi 
inner join bloodgroup bg on bmsi.bloodgroup_id=bg.bloodgroup_id 
group by bg.bloodgroup_name;

---------------view for expired blood samples------------------------------------------------
create or replace view blood_expiry as
SELECT bms.sample_id, bg.bloodgroup_name, 
CASE WHEN round(sysdate - TRUNC(bms.samplingdate)) < 42 THEN 'Not Expired'
ELSE 'Expired'
END AS StatusOfExpiry
FROM bloodgroup bg, blood_management_sysinventory bms
where bms.bloodgroup_id = bg.bloodgroup_id;

select * from blood_expiry;

----Quantity required per blood group-----
create or replace view blood_requests as 
select bloodgroup_name, sum(qtyreq) as ReqQuantity
from bloodrequest, bloodgroup where 
bloodrequest.bloodgroup_id = bloodgroup.bloodgroup_id
group by bloodgroup_name;

select * from blood_requests;


----Example to delete a record from bloodrequest table : TO BE EXECUTED AFTER EXECUTING THE PROCEDURE ABOVE------
begin
ADDEDITBLOODREQUEST(2 ,301 ,801 ,601,1,2 ,'10-Aug-21','High' ,901 ,'delete');
END;
