 SELECT * FROM performance_schema.replication_group_members;
 
 START GROUP_REPLICATION; 
 
RESET MASTER;
START GROUP_REPLICATION;
   # 停止组复制(所有节点执行)：
STOP group_replication;
SET GLOBAL group_replication_single_primary_mode=OFF;
SET GLOBAL group_replication_enforce_update_everywhere_checks=ON;


SET SQL_LOG_BIN=0;
CREATE USER rpl@'%' IDENTIFIED BY '123456';
GRANT REPLICATION SLAVE ON *.* TO rpl@'%';
GRANT BACKUP_ADMIN ON *.* TO rpl@'%';
FLUSH PRIVILEGES;
SET SQL_LOG_BIN=1;
FLUSH PRIVILEGES;
CHANGE MASTER TO MASTER_USER='rpl', MASTER_PASSWORD='123456'  FOR CHANNEL 'group_replication_recovery';
INSTALL PLUGIN group_replication SONAME 'group_replication.so';



SET GLOBAL group_replication_bootstrap_group=ON; 
START GROUP_REPLICATION; 
SET GLOBAL group_replication_bootstrap_group=OFF;
SELECT COUNT(1) FROM `goods_info`



mysqlbinlog -v --stop-POSITION=1032 /binlog_path/mysql-bin.000001 > /tmpbinlog.log


BINLOG -v --stop-POSITION=1032 

CREATE DATABASE test;
USE test;
CREATE TABLE t1 (c1 INT PRIMARY KEY, c2 TEXT NOT NULL);
INSERT INTO t1 VALUES (1, 'Luis');
INSERT INTO t1 VALUES (2, 'Luis1');
INSERT INTO t1 VALUES (3, 'Luis3');
INSERT INTO t1 VALUES (4, 'Luis5');
INSERT INTO t1 VALUES (5, 'Luis5');

INSERT INTO t1 VALUES (7, 'Luis5');


SHOW BINLOG EVENTS IN 'binlog.000001'
