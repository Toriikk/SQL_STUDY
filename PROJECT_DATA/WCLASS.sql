--DROP TABLE WCLASS;

CREATE TABLE WCLASS (
    CLASSNUM NUMBER(4) NOT NULL PRIMARY KEY,
    CLASSNAME VARCHAR2(1000),
    STU_NUM NUMBER(4),
    STU_REGDATE DATE DEFAULT SYSDATE,
    TOPIC VARCHAR2(2000),
    CONTENT VARCHAR2(3000),
    CLEVEL VARCHAR2(2000),
    UPLOADFILE VARCHAR2(20)
);

CREATE SEQUENCE WCLASS_SEQ START WITH 1;

SELECT * FROM WCLASS;

COMMIT;    