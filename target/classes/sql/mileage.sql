--mileage
CREATE TABLE mileage
(
    mileage_id           VARCHAR2(32)      NOT NULL, 
    member_idx           VARCHAR2(32)      NOT NULL, 
    order_id             VARCHAR2(32)      NOT NULL, 
    mileage_status       VARCHAR2(45)      NOT NULL, 
    mileage_details      VARCHAR2(4000)    NULL, 
    order_create_date    DATE              NOT NULL, 
     PRIMARY KEY (mileage_id),
     CONSTRAINT FK_mileage_member_idx FOREIGN KEY (member_idx)
        REFERENCES member (member_idx),
     CONSTRAINT FK_mileage_order_id FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
);

insert into mileage (mileage_id, member_idx, order_id, mileage_status, mileage_details, order_create_date) 
            values('3f25c7ca8b9a4bf7a39ba497618aad65', '5a1be4a512364cf1beee3e4b555c6d5e', '32b8f59f195b4c7f9970737d285f9f6e', '사용가능', '기본적립금', to_date('20210701', 'YYYY-MM-DD')); 
insert into mileage (mileage_id, member_idx, order_id, mileage_status, mileage_details, order_create_date) 
            values('8a245ee73d28446db7e6e9f62631a6b3', '5a1be4a512364cf1beee3e4b555c6d5e', 'abcedd16b1dc49a89f562965e4f3fbb4', '사용됨', '기본적립금', to_date('20210701', 'YYYY-MM-DD')); 
insert into mileage (mileage_id, member_idx, order_id, mileage_status, mileage_details, order_create_date) 
            values('c81d0b178a5d4eebbc4c31f9cd1a0d88', '139efe026f1145c3be25db834c01ed42', 'd7f86d74d89a4762aeaa944ef8de829d', '미가용', '기본적립금', to_date('20210701', 'YYYY-MM-DD'));
insert into mileage (mileage_id, member_idx, order_id, mileage_status, mileage_details, order_create_date)
            values('c0e348b0f34f4b8ea5d51800a7905701', '139efe026f1145c3be25db834c01ed42', 'cc5dd9c71e504cafb2d33611d91d5fdf', '환불예정', '기본적립금', to_date('20210701', 'YYYY-MM-DD')); 

CREATE INDEX IX_mileage_1
    ON mileage(mileage_id, order_id, member_idx);
/

CREATE UNIQUE INDEX UQ_mileage_1
    ON mileage(mileage_id, order_id, member_idx);
/
select * from mileage;
drop table mileage;