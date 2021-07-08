CREATE TABLE qna_A
(
    answer_id             VARCHAR2(36)      NOT NULL, 
    question_id           VARCHAR2(36)      NOT NULL, 
    answer_writer_id      VARCHAR2(36)      NOT NULL, 
    answer_title          VARCHAR(255)      NOT NULL, 
    answer_content        VARCHAR2(4000)    NOT NULL, 
    answer_create_date    DATE              NOT NULL, 
    answer_views          NUMBER            NULL, 
    CONSTRAINT PK_qna_A PRIMARY KEY (answer_id)
)
/

COMMENT ON TABLE qna_A IS '판매자 답변'
/

COMMENT ON COLUMN qna_A.answer_id IS '답변 아이디'
/

COMMENT ON COLUMN qna_A.question_id IS '질문 아이디'
/

COMMENT ON COLUMN qna_A.answer_writer_id IS '답변 작성자 아이디'
/

COMMENT ON COLUMN qna_A.answer_title IS '답변 제목'
/

COMMENT ON COLUMN qna_A.answer_content IS '답변 내용'
/

COMMENT ON COLUMN qna_A.answer_create_date IS '답변 생성 날짜'
/

COMMENT ON COLUMN qna_A.answer_views IS '답변 조회수'
/

CREATE INDEX IX_qna_A_1
    ON qna_A(answer_id, question_id, answer_writer_id)
/

CREATE UNIQUE INDEX UQ_qna_A_1
    ON qna_A(answer_id)
/

ALTER TABLE qna_A
    ADD CONSTRAINT FK_qna_A_question_id_qna_Q_que FOREIGN KEY (question_id)
        REFERENCES qna_Q (question_id)
/

ALTER TABLE qna_A
    ADD CONSTRAINT FK_qna_A_answer_writer_id_memb FOREIGN KEY (answer_writer_id)
        REFERENCES member (member_idx)
/