*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Test Template
Resource          datasyncResource.robot

*** Test Cases ***
SuiteVariable
    [Tags]    datasync    v2.1.2
    #后缀
    ${getDate}    Get Time    epoch    time_=NOW
    Set Suite Variable    ${suffix}    ${getDate}

greenplum_to_hive_all
    [Tags]    datasync    v2.1.2
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    greenplum_to_hive_all_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_greenplum_to_hive_all_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    auto_Greenplum    table    JWZX_CONTENT-datasync    #分区、源、视图/表、表名
    @{export_info}    Create List    hive    banghui_zone    auto_Hive_hui_database    \    #目标类型、分区、源
    @{more_info}    Create List    全量抽取    NULL    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    #选择文件格式：parquet    包含CLOB/BLOB测试
    Select From List By Value    css=[ng-model="job.submitParams.hiveOptions['file-format']"]    parquet    #选择parquet
    Sleep    1
    #parquet 选择完成
    点击元素    xpath=*//div[@name='hive']/div/div[2]/label[text()=' 全量抽取']/i    #增量方式
    点击按钮    创建
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard

greenplum_view_to_hive_all
    [Tags]    datasync    v2.1.2
    [Setup]
    [Template]
    #设置各种信息
    ${job_name}    Set Variable    greenplum_view_to_hive_all_${suffix}    #设置作业
    ${target_table_name}    Set Variable    auto_greenplum_view_to_hive_all_${suffix}    #设置目标表
    @{import_info}    Create List    banghui_zone    auto_Greenplum    view    view-datasync-jwzx_content    #分区、源、视图/表、表名
    @{export_info}    Create List    hive    banghui_zone    auto_Hive_hui_database    \    #目标类型、分区、源
    @{more_info}    Create List    全量抽取    NULL    \    \    #增量方式、增量字段
    #case
    Run Keyword    basicInfo_AddJob    ${job_name}    auto_job    {"jobName": "${job_name}","target_table_name": "${target_table_name}","增量方式": "@{more_info}[0]","增量字段": "@{more_info}[1]"}
    Run Keyword    importInfo_AddJob    @{import_info}[0]    @{import_info}[1]    @{import_info}[2]    @{import_info}[3]
    Run Keyword    exportInfo_AddJob    @{export_info}[0]    @{export_info}[1]    @{export_info}[2]    ${target_table_name}
    点击元素    xpath=*//div[@name='hive']/div/div[2]/label[text()=' 全量抽取']/i    #增量方式
    等待元素可见    xpath=*//button[@ng-show="job.jobSubType=='hive'" and text()='创建']
    点击按钮    创建
    Run Keyword    verify_Addjob    ${job_name}
    [Teardown]    Enter_dashboard
