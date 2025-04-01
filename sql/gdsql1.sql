use dev_realtime_v2_danyu_shi;

show tables ;

drop table dev_realtime_v2_danyu_shi.ods_product_visit_detail;
CREATE TABLE dev_realtime_v2_danyu_shi.ods_product_visit_detail (
  id int,
  visit_id STRING COMMENT '访问ID',
  user_id STRING COMMENT '用户ID',
  shop_id STRING COMMENT '店铺ID',
  product_id STRING COMMENT '商品ID',
  visit_time STRING COMMENT '访问时间',
  exit_time STRING COMMENT '离开时间',
  page_stay_duration INT COMMENT '页面停留时长(秒)',
  is_bounce int COMMENT '是否跳出(1是0否)',
  device_type STRING COMMENT '设备类型',
  channel STRING COMMENT '访问渠道',
  ip_address STRING COMMENT 'IP地址',
  province STRING COMMENT '省份',
  city STRING COMMENT '城市'
)COMMENT '商品访问明细表'
PARTITIONED BY (ds STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
TBLPROPERTIES (
    "orc.compress"="SNAPPY"
    );

INSERT INTO TABLE ods_product_visit_detail PARTITION(ds='20250329')
VALUES
    (1, 'visit001', 'user1001', 'shop001', 'prod1001', '2023-06-01 09:15:23', '2023-06-01 09:18:45', 202, 0, 'iOS', 'app', '192.168.1.1', '浙江省', '杭州市'),
    (2, 'visit002', 'user1002', 'shop001', 'prod1001', '2023-06-01 10:30:12', '2023-06-01 10:30:45', 33, 1, 'Android', 'wap', '192.168.1.2', '江苏省', '南京市'),
    (3, 'visit003', 'user1003', 'shop002', 'prod2002', '2023-06-01 11:45:30', '2023-06-01 11:50:15', 285, 0, 'iOS', 'wechat', '192.168.1.3', '广东省', '广州市'),
    (4, 'visit004', 'user1004', 'shop002', 'prod2002', '2023-06-02 08:20:18', '2023-06-02 08:25:30', 312, 0, 'Android', 'app', '192.168.1.4', '北京市', '北京市'),
    (5, 'visit005', 'user1005', 'shop003', 'prod3003', '2023-06-02 13:15:42', '2023-06-02 13:16:50', 68, 1, 'iOS', 'pc', '192.168.1.5', '上海市', '上海市'),
    (6, 'visit006', 'user1006', 'shop003', 'prod3003', '2023-06-02 15:30:25', '2023-06-02 15:35:40', 315, 0, 'Android', 'app', '192.168.1.6', '四川省', '成都市'),
    (7, 'visit007', 'user1007', 'shop004', 'prod4004', '2023-06-03 10:10:10', '2023-06-03 10:15:25', 315, 0, 'iOS', 'app', '192.168.1.7', '湖北省', '武汉市'),
    (8, 'visit008', 'user1008', 'shop004', 'prod4004', '2023-06-03 14:45:33', '2023-06-03 14:45:58', 25, 1, 'Android', 'wap', '192.168.1.8', '陕西省', '西安市'),
    (9, 'visit009', 'user1009', 'shop005', 'prod5005', '2023-06-03 16:30:47', '2023-06-03 16:35:12', 265, 0, 'iOS', 'wechat', '192.168.1.9', '湖南省', '长沙市'),
    (10, 'visit010', 'user1010', 'shop005', 'prod5005', '2023-06-03 18:20:15', '2023-06-03 18:21:30', 75, 1, 'Android', 'app', '192.168.1.10', '福建省', '厦门市');

select *
from ods_product_visit_detail;

drop table dev_realtime_v2_danyu_shi.ods_product_favorite_cart;
CREATE TABLE dev_realtime_v2_danyu_shi.ods_product_favorite_cart (
  id int,
  operation_id STRING COMMENT '操作ID',
  user_id STRING COMMENT '用户ID',
  shop_id STRING COMMENT '店铺ID',
  product_id STRING COMMENT '商品ID',
  operation_type int COMMENT '操作类型(1收藏2加购3取消收藏4取消加购)',
  operation_time STRING COMMENT '操作时间',
  quantity INT DEFAULT 1 COMMENT '数量(加购时有效)'
)COMMENT '商品收藏加购明细表'
PARTITIONED BY (ds STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
TBLPROPERTIES (
    "orc.compress"="SNAPPY"
    );


INSERT INTO TABLE dev_realtime_v2_danyu_shi.ods_product_favorite_cart PARTITION(ds='20250329')
VALUES
    (1, 'fav20230601001', 'user1001', 'shop001', 'prod1001', 1, '2023-06-01 09:15:22', 1),
    (2, 'cart20230601001', 'user1002', 'shop001', 'prod1001', 2, '2023-06-01 11:30:45', 2),
    (3, 'fav20230601002', 'user1003', 'shop002', 'prod2002', 1, '2023-06-01 14:20:33', 1),
    (4, 'cart20230601002', 'user1004', 'shop002', 'prod2002', 2, '2023-06-01 16:45:18', 1),
    (5, 'fav20230602001', 'user1005', 'shop003', 'prod3003', 1, '2023-06-02 10:05:12', 1),
    (6, 'cart20230602001', 'user1001', 'shop001', 'prod1001', 2, '2023-06-02 13:15:47', 3),
    (7, 'unfav20230602001', 'user1002', 'shop001', 'prod1001', 3, '2023-06-02 15:30:22', 1),
    (8, 'uncart20230602001', 'user1003', 'shop002', 'prod2002', 4, '2023-06-02 17:45:39', 1),
    (9, 'fav20230603001', 'user1006', 'shop003', 'prod3003', 1, '2023-06-03 09:20:15', 1),
    (10, 'cart20230603001', 'user1007', 'shop004', 'prod4004', 2, '2023-06-03 14:35:28', 2);
select *
from dev_realtime_v2_danyu_shi.ods_product_favorite_cart;

drop table dev_realtime_v2_danyu_shi.ods_product_order_transaction;
CREATE TABLE dev_realtime_v2_danyu_shi.ods_product_order_transaction (
 id int,
 order_id STRING COMMENT '订单ID',
 user_id STRING COMMENT '用户ID',
 shop_id STRING COMMENT '店铺ID',
 product_id STRING COMMENT '商品ID',
 order_time STRING COMMENT '下单时间',
 payment_time STRING COMMENT '支付时间',
 refund_time STRING COMMENT '退款时间',
 order_status int COMMENT '订单状态(1待付款2已付款3已发货4已完成5已取消6已退款)',
 quantity INT COMMENT '商品数量',
 price double COMMENT '商品单价',
 amount double COMMENT '订单金额',
 payment_amount double COMMENT '实际支付金额',
 refund_amount double COMMENT '退款金额',
 is_first_order int COMMENT '是否首单(1是0否)',
 coupon_amount double COMMENT '优惠券金额'
)PARTITIONED BY (ds STRING)
STORED as ORC
TBLPROPERTIES ("orc.compress"="SNAPPY");

INSERT INTO TABLE dev_realtime_v2_danyu_shi.ods_product_order_transaction PARTITION(ds='20250329')
VALUES
    (1, 'order230601001', 'user1001', 'shop001', 'prod1001', '2023-06-01 10:15:23', '2023-06-01 10:16:05', NULL, 2, 1, 399.00, 399.00, 379.00, 0.00, 0, 20.00),
    (2, 'order230601002', 'user1002', 'shop001', 'prod1001', '2023-06-01 11:30:45', NULL, NULL, 1, 2, 399.00, 798.00, NULL, 0.00, 1, 0.00),
    (3, 'order230601003', 'user1003', 'shop002', 'prod2002', '2023-06-01 14:20:18', '2023-06-01 14:22:30', NULL, 2, 1, 799.00, 799.00, 749.00, 0.00, 0, 50.00),
    (4, 'order230602001', 'user1004', 'shop002', 'prod2002', '2023-06-02 09:05:12', '2023-06-02 09:07:25', NULL, 2, 3, 799.00, 2397.00, 2297.00, 0.00, 1, 100.00),
    (5, 'order230602002', 'user1005', 'shop003', 'prod3003', '2023-06-02 13:45:33', '2023-06-02 13:50:15', NULL, 2, 1, 3500.00, 3500.00, 3400.00, 0.00, 0, 100.00),
    (6, 'order230602003', 'user1001', 'shop001', 'prod1001', '2023-06-02 15:30:47', NULL, NULL, 5, 2, 399.00, 798.00, NULL, 0.00, 0, 0.00),
    (7, 'order230603001', 'user1002', 'shop002', 'prod2002', '2023-06-03 10:20:55', '2023-06-03 10:23:10', '2023-06-05 10:00:00', 6, 1, 799.00, 799.00, 799.00, 799.00, 4, 2.00),
    (8, 'order230603002', 'user1006', 'shop003', 'prod3003', '2023-06-03 14:15:22', '2023-06-03 14:20:30', NULL, 2, 2, 3500.00, 7000.00, 6800.00, 0.00, 1, 200.00),
    (9, 'order230603003', 'user1007', 'shop001', 'prod1001', '2023-06-03 16:40:18', '2023-06-03 16:42:05', NULL, 2, 1, 399.00, 399.00, 299.00, 0.00, 1, 100.00),
    (10, 'order230603004', 'user1003', 'shop002', 'prod2002', '2023-06-03 18:30:45', '2023-06-03 18:33:20', '2023-06-06 14:00:00', 6, 2, 799.00, 1598.00, 1598.00, 799.00, 2, 5.0);

INSERT INTO TABLE dev_realtime_v2_danyu_shi.ods_product_order_transaction PARTITION(ds='20250329')
VALUES
    (11, 'order230604001', 'user1001', 'shop001', 'prod1001', '2023-06-01 10:15:23', '2023-06-01 10:16:05', NULL, 4, 1, 399.00, 399.00, 379.00, 0.00, 0, 20.00),
    (12, 'order230604002', 'user1002', 'shop001', 'prod1001', '2023-06-01 11:30:45', NULL, NULL, 1, 2, 399.00, 798.00, NULL, 0.00, 1, 0.00),
    (13, 'order230604003', 'user1003', 'shop002', 'prod2002', '2023-06-01 14:20:18', '2023-06-01 14:22:30', NULL, 3, 1, 799.00, 799.00, 749.00, 0.00, 0, 50.00),
    (14, 'order230605001', 'user1004', 'shop002', 'prod2002', '2023-06-02 09:05:12', '2023-06-02 09:07:25', NULL, 3, 3, 799.00, 2397.00, 2297.00, 0.00, 1, 100.00),
    (15, 'order230605002', 'user1005', 'shop003', 'prod3003', '2023-06-02 13:45:33', '2023-06-02 13:50:15', NULL, 3, 1, 3500.00, 3500.00, 3400.00, 0.00, 0, 100.00),
    (16, 'order230605003', 'user1001', 'shop001', 'prod1001', '2023-06-02 15:30:47', NULL, NULL, 5, 2, 399.00, 798.00, NULL, 0.00, 0, 0.00),
    (17, 'order230606001', 'user1002', 'shop002', 'prod2002', '2023-06-03 10:20:55', '2023-06-03 10:23:10', '2023-06-05 10:00:00', 6, 1, 799.00, 799.00, 799.00, 799.00, 4, 2.00),
    (18, 'order230606002', 'user1006', 'shop003', 'prod3003', '2023-06-03 14:15:22', '2023-06-03 14:20:30', NULL, 4, 2, 3500.00, 7000.00, 6800.00, 0.00, 1, 200.00),
    (19, 'order230606003', 'user1007', 'shop001', 'prod1001', '2023-06-03 16:40:18', '2023-06-03 16:42:05', NULL, 4, 1, 399.00, 399.00, 299.00, 0.00, 1, 100.00),
    (20, 'order230606004', 'user1003', 'shop002', 'prod2002', '2023-06-03 18:30:45', '2023-06-03 18:33:20', '2023-06-06 14:00:00', 6, 2, 799.00, 1598.00, 1598.00, 799.00, 2, 5.0);



select *
from dev_realtime_v2_danyu_shi.ods_product_order_transaction;


drop table dev_realtime_v2_danyu_shi.ods_product_info;
CREATE TABLE dev_realtime_v2_danyu_shi.ods_product_info (
 id int,
 product_id STRING COMMENT '商品ID',
 product_name STRING COMMENT '商品名称',
 shop_id STRING COMMENT '店铺ID',
 shop_name STRING COMMENT '店铺名称',
 category_id STRING COMMENT '类目ID',
 category_name STRING COMMENT '类目名称',
 brand_id STRING COMMENT '品牌ID',
 brand_name STRING COMMENT '品牌名称',
 price double COMMENT '商品价格',
 cost_price double COMMENT '成本价',
 market_price double COMMENT '市场价',
 stock INT DEFAULT 0 COMMENT '库存',
 status int DEFAULT 1 COMMENT '状态(1上架0下架)',
 create_time STRING COMMENT '创建时间',
 update_time STRING COMMENT '更新时间'
)COMMENT '商品基础信息表'
PARTITIONED BY (ds STRING)
STORED as ORC
TBLPROPERTIES ("orc.compress"="SNAPPY");

INSERT INTO TABLE dev_realtime_v2_danyu_shi.ods_product_info PARTITION(ds='20250329')
VALUES
    (1, 'prod1001', '高端智能手表', 'shop001', '旗舰店', 'cat001', '智能穿戴', 'brand001', 'TechMaster', 399.00, 250.00, 499.00, 150, 1, '2023-01-15 09:00:00', '2023-05-20 14:30:00'),
    (2, 'prod2002', '无线降噪耳机', 'shop001', '旗舰店', 'cat002', '耳机耳麦', 'brand001', 'TechMaster', 799.00, 450.00, 899.00, 80, 1, '2022-11-10 10:30:00', '2023-04-15 11:20:00'),
    (3, 'prod3003', '4K超清摄像机', 'shop002', '数码专卖', 'cat003', '摄影摄像', 'brand002', 'PhotoPro', 3500.00, 2200.00, 3999.00, 25, 1, '2023-03-05 14:00:00', '2023-05-25 16:45:00'),
    (4, 'prod4004', '智能空气净化器', 'shop003', '家电城', 'cat004', '生活电器', 'brand003', 'HomeLife', 1299.00, 800.00, 1599.00, 40, 1, '2023-02-18 13:15:00', '2023-05-30 10:10:00'),
    (5, 'prod5005', '全自动咖啡机', 'shop003', '家电城', 'cat004', '生活电器', 'brand004', 'BrewMax', 899.00, 550.00, 1099.00, 60, 1, '2022-12-22 11:00:00', '2023-05-28 15:30:00'),
    (6, 'prod6006', '男士商务衬衫', 'shop004', '时尚服饰', 'cat005', '男装', 'brand005', 'Elegant', 199.00, 80.00, 299.00, 200, 1, '2023-04-10 10:00:00', '2023-05-31 09:45:00'),
    (7, 'prod7007', '女士真丝连衣裙', 'shop005', '精品女装', 'cat006', '女装', 'brand006', 'Silky', 459.00, 200.00, 599.00, 75, 1, '2023-05-01 14:30:00', '2023-05-29 16:20:00'),
    (8, 'prod8008', '保湿精华套装', 'shop006', '美妆优选', 'cat007', '护肤', 'brand007', 'Glow', 299.00, 120.00, 399.00, 120, 1, '2023-03-25 09:45:00', '2023-05-27 11:15:00'),
    (9, 'prod9009', '进口巧克力礼盒', 'shop007', '环球食品', 'cat008', '进口食品', 'brand008', 'Deluxe', 159.00, 70.00, 199.00, 300, 1, '2023-05-10 16:00:00', '2023-05-30 14:50:00'),
    (10, 'prod1010', '专业瑜伽垫', 'shop008', '运动健康', 'cat009', '运动器材', 'brand009', 'FitLife', 129.00, 50.00, 169.00, 180, 1, '2023-04-05 11:30:00', '2023-05-25 10:40:00');

select *
from dev_realtime_v2_danyu_shi.ods_product_info;


drop table dev_realtime_v2_danyu_shi.ods_product_micro_detail_visit;
CREATE TABLE dev_realtime_v2_danyu_shi.ods_product_micro_detail_visit
(
    id int,
    visit_id STRING COMMENT '访问ID',
    user_id STRING COMMENT '用户ID',
    shop_id STRING COMMENT '店铺ID',
    product_id STRING COMMENT '商品ID',
    visit_time STRING COMMENT '访问时间',
    scene_type STRING COMMENT '场景类型',
    exposure_duration INT COMMENT '曝光时长(秒)',
    is_click int COMMENT '是否点击进入详情(1是0否)'
)COMMENT '商品微详情访问表'
PARTITIONED BY (ds STRING)
STORED as ORC
TBLPROPERTIES ("orc.compress"="SNAPPY");


INSERT INTO TABLE dev_realtime_v2_danyu_shi.ods_product_micro_detail_visit PARTITION(ds='20250329')
VALUES
    (1, 'micro20230601001', 'user1001', 'shop001', 'prod1001', '2023-06-01 09:15:22', 'recommend ', 15, 0),
    (2, 'micro20230601002', 'user1002', 'shop001', 'prod1001', '2023-06-01 11:30:45', 'search', 8, 1),
    (3, 'micro20230601003', 'user1003', 'shop002', 'prod2002', '2023-06-01 14:20:33', 'activity', 45, 0),
    (4, 'micro20230602001', 'user1004', 'shop002', 'prod2002', '2023-06-02 10:05:12', 'homepage', 12, 1),
    (5, 'micro20230602002', 'user1005', 'shop003', 'prod3003', '2023-06-02 13:15:47', 'short_video', 30, 0),
    (6, 'micro20230602003', 'user1001', 'shop001', 'prod1001', '2023-06-02 15:30:22', 'cart_recommend ', 5, 1),
    (7, 'micro20230603001', 'user1006', 'shop003', 'prod3003', '2023-06-03 09:20:15', 'similar_recommend ', 25, 0),
    (8, 'micro20230603002', 'user1007', 'shop002', 'prod2002', '2023-06-03 14:35:28', 'history_recommend ', 10, 1),
    (9, 'micro20230603003', 'user1008', 'shop003', 'prod3003', '2023-06-03 16:50:42', 'promotion_popup', 20, 0),
    (10, 'micro20230603004', 'user1009', 'shop001', 'prod1001', '2023-06-03 19:05:37', 'cross_shop', 7, 1);


select *
from dev_realtime_v2_danyu_shi.ods_product_micro_detail_visit;


drop table dev_realtime_v2_danyu_shi.aws_store_anys_info_1df;
CREATE TABLE dev_realtime_v2_danyu_shi.aws_store_anys_info_1df (
 product_no STRING COMMENT '商品编号',
 product_name STRING COMMENT '商品名称',
 store_no STRING COMMENT '店铺编号',
 product_num_uv STRING COMMENT  '商品访客数' ,
 product_num_pv STRING COMMENT  '商品浏览量',
 have_product_num STRING COMMENT '有访问商品数',
 product_stopover_avg_ts STRING COMMENT '商品平均停留时长(分钟) ',
 product_info_page_jump_rate STRING COMMENT  '商品详情页跳出率 ',
 product_trove_num STRING COMMENT  '商品收藏人数',
 product_cart_num STRING COMMENT '商品加购数',
 trove_conversion_rate STRING COMMENT '访问收藏转化率',
 cart_conversion_rate STRING COMMENT '访问加购转化率'
) COMMENT '店铺商品分析宽表(日/周/月维度)'
PARTITIONED BY (ds STRING)
STORED as PARQUET
TBLPROPERTIES ("orc.compress"="SNAPPY");

insert into dev_realtime_v2_danyu_shi.aws_store_anys_info_1df partition(ds='20250329')
select
    opi.product_id as product_no,
    opi.product_name,
    opi.shop_id as store_no,
    count(distinct opvd.user_id) as product_num_uv,
    count(opvd.visit_id) as product_num_pv,
    case when count(opvd.visit_id) > 0 then '1' else '0' end as have_product_num,
    round(coalesce(avg(opvd.page_stay_duration),0)/60,2) as product_stopover_avg_ts,
    concat(round(100*sum(case when opvd.is_bounce = 1 then 1 else 0 end )/count(*),1),'%') as product_info_page_jump_rate,
    count(distinct case when pfc.operation_type = 1 then pfc.user_id end ) as product_trove_num,
    coalesce(sum(case when pfc.operation_type = 2 then pfc.quantity else 0 end ), 0) as product_cart_num,
    case
        when count(distinct opvd.user_id) = 0 then 0
        else cast(count(distinct case when pfc.operation_type = 1 then pfc.user_id end ) as FLOAT) / cast(count(distinct opvd.user_id) as FLOAT)
        end as trove_conversion_rate,
    case
        when count(distinct opvd.user_id) = 0 then 0
        else count(distinct case when pfc.operation_type = 2 then pfc.user_id end ) / count(distinct opvd.user_id)
        end as cart_conversion_rate
from ods_product_info opi
         left join ods_product_visit_detail opvd
                   on opi.product_id=opvd.product_id
         left join ods_product_favorite_cart pfc
                   on opi.product_id = pfc.product_id
group by
    opi.product_id,
    opi.product_name,
    opi.shop_id,
    '20250329';

select *
from dev_realtime_v2_danyu_shi.aws_store_anys_info_1df;

drop TABLE dev_realtime_v2_danyu_shi.aws_store_anys_info_2df;
CREATE TABLE dev_realtime_v2_danyu_shi.aws_store_anys_info_2df
(
    product_no STRING COMMENT '商品编号',
    order_buyer_num STRING COMMENT '下单买家数',
    order_product_num STRING COMMENT '下单件数',
    order_amount STRING COMMENT '下单金额',
    order_conversion_rate STRING COMMENT '下单转化率',
    pay_buyer_num STRING COMMENT '支付买家数',
    pay_product_num STRING COMMENT '支付件数',
    pay_amount STRING COMMENT '支付金额',
    have_pay_product_num STRING COMMENT '有支付商品数',
    pay_conversion_rate STRING COMMENT '支付转化率',
    new_pay_buyer_num STRING COMMENT '支付新买家数',
    old_pay_buyer_num STRING COMMENT '支付老买家数',
    old_pay_amount STRING COMMENT '老买家支付金额',
    customer_unit_price STRING COMMENT '客单价',
    refund_amount STRING COMMENT '成功退款退货金额',
    year_pay_amount STRING COMMENT '年累计支付金额',
    uv_avg_value STRING COMMENT '访客平均价值'
)COMMENT '店铺商品分析宽表(日/周/月维度)'
PARTITIONED BY (ds STRING)
STORED as PARQUET
TBLPROPERTIES ("orc.compress"="SNAPPY");


select *
from dev_realtime_v2_danyu_shi.aws_store_anys_info_2df;

insert into dev_realtime_v2_danyu_shi.aws_store_anys_info_2df partition(ds='20250329')
select
    opi.product_id as product_no,
    count(distinct opot.user_id) as order_buyer_num,
    count(distinct opot.product_id) as order_product_num,
    count(distinct opot.product_id) as order_amount,
    case
        when count(distinct opvd.user_id) = 0 then 0
        else count(distinct opot.user_id) / count(distinct opvd.user_id)
        end as order_conversion_rate,
    count(distinct opot.user_id) as pay_buyer_num,
    sum(opot.quantity) as pay_product_num,
    sum(opot.payment_amount) as pay_amount,
    count(distinct case when opot.order_status in (3, 4) then opvd.product_id end ) as paid_product_count,
    case
        when count(distinct opot.user_id) = 0 then 0
        else count(distinct case when opot.order_status = 2 then opot.user_id end ) / count(distinct opot.user_id)
        end as payment_conversion_rate,
    sum(case when opot.is_first_order = 1 then 1 else 0 end ) as new_pay_buyer_num,
    sum(case when opot.is_first_order = 0 then 1 else 0 end ) as old_pay_buyer_num,
    sum(case when opot.payment_amount = 0 then 1 else 0 end ) as old_pay_amount,
    case
        when count(distinct opot.user_id) = 0 then 0
        else sum(opot.payment_amount) / count(distinct opvd.user_id)
        end as customer_unit_price,
    sum(case when opot.order_status = 6 then opot.refund_amount else 0 end ) as refund_amount,
    sum(case when year(opot.order_time) = 2023 then opot.payment_amount else 0 end ) as annual_payment_amount,
    sum(opot.payment_amount) / count(distinct opvd.user_id) as uv_avg_value
from ods_product_info opi
         left join ods_product_order_transaction opot
                   on opi.product_id=opot.product_id
         left join ods_product_visit_detail opvd
                   on opi.product_id=opvd.product_id
         left join ods_product_favorite_cart pfc
                   on opi.product_id = pfc.product_id
         left join ods_product_micro_detail_visit opmdv
                   on opi.product_id=opmdv.product_id
group by
    opi.product_id,
    opi.product_name,
    opi.shop_id,
    '20250329';

drop table dev_realtime_v2_danyu_shi.dws_store_anys_info_1df;
create table dev_realtime_v2_danyu_shi.dws_store_anys_info_1df (
 product_no STRING COMMENT '商品编号',
 product_name STRING COMMENT '商品名称',
 store_no STRING COMMENT '店铺编号',
 product_num_uv STRING COMMENT  '商品访客数' ,
 product_num_pv STRING COMMENT  '商品浏览量',
 have_product_num STRING COMMENT '有访问商品数',
 product_stopover_avg_ts STRING COMMENT '商品平均停留时长(分钟) ',
 product_info_page_jump_rate STRING COMMENT  '商品详情页跳出率 ',
 product_trove_num STRING COMMENT  '商品收藏人数',
 product_cart_num STRING COMMENT '商品加购数',
 trove_conversion_rate STRING COMMENT '访问收藏转化率',
 cart_conversion_rate STRING COMMENT '访问加购转化率',
 order_buyer_num STRING COMMENT '下单买家数',
 order_product_num STRING COMMENT '下单件数',
 order_amount STRING COMMENT '下单金额',
 order_conversion_rate STRING COMMENT '下单转化率',
 pay_buyer_num STRING COMMENT '支付买家数',
 pay_product_num STRING COMMENT '支付件数',
 pay_amount STRING COMMENT '支付金额',
 have_pay_product_num STRING COMMENT '有支付商品数',
 pay_conversion_rate STRING COMMENT '支付转化率',
 new_pay_buyer_num STRING COMMENT '支付新买家数',
 old_pay_buyer_num STRING COMMENT '支付老买家数',
 old_pay_amount STRING COMMENT '老买家支付金额',
 customer_unit_price STRING COMMENT '客单价',
 refund_amount STRING COMMENT '成功退款退货金额',
 year_pay_amount STRING COMMENT '年累计支付金额',
                                                                   uv_avg_value STRING COMMENT '访客平均价值'
)COMMENT '店铺商品分析宽表(日/周/月维度)'
PARTITIONED BY (ds STRING)
STORED as PARQUET
TBLPROPERTIES ("orc.compress"="SNAPPY");

insert into dws_store_anys_info_1df partition (ds='20250329')
select
    a1.product_no,
    a1.product_name,
    a1.store_no,
    a1.product_num_uv,
    a1.product_num_pv,
    a1.have_product_num,
    a1.product_stopover_avg_ts,
    a1.product_info_page_jump_rate,
    a1.product_trove_num,
    a1.product_cart_num,
    a1.trove_conversion_rate,
    a1.cart_conversion_rate,
    a2.order_buyer_num,
    a2.order_product_num,
    a2.order_amount,
    a2.order_conversion_rate,
    a2.pay_buyer_num,
    a2.pay_product_num,
    a2.pay_amount,
    a2.have_pay_product_num,
    a2.pay_conversion_rate,
    a2.new_pay_buyer_num,
    a2.old_pay_buyer_num,
    a2.old_pay_amount,
    a2.customer_unit_price,
    a2.refund_amount,
    a2.year_pay_amount,
    a2.uv_avg_value
from
    dev_realtime_v2_danyu_shi.aws_store_anys_info_1df a1
        left join
    dev_realtime_v2_danyu_shi.aws_store_anys_info_2df a2
    on
                a1.ds = a2.ds and a1.product_no = a2.product_no;