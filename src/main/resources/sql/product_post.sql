--product_post
CREATE TABLE product_post
(
    product_post_id             VARCHAR2(36)      NOT NULL, 
    product_id                  VARCHAR2(36)      NOT NULL, 
    product_post_title          VARCHAR2(255)     NOT NULL, 
    product_post_description    VARCHAR2(4000)    NOT NULL, 
    product_post_create_date    DATE              DEFAULT SYSDATE NOT NULL, 
    product_post_update_date    DATE              NULL, 
    sell_counts                 NUMBER            DEFAULT 0, 
    product_file_1              VARCHAR2(500)     NULL, 
    product_file_2              VARCHAR2(500)     NULL, 
    product_file_3              VARCHAR2(500)     NULL, 
    CONSTRAINT PK_product_post_id PRIMARY KEY (product_post_id),
    CONSTRAINT FK_product_id FOREIGN KEY (product_id)
        REFERENCES product (product_id)
);

insert into product_post (product_post_id, product_id, product_post_title, product_post_description) values('37c8f25f072f406ca88edfba80089d68', '24ee0193badb48f49e17096960f458ca', '흡수혁명 애견패드 소형 50매', '흡수혁명 패드는 도톰해진 파워 흡수층으로 여러 번 배변해도 흐르거나 바닥에 묻지 않으며, 다이아몬드 엠보싱이 액체가 흐르는 길을 만들어 흘러내리기 전에 빠르게 흡수시켜 줍니다. 또한, 넓어진 흡수면적으로 배변이 패드의 주변으로 튀거나 흘러내림을 방지하며, 강아지에게 거부반응 없는 배변유도제를 함유하여 강아지의 배변 훈련을 도와줍니다. 입자 분사처리 된 기분 좋은 베이비 파우더향이 배변시 발생되어 쾌적한 실내환경을 유지시켜주며, 안전성이 입증된 공산품에 대해 정부에서 확인해주는 한국 제품 안전마크인 자율안전확인 인증을 받은 제품입니다. 패드는 여름, 혹은 겨울이 지나면 습도에 의해 사용이 불가능한 경우가 생길 수 있으니 개봉 후 6개월 안에 사용하시는 것을 권장 드립니다.'); 
insert into product_post (product_post_id, product_id, product_post_title, product_post_description) values('438bb562958c486eb77dedec22e1301c', 'de3724de59394581837c87b174a201a7', '네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg', '네츄럴코어 홀리스틱 베네 M32 멀티프로테인은 최적의 영양밸런스를 자랑하는 사료이며, 뼈를 발라낸 국내산 오리고기, 닭살코기 분말 등 양질의 단백질원을 함유하여 강아지에게 필요한 양질의 단백질을 풍부하게 제공해주며, 아스타잔틴이 함유된 사료로 키운 오리고기는 면역력과 항산화 기능을 향상시키고 스트레스 및 눈의 피로를 감소시켜 줍니다. 비타민나무로 불리는 씨벅턴은 사과의 200~800배의 비타민을 함유하고 있으며 비타민A, C가 동시에 포함된 유일한 과실로 강력한 항산화 효과뿐아니라 각종 영양소의 신진대사율을 높여 비만 예방과 심혈관 질환 예방에 도움을 줍니다. 씨눈을 제거하지 않은 유기농 통곡물은 수용성 섬유소와 다양한 비타민 및 미네랄이 함유되어 있어 장기능 개선과 체내 밸런스 유지 및 심혈관 질환 예방에 도움을 줍니다. 또한, 안토시아닌이 풍부하게 함유된 블루베리는 눈의 건강을 지켜주고, 항산화 효과 및 심혈관 개선에 도움을 주고, 유익균 발효 추출물과 장내 유익균의 먹이가 되는 키토산 올리고당과 알긴산 올리고당의 배합으로 소화기능 개선 및 설사예방 변냄새 개선에 효과적이며, 키토산 올리고당의 영향으로 변이 검게 나올 수 있습니다. 유기농 원료는 천연 항산화 물질인 폴리페놀이 다량 함유되어 있어 각종 질병과 노화의 원인이 되는 활성산소로부터 건강한 세포를 보호해 줍니다. 원료가 생산, 재배되는 농장과, 양축장에서 출하되어 완제품이 생산되는 전 과정을 관리 감독하여 미국USDA, 유럽ECOCERT에서 매년 인증서를 발급해주며 농약, 화학비료, 인공색소, 방부제 및 GMO로부터 안전합니다. 내추럴코어는 엄선된 유기농 원료와 깐깐한 공정으로 안전한 먹거리를 생산하며, 각각 원료의 특성에 맞게 1차 가공한 원료로 씨앗에서 재료가 되기까지 철저한 이력관리가 이루어지고 있습니다. 또한, 교차 오염을 방지하기 위해 생산공장은 도로로 부터 멀리 떨어진 곳에 자리하고 있으며 생산 후 즉시 출하 됨으로 갓 구워낸 신선한 제품을 공급합니다. 질소 충전 포장으로 산소와의 접촉을 취대한 줄였으며, 400g씩 15개로 낱개 소포장으로 보관이 용이합니다.'); 
insert into product_post (product_post_id, product_id, product_post_title, product_post_description) values('2e846ac9f85c4781905b753835dd3bab', '9ce20e66f53e4c08bbdeacb4844a70ad', '카리에스 덴탈껌 6개입', '카리에스 먹는치약은 먹는 타입의 치약으로 치아에 끼어있는 이물질을 분리시키는 작용과 동시에 치석등을 끌어내는 힘을 가지고 있는 제품이며 고단백, 저지방, 칼슘 첨가로 튼튼한 뼈와 골격을 유지시켜 주고 애견의 입냄새, 씹는 본능 스트레스 해소를 충족시켜 줍니다. 되도록 오래 씹을 수 있도록 해주시고, 너무 작게 잘라서 급여하는 경우 꿀꺽 삼켜버려 효과가 감소되므로 애견의 연령 및 크기에 따라 도구를 이용하여 잘라서 급여해 주시기 바랍니다.'); 
insert into product_post (product_post_id, product_id, product_post_title, product_post_description) values('09eb65010f4c44329b6d9bada837307e', '6bea2df9c3074e1c91e0b43d8c193dd5', '도모다찌 고구마 사사미 380g', '도모다찌 고구마 사사미는 애견들의 균형있는 발육을 위해 꼭 필요한 영양소를 엄격한 과정을 통해 선별, 배합하여 뛰어난 기호성과 맛을 자랑하는 최고급 영양 간식입니다. 신선한 닭고기를 주원료로 하여 단백질, 비타민, 미네랄, 칼슘이 풍부하게 함유되어 있습니다. 고단백, 저지방의 영양 간식으로 발육 촉진, 변냄새 억제 및 골격 형성, 모질 개선에 효과가 뛰어나며 애견의 부족한 영양을 채워줍니다. 자연건조 과정에서 상품마다 건조상태가 다를 수 있으며, 직사광선 및 고온 다습한 장소를 피하여 보관해 주시기 바랍니다.'); 

select * from product_post;
drop table product_post;
