select F15F8_RFE_EXCEPT_REQ.EXPLANATION as EXPLANATION,
F15F8_RFE_EXCEPT_REQ.RFE_ID as "RFE ID",
F15F8_RFE_EXCEPT_REQ.ALT_PROTECTIONS as ALT_PROTECTIONS,
F15F8_RFE_EXCEPT_REQ.REVIEW_DATE as REVIEW_DATE,
F15F8_RFE_EXCEPT_REQ.STATUS_ID as STATUS_ID,
(SELECT F15F8_RFE_STATUS_CODES.RFE_Status FROM F15F8_RFE_STATUS_CODES WHERE F15F8_RFE_STATUS_CODES.STATUS_CODE_ID = F15F8_RFE_EXCEPT_REQ.STATUS_CODE_ID) as "Status Name",
(SELECT F15F8_EMPLOYEE.EMP_NAME FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID=F15F8_RFE_EXCEPT_REQ.REQUESTOR_ID) as "Requestor",
(SELECT F15F8_EMPLOYEE.EMP_NAME FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID=F15F8_RFE_EXCEPT_REQ.REVIEWER_ID) as "Reviewer",
(SELECT F15F8_EMPLOYEE.EMP_NAME FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID=F15F8_RFE_EXCEPT_REQ.SA_APPROVER_ID) as "Sys Admin",
(SELECT F15F8_EMPLOYEE.EMP_NAME FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID= F15F8_RFE_EXCEPT_REQ.LD_APPROVER_ID) as "Lab Director",
(SELECT F15F8_EMPLOYEE.EMP_NAME FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID=F15F8_RFE_EXCEPT_REQ.CP_APPROVER_ID) as "Chairperson",
(SELECT F15F8_EMPLOYEE.EMP_NAME FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID=F15F8_RFE_EXCEPT_REQ.ED_APPROVER_ID) as "Executive Director" 
from F15F8_RFE_EXCEPT_REQ F15F8_RFE_EXCEPT_REQ

SELECT EMP_NAME as D, EMP_ID as R
FROM F15F8_EMPLOYEE

SELECT STATUS_CODE AS D, STATUS_ID AS R FROM F15F8_STATUS

SELECT EMP_NAME AS D, EMP_ID AS R
FROM F15F8_EMPLOYEE 
WHERE F15F8_EMPLOYEE.EMP_ID = :P71_EMPLOYEE_LOGGED_IN;

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID = 
   (SELECT F15F8_CONTACTS.CONTACT_ID FROM F15F8_CONTACTS WHERE F15F8_CONTACTS.EMP_ID = :P71_EMPLOYEE_LOGGED_IN AND 
   F15F8_CONTACTS.CONTACT_ROLE_NAME = 'Reviewer');

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE lab_id = :P71_LAB_LOGGED_IN;

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_EXECDIR_FLAG = 1;

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_CHAIR_FLAG = 1;

select F15F8_HISTORY.STATUS_CODE,
   F15F8_HISTORY.EFFECTIVE_DATE,
   (SELECT F15F8_EMPLOYEE.EMP_NAME FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID = F15F8_HISTORY.ENTERED_BY_ID) AS ENTERED_BY,
   F15F8_HISTORY.RFE_ID
from F15F8_HISTORY

select "ROWID", 
"EMP_ID",
"EMP_NAME",
"EMP_EMAIL",
"EMP_OFFICE",
"EMP_STATUS",
"EMP_STATUS_DATE",
"EMP_ADMIN_FLAG",
"EMP_LABDIR_FLAG",
"EMP_EXECDIR_FLAG",
"EMP_CHAIR_FLAG",
"LAB_ID",
(SELECT F15F8_AUTH."right" FROM F15F8_AUTH WHERE F15F8_EMPLOYEE.AUTH_ID = F15F8_AUTH.AUTH_ID) AS "AUTHORIZATION",
"EMP_PHONE"
from "#OWNER#"."F15F8_EMPLOYEE" 

select F15F8_AUTH."right" as D,
F15F8_AUTH.AUTH_ID as R
from F15F8_AUTH F15F8_AUTH

select 
"ROWID",
"LAB_ID"
from "#OWNER#"."F15F8_LAB"

select "STATUS_ID", 
"STATUS_CODE",
"EFFECTIVE_DATE",
"ENTERED_BY_ID",
(SELECT F15F8_RFE_STATUS_CODES.rfe_status from F15F8_RFE_STATUS_CODES where F15F8_RFE_STATUS_CODES.status_code_id = F15F8_STATUS.STATUS_CODE_ID) as "Status Name"
from "#OWNER#"."F15F8_STATUS" 

select F15F8_EMPLOYEE.EMP_NAME as D,
F15F8_EMPLOYEE.EMP_ID as R
from F15F8_EMPLOYEE F15F8_EMPLOYEE

select 
F15F8_RFE_STATUS_CODES.RFE_STATUS as D,
F15F8_RFE_STATUS_CODES.STATUS_CODE_ID as R
from F15F8_RFE_STATUS_CODES F15F8_RFE_STATUS_CODES

select F15F8_EMPLOYEE.EMP_ID,
F15F8_EMPLOYEE.EMP_NAME as "Name",
F15F8_EMPLOYEE.EMP_EMAIL as "Email",
F15F8_EMPLOYEE.EMP_PHONE as "Phone Number",
F15F8_EMPLOYEE.EMP_OFFICE as "Office",
F15F8_EMPLOYEE.EMP_STATUS as "Status",
F15F8_EMPLOYEE.EMP_STATUS_DATE as "Date Status Updated",
F15F8_EMPLOYEE.EMP_ADMIN_FLAG as "Administrator",
F15F8_EMPLOYEE.EMP_LABDIR_FLAG as "Lab Director",
F15F8_EMPLOYEE.EMP_EXECDIR_FLAG as "Executive Director",
F15F8_EMPLOYEE.EMP_CHAIR_FLAG as "Chairperson",
F15F8_EMPLOYEE.LAB_ID as "Laboratory Assigned" 
from F15F8_EMPLOYEE F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID = :P71_EMPLOYEE_LOGGED_IN

select "TASK_ID", 
"EFFECTIVE_DATE",
"TASK_ABBRV",
"TASK_DESC"
from "#OWNER#"."F15F8_TASK" 

SELECT EMP_NAME as D, EMP_ID as R from F15F8_EMPLOYEE

SELECT RFE_ID as D, RFE_ID as R FROM F15F8_RFE_EXCEPT_REQ where RFE_ID = :SELECT_RFE_ID

SELECT STATUS_CODE AS D, STATUS_ID AS R FROM F15F8_STATUS

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.LAB_ID = :P71_LAB_LOGGED_IN

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a'

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.LAB_ID = :P71_LAB_LOGGED_IN
AND F15F8_EMPLOYEE.emp_admin_flag = 1 AND F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a'

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.LAB_ID = :P71_LAB_LOGGED_IN
AND F15F8_EMPLOYEE.emp_labdir_flag = 1 AND F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a'

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE 
F15F8_EMPLOYEE.emp_chair_flag = 1 AND F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a'

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE 
F15F8_EMPLOYEE.emp_execdir_flag = 1 AND F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a'

select F15F8_RFE_STATUS_CODES.STATUS_CODE_ID as "Status Code ID",
F15F8_RFE_STATUS_CODES.RFE_STATUS as "RFE Status",
F15F8_RFE_STATUS_CODES.DESCRIPTION as DESCRIPTION 
from F15F8_RFE_STATUS_CODES F15F8_RFE_STATUS_CODES

select (SELECT F15F8_EMPLOYEE.EMP_NAME FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID = F15F8_CONTACTS.CONTACT_EMP_ID) as "Contact Name",
F15F8_CONTACTS.CONTACT_ROLE_NAME as "Role",
F15F8_CONTACTS.CONTACT_EMP_ID as "Employee ID",
F15F8_CONTACTS.EFFECTIVE_DATE as "Effective Date",
F15F8_CONTACTS.COMMENTS as COMMENTS 
from F15F8_CONTACTS F15F8_CONTACTS
where (SELECT F15F8_EMPLOYEE.LAB_ID 
    FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID = F15F8_CONTACTS.CONTACT_EMP_ID) = :P71_LAB_LOGGED_IN

select F15F8_ROLE_CODES.ROLE_CODE_NAME as D,
F15F8_ROLE_CODES.ROLE_CODE_NAME as R
from F15F8_ROLE_CODES F15F8_ROLE_CODES;

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.EMP_ID = 
(SELECT CONTACT_ID FROM F15F8_CONTACTS WHERE F15F8_CONTACTS.CONTACT_ROLE_NAME = 'Reviewer' AND F15F8_CONTACTS.emp_id = :P71_EMPLOYEE_LOGGED_IN);

SELECT EMP_NAME AS D, EMP_ID as R FROM F15F8_EMPLOYEE WHERE EMP_ID = :P71_EMPLOYEE_LOGGED_IN

select "DOC_ID", 
"RFE_ID",
"FILE_NAME",
dbms_lob.getlength("FILE_BLOB") "FILE_BLOB",
"FILE_COMMENTS",
"CREATED_BY",
"DATE_CREATED",
"UPDATED_BY",
"DATE_UPDATED",
"TAGS"
from "#OWNER#"."F15F8_DOCUMENT" 

SELECT RFE_ID as D, RFE_ID as R 
FROM 
F15F8_RFE_Except_Req

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE

SELECT EMP_NAME AS D, EMP_ID as R FROM F15F8_EMPLOYEE

select RFE_ID as display_value, RFE_ID as return_value 
from F15F8_RFE_EXCEPT_REQ
order by 1

:P71_EMPLOYEE_LOGGED_IN = (SELECT REQUESTOR_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE) OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT SA_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE)OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT LD_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE) OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT CP_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE);



BEGIN
DECLARE
REQUESTOR INTEGER;
SA_APPROVER INTEGER;
LABDIR_APPROVER INTEGER;
CHAIR_APPROVER INTEGER;
CURRENT_STATUS INTEGER;



BEGIN
SELECT REQUESTOR_ID INTO REQUESTOR FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE;
SELECT SA_APPROVER_ID INTO SA_APPROVER FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE;
SELECT LD_APPROVER_ID INTO LABDIR_APPROVER FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE;
SELECT CP_APPROVER_ID INTO CHAIR_APPROVER FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE;
SELECT STATUS_CODE_ID INTO CURRENT_STATUS FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE;


IF :P71_EMPLOYEE_LOGGED_IN = REQUESTOR AND CURRENT_STATUS =100
    THEN
    UPDATE F15F8_RFE_EXCEPT_REQ
    SET status_code_id = 101, review_date = SYSDATE
    WHERE rfe_id = :SELECT_RFE; 

    INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
    VALUES (2, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);
END IF;
    
IF :P71_EMPLOYEE_LOGGED_IN = SA_APPROVER
    THEN
    UPDATE F15F8_RFE_EXCEPT_REQ
    SET status_code_id = 105, review_date = SYSDATE
    WHERE rfe_id = :SELECT_RFE; 

    INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
    VALUES (6, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);
END IF;
    
IF :P71_EMPLOYEE_LOGGED_IN = LABDIR_APPROVER

    THEN
    UPDATE F15F8_RFE_EXCEPT_REQ
    SET status_code_id = 106, review_date = SYSDATE
    WHERE rfe_id = :SELECT_RFE; 

    INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
    VALUES (7, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);
END IF;
    
IF :P71_EMPLOYEE_LOGGED_IN = CHAIR_APPROVER
    THEN
    UPDATE F15F8_RFE_EXCEPT_REQ
    SET status_code_id = 107, review_date = SYSDATE
    WHERE rfe_id = :SELECT_RFE; 

    INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
    VALUES (8, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);
END IF;


END;
END;

:P71_EMPLOYEE_LOGGED_IN = (SELECT ED_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE);

BEGIN
DECLARE EXEC_ID INTEGER;

BEGIN

SELECT ED_APPROVER_ID INTO EXEC_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE;

IF :P71_EMPLOYEE_LOGGED_IN = EXEC_ID
    THEN
    UPDATE F15F8_RFE_EXCEPT_REQ
    SET status_code_id = 108
    WHERE rfe_id = :SELECT_RFE; 

    INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
    VALUES (9, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);
END IF;

END;
END;


:P71_EMPLOYEE_LOGGED_IN = (SELECT ED_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE) OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT SA_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE)OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT LD_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE) OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT CP_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE);


BEGIN
    UPDATE F15F8_RFE_EXCEPT_REQ
    SET status_code_id = 104
    WHERE rfe_id = :SELECT_RFE; 

    INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
    VALUES (5, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);

END;

:P71_EMPLOYEE_LOGGED_IN = (SELECT ED_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE) OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT SA_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE)OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT LD_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE) OR
:P71_EMPLOYEE_LOGGED_IN = (SELECT CP_APPROVER_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE);

BEGIN
    UPDATE F15F8_RFE_EXCEPT_REQ
    SET status_code_id = 102
    WHERE rfe_id = :SELECT_RFE; 

    INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
    VALUES (3, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);

END;

:P71_EMPLOYEE_LOGGED_IN = (SELECT REQUESTOR_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE);

BEGIN
    UPDATE F15F8_RFE_EXCEPT_REQ
    SET status_code_id = 103, review_date = SYSDATE
    WHERE rfe_id = :SELECT_RFE; 
    
    INSERT INTO F15F8_COMMENT(ENTERED_BY_ID, ENTRY_DATE, COMMENT_TEXT, RFE_ID)
    VALUES (:P71_EMPLOYEE_LOGGED_IN, SYSDATE, 'RFE RECALLED BY '||(SELECT EMP_NAME FROM F15F8_EMPLOYEE WHERE EMP_ID = :P71_EMPLOYEE_LOGGED_IN) || 'ON ' || SYSDATE, :SELECT_RFE);
    

    INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
    VALUES (4, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);

END;

:P71_EMPLOYEE_LOGGED_IN = (SELECT REQUESTOR_ID FROM F15F8_RFE_EXCEPT_REQ WHERE F15F8_RFE_EXCEPT_REQ.RFE_ID = :SELECT_RFE);

DECLARE
expl VARCHAR2(4000);
alt_pro VARCHAR2(4000);
rev_date DATE;
eid INTEGER;
stat_id INTEGER;
stat_code_id INTEGER;
rev_id INTEGER;
req_id INTEGER;
sa_id INTEGER;
ld_id INTEGER;
cp_id INTEGER;
ed_id INTEGER;

BEGIN
SELECT explanation, alt_protections, review_date, emp_id, status_id, status_code_id, requestor_id, reviewer_id, sa_approver_id, ld_approver_id, cp_approver_id, ed_approver_id
INTO expl, alt_pro, rev_date, eid, stat_id, stat_code_id, req_id, rev_id, sa_id, ld_id, cp_id, ed_id
FROM F15F8_RFE_EXCEPT_REQ
WHERE rfe_id = :SELECT_RFE;

INSERT INTO F15F8_RFE_EXCEPT_REQ(explanation, alt_protections, review_date, emp_id, status_id, status_code_id, requestor_id, reviewer_id, sa_approver_id, ld_approver_id, cp_approver_id, ed_approver_id) 
VALUES (expl, alt_pro, rev_date, eid, stat_id, 100, req_id, rev_id, sa_id, ld_id, cp_id, ed_id);

INSERT INTO F15F8_HISTORY(status_code, effective_date, entered_by_id, rfe_id) 
VALUES (1, SYSDATE, :P71_EMPLOYEE_LOGGED_IN, :SELECT_RFE);
END;


SELECT EMP_NAME as D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE 
F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a'

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE
F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a'AND 
F15F8_EMPLOYEE.emp_admin_flag = '1'
AND F15F8_EMPLOYEE.LAB_ID = :P71_LAB_LOGGED_IN

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE
F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a' AND 
F15F8_EMPLOYEE.emp_labdir_flag = '1'
AND F15F8_EMPLOYEE.LAB_ID = :P71_LAB_LOGGED_IN

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE
F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a' AND
F15F8_EMPLOYEE.emp_execdir_flag = '1'

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE
F15F8_EMPLOYEE.emp_status = 'A' OR F15F8_EMPLOYEE.emp_status='a' AND 
F15F8_EMPLOYEE.emp_chair_flag ='1'


SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.emp_admin_flag = 1 and F15F8_EMPLOYEE.lab_id = :P71_LAB_LOGGED_IN;

SELECT EMP_NAME AS D, EMP_ID as R FROM F15F8_EMPLOYEE WHERE EMP_ID = :P71_EMPLOYEE_LOGGED_IN

SELECT EMP_NAME AS D, EMP_ID AS R FROM F15F8_EMPLOYEE WHERE F15F8_EMPLOYEE.emp_labdir_flag = 1 and F15F8_EMPLOYEE.lab_id = :P71_LAB_LOGGED_IN;

SELECT EMP_NAME AS D, EMP_ID as R FROM F15F8_EMPLOYEE WHERE EMP_ID = :P71_EMPLOYEE_LOGGED_IN