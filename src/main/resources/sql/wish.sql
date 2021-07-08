
CREATE TABLE wish
(
    wish_id             VARCHAR2(32)     NOT NULL, 
    buyer_idx           VARCHAR2(32)     NOT NULL, 
    wish_name           VARCHAR2(255)    NOT NULL, 
    wish_counts         NUMBER           NOT NULL, 
    wish_total_price    NUMBER           NOT NULL, 
    CONSTRAINT PK_wish_id PRIMARY KEY (wish_id),
    CONSTRAINT FK_wish_wish_id FOREIGN KEY (wish_id)
        REFERENCES product (product_id),
    CONSTRAINT FK_wish_buyer_idx FOREIGN KEY (buyer_idx)
        REFERENCES member (member_idx)
);

insert into wish (wish_id, buyer_idx, wish_name, wish_counts, wish_total_price) 
            values('15cfb9f557e645678220d467c75c6038', '5a1be4a512364cf1beee3e4b555c6d5e', '페페로니 진짜 오메가3 연어 180g', 2, 9800); 
insert into wish (wish_id, buyer_idx, wish_name, wish_counts, wish_total_price) 
            values('aefdae3eb160447c8c4bca912d0c06b7', '5a1be4a512364cf1beee3e4b555c6d5e', '네츄럴코어 하루유산균 혼합 12개입', 3, 12000); 
insert into wish (wish_id, buyer_idx, wish_name, wish_counts, wish_total_price) 
            values('06361df3f54c4b72aecf3b2765c78f96', '139efe026f1145c3be25db834c01ed42', '구루머스 치킨 우유껌 7개입', 2, 2800);
insert into wish (wish_id, buyer_idx, wish_name, wish_counts, wish_total_price) 
            values('546af01d1fd74bf8b8f518f210f234ee', '139efe026f1145c3be25db834c01ed42', '페페로니 진짜 오메가3 소고기 180g', 2, 9800); 


CREATE INDEX IX_wish_1
    ON wish(wish_id, buyer_idx);
/

CREATE UNIQUE INDEX UQ_wish_1
    ON wish(wish_id);
/

drop table wish;
select * from wish;

