use dev_realtime_v1_danyu_shi;

use dev_realtime_v1_danyu_shi;

show tables ;

desc ods_order_info;
create table if not exists dwd_order_info(
                                             id int,
                                             consignee string,
                                             consignee_tel string,
                                             total_amount double,
                                             order_status string,
                                             user_id int,
                                             payment_way string,
                                             delivery_address string,
                                             order_comment string,
                                             out_trade_no string,
                                             trade_body string,
                                             create_time string,
                                             operate_time string,
                                             expire_time string,
                                             process_status string,
                                             tracking_no string,
                                             parent_order_id int,
                                             img_url string,
                                             province_id int,
                                             activity_reduce_amount double,
                                             coupon_reduce_amount double,
                                             original_total_amount double,
                                             feight_fee double,
                                             feight_fee_reduce double,
                                             refundable_time string
) row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/dwd_order_info';

insert into dwd_order_info(id,
                           consignee,
                           consignee_tel,
                           total_amount,
                           order_status,
                           user_id,
                           payment_way,
                           delivery_address,
                           order_comment,
                           out_trade_no,
                           trade_body,
                           create_time,
                           operate_time,
                           expire_time,
                           process_status,
                           tracking_no,
                           parent_order_id,
                           img_url,
                           province_id,
                           activity_reduce_amount,
                           coupon_reduce_amount,
                           original_total_amount,
                           feight_fee,
                           feight_fee_reduce,
                           refundable_time
) select id,
         consignee,
         consignee_tel,
         total_amount,
         order_status,
         user_id,
         payment_way,
         delivery_address,
         order_comment,
         out_trade_no,
         trade_body,
         create_time,
         operate_time,
         expire_time,
         process_status,
         tracking_no,
         parent_order_id,
         img_url,
         province_id,
         activity_reduce_amount,
         coupon_reduce_amount,
         original_total_amount,
         feight_fee,
         feight_fee_reduce,
         refundable_time
from ods_order_info;

select * from dwd_order_info;

desc ods_order_detail;
drop table dwd_order_detail;
create table if not exists dwd_order_detail(
                                               id int,
                                               order_id int,
                                               sku_id int,
                                               sku_name string,
                                               img_url string,
                                               order_price double,
                                               sku_num string,
                                               create_time string,
                                               source_type string,
                                               source_id int,
                                               split_total_amount double,
                                               split_activity_amount double,
                                               split_coupon_amount double

)row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/dwd_order_detail';

insert into dwd_order_detail(id,
                             order_id,
                             sku_id,
                             sku_name,
                             img_url,
                             order_price,
                             sku_num,
                             create_time,
                             source_type,
                             source_id,
                             split_total_amount,
                             split_activity_amount,
                             split_coupon_amount
) select id,
         order_id,
         sku_id,
         sku_name,
         img_url,
         order_price,
         sku_num,
         create_time,
         source_type,
         source_id,
         split_total_amount,
         split_activity_amount,
         split_coupon_amount
from ods_order_detail;

show tables ;

desc ods_sku_info;
drop table dwd_sku_info;
create table dwd_sku_info(
                             id int,
                             spu_id int,
                             price double,
                             sku_name string,
                             sku_desc string,
                             weight double,
                             tm_id int,
                             category3_id int,
                             create_time string
)row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/dwd_sku_info';

insert into dwd_sku_info(id,
                         spu_id,
                         price,
                         sku_name,
                         sku_desc,
                         weight,
                         tm_id,
                         category3_id,
                         create_time
)
select id,
       spu_id,
       price,
       sku_name,
       sku_desc,
       weight,
       tm_id,
       category3_id,
       create_time
from ods_sku_info;


desc ods_spu_info;
drop table dwd_spu_info;
create table if not exists dwd_spu_info(
                                           id int,
                                           spu_name String,
                                           description String,
                                           category3_id int,
                                           tm_id int
)row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/dwd_spu_info';

insert into dwd_spu_info (id,
                          spu_name,
                          description,
                          category3_id,
                          tm_id
) select id,
         spu_name,
         description,
         category3_id,
         tm_id from ods_spu_info;


desc ods_payment_info;
drop table dwd_payment_info;
create table if not exists dwd_payment_info(
                                               id int,
                                               out_trade_no string,
                                               order_id int,
                                               user_id int,
                                               payment_type string,
                                               trade_no string,
                                               total_amount double,
                                               subject string,
                                               payment_status string,
                                               create_time string,
                                               callback_time string,
                                               callback_content string
)row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/dwd_payment_info';
insert into dwd_payment_info (id,
                              out_trade_no,
                              order_id,
                              user_id,
                              payment_type,
                              trade_no,
                              total_amount,
                              subject,
                              payment_status,
                              create_time,
                              callback_time,
                              callback_content
) select id,
         out_trade_no,
         order_id,
         user_id,
         payment_type,
         trade_no,
         total_amount,
         subject,
         payment_status,
         create_time,
         callback_time,
         callback_content from ods_payment_info;

desc ods_user_info;

create table if not exists dwd_user_info(
                                            id int,
                                            login_name string,
                                            nick_name string,
                                            passwd string,
                                            name string,
                                            phone_num string,
                                            email string,
                                            head_img string,
                                            user_level string,
                                            birthday string,
                                            gender string,
                                            create_time string,
                                            operate_time string,
                                            status string
)row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/dwd_user_info';
insert into dwd_user_info (id,
                           login_name,
                           nick_name,
                           passwd,
                           name,
                           phone_num,
                           email,
                           head_img,
                           user_level,
                           birthday,
                           gender,
                           create_time,
                           operate_time,
                           status
) select id,
         login_name,
         nick_name,
         passwd,
         name,
         phone_num,
         email,
         head_img,
         user_level,
         birthday,
         gender,
         create_time,
         operate_time,
         status
from ods_user_info;

use dev_realtime_v1_danyu_shi;

show tables ;

drop table dws_with;
create table dws_with(
                         `id`                    int,
                         `order_id`              int,
                         `order_status`          STRING,
                         `original_total_amount` double,
                         `feight_fee`            double,
                         `user_id`               int,
                         `sku_id`                int,
                         `sku_name`              STRING,
                         `create_time`           string
)row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/dws_with';

desc dws_with;

insert into dws_with(id,
                     order_id,
                     order_status,
                     original_total_amount,
                     feight_fee,
                     user_id,
                     sku_id,
                     sku_name,
                     create_time)
select
    dod.id,
    dod.order_id,
    doi.order_status,
    doi.original_total_amount,
    doi.feight_fee,
    doi.user_id,
    dod.sku_id,
    dod.sku_name,
    dod.create_time
from dwd_order_detail dod join dwd_order_info doi on dod.order_id=doi.id;

drop table dws_order_count;
create table if not exists dws_order_count(
                                              order_amount double,
                                              order_count int
) partitioned by (dt string)
    row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/dws_order_count';


insert overwrite table dws_order_count partition (dt='2025-03-25')
select sum(doi.original_total_amount) as order_amount,count(*) as order_count from dwd_order_detail dod,dwd_order_info doi where dod.order_id=doi.id;


use dev_realtime_v1_danyu_shi;

show tables ;

drop table ads_gmv_amount;
create table if not exists ads_gmv_amount(
    gmv_amount double
)    row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/ads_gmv_amount';

insert overwrite table ads_gmv_amount
select sum(original_total_amount)-sum(if(order_status in (1003,1005,1006),original_total_amount,0)) from dws_with;


drop table ads_sku_lv;
create table ads_sku_lv (
                            month STRING,
                            sku_name STRING,
                            sku_lv STRING
)    row format delimited fields terminated by '\t'
    location '/2207A/danyu_shi/250325_ods/ads_sku_lv';

insert overwrite table ads_sku_lv select month(create_time),
                                         a.sku_id,concat(round(sum(`if`(t1.single>=2,1,0))/count(distinct a.user_id),2),'%') from dws_with a,(
    select month(create_time) as month,sku_id,user_id,count(*) as single from dws_with group by month(create_time),sku_id,user_id
)t1 where a.sku_id=t1.sku_id group by month(create_time),a.sku_id;









select * from dwd_order_info;
select * from dwd_order_detail;
select * from dwd_sku_info;
select * from dwd_spu_info;


select * from dws_with;
select * from dws_order_count;


select * from ads_gmv_amount;
select * from ads_sku_lv;



