use dev_realtime_v1_danyu_shi;

-- 商品基础信息表
CREATE TABLE dev_realtime_v1_danyu_shi.ods_product_info_gd02 (
 product_id STRING COMMENT '商品ID',
 product_no STRING COMMENT '商品编号',
 product_name STRING COMMENT '商品名称',
 category_id STRING COMMENT '类目ID',
 category_name STRING COMMENT '类目名称',
 store_id STRING COMMENT '店铺ID',
 store_name STRING COMMENT '店铺名称',
 price double COMMENT '商品价格',
 cost double COMMENT '商品成本',
 create_time string COMMENT '创建时间',
 modify_time string COMMENT '修改时间',
 status int COMMENT '状态(1-上架,0-下架)'
) COMMENT '商品基础信息表'
PARTITIONED BY (ds STRING)
STORED as PARQUET
TBLPROPERTIES ("orc.compress"="SNAPPY");
INSERT INTO TABLE dev_realtime_v1_danyu_shi.ods_product_info_gd02 PARTITION (ds='20250401')
VALUES
    ('P10001', 'ELEC-001', '华为Mate60 Pro', 'C001', '智能手机', 'S001', '华为官方旗舰店', 6999.00, 4500.00, '2024-01-10 09:00:00', '2024-01-10 09:00:00', 1),
    ('P10002', 'ELEC-002', '苹果iPhone15', 'C001', '智能手机', 'S002', '苹果授权专卖店', 5999.00, 4800.00, '2024-01-12 10:30:00', '2024-01-15 11:20:00', 1),
    ('P10003', 'ELEC-003', '小米电视65英寸', 'C002', '智能电视', 'S003', '小米官方旗舰店', 3299.00, 2500.00, '2024-01-05 14:15:00', '2024-01-18 16:30:00', 1),
    ('P10004', 'ELEC-004', '索尼蓝牙耳机', 'C003', '耳机', 'S004', '索尼数码专卖', 899.00, 600.00, '2024-01-08 11:00:00', '2024-01-08 11:00:00', 1),
    ('P10005', 'ELEC-005', '联想小新Pro16', 'C004', '笔记本电脑', 'S005', '联想电脑旗舰店', 5499.00, 4200.00, '2024-01-15 13:45:00', '2024-01-20 10:15:00', 1),
    ('P20001', 'CLOTH-001', '男士纯棉T恤', 'C101', '男装', 'S101', '优衣库官方店', 99.00, 45.00, '2024-01-02 08:00:00', '2024-01-10 09:30:00', 1),
    ('P20002', 'CLOTH-002', '女士羊毛大衣', 'C102', '女装', 'S102', 'Only官方旗舰店', 899.00, 450.00, '2024-01-03 10:00:00', '2024-01-12 14:00:00', 1),
    ('P20003', 'CLOTH-003', '儿童运动鞋', 'C103', '童装', 'S103', '安踏儿童旗舰店', 199.00, 100.00, '2024-01-04 11:30:00', '2024-01-04 11:30:00', 1),
    ('P20004', 'CLOTH-004', '男士牛仔裤', 'C101', '男装', 'S104', '李维斯官方店', 399.00, 200.00, '2024-01-06 09:15:00', '2024-01-16 16:45:00', 1),
    ('P20005', 'CLOTH-005', '女士连衣裙', 'C102', '女装', 'S105', 'Zara官方旗舰店', 299.00, 150.00, '2024-01-07 14:30:00', '2024-01-14 10:20:00', 1),
    ('P30001', 'FOOD-001', '德芙巧克力礼盒', 'C201', '巧克力', 'S201', '德芙官方旗舰店', 129.00, 70.00, '2024-01-09 10:45:00', '2024-01-09 10:45:00', 1),
    ('P30002', 'FOOD-002', '三只松鼠坚果大礼包', 'C202', '坚果', 'S202', '三只松鼠旗舰店', 89.00, 45.00, '2024-01-11 13:20:00', '2024-01-17 15:10:00', 1),
    ('P30003', 'FOOD-003', '蒙牛纯牛奶250ml*24', 'C203', '乳制品', 'S203', '蒙牛官方旗舰店', 69.90, 35.00, '2024-01-13 08:30:00', '2024-01-19 09:40:00', 1),
    ('P30004', 'FOOD-004', '金龙鱼大米5kg', 'C204', '粮油', 'S204', '金龙鱼旗舰店', 59.90, 30.00, '2024-01-14 11:15:00', '2024-01-14 11:15:00', 1),
    ('P30005', 'FOOD-005', '农夫山泉矿泉水550ml*24', 'C205', '饮用水', 'S205', '农夫山泉旗舰店', 29.90, 15.00, '2024-01-16 14:50:00', '2024-01-16 14:50:00', 1),
    ('P40001', 'HOME-001', '苏泊尔电饭煲', 'C301', '厨房电器', 'S301', '苏泊尔官方旗舰店', 299.00, 180.00, '2024-01-17 10:00:00', '2024-01-22 11:30:00', 1),
    ('P40002', 'HOME-002', '罗莱家纺四件套', 'C302', '家纺', 'S302', '罗莱家纺旗舰店', 599.00, 350.00, '2024-01-18 13:45:00', '2024-01-18 13:45:00', 1),
    ('P40003', 'HOME-003', '双立人菜刀套装', 'C303', '厨房用具', 'S303', '双立人官方店', 399.00, 250.00, '2024-01-19 09:30:00', '2024-01-21 14:20:00', 1),
    ('P40004', 'HOME-004', 'IKEA书桌', 'C304', '家具', 'S304', '宜家家居旗舰店', 499.00, 300.00, '2024-01-20 15:00:00', '2024-01-20 15:00:00', 1),
    ('P40005', 'HOME-005', '美的空气净化器', 'C305', '生活电器', 'S305', '美的官方旗舰店', 1299.00, 800.00, '2024-01-21 11:20:00', '2024-01-23 10:40:00', 0);


CREATE TABLE dev_realtime_v1_danyu_shi.ods_product_flow_gd02 (
 product_id STRING COMMENT '商品ID',
 uv int COMMENT '访客数',
 pv int COMMENT '浏览量',
 avg_stay_time double COMMENT '平均停留时长(秒)',
 bounce_rate double COMMENT '跳出率',
 source_type STRING COMMENT '流量来源类型',
 source_detail STRING COMMENT '流量来源详情'
) COMMENT '商品流量表'
PARTITIONED BY (ds STRING)
STORED as PARQUET
TBLPROPERTIES ("orc.compress"="SNAPPY");

INSERT INTO TABLE dev_realtime_v1_danyu_shi.ods_product_flow_gd02 PARTITION (ds='20250401')
VALUES
    ('P10001', 1250, 3800, 68.5, 0.42, 'search', '手淘搜索'),
    ('P10001', 680, 2100, 45.2, 0.38, 'recommend', '手淘推荐'),
    ('P10001', 320, 950, 72.8, 0.35, 'ad', '效果广告'),
    ('P10002', 980, 2950, 55.3, 0.45, 'search', '手淘搜索'),
    ('P10002', 420, 1300, 62.1, 0.41, 'social', '内容广告'),
    ('P10002', 210, 650, 48.7, 0.52, 'other', '淘内待分类'),
    ('P10003', 760, 2250, 82.4, 0.32, 'recommend', '手淘推荐'),
    ('P10003', 310, 920, 67.9, 0.39, 'ad', '品牌广告'),
    ('P10003', 180, 540, 58.2, 0.47, 'other', '手淘其他店铺'),
    ('P20001', 890, 2650, 42.7, 0.28, 'search', '手淘搜索'),
    ('P20001', 380, 1150, 37.5, 0.31, 'recommend', '手淘推荐'),
    ('P20002', 670, 2000, 51.3, 0.36, 'search', '手淘搜索'),
    ('P20002', 290, 870, 45.8, 0.42, 'ad', '站外广告'),
    ('P30001', 540, 1600, 32.6, 0.25, 'recommend', '手淘推荐'),
    ('P30001', 230, 690, 28.4, 0.33, 'other', '购物车'),
    ('P40001', 430, 1280, 61.8, 0.39, 'search', '手淘搜索'),
    ('P40001', 190, 570, 53.2, 0.44, 'ad', '效果广告'),
    ('P40002', 380, 1140, 57.3, 0.37, 'recommend', '手淘推荐'),
    ('P40002', 160, 480, 49.6, 0.46, 'other', '我的淘宝'),
    ('P40005', 290, 870, 73.5, 0.51, 'search', '手淘搜索');

CREATE TABLE dev_realtime_v1_danyu_shi.ods_product_trade_gd02 (
 product_id STRING COMMENT '商品ID',
 order_count int COMMENT '订单数',
 order_buyer_count int COMMENT '下单买家数',
 order_amount double COMMENT '下单金额',
 pay_count int COMMENT '支付件数',
 pay_buyer_count int COMMENT '支付买家数',
 pay_amount double COMMENT '支付金额',
 refund_amount double COMMENT '退款金额'
) COMMENT '商品交易表'
PARTITIONED BY (ds STRING)
STORED as PARQUET
TBLPROPERTIES ("orc.compress"="SNAPPY");

INSERT INTO TABLE dev_realtime_v1_danyu_shi.ods_product_trade_gd02 PARTITION (ds='20250401')
VALUES
    ('P10001', 320, 280, 2236800.00, 300, 260, 2099700.00, 58700.00),
    ('P10002', 280, 250, 1679720.00, 260, 230, 1559740.00, 42000.00),
    ('P10003', 150, 140, 494850.00, 140, 130, 461860.00, 12900.00),
    ('P10004', 420, 380, 377580.00, 400, 360, 359600.00, 9800.00),
    ('P10005', 180, 170, 989820.00, 170, 160, 934830.00, 26000.00),
    ('P20001', 650, 600, 64350.00, 620, 580, 61380.00, 1700.00),
    ('P20002', 120, 110, 107880.00, 110, 100, 98890.00, 2800.00),
    ('P20003', 380, 350, 75620.00, 360, 330, 71640.00, 2000.00),
    ('P20004', 95, 90, 37905.00, 90, 85, 35910.00, 1000.00),
    ('P20005', 210, 200, 62790.00, 200, 190, 59800.00, 1700.00),
    ('P30001', 840, 800, 108360.00, 820, 780, 105780.00, 2900.00),
    ('P30002', 720, 680, 64080.00, 700, 660, 62300.00, 1800.00),
    ('P30003', 950, 900, 66405.00, 930, 880, 65007.00, 1800.00),
    ('P30004', 520, 500, 31148.00, 510, 490, 30549.00, 850.00),
    ('P30005', 1100, 1050, 32890.00, 1080, 1030, 32292.00, 900.00),
    ('P40001', 130, 120, 38870.00, 125, 115, 37375.00, 1050.00),
    ('P40002', 75, 70, 44925.00, 72, 67, 43128.00, 1200.00),
    ('P40003', 60, 55, 23940.00, 58, 53, 23142.00, 650.00),
    ('P40004', 45, 40, 22455.00, 43, 38, 21457.00, 600.00),
    ('P40005', 30, 28, 38970.00, 28, 26, 36372.00, 1000.00);


CREATE TABLE dev_realtime_v1_danyu_shi.ods_product_search_keyword_gd02
(
 product_id  STRING COMMENT '商品ID',
 keyword     STRING COMMENT '搜索词',
 uv          int COMMENT '搜索访客数',
 click_count int COMMENT '点击次数'
) COMMENT '商品搜索词表'
PARTITIONED BY (ds STRING)
STORED as PARQUET
TBLPROPERTIES ("orc.compress"="SNAPPY");

INSERT INTO TABLE dev_realtime_v1_danyu_shi.ods_product_search_keyword_gd02 PARTITION (ds='20250401')
VALUES
    ('P10001', '华为手机', 580, 1250),
    ('P10001', 'Mate60 Pro', 320, 780),
    ('P10001', '5G手机', 210, 520),
    ('P10002', '苹果手机', 620, 1480),
    ('P10002', 'iPhone15', 380, 920),
    ('P10002', '新款苹果', 190, 450),
    ('P10003', '小米电视', 350, 820),
    ('P10003', '65寸电视', 280, 670),
    ('P10003', '智能电视', 180, 430),
    ('P20001', '男士T恤', 420, 980),
    ('P20001', '纯棉短袖', 310, 720),
    ('P20002', '羊毛大衣', 380, 890),
    ('P20002', '女士外套', 260, 610),
    ('P30001', '德芙巧克力', 510, 1150),
    ('P30001', '情人节礼物', 290, 680),
    ('P40001', '电饭煲', 330, 770),
    ('P40001', '苏泊尔', 240, 560),
    ('P40002', '四件套', 270, 630),
    ('P40002', '床品套装', 190, 450),
    ('P40005', '空气净化器', 210, 490);

CREATE TABLE dev_realtime_v1_danyu_shi.ods_product_price_power_gd02
(
 product_id STRING COMMENT '商品ID',
 price_power_level int COMMENT '价格力等级(1-优秀,2-良好,3-较差)',
 price_power_score double COMMENT '价格力分数',
 market_avg_price double COMMENT '市场平均价',
 price_ratio double COMMENT '价格比(商品价/市场价)',
 conversion_rate double COMMENT '转化率',
 market_avg_conversion_rate double COMMENT '市场平均转化率',
 warning_flag int COMMENT '预警标志(1-价格力预警,2-商品力预警)'
) COMMENT '价格力商品表'
PARTITIONED BY (ds STRING)
STORED as PARQUET
TBLPROPERTIES ("orc.compress"="SNAPPY");


INSERT INTO TABLE dev_realtime_v1_danyu_shi.ods_product_price_power_gd02 PARTITION (ds='20250401')
VALUES
    ('P10001', 1, 94.2, 7100.00, 0.985, 0.088, 0.075, 0),
    ('P10003', 1, 91.5, 3400.00, 0.970, 0.082, 0.068, 0),
    ('P20001', 1, 89.3, 105.00, 0.943, 0.132, 0.098, 0),
    ('P30001', 1, 92.8, 145.00, 0.890, 0.148, 0.118, 0),
    ('P40001', 1, 90.1, 340.00, 0.879, 0.102, 0.083, 0),
    ('P10002', 2, 79.6, 5850.00, 1.025, 0.072, 0.075, 0),
    ('P10004', 2, 77.2, 830.00, 1.083, 0.085, 0.088, 0),
    ('P20002', 2, 74.9, 920.00, 0.977, 0.092, 0.095, 0),
    ('P30003', 2, 78.4, 72.00, 0.971, 0.142, 0.145, 0),
    ('P40002', 2, 75.3, 630.00, 0.951, 0.083, 0.088, 0),
    ('P10005', 3, 65.8, 4950.00, 1.111, 0.058, 0.068, 1),
    ('P20003', 3, 61.4, 175.00, 1.137, 0.078, 0.098, 1),
    ('P30002', 3, 68.7, 78.00, 1.141, 0.112, 0.128, 2),
    ('P30005', 3, 63.5, 24.00, 1.246, 0.092, 0.118, 2),
    ('P40003', 3, 58.9, 345.00, 1.157, 0.068, 0.083, 1),
    ('P20004', 2, 73.1, 375.00, 1.064, 0.072, 0.078, 1),
    ('P20005', 3, 71.8, 270.00, 1.107, 0.065, 0.085, 2),
    ('P30004', 3, 66.2, 53.00, 1.130, 0.098, 0.122, 2),
    ('P40004', 3, 62.4, 440.00, 1.134, 0.062, 0.075, 1),
    ('P40005', 3, 55.3, 1150.00, 1.130, 0.048, 0.068, 3);


drop table dev_realtime_v1_danyu_shi.ads_product_rank_dashboard_gd02;
CREATE TABLE dev_realtime_v1_danyu_shi.ads_product_rank_dashboard_gd02 (
 product_id STRING COMMENT '商品ID',
 product_no STRING COMMENT '商品编号',
 product_name STRING COMMENT '商品名称',
 category_id STRING COMMENT '类目ID',
 category_name STRING COMMENT '类目名称',
 store_id STRING COMMENT '店铺ID',
 store_name STRING COMMENT '店铺名称',
 source_type STRING COMMENT '流量来源类型',
 source_detail STRING COMMENT '流量来源详情',
 keyword STRING COMMENT '搜索词',
 uv int COMMENT '访客数',
 pv int COMMENT '浏览量',
 pay_count int COMMENT '支付件数',
 pay_amount double COMMENT '支付金额',
 conversion_rate double COMMENT '支付转化率',
 price_power_level int COMMENT '价格力等级',
 rank_by_amount INT COMMENT '按金额排名',
 rank_by_count INT COMMENT '按金额排名',
 rank_by_conversion INT COMMENT '按转化率排名',
 warning_flag int COMMENT '预警标志(1-价格力预警,2-商品力预警)',
 excellent_count int COMMENT '价格力优秀商品数',
 good_count int COMMENT '价格力良好商品数',
 poor_count int COMMENT '价格力较差商品数',
 period_type int COMMENT '周期类型(1-日,2-周,3-月,4-7天,5-30天)',
 start_date STRING COMMENT '开始日期(yyyyMMdd)',
 end_date STRING COMMENT '结束日期(yyyyMMdd)'
) COMMENT '商品排行看板主表'
STORED as PARQUET
TBLPROPERTIES (
    "orc.compress"="SNAPPY");

insert into dev_realtime_v1_danyu_shi.ads_product_rank_dashboard_gd02
select
    opi.product_id,
    opi.product_no,
    opi.product_name,
    opi.category_id,
    opi.category_name,
    opi.store_id,
    opi.store_name,
    opf.source_type,
    opf.source_detail,
    opsk.keyword,
    sum(opsk.uv) as uv,
    sum(opf.pv) as pv,
    opt.pay_count,
    opt.pay_amount,
    oppp.conversion_rate,
    oppp.price_power_level,
    rank() over (order by opt.pay_amount desc ) as rank_by_amount,
        rank() over (order by opt.pay_count desc ) as rank_by_count,
        rank() over (order by oppp.conversion_rate desc ) as rank_by_conversion,
        oppp.warning_flag,
    sum(case when opt.order_amount - opt.pay_amount <= 10 then 1 else 0 end) as excellent_count,
    sum(case when opt.order_amount - opt.pay_amount > 10 and opt.order_amount - opt.pay_amount <= 50 then 1 else 0 end) as good_count,
    sum(case when opt.order_amount - opt.pay_amount > 50 then 1 else 0 end) as poor_count,
    case
        when datediff(current_date, opt.ds) <= 1 then 1
        when `dayofweek`(current_date) = `dayofweek`(opt.ds) then 2
        when datediff(current_date, opt.ds) <= 30 then 5
        else 3
        end as period_type,
    max(opt.ds) as start_date,
    min(opt.ds) as end_date
from
    ods_product_info_gd02 opi
        left join
    ods_product_trade_gd02 opt ON opi.product_id = opt.product_id
        left join
    ods_product_flow_gd02 opf ON opi.product_id = opf.product_id
        left join
    ods_product_price_power_gd02 oppp ON opi.product_id = oppp.product_id
        left join
    ods_product_search_keyword_gd02 opsk ON opi.product_id = opsk.product_id
group by
    opi.product_id,
    opi.product_no,
    opi.product_name,
    opi.category_id,
    opi.category_name,
    opi.store_id,
    opi.store_name,
    opf.source_type,
    opf.source_detail,
    opsk.keyword,
    opt.pay_count,
    opt.pay_amount,
    oppp.conversion_rate,
    oppp.price_power_level,
    oppp.warning_flag,
    opt.ds;


-- TOP10 流量来源，展现访客数与支付转化率
select
    source_type,
    uv,
    case
        when sum(pay_count) = 0 then 0
        else avg(conversion_rate)
        end AS avg_payment_conversion_rate
from
    dev_realtime_v1_danyu_shi.ads_product_rank_dashboard_gd02
group by
    source_type,uv
order by
    uv desc
    limit 10;


-- Top 5 SKU 销售，了解最受欢迎的 SKU，及时调整库存
select
    product_no,
    sum(pay_count) as sp
from
    dev_realtime_v1_danyu_shi.ads_product_rank_dashboard_gd02
group by
    product_no
order by
    sp desc
    limit 5;



-- Top 10 搜索词
select
    keyword,
    count(keyword) as c
from
    dev_realtime_v1_danyu_shi.ads_product_rank_dashboard_gd02
group by
    keyword
order by
    c desc
    limit 10;
