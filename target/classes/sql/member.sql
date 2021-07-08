CREATE TABLE member
(
    member_idx            VARCHAR2(36)     NOT NULL, 
    member_name           VARCHAR2(255)    NOT NULL, 
    member_email          VARCHAR2(45)     NOT NULL, 
    member_password       VARCHAR2(255)    NOT NULL, 
    member_role           VARCHAR2(45)     NOT NULL, 
    member_address        VARCHAR2(255)    NOT NULL, 
    member_address2       VARCHAR2(255)    NULL, 
    member_create_date    DATE             NOT NULL, 
    member_mileage        NUMBER           NULL, 
    member_point          NUMBER           NULL, 
    member_id             VARCHAR2(36)     NOT NULL, 
    member_phone          VARCHAR2(45)     NOT NULL, 
    member_sessionId      VARCHAR2(45)     NOT NULL, 
    member_limitTime      DATE             NOT NULL, 
    CONSTRAINT PK_member PRIMARY KEY (member_idx)
);
/

COMMENT ON TABLE member IS '회원'
/

COMMENT ON COLUMN member.member_idx IS '회원 인덱스'
/

COMMENT ON COLUMN member.member_name IS '회원 이름'
/

COMMENT ON COLUMN member.member_email IS '회원 이메일'
/

COMMENT ON COLUMN member.member_password IS '회원 비밀번호'
/

COMMENT ON COLUMN member.member_role IS '회원 역할'
/

COMMENT ON COLUMN member.member_address IS '회원 주소'
/

COMMENT ON COLUMN member.member_create_date IS '회원 생성 날짜'
/

COMMENT ON COLUMN member.member_mileage IS '회원 적립금'
/

COMMENT ON COLUMN member.member_point IS '회원 포인트'
/

COMMENT ON COLUMN member.member_id IS '회원 아이디'
/

COMMENT ON COLUMN member.member_phone IS '회원 전화번호'
/

COMMENT ON COLUMN member.member_sessionId IS '회원 세션아이디'
/

COMMENT ON COLUMN member.member_limitTime IS '회원 만료시간'
/

CREATE INDEX IX_member_1
    ON member(member_idx)
/

CREATE UNIQUE INDEX UQ_member_1
    ON member(member_idx)
/