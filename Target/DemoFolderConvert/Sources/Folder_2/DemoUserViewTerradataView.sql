/*** MSC-WARNING - MSCEWI1039 - SEMANTIC INFORMATION COULD NOT BE LOADED FOR ViewDemoUsers. CHECK IF THE NAME IS INVALID OR DUPLICATED. ***/
CREATE OR REPLACE VIEW PUBLIC.ViewDemoUsers
(FirstName, LastName, PhoneNumber, Email, RegistrationDate)
AS
SELECT
 FirstName,
 LastName,
 PhoneNumber,
 Email,
 RegistrationDate
      FROM
 PUBLIC.ViewDemoUsers
      WHERE RegistrationDate <= CURRENT_DATE
-- ** MSC-WARNING - MSCEWI2045 - VIEW WITH OPTION NOT SUPPORTED IN SNOWFLAKE **
--                                             WITH CHECK OPTION
                                                              ;