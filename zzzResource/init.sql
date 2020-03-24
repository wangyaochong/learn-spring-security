drop table if exists test.user;
create table test.user
(
    id        bigint(20) not null primary key auto_increment comment '用户id',
    username  varchar(64),
    password  varchar(64),
    full_name varchar(255),
    mobile    varchar(11)

) engine innodb
  default charset = utf8;
INSERT INTO test.user (id, username, password, full_name, mobile)
VALUES (1, 'zhangsan', '123', 'zhangsan', '1111'),
       (2, 'lisi', '456', 'lisi', '2222');


drop table if exists test.role;
create table test.role
(
    id          bigint primary key auto_increment,
    role_name   varchar(255),
    description varchar(255),
    create_time datetime,
    update_time datetime,
    status      char
) engine innodb
  default charset = utf8;
insert into test.role(id, role_name, description, create_time, update_time, status)
values (1, 'role1', 'role1', now(), now(), 1),
       (2, 'role2', 'role2', now(), now(), 1);



drop table if exists test.user_role;
create table test.user_role
(
    user_id     bigint,
    role_id     bigint,
    create_time datetime,
    update_time datetime
) engine innodb
  default charset = utf8;
insert into test.user_role(user_id, role_id, create_time, update_time)
VALUES (1, 1, now(), now()),
       (2, 2, now(), now());



drop table if exists test.permission;
create table test.permission
(
    id          bigint auto_increment primary key,
    code        varchar(255),
    description varchar(255),
    url         varchar(255)
) engine innodb
  default charset = utf8;

insert into test.permission(id, code, description, url)
VALUES (1, 'p1', '测试资源p1', '/r1'),
       (2, 'p2', '测试资源p2', '/r2');


drop table if exists test.role_permission;
create table test.role_permission
(
    role_id       bigint,
    permission_id bigint
) engine innodb
  default charset = utf8;
insert into test.role_permission(role_id, permission_id)
VALUES (1, 1),
       (2, 2);




DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
`client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端标
识',
`resource_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
COMMENT '接入资源列表',
`client_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
COMMENT '客户端秘钥',
`scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`authorized_grant_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT
NULL,
`web_server_redirect_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT
NULL,
`authorities` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`access_token_validity` int(11) NULL DEFAULT NULL,
`refresh_token_validity` int(11) NULL DEFAULT NULL,
`additional_information` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE
CURRENT_TIMESTAMP(0),
`archived` tinyint(4) NULL DEFAULT NULL,
`trusted` tinyint(4) NULL DEFAULT NULL,
`autoapprove` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接入客户端信息'
ROW_FORMAT = Dynamic;
INSERT INTO oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, create_time, archived, trusted, autoapprove) VALUES ('c1', 'res1', 'secret1', 'all', 'authorization_code,password,client_credentials,implicit,refresh_token', 'http://xxx', 'r2', 1, 1, null, '2020-03-24 08:07:12', 1, 1, '0');

DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
`create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
`code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`authentication` blob NULL,
INDEX `code_index`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;
