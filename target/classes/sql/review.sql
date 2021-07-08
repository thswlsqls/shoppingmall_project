--review
CREATE TABLE review
(
    review_id           VARCHAR2(32)      NOT NULL, 
    review_writer_idx    VARCHAR2(32)      NOT NULL, 
    review_title        VARCHAR(255)      NOT NULL, 
    review_content      VARCHAR2(4000)    NOT NULL, 
    product_score       NUMBER            NOT NULL, 
    product_id     VARCHAR2(32)      NOT NULL,
    product_name        VARCHAR2(255)     NOT NULL, 
    product_file_1      VARCHAR2(500)     NULL, 
    product_file_2      VARCHAR2(500)     NULL, 
    product_file_3      VARCHAR2(500)     NULL, 
    product_file_4      VARCHAR2(500)     NULL, 
    product_file_5      VARCHAR2(500)     NULL, 
    CONSTRAINT PK_review_id PRIMARY KEY (review_id),
    CONSTRAINT FK_review_writer_idx FOREIGN KEY (review_writer_idx)
        REFERENCES member (member_idx),
    CONSTRAINT FK_review_product_id FOREIGN KEY (product_id)
        REFERENCES product (product_id)
);

CREATE INDEX IX_review_1
    ON review(review_id, review_writer_idx, product_id);
/
CREATE UNIQUE INDEX UQ_review_1
    ON review(review_id);
/
select * from review;
drop table review;
