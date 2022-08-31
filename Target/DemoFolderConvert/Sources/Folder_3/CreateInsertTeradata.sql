/* <sc-table> Mobilize.Table1 </sc-table> */
/*** MSC-WARNING - MSCEWI2015 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS ***/
CREATE TABLE PUBLIC.DemoUsers
(
     FirstName VARCHAR(100) NOT NULL,
     LastName VARCHAR(79) NOT NULL,
     PhoneNumber INTEGER,
     Email VARCHAR(100) NOT NULL,
     RegistrationDate DATE NOT NULL
)
/*** MSC-WARNING - MSCEWI2065 - NON UNIQUE PRIMARY INDEX IS NOT SUPPORTED IN SNOWFLAKE ***/
/* PRIMARY INDEX(id)*/;

/* <sc-insert> </sc-insert> */
INSERT INTO PUBLIC.DemoUsers (FirstName,LastName, PhoneNumber, Email, RegistrationDate)
VALUES ('Anna', 'QA', '1213214324', 'qasigma@mobilize.se', '2021-11-11');

/* <sc-insert> </sc-insert> */
INSERT INTO PUBLIC.DemoUsers (FirstName,LastName, PhoneNumber, Email, RegistrationDate)
VALUES ('Artem', 'PM', '1213214324', 'pmsigma@mobilize.se', '2021-10-11');

/* <sc-insert> </sc-insert> */
INSERT INTO PUBLIC.DemoUsers (FirstName,LastName, PhoneNumber, Email, RegistrationDate)
VALUES ('Sergey', 'DEV', '3547658769', 'devsigma@mobilize.se', '2021-09-11');

INSERT INTO PUBLIC.DemoUsers (FirstName,LastName, PhoneNumber, Email, RegistrationDate)
VALUES ('Natalia', 'Designer', '357658768', 'dessigma@mobilize.se', '2021-11-11');