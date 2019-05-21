*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Resource          dataResResource.robot

*** Test Cases ***    0信息项名称        英文字段名             数据长度                     备注         数据类型    共享属性    开放属性
resinfo_oracle        [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_oracle
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0

resinfo_ElasticSearch
                      [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_ElasticSearch
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0

resinfo_Hive          [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_Hive
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0

resinfo_Grennplum     [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_Grennplum
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0

resinfo_sqlserver     [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_sqlserver
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0

resinfo_Dameng        [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_Dameng
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0

resinfo_mysql         [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_mysql
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0

resinfo_hbase         [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_hbase
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0

resinfo_hdfs          [Tags]        dataresInfo
                      [Setup]       pre_AddResInfo    banghui_hdfs
                      [Template]    AddResInfo
                      序号啊           ID                10                       我是序号，备注    整型I     0       0
                      姓名啊           Name              10                       我是姓名，备注    字符型C    0       0
