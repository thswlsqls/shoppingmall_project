
--order_details
CREATE TABLE order_details
(
    order_id                VARCHAR2(32)     NOT NULL, 
    delevery_requirement    VARCHAR2(255)    NULL, 
    delevery_address        VARCHAR2(255)    NOT NULL, 
    seller_phone            NUMBER           NULL, 
    delevery_status         VARCHAR2(45)     NOT NULL, 
    buyer_idx               VARCHAR2(36)     NOT NULL, 
    CONSTRAINT PK_order_details_id PRIMARY KEY (order_id),
    CONSTRAINT FK_order_id FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    CONSTRAINT FK_buyer_idx_order_details FOREIGN KEY (buyer_idx)
        REFERENCES member (member_idx)
);
/

CREATE INDEX IX_order_details_1
    ON order_details(order_id);
/

CREATE UNIQUE INDEX UQ_order_details_1
    ON order_details(order_id);
/

insert into order_details (order_id, delevery_address, delevery_status, buyer_idx) 
            values('32b8f59f195b4c7f9970737d285f9f6e', '서울특별시 중구 서소문로11길 24(서소문동)', '입금전', '5a1be4a512364cf1beee3e4b555c6d5e'); 
insert into order_details (order_id, delevery_address, delevery_status, buyer_idx)
            values('abcedd16b1dc49a89f562965e4f3fbb4', '서울특별시 중구 서소문로11길 24(서소문동)', '배송준비중', '5a1be4a512364cf1beee3e4b555c6d5e'); 
insert into order_details (order_id, delevery_address, delevery_status, buyer_idx)
            values('d7f86d74d89a4762aeaa944ef8de829d', '서울특별시 중구 남대문로 5(남대문로4가)', '배송중', '139efe026f1145c3be25db834c01ed42'); 
insert into order_details (order_id, delevery_address, delevery_status, buyer_idx) 
            values('cc5dd9c71e504cafb2d33611d91d5fdf', '서울특별시 중구 남대문로 5(남대문로4가)', '배송완료', '139efe026f1145c3be25db834c01ed42'); 
/
drop table order_details;
select * from order_details;
