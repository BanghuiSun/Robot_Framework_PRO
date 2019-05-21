*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Test Setup        Start_AddDataSource
Test Teardown     End_AddDataSource
Resource          dataResource.robot

*** Test Cases ***    分区                 数据源名称                                                                 ip或主机名           端口       数据库名称             用户名               密码           所属单位             联系人姓名          联系人电话
AddMysql              [Documentation]    分区,数据源名称,ip或主机名,端口,数据库名称,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         mysqlDataSource
                      banghui_zone       mysql_datasync                                                        10.111.30.154    3306     datasyncdb        root              123456       电科华云             测试人员           18202812392
                      banghui_zone       mysql_shuilj                                                          10.111.30.154    3306     shuilj            root              123456       电科华云             测试人员           18202812392
                      banghui_zone       mysql_banghuidb                                                       10.111.30.154    3306     banghuidb         root              123456       电科华云             测试人员           18202812392
                      banghui_zone       mysql_banghuidb2                                                      10.111.30.154    3306     banghuidb2        root              123456       电科华云             测试人员           18202812392
                      banghui_zone       mysql_banghuidb3                                                      10.111.30.154    3306     banghuidb3        root              123456       电科华云             测试人员           18202812392
                      banghui_zone       mysql_empty_database                                                  10.111.30.154    3306     EMPTY-DATABASE    root              123456       电科华云             测试人员           18202812392
                      banghui_zone       mysql_banghuidb21                                                     172.16.50.21     3306     banghuidb         root              root         电科华云             测试人员           18202812392
                      banghui_zone       mysql_banghuidb68                                                     172.16.4.68      3306     banghuidb         root              123456       电科华云             测试人员           18202812392
                      [Teardown]         Enter_dashboard

AddOracle             [Documentation]    分区,数据源名称,ip或主机名,端口,服务名,用户名,模式,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         oracleDataSource
                      banghui_zone       auto_oracle2                                                          172.16.50.22     1521     helowin           banghui           BANGHUI      password         电科华云           测试人员           18202812392
                      banghui_zone       oracle_datasync                                                       172.16.50.22     1521     helowin           banghui           BANGHUI2     password         电科华云           测试人员           18202812392
                      banghui_zone       auto_oracle_89测试机                                                     10.111.30.154    1521     XE                system            SYSTEM       oracle           电科华云           测试人员           18202812392
                      banghui_zone       auto_oracle_68测试机                                                     172.16.4.68      1521     XE                BANGHUI           BANGHUI      password         电科华云           测试人员           18202812392
                      [Teardown]         Enter_dashboard

AddGreenplum          [Documentation]    分区,数据源名称,ip或主机名,端口,数据库名称,schema,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         GreenplumDataSource
                      banghui_zone       auto_Greenplum                                                        172.16.50.22     5432     BANGHUIDB         sunbanghui        postgres     123456           电科华云           测试人员           18202812392
                      banghui_zone       auto_Greenplum_68                                                     172.16.4.61      5432     BANGHUIDB         sunbanghui        postgres     123456           电科华云           测试人员           18202812392
                      banghui_zone       auto_Greenplum_154                                                    10.111.30.154    5432     BANGHUIDB         sunbanghui        postgres     123456           电科华云           测试人员           18202812392
                      [Teardown]         Enter_dashboard

AddHive               [Documentation]    分区,数据源名称,ip或主机名,端口,数据库名称,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         hiveDataSource
                      banghui_zone       auto_Hive                                                             172.16.50.21     10000    chinacloud        hdfs              123456       电科华云             测试人员           18202812392
                      banghui_zone       auto_Hive_hui_database                                                172.16.50.21     10000    hui_database      hdfs              123456       电科华云             测试人员           18202812392
                      banghui_zone       auto_Hive3                                                            172.16.50.21     10000    default           hdfs              123456       电科华云             测试人员           18202812392
                      [Teardown]         Enter_dashboard

Addes                 [Documentation]    分区,数据源名称,ip或主机名,端口,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         ElasticSearchDataSource
                      banghui_zone       auto_es                                                               172.16.50.24     9200     hdfs              123456            电科华云         测试人员             18202812392
                      banghui_zone       auto_es_68                                                            172.16.4.68      9200     hdfs              123456            电科华云         测试人员             18202812392
                      [Teardown]         Enter_dashboard

AddHBase              [Documentation]    分区,数据源名称,ip或主机名,zookeeper端口,注册路径,NameSpace,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         HBaseDataSource
                      banghui_zone       auto_HBase                                                            172.16.50.21     2181     /hbase            hui_test          root         123456           电科华云           测试人员           18202812392
                      [Teardown]         Enter_dashboard

AddHDFS               [Documentation]    分区,数据源名称,ip或主机名,NameNode端口,路径,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         HDFSDataSource
                      banghui_zone       auto_HDFS                                                             172.16.50.21     8020     /banghui          hdfs              123456       电科华云             测试人员           18202812392
                      [Teardown]         Enter_dashboard

AddFTP                [Documentation]    分区,数据源名称,ip或主机名,端口,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         FTPDataSource
                      banghui_zone       auto_FTP                                                              172.16.50.21     21       banghui           password          电科华云         测试人员             18202812392
                      [Teardown]         Enter_dashboard

AddSQLServer          [Documentation]    分区,数据源名称,ip或主机名,端口,数据库名称,schema,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         SqlserverDataSource
                      banghui_zone       auto_sqlserver                                                        172.16.50.24     1433     student           banghui_Schema    sa           Chinacloud123    电科华云           测试人员           18202812392
                      banghui_zone       auto_sqlserver_测试机154                                                 10.111.30.154    1433     banghui           banghui_Schema    sa           banghui@123      电科华云           测试人员           18202812392
                      banghui_zone       auto_sqlserver_测试机68                                                  172.16.4.68      1433     banghui           banghui_Schema    sa           banghui@123      电科华云           测试人员           18202812392
                      [Teardown]         Enter_dashboard

AddDmeng              [Documentation]    分区,数据源名称,ip或主机名,端口,schema,用户名,密码,所属单位,联系人姓名,联系人电话
                      [Tags]             datasource                                                            v2.1.4
                      [Setup]
                      [Template]         DamengDataSource
                      banghui_zone       auto_Dameng                                                           172.16.2.134     5326     BANGHUI           BANGHUI           hui930626    电科华云             测试人员           18202812392
                      [Teardown]         Enter_dashboard
