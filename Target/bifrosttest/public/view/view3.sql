create or replace view BIFROSTTEST.PUBLIC.VIEW3(
	COL1
) as
SELECT * FROM
PUBLIC.TABLE2_view;

/*** MSC-WARNING - MSCEWI1050 - MISSING DEPENDENT OBJECT "TABLE3" **/*
