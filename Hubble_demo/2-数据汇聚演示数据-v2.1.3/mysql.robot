*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Test Template
Resource          datasyncResource.robot

*** Test Cases ***
SuiteVariable
    [Tags]    datasync    v2.1.3
    #后缀
    ${getDate}    Get Time    epoch    time_=NOW
    Set Suite Variable    ${suffix}    ${getDate}

mysql_to_hive_id
    [Tags]    datasync    v2.1.3
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    mysql_to_hive_id_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_mysql_to_hive_id_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    mysql_datasync    table    TABLE-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hive    banghui_zone    auto_Hive_hui_database    \    #目标类型、分区、源
    @{more_info}    Create List    字段增量    ID-s    \    \    #增量方式、增量字段
    #case
    #    FUNC：基本信息    作业名    标签    描述
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    #    FUNC：导入信息    导入分区    导入数据源    表 / 视图    数据表名
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    #    FUNC：导出信息    目标类型    目标分区    目标数据源    目标表名
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    #    FUNC：导入信息-增量    目标类型    增量类型    增量字段
    Run Keyword    choose_incrementalType    @{export_info}[0]    @{more_info}[0]    @{more_info}[1]
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard

mysql_to_hive_time
    [Tags]    datasync    v2.1.3
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    mysql_to_hive_time_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_mysql_to_hive_time_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    mysql_datasync    table    TABLE-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hive    banghui_zone    auto_Hive_hui_database    \    #目标类型、分区、源
    @{more_info}    Create List    时间增量    TIMESTAMP    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    Run Keyword    choose_incrementalType    @{export_info}[0]    @{more_info}[0]    @{more_info}[1]
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard

mysql_to_hive_all
    [Tags]    datasync    v2.1.3
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    mysql_to_hive_all_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_mysql_to_hive_all_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    mysql_datasync    table    TABLE-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hive    banghui_zone    auto_Hive_hui_database    \    #目标类型、分区、源
    @{more_info}    Create List    全量抽取    NULL    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    Run Keyword    choose_incrementalType    @{export_info}[0]    @{more_info}[0]    @{more_info}[1]
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard

mysql_to_hbase_time
    [Tags]    datasync    v2.1.3
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    mysql_to_hbase_time_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_mysql_to_hbase_time_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    mysql_datasync    table    TABLE-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hbase    banghui_zone    auto_HBase    \    #目标类型、分区、源
    @{more_info}    Create List    时间增量    TIMESTAMP    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    Run Keyword    choose_incrementalType    @{export_info}[0]    @{more_info}[0]    @{more_info}[1]
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard

mysql_view_to_hive_id
    [Tags]    datasync    v2.1.3
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    mysql_view_to_hive_id_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_mysql_view_to_hive_id_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    mysql_datasync    view    view-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hive    banghui_zone    auto_Hive_hui_database    \    #目标类型、分区、源
    @{more_info}    Create List    字段增量    ID-s    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    Run Keyword    choose_incrementalType    @{export_info}[0]    @{more_info}[0]    @{more_info}[1]
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard

mysql_view_to_hive_time
    [Tags]    datasync    v2.1.3
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    mysql_view_to_hive_time_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_mysql_view_to_hive_time_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    mysql_datasync    view    view-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hive    banghui_zone    auto_Hive_hui_database    \    #目标类型、分区、源
    @{more_info}    Create List    时间增量    TIMESTAMP    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    Run Keyword    choose_incrementalType    @{export_info}[0]    @{more_info}[0]    @{more_info}[1]
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard

mysql_view_to_hive_all
    [Tags]    datasync    v2.1.3
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    mysql_view_to_hive_all_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_mysql_view_to_hive_all_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    mysql_datasync    view    view-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hive    banghui_zone    auto_Hive_hui_database    \    #目标类型、分区、源
    @{more_info}    Create List    全量抽取    NULL    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    Run Keyword    choose_incrementalType    @{export_info}[0]    @{more_info}[0]    @{more_info}[1]
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard

mysql_view_to_hbase_time
    [Tags]    datasync    v2.1.3
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    mysql_view_to_hbase_time_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_mysql_view_to_hbase_time_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    mysql_datasync    view    view-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hbase    banghui_zone    auto_HBase    \    #目标类型、分区、源
    @{more_info}    Create List    时间增量    TIMESTAMP    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    Run Keyword    choose_incrementalType    @{export_info}[0]    @{more_info}[0]    @{more_info}[1]
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard
