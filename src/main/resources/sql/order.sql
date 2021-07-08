--orders
CREATE TABLE orders
(
    order_id              VARCHAR2(32)     NOT NULL, 
    buyer_idx             VARCHAR2(32)     NOT NULL, 
    order_product_id      VARCHAR2(32)     NOT NULL, 
    order_counts          NUMBER           NOT NULL, 
    order_create_date     DATE             DEFAULT SYSDATE NOT NULL,
    total_price           NUMBER           NOT NULL, 
    payment               VARCHAR2(255)    NULL, 
    order_product_name    VARCHAR2(255)    NOT NULL, 
    CONSTRAINT PK_order_id PRIMARY KEY (order_id),
    CONSTRAINT FK_buyer_idx FOREIGN KEY (buyer_idx)
        REFERENCES member (member_idx),
    CONSTRAINT FK_order_product_id FOREIGN KEY (order_product_id)
        REFERENCES product (product_id)
);
/

insert into orders (order_id, buyer_idx, order_product_id, order_counts, total_price, order_product_name) 
            values('32b8f59f195b4c7f9970737d285f9f6e', '5a1be4a512364cf1beee3e4b555c6d5e', '24ee0193badb48f49e17096960f458ca', 2, 18000, '흡수혁명 애견패드 소형 50매'); 
insert into orders (order_id, buyer_idx, order_product_id, order_counts, total_price, order_product_name) 
            values('abcedd16b1dc49a89f562965e4f3fbb4', '5a1be4a512364cf1beee3e4b555c6d5e', 'de3724de59394581837c87b174a201a7', 1, 43000, '네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg'); 
insert into orders (order_id, buyer_idx, order_product_id, order_counts, total_price, order_product_name)
            values('d7f86d74d89a4762aeaa944ef8de829d', '139efe026f1145c3be25db834c01ed42', '9ce20e66f53e4c08bbdeacb4844a70ad', 5, 8000, '카리에스 덴탈껌 6개입'); 
insert into orders (order_id, buyer_idx, order_product_id, order_counts, total_price, order_product_name) 
            values('cc5dd9c71e504cafb2d33611d91d5fdf', '139efe026f1145c3be25db834c01ed42', '6bea2df9c3074e1c91e0b43d8c193dd5', 3, 9600, '도모다찌 고구마 사사미 380g'); 

drop table orders;
select * from orders;

CREATE INDEX IX_orders_1
    ON orders(order_id, buyer_id, order_product_id);
/

CREATE UNIQUE INDEX UQ_orders_1
    ON orders(order_id);
/

select * from orders;
drop table orders;

