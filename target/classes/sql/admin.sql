CREATE TABLE admin
(
    admin_id          VARCHAR2(36)     NOT NULL, 
    admin_email       VARCHAR2(45)     NOT NULL, 
    admin_password    VARCHAR2(255)    NOT NULL, 
    admin_name        VARCHAR2(255)    NOT NULL, 
    CONSTRAINT PK_blog_author PRIMARY KEY (admin_id)
)
/

COMMENT ON TABLE admin IS '저자에 관한 정보를 저장하는 테이블'
/

COMMENT ON COLUMN admin.admin_id IS '아이디는 번호로 구성'
/

COMMENT ON COLUMN admin.admin_email IS '실제 이름이 아니라 닉네임 같은 이름'
/

COMMENT ON COLUMN admin.admin_password IS '실제 이름'
/

COMMENT ON COLUMN admin.admin_name IS '실제 이름'
/

CREATE INDEX IX_admin_1
    ON admin(admin_id)
/

CREATE UNIQUE INDEX UQ_admin_1
    ON admin(admin_id)
/