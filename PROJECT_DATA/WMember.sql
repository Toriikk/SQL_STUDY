--DROP TABLE WMEMBER CASCADE CONSTRAINTS;

CREATE TABLE WMEMBER (
	NUM NUMBER NOT NULL PRIMARY KEY,
	NAME VARCHAR2(50),
	USERID VARCHAR2(50),
	PWD VARCHAR2(50),
	EMAIL VARCHAR2(50),
	ADDRESS VARCHAR2(1000),
	CLASSNUM NUMBER(4),
	REG_DATE VARCHAR2(20),
	POSTCODE NUMBER(5),
	DETAILADDRESS VARCHAR2(1000),
	EXTRAADDRESS VARCHAR2(1000),
	ADMIN NUMBER,
	FOREIGN KEY (CLASSNUM)
    REFERENCES WCLASS(CLASSNUM)
	ON DELETE CASCADE
);

COMMIT;