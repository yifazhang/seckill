-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE seckill;

USE seckill;

-- 创建秒杀库存表
CREATE TABLE seckill(
`seckill_id` bigint not null auto_increment comment '商品库存id',
`name` varchar(120) not null comment '商品名称',
`number` int not null comment '库存数量',
`start_time` TIMESTAMP not null DEFAULT  CURRENT_TIMESTAMP comment '秒杀开启时间',
`end_time` TIMESTAMP not null DEFAULT  CURRENT_TIMESTAMP comment '秒杀结束时间',
`create_time` TIMESTAMP not null DEFAULT  CURRENT_TIMESTAMP comment '创建时间',
PRIMARY KEY (seckill_id),
KEY idx_start_time(start_time),
KEY idx_end_time(end_time),
KEY idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

-- 初始化数据
insert into
  seckill(name,number,start_time,end_time)
VALUES
  ('1000元秒杀iPhone6',100,'2017-06-04 15:05:50','2017-06-10 15:06:16'),
  ('500元秒杀iPad2',200,'2017-06-04 15:05:50','2017-06-10 15:06:16'),
  ('300元秒杀小米4',300,'2017-06-04 15:05:50','2017-06-10 15:06:16'),
  ('200元秒杀红米note',400,'2017-06-04 15:05:50','2017-06-10 15:06:16');

-- 秒杀成功明细表
-- 用户登录认证相关的信息
create table success_killed(
`seckill_id` bigint not null comment '秒杀商品id',
`user_phone` bigint not null COMMENT  '用户手机号',
`state` tinyint not null DEFAULT -1 comment '状态标示:-1:无效 0:成功 1:已付款',
`create_time` TIMESTAMP not null comment '创建时间',
PRIMARY KEY (seckill_id,user_phone),/*联合主键*/
KEY idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';




select
  sk.seckill_id,
  sk.user_phone,
  sk.create_time,
  sk.state,
  s.seckill_id "seckill.seckill_id",
  s.name "seckill.name",
  s.number "seckill.number",
  s.start_time "seckill.start_time",
  s.end_time "seckill.end_time",
  s.create_time  "seckill.create_time"
from success_killed sk
  inner join seckill s on sk.seckill_id = s.seckill_id
where sk.seckill_id = 1000 and sk.user_phone=13888888888;


select
 *
from success_killed sk
inner join seckill s
on sk.seckill_id = s.seckill_id
where sk.seckill_id = 1000 and sk.user_phone=13888888888;
