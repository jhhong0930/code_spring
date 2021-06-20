DROP TABLE HOTEL;
DROP TABLE RESERVATION;
DROP TABLE USER;
DROP TABLE GRADE;

CREATE TABLE HOTEL (
   HOTEL_NO        int    AUTO_INCREMENT PRIMARY KEY NOT NULL       COMMENT '호텔 번호',
   HOTEL_NAME      varchar(50)                           NULL       COMMENT '호텔 이름',
   HOTEL_LEVEL     int                                   NULL       COMMENT '호텔 등급',
   HOTEL_ADDRESS   varchar(200)                          NULL       COMMENT '호텔 주소',
   HOTEL_PHONE     char(11)                              NULL       COMMENT '호텔 연락처'
);

CREATE TABLE RESERVATION (
    REV_NO     int AUTO_INCREMENT NOT NULL    PRIMARY KEY                COMMENT '예약 번호',
    HOTEL_NO   int                NOT NULL                               COMMENT '호텔 번호',
    USER_NO    int                NOT NULL                               COMMENT '회원 번호',
    REV_DATE   datetime               NULL    DEFAULT current_timestamp  COMMENT '예약 날짜',
    IN_DATE    datetime               NULL    DEFAULT current_timestamp  COMMENT '체크인 날짜',
    OUT_DATE   datetime               NULL    DEFAULT current_timestamp  COMMENT '체크아웃 날짜'
);
CREATE TABLE USER (
    USER_NO      int AUTO_INCREMENT NOT NULL PRIMARY KEY                COMMENT '회원 번호',
    USER_ID      varchar(50)            NULL                            COMMENT '회원 아이디',
    USER_PWD     varchar(50)            NULL                            COMMENT '회원 비밀번호',
    USER_NAME    varchar(50)            NULL                            COMMENT '회원명',
    USER_PHONE   char(11)               NULL                            COMMENT '회원 연락처',
    USER_EMAIL   varchar(100)           NULL                            COMMENT '회원 이메일',
    ENROLL_DATE  datetime               NULL DEFAULT current_timestamp  COMMENT '회원 가입일',
    STATUS       char(1)                NULL DEFAULT 'Y'                COMMENT '상태(Y/N)',
    GRADE_NO     int                NOT NULL DEFAULT 1                  COMMENT '회원 등급'
);

CREATE TABLE GRADE (
    GRADE_NO      int PRIMARY KEY NOT NULL COMMENT '등급 번호',
    GRADE_TITLE   varchar(50)         NULL COMMENT '등급명'
);

ALTER TABLE RESERVATION ADD FOREIGN KEY (HOTEL_NO) REFERENCES HOTEL (HOTEL_NO);
ALTER TABLE RESERVATION ADD FOREIGN KEY (USER_NO) REFERENCES USER (USER_NO);
ALTER TABLE USER ADD FOREIGN KEY (GRADE_NO) REFERENCES GRADE (GRADE_NO);