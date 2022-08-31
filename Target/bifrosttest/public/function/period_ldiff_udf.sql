CREATE OR REPLACE FUNCTION BIFROSTTEST.PUBLIC.PERIOD_LDIFF_UDF(PERIOD_1 VARCHAR(50), PERIOD_2 VARCHAR(50))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
IMMUTABLE
AS 
$$
 CASE WHEN PUBLIC.PERIOD_OVERLAPS_UDF(PERIOD_2, PERIOD_1) = 'TRUE' 
            AND PUBLIC.PERIOD_BEGIN_UDF(PERIOD_1) < PUBLIC.PERIOD_BEGIN_UDF(PERIOD_2) 
       THEN
        SUBSTR(PERIOD_1,1, POSITION('*',PERIOD_1)-1) || '*' || SUBSTR(PERIOD_2,1, POSITION('*',PERIOD_2)-1)
       ELSE
         NULL
       END     
$$;
