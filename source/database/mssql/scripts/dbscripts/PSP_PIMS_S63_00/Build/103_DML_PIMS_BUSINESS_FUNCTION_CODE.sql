/* -----------------------------------------------------------------------------
Delete all data from the PIMS_BUSINESS_FUNCTION_CODE table and repopulate.
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
Author        Date         Comment
------------  -----------  -----------------------------------------------------
Doug Filteau  2021-Aug-24  Initial version
----------------------------------------------------------------------------- */

DELETE FROM PIMS_BUSINESS_FUNCTION_CODE
GO

INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PROJ MAN', 'PROJECT MANAGEMENT', '19991122 18:22:24.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('ENGINEER', 'ENGINEERING', '19991122 18:22:24.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('CONSTRUC', 'CONSTRUCTION', '19991122 18:22:24.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PROP ACQ', 'PROPERTY ACQUISITION', '19991122 18:22:24.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('ENVIRON', 'ENVIRONMENT', '19991122 18:22:24.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('COMMUN', 'COMMUNICATION', '19991122 18:22:24.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PLANNING', 'PLANNING', '20010330 16:06:17.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('IDC', 'INTEREST DURING CONSTRUCTION', '20020422 15:25:01.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('CORP SER', 'CORPORATE SERVICES', '20020422 15:26:59.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('MAINTNCE', 'MAINTENANCE', '20020521 13:20:09.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('EC INVES', 'ECONOMIC INVESTIGATION', '20020423 08:44:08.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PROC DEV', 'PROCESS DEVELOPMENT', '20020423 09:48:49.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('LEGAL', 'LEGAL', '20020423 09:59:41.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PROP SAL', 'PROPERTY SALES', '20020423 10:31:16.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('STAKEHLD', 'STAKEHOLDER CONSULT & LIASON', '20020621 15:11:57.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('FERRIES', 'FERRY SERVICES', '20020522 11:44:54.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('DEFAULT', 'CAS DOWNLOAD NULL VALUE', '20020815 17:10:43.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('CONTING', 'CONTINGENCY', '20030813 10:44:55.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PLANTRAF', 'PLANNING AND TRAFFIC', '20040422 12:32:53.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('CONSULT', 'CONSULTATION', '20040426 15:45:39.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('FIN ADMN', 'FINANCE AND ADMINISTRATION', '20040426 15:52:53.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PROCURE', 'PROCUREMENT', '20040426 16:04:36.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('TOLLING', 'TOLLING', '20040526 11:35:08.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('DATAROOM', 'DATAROOM', '20050412 11:23:40.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PROG DEV', 'PROGRAM DEVELOPMENT', '20050412 11:26:34.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('TDM', 'TRAFFIC DEMAND MANAGEMENT', '20050412 11:27:35.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('CON ADMN', 'CONTRACT ADMINISTRATION', '20050727 15:32:36.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('O&M RISK', 'O & M RISKS', '20050727 15:33:34.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('OLYMPIC', 'OLYMPIC OPERATIONS & MAINTNCE', '20050727 15:34:22.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('DBFO', 'DESIGN BUILD FINANCE OPERATING', '20051007 09:37:19.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('CVSE', 'COMMERCIAL VEHICLE SAF & ENFOR', '20051118 10:57:32.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('TRST ACQ', 'TRANSIT ACQUISITION', '20090817 09:40:29.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('TRNSLINK', 'TRANSLINK', '20090817 09:41:38.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('FEDGOVT', 'FEDERAL GOVERNMENT RECOVERIES', '20090731 10:55:16.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('BCTRAN', 'BC TRANSIT RECOVERIES', '20090817 09:42:18.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('FRST NTN', 'FIRST NATION', '20151201 10:47:59.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('EMBC', 'EMERGENCY MANAGEMENT BC', '20160311 11:14:29.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('DIR WRKS', 'DIRECT WORKS', '20200116 12:15:44.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('COVID19', 'COVID19', '20200408 14:36:56.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('MUNIGOVT', 'MUNICIPAL GOVERNMENT', '20170223 16:47:12.0');
INSERT INTO PIMS_BUSINESS_FUNCTION_CODE (CODE, DESCRIPTION, EFFECTIVE_DATE) VALUES('PCRMS', 'PROC,CONTRT,RISK MGMT SERV', '20191126 14:45:46.0');
GO