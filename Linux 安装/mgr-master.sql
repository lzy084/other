SET SQL_LOG_BIN=0;
CREATE USER rpl@'%' IDENTIFIED BY '123456';
GRANT REPLICATION SLAVE ON *.* TO rpl@'%';
GRANT BACKUP_ADMIN ON *.* TO rpl@'%';
FLUSH PRIVILEGES;
SET SQL_LOG_BIN=1;
FLUSH PRIVILEGES;
CHANGE MASTER TO MASTER_USER='rpl', MASTER_PASSWORD='123456'  FOR CHANNEL 'group_replication_recovery';
INSTALL PLUGIN group_replication SONAME 'group_replication.so';



 RESET MASTER;
 SET GLOBAL group_replication_bootstrap_group=ON;
 START GROUP_REPLICATION;
 SET GLOBAL group_replication_bootstrap_group=OFF;
 
 SELECT * FROM performance_schema.replication_group_members;
 
 
 
   # 停止组复制(所有节点执行)：
STOP group_replication;
SET GLOBAL group_replication_single_primary_mode=OFF;
SET GLOBAL group_replication_enforce_update_everywhere_checks=ON;

RESET MASTER;
SET GLOBAL group_replication_bootstrap_group=ON; 
START GROUP_REPLICATION; 
SET GLOBAL group_replication_bootstrap_group=OFF;


CREATE DATABASE test;
USE test;
CREATE TABLE t1 (c1 INT PRIMARY KEY, c2 TEXT NOT NULL);
INSERT INTO t1 VALUES (1, 'Luis');
INSERT INTO t1 VALUES (2, 'Luis1');
INSERT INTO t1 VALUES (3, 'Luis3');
INSERT INTO t1 VALUES (4, 'Luis5');
INSERT INTO t1 VALUES (5, 'Luis5');
INSERT INTO t1 VALUES (6, 'Luis5');
SHOW BINLOG EVENTS;



SET GLOBAL group_replication_bootstrap_group=ON; 
START GROUP_REPLICATION; 
SET GLOBAL group_replication_bootstrap_group=OFF;


`today-bpm-dev`

`cloud-sys`
`sxjg_mall`;

`today-common`

```zentao```;
`cloud-main`

SHOW BINLOG EVENTS IN 'binlog.000001'





CREATE TABLE `order-test`.`goods_info` (
  /* 未指定表名 */
  `goods_id` INT NOT NULL AUTO_INCREMENT,
  `goods_name` VARCHAR (50),
  `goods_num` INT,
  PRIMARY KEY (`goods_id`)
);

CREATE TABLE `order-test`.`order_info` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `goods_id` INT,
  `user_id` INT,
  `create_time` DATETIME,
  `goods_unm` INT,
  PRIMARY KEY (`order_id`)
);
CREATE TABLE `order-test`.`user_info` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `login_name` VARCHAR (50),
  `user_name` VARCHAR (50),
  PRIMARY KEY (`user_id`)
);

SELECT COUNT(1) FROM `goods_info`;

SELECT UUID();

