 SET SERVEROUTPUT ON;
DECLARE
already_exists exception;
pragma exception_init (already_exists, -955);
begin
--------------------------------------------------------
--  File created - Friday-December-10-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CUSTOMER_ID_SEQ
--------------------------------------------------------
execute immediate
   ' CREATE SEQUENCE  "ADMIN"."SEQ_BLOOD_ID"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL';
--------------------------------------------------------
--  DDL for Sequence DELIVERYORDER_ID_SEQ
--------------------------------------------------------
execute immediate
   'CREATE SEQUENCE  "ADMIN"."SEQ_SAMPLE_ID"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL';
--  DDL for Sequence DINEINORDER_ID_SEQ
--------------------------------------------------------
execute immediate
    'CREATE SEQUENCE  "ADMIN"."SEQ_SCO_ID"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ';
dbms_output.put_line('Sequence Created');
  exception
  when already_exists then
  dbms_output.put_line('Sequence already Exists');
  null;
  end;
  
  
  
