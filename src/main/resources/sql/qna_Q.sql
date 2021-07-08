CREATE TABLE qna_Q
(
    question_id             VARCHAR2(36)      NOT NULL, 
    question_writer_id      VARCHAR2(36)      NOT NULL, 
    product_post_id         VARCHAR2(36)      NOT NULL, 
    question_title          VARCHAR(255)      NOT NULL, 
    question_content        VARCHAR2(4000)    NOT NULL, 
    question_create_date    DATE              NOT NULL, 
    question_views          NUMBER            NULL, 
    CONSTRAINT PK_qna_Q PRIMARY KEY (question_id)
)
/

COMMENT ON TABLE qna_Q IS '구매자 질문'
/

COMMENT ON COLUMN qna_Q.question_id IS '질문 아이디'
/

COMMENT ON COLUMN qna_Q.question_writer_id IS '질문 작성자 아이디'
/

COMMENT ON COLUMN qna_Q.product_post_id IS '상품 게시글 아이디'
/

COMMENT ON COLUMN qna_Q.question_title IS '질문 제목'
/

COMMENT ON COLUMN qna_Q.question_content IS '질문 내용'
/

COMMENT ON COLUMN qna_Q.question_create_date IS '질문 생성 날짜'
/

COMMENT ON COLUMN qna_Q.question_views IS '질문 조회수'
/

CREATE INDEX IX_qna_Q_1
    ON qna_Q(question_id, question_writer_id, product_post_id)
/

CREATE UNIQUE INDEX UQ_qna_Q_1
    ON qna_Q(question_id)
/

ALTER TABLE qna_Q
    ADD CONSTRAINT FK_qna_Q_product_post_id_produ FOREIGN KEY (product_post_id)
        REFERENCES product_post (product_post_id)
/

ALTER TABLE qna_Q
    ADD CONSTRAINT FK_qna_Q_question_writer_id_me FOREIGN KEY (question_writer_id)
        REFERENCES member (member_idx)
/