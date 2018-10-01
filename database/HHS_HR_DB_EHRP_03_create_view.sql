-------------------
--VW_EHRP_15_MIN
-------------------
CREATE OR REPLACE VIEW HHS_HR.VW_EHRP_15_MIN
AS
SELECT
	REQ.HRS_JOB_OPENING_ID,
	REQ.ORIGINATOR_ID,
	REQ.OPEN_DT,
	REQ.JOB_REQ_STATUS,
	REQ.BUSINESS_UNIT,
	REQ.DEPTID AS ADMIN_CODE,
	REQ.GVT_RECR_OFFICE,
	REQ.HE_APPROVALO_OPRID,
	REQ.GVT_SEL_OFFICIAL,
	REQ.STATUS_DT,
	REQ.OPENINGS_TARGET,
	REQ.SETID_DEPT,
	REQ.COMPANY,
	POS.POSITION_NBR,
	POS.HRS_JO_PRM_PSN_FLG,
	REQ.JOBCODE,
	JC.GVT_PRIMARY_JCODE,
	LOC.LOCATION,
	LOC.HRS_JO_PRM_LOC_FLG,
	LOC.DESCR AS LOCATION_DESCR,
	REQ.POSTING_TITLE,
	REQ.DESIRED_START_DT,
	REQ.AUTHORIZATION_DT,
	REQ.COUNTRY,
	REQ.GVT_STAFF_SPCLST,
	REQ.GVT_CONSIDER_AREA,
	REQ.GVT_RQSN_TYPE,
	REQ.INITIATOR_OPRID,
	REQ.HE_COMMENTS,
	JC.REG_REGION,
	JC.DESIRED_FULL_PART,
	JC.DESIRED_REG_TEMP,
	JC.STD_HOURS,
	JC.STD_HRS_FREQUENCY,
	JC.DESIRED_SHIFT,
	JC.GVT_RQSN_SAL_FROM,
	JC.GVT_RQSN_SAL_TO,
	JC.PAY_FREQ_ABBRV,
	JC.CURRENCY_CD,
	JC.GVT_TRAVEL_PERCENT,
	JC.MANAGER_LEVEL,
	JC.FLSA_STATUS,
	JC.GVT_SUMMER_APPT,
	JC.GVT_NTE_DATE,
	JC.GVT_NTE_DAYS,
	JC.GVT_LEO_POSITION,
	JC.GVT_TYPE_OF_APPT,
	JCDTL.SAL_ADMIN_PLAN,
	JCDTL.GRADE,
	JCDTL.GVT_PAY_PLAN,
	JCDTL.GVT_OCC_SERIES,
	JCDTL.GVT_OFFICIAL_DESCR,
	JCDTL.GVT_EXEC_FIN_DISCL,
	SAL.MIN_RT_ANNUAL,
	SAL.MAX_RT_ANNUAL,
	POSDTL.REPORTS_TO,
	POSDTL.STD_HRS_DEFAULT,
	POSDTL.BARG_UNIT,
	POSDTL.GVT_WORK_SCHED,
	POSDTL.GVT_ORG_TTL_DESCR,
	POSDTL.GVT_DRUG_TEST_REQ,
	POSDTL.GVT_POSN_SENS_CD,
	POSDTL.SECURITY_CLEARANCE,
	POSDTL.GVT_EMP_FIN_INT,
	POSDTL.GRADE_DEFAULT,
	PDEPT.SETID AS POS_SETID,
	PDEPT.DEPTID AS POS_DEPTID,
	PDEPT.DESCR AS POS_DESCR,
	PDEPT.GVT_PAR_LINE2 AS POS_GVT_PAR_LINE2,
	PDEPT.GVT_PAR_DESCR2 AS POS_GVT_PAR_DESCR2,
	PDEPT.GVT_PAR_LINE3 AS POS_GVT_PAR_LINE3,
	PDEPT.GVT_PAR_DESCR3 AS POS_GVT_PAR_DESCR3,
	PDEPT.GVT_PAR_LINE4 AS POS_GVT_PAR_LINE4,
	PDEPT.GVT_PAR_DESCR4 AS POS_GVT_PAR_DESCR4,
	PDEPT.GVT_PAR_LINE5 AS POS_GVT_PAR_LINE5,
	PDEPT.GVT_PAR_DESCR5 AS POS_GVT_PAR_DESCR5,
	DEPT.SETID,
	DEPT.DEPTID,
	DEPT.DESCR,
	DEPT.GVT_PAR_LINE2,
	DEPT.GVT_PAR_DESCR2,
	DEPT.GVT_PAR_LINE3,
	DEPT.GVT_PAR_DESCR3,
	DEPT.GVT_PAR_LINE4,
	DEPT.GVT_PAR_DESCR4,
	DEPT.GVT_PAR_LINE5,
	DEPT.GVT_PAR_DESCR5,
	EWIT.PHYSICIAN_COMP_ALLOWANCE,
	EWIT.PHYSICIAN_DENTIST_PAY,
	EWIT.NON_STANDARD_PAY,
	EWIT.POSITION_DESCRIPTION,
	EWIT.RECRUITMENT_INCENTIVE,
	EWIT.RELOCATION_INCENTIVE,
	EWIT.CAN
FROM HHS_HR.EHRP_REQ_DTL REQ
	LEFT JOIN HHS_HR.EHRP_JOBCODES JC
		ON REQ.HRS_JOB_OPENING_ID = JC.HRS_JOB_OPENING_ID
	LEFT JOIN HHS_HR.EHRP_JOBCODE_DTL JCDTL
		ON REQ.HRS_JOB_OPENING_ID = JCDTL.HRS_JOB_OPENING_ID
		AND JC.JOBCODE = JCDTL.JOBCODE
	LEFT JOIN HHS_HR.EHRP_SALARY_DTL SAL
		ON REQ.HRS_JOB_OPENING_ID = SAL.HRS_JOB_OPENING_ID
		AND JC.JOBCODE = SAL.JOBCODE
	LEFT JOIN HHS_HR.EHRP_POSITIONS POS
		ON REQ.HRS_JOB_OPENING_ID = POS.HRS_JOB_OPENING_ID
	LEFT JOIN HHS_HR.EHRP_POSITION_DTL POSDTL
		ON REQ.HRS_JOB_OPENING_ID = POSDTL.HRS_JOB_OPENING_ID
		AND POS.POSITION_NBR = POSDTL.POSITION_NBR
	LEFT JOIN HHS_HR.EHRP_POSITION_DEPT PDEPT
		ON REQ.HRS_JOB_OPENING_ID = PDEPT.HRS_JOB_OPENING_ID
		AND POS.POSITION_NBR = PDEPT.POSITION_NBR
	LEFT JOIN HHS_HR.EHRP_OPENINGS LOC
		ON REQ.HRS_JOB_OPENING_ID = LOC.HRS_JOB_OPENING_ID
	LEFT JOIN HHS_HR.EHRP_DEPT DEPT
		ON REQ.HRS_JOB_OPENING_ID = DEPT.HRS_JOB_OPENING_ID
	LEFT JOIN HHS_HR.EHRP_EWITS_DTL EWIT
		ON REQ.HRS_JOB_OPENING_ID = EWIT.HRS_JOB_OPENING_ID
;
