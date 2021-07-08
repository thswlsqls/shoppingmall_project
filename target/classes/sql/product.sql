--product
CREATE TABLE product
(
    product_id                  VARCHAR2(32)     NOT NULL, 
    product_seller_id           VARCHAR2(32)     NOT NULL, 
    product_category            VARCHAR2(500)    NOT NULL, 
    product_brand               VARCHAR2(255)    NULL, 
    product_name                VARCHAR2(255)    NOT NULL,
    product_discount_rate       NUMBER           NOT NULL, 
    product_normal_price        NUMBER           NOT NULL, 
    product_sale_price          NUMBER           NOT NULL,
    product_file_1              VARCHAR2(500)    NULL, 
    product_recommend_counts    NUMBER           DEFAULT 0 NOT NULL, 
    product_stock_counts        NUMBER           DEFAULT 100 NOT NULL, 
    product_score               NUMBER           DEFAULT 5 NOT NULL, 
    CONSTRAINT product_id PRIMARY KEY (product_id),
    CONSTRAINT FK_product_seller_id FOREIGN KEY (product_seller_id)
        REFERENCES admin (admin_id)
);

insert into product (product_id, product_seller_id, product_category, product_brand, product_name, product_discount_rate, product_normal_price, product_sale_price) 
            values('24ee0193badb48f49e17096960f458ca', '760e3cd7f050432282790b4f87cda83a', 'hygiene', '흡수혁명', '흡수혁명 애견패드 소형 50매', 25, 12000, 9000); 
insert into product (product_id, product_seller_id, product_category, product_brand, product_name, product_discount_rate, product_normal_price, product_sale_price) 
            values('de3724de59394581837c87b174a201a7', '760e3cd7f050432282790b4f87cda83a', 'health', '네츄럴코어', '네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg', 4, 45000, 43000); 
insert into product (product_id, product_seller_id, product_category, product_brand, product_name, product_discount_rate, product_normal_price, product_sale_price) 
            values('9ce20e66f53e4c08bbdeacb4844a70ad', '760e3cd7f050432282790b4f87cda83a', 'snack', 'JHPet', '카리에스 덴탈껌 6개입', 25, 2500, 1600); 
insert into product (product_id, product_seller_id, product_category, product_brand, product_name, product_discount_rate, product_normal_price, product_sale_price) 
            values('6bea2df9c3074e1c91e0b43d8c193dd5', '760e3cd7f050432282790b4f87cda83a', 'snack', '도모다찌', '도모다찌 고구마 사사미 380g', 60, 8000, 3200); 


insert into product (product_id, product_seller_id, product_category, product_brand, product_name, product_discount_rate, product_normal_price, product_sale_price) 
            values('15cfb9f557e645678220d467c75c6038', '760e3cd7f050432282790b4f87cda83a', 'snack', '페페로니', '페페로니 진짜 오메가3 연어 180g', 11, 5500, 4900); 
insert into product (product_id, product_seller_id, product_category, product_brand, product_name, product_discount_rate, product_normal_price, product_sale_price) 
            values('aefdae3eb160447c8c4bca912d0c06b7', '760e3cd7f050432282790b4f87cda83a', 'snack', '네츄럴코어', '네츄럴코어 하루유산균 혼합 12개입', 20, 5000, 4000); 
insert into product (product_id, product_seller_id, product_category, product_brand, product_name, product_discount_rate, product_normal_price, product_sale_price) 
            values('06361df3f54c4b72aecf3b2765c78f96', '760e3cd7f050432282790b4f87cda83a', 'snack', '구루머스', '구루머스 치킨 우유껌 7개입', 7, 1400, 1500); 
insert into product (product_id, product_seller_id, product_category, product_brand, product_name, product_discount_rate, product_normal_price, product_sale_price) 
            values('546af01d1fd74bf8b8f518f210f234ee', '760e3cd7f050432282790b4f87cda83a', 'snack', '페페로니', '페페로니 진짜 오메가3 소고기 180g', 11, 5500, 4900); 



CREATE INDEX IX_product_1
    ON product(product_id, product_seller_id);
/
CREATE UNIQUE INDEX UQ_product_1
    ON product(product_id);
/

drop table product;

select * from product;

