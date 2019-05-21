*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Resource          dataResResource.robot

*** Test Cases ***    资源名称             资源代码                资源格式        资源摘要      应用领域        数据覆盖范围    系统属性    资源提供方
res_data              [Tags]           datares_d
                      [Setup]          pre_AddRes
                      [Template]       AddRes
                      oracle           code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
                      ElasticSearch    code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
                      Hive             code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
                      Grennplum        code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
                      sqlserver        code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
                      Dameng           code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
                      hdfs             code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
                      hbase            code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
                      mysql            code_banghui_007    EXE; TXT    我是资源摘要    应用领域-大数据    全球        秘密      Japancloud-华云@2019
