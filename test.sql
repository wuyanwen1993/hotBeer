# noinspection SqlNoDataSourceInspectionForFile

Update `user` SET `authentication_string`= password('123456') where user = `jss` and `Host` = 'localhost';

SET PASSWORD FOR jss=password('123456@jss');

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

-- sql 基础教程
CREATE DATABASE shop;
CREATE TABLE `Shohin`(
shohin_id CHAR(4) NOT NULL,
shohin_mei VARCHAR(100) NOT NULL,
hanbai_tanka INT,
shiire_tanka INT,
torokubi DATE,
PRIMARY KEY(shohin_id)
)CHARACTER SET utf8mb4 ENGINE innodb;

ALTER TABLE Shohin ADD shohin_mei_kana varchar(100);
ALTER TABLE Shohin ADD UNIQUE INDEX uni_name(shohin_mei_kana);
ALTER TABLE Shohin DROP COLUMN shohin_mei_kana;


-- sql 五十题
create table Student(
	SId varchar(10),
	Sname varchar(10),
	Sage datetime,
	Ssex varchar(10)
	)character set utf8 engine innodb;
insert into Student values('01' , '赵雷' , '1990-01-01' , '男');
insert into Student values('02' , '钱电' , '1990-12-21' , '男');
insert into Student values('03' , '孙风' , '1990-05-20' , '男');
insert into Student values('04' , '李云' , '1990-08-06' , '男');
insert into Student values('05' , '周梅' , '1991-12-01' , '女');
insert into Student values('06' , '吴兰' , '1992-03-01' , '女');
insert into Student values('07' , '郑竹' , '1989-07-01' , '女');
insert into Student values('09' , '张三' , '2017-12-20' , '女');
insert into Student values('10' , '李四' , '2017-12-25' , '女');
insert into Student values('11' , '李四' , '2017-12-30' , '女');
insert into Student values('12' , '赵六' , '2017-01-01' , '女');
insert into Student values('13' , '孙七' , '2018-01-01' , '女');

create table Course(CId varchar(10),Cname nvarchar(10),TId varchar(10))charset=utf8 engine innodb;
insert into Course values('01' , '语文' , '02');
insert into Course values('02' , '数学' , '01');
insert into Course values('03' , '英语' , '03');

create table Teacher(TId varchar(10),Tname varchar(10))charset=utf8 engine innodb;
insert into Teacher values('01' , '张三');
insert into Teacher values('02' , '李四');
insert into Teacher values('03' , '王五');

create table SC(SId varchar(10),CId varchar(10),score decimal(18,1))charset=utf8 engine innodb;
insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98);

#1. 查询" 01 "课程比" 02 "课程成绩高的学生的信息及课程分数?
select * from (select * from sc where CId='01')as t1 INNER JOIN (select * from sc where CId='02')as t2 where t1.SId=t2.SId and t1.score > t2.score; 
#2. 查询同时存在" 01 "课程和" 02 "课程的情况
select * from (select * from sc where `CId` = '01') as t1 INNER JOIN (select * from sc where `CId`='02')as t2 on t1.SId = t2.SId;
#3.  查询存在" 01 "课程但可能不存在" 02 "课程的情况(不存在时显示为 null )
select * from (select * from sc where CId = '01') as t1 left join  (select * from sc where CId = '02') as t2 on t1.SId = t2.SId;
#4. 查询不存在" 01 "课程但存在" 02 "课程的情况
select * from (select * from sc where CId = '02') as t1 left join (select * from sc where CId not in('01', '02')) as t2 on t1.SId = t2.SId;
#5. 查询平均成绩大于等于 60 分的同学的学生编号和学生姓名和平均成绩
select * from (select SId,avg_score from (select SId,avg(score)as avg_score from  sc group by SId) as s1 where s1.avg_score>60 ) as t1 left join Student as t2 on t1.SId=t2.SId;
#6. 查询在 SC 表存在成绩的学生信息
select t2.* from  (select SId from SC group by SId) as t1 left join Student as t2 on t1.SId=t2.SId;
#7 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩(没成绩的显示为 null )
select * from (select SId, Sname from Student) as t1 left join (select SId,count(CId)as course_number, sum(score)as sum_score from SC group by SId)as t2 on t1.SId=t2.SId;
#8 查有成绩的学生信息
select t2.* from (select SId from SC group by SId)as t1 left join (select * from Student)as t2 on t1.SId=t2.SId;
#9 查询「李」姓老师的数量
select count(TId)as li_count from Teacher where Tname like '李%';
#10 查询学过「张三」老师授课的同学的信息
select * from Student where SId in (select SId from SC where CId in(select CId from Course where TId in (select TId from Teacher where Tname='张三')));
#11 查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
select * from Student as s1 inner join (select t2.SId,avg(t2.score)as score_avg from (select t1.SId, t1.score from (select * from SC where score < 60 ) as t1 group by t1.SId having count(t1.SId) >=2)as t2) as t3 on s1.SId=t3.SId;
#12. 检索" 01 "课程分数小于 60，按分数降序排列的学生信息



# 测试表
create table t1(
  id1 int(11) unsigned comment 'id1',
  title1 varchar(36)
)engine InnoDB charset utf8;

create table t2(
  id1 int(11) unsigned comment 'id2',
  title2 varchar(36)
)engine InnoDB charset utf8;

insert into t1 (id1, title1) values(1, 'c1');
insert into t1 (id1, title1) values(2, 'c2');
insert into t1 (id1, title1) values(3, 'c3');

insert into t2 (id1, title2) values(1, 'a1');
insert into t2 (id1, title2) values(2,'a2');
insert into t2 (id1, title2) values(4,'a4');