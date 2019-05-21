*** Settings ***
Resource          ../common.robot
Resource          ../../RFS_Basic/verify.txt

*** Keywords ***
basicInfo_AddJob
    [Arguments]    ${jobname}    ${jobtag}    ${jobinfo}
    [Documentation]    basicInfo_AddJob 添加一个结构化数据汇聚作业，分四个步骤：
    ...
    ...    步骤1：基本信息
    ...    步骤2：导入源信息
    ...    步骤3：导出源信息
    ...    步骤4：设置调度（可选）
    ...
    ...    当前为，步骤1
    ...
    ...    所需参数："作业名称","作业标签","作业描述"
    #step1 进入新增页面
    Enter_menu    作业管理    none
    点击元素    css=a[ui-sref="webb.datasync"]
    Wait Until Element Is Enabled    css=[ng-click="createDatasync()"]
    点击元素    css=[ng-click="createDatasync()"]
    #step2 输入基本信息
    等待元素可见    name=jobname
    输入文本    name=jobname    ${jobname}
    输入文本    name=jobTag    ${jobtag}
    输入文本    name=jobInfo    ${jobinfo}
    Wait Until Element Is Enabled    css=[ng-click="stepToSecond()"]
    截图    ${jobname}
    #step3 下一步
    点击元素    css=[ng-click="stepToSecond()"]
    Wait Until Page Contains Element    xpath=*//div[@ng-controller = 'dsImportCtrl']/div[1]
    Element Text Should Be    xpath=*//div[@ng-controller = 'dsImportCtrl']/div[1]    结构化数据汇聚-导入信息

importInfo_AddJob
    [Arguments]    ${zone_name}    ${datasource_name}    ${type}    ${table_name}
    [Documentation]    importInfo_AddJob 添加一个结构化数据汇聚作业，分四个步骤：
    ...
    ...    步骤1：基本信息
    ...    步骤2：导入源信息
    ...    步骤3：导出源信息
    ...    步骤4：设置调度（可选）
    ...
    ...    当前为，步骤2
    ...
    ...    所需参数："分区名称", "数据源名称", "数据表类型：table/view", "数据表/视图表"
    #step1 选择分区
    点击元素    css=[ng-model="partitionList.selected"]    #展开选择分区
    Sleep    1
    ${total_zone}    Get Element Count    xpath=*//div[starts-with(@id,'ui-select-choices-row')]    #统计分区的个数
    点击元素    xpath=*//div/span/div[text()='${zone_name}']    #选择需要的分区
    Sleep    1
    Element Attribute Value Should Be    css=[ng-model="partitionList.selected"]    title    ${zone_name}    #验证
    log    ***成功选择来源分区，当前分区为:${zone_name}***
    #step2 选择数据源
    点击元素    css=[ng-model="links.selected"]    #展开选择数据源
    ${total_datasource}    Get Element Count    xpath=*//li[starts-with(@ng-attr-id,'ui-select-choices-row')]    #统计数据源的个数
    点击元素    xpath=*//li[starts-with(@ng-attr-id,'ui-select-choices-row')]/div/div/span[text()='${datasource_name}']    #选择需要的数据源
    Sleep    1
    Element Attribute Value Should Be    css=[ng-model="links.selected"]    title    ${datasource_name}    #验证
    log    ***成功选择来源数据源，当前数据源为:${datasource_name}***
    #选择类型（table / view）
    Run Keyword If    '${type}' == 'table'    点击元素    css=[btn-radio="'tables'"]
    Run Keyword If    '${type}' == 'view'    点击元素    css=[btn-radio="'views'"]
    Sleep    3
    #step3 选择表
    输入文本    id=filter    ${table_name}
    点击元素    css=[ng-click="searchLinks()"]
    Sleep    2
    Page Should Not Contain Element    xpath=*//table/tbody/tr[1]/td[1][text()='没有查询到内容']    ***该数据库下，没有找到表:${table_name} ***    \    #若无该元素，说明该表存在
    点击元素    xpath=*//table/tbody/tr[1]/td/label    #点击过滤后的第一张表
    Sleep    1
    截图    ${table_name}-{index}
    #step4 下一步
    点击按钮    下一步
    Wait Until Page Contains Element    xpath=*//div[@ng-controller = 'dsExportCtrl']/div[1]
    Element Text Should Be    xpath=*//div[@ng-controller = 'dsExportCtrl']/div[1]    结构化数据汇聚-导出信息

exportInfo_AddJob
    [Arguments]    ${export_type}    ${zone_name}    ${datasource_name}    ${export_table_name}
    [Documentation]    importInfo_AddJob 添加一个结构化数据汇聚作业，分四个步骤：
    ...
    ...    步骤1：基本信息
    ...    步骤2：导入源信息
    ...    步骤3：导出源信息
    ...    步骤4：设置调度（可选）
    ...
    ...    当前为，步骤3
    ...
    ...    所需参数："目标类型：hive/hbase", "分区名称", "数据源名称", "目标表名"
    #step1 选择目标类型
    点击元素    css=[uib-btn-radio="'${export_type}'"]
    Element Attribute Should Contain    css=[uib-btn-radio="'${export_type}'"]    class    active    ***目标类型不匹配***
    #step2 选择分区
    点击元素    xpath=*//div[@name='${export_type}']//div[@ng-change="choosePartiton()"]    #展开选择分区
    Sleep    1
    ${total_zone}    Get Element Count    xpath=*//div[starts-with(@id,'ui-select-choices-row')]    #统计分区的个数
    点击元素    xpath=*//div/span/div[text()='${zone_name}']    #选择需要的分区
    Sleep    1
    Element Text Should Be    xpath=*//div[@name='${export_type}']//div[@ng-change="choosePartiton()"]/div[1]/span/span/span    ${zone_name}    ***当前分区为:${zone_name}，与预期不一致***    \    #验证
    log    ***成功选择目标分区，当前分区为:${zone_name}***
    #step3 选择数据源
    点击元素    xpath=*//div[@name='${export_type}']//div[@placeholder="选择数据源"]    #展开选择数据源
    ${total_datasource}    Get Element Count    xpath=*//div[starts-with(@id,'ui-select-choices-row')]    #统计数据源的个数
    点击元素    xpath=*//div[starts-with(@id,'ui-select-choices-row')]/span/div[text()='${datasource_name}']    #选择需要的数据源
    Sleep    1
    Element Text Should Be    xpath=*//div[@name='${export_type}']//span[text()='选择数据源']/../span[2]/span    ${datasource_name}    ***当前数据源为:${datasource_name}，与预期不一致***    \    #验证
    log    ***成功选择目标数据源，当前数据源为:${datasource_name}***
    #step4 数据目标表名
    输入文本    css=[ng-model="job.submitParams.${export_type}Options['${export_type}-table']"]    ${export_table_name}
    Sleep    1
    Mouse Out    css=[ng-model="job.submitParams.${export_type}Options['${export_type}-table']"]
    Sleep    3
    截图    ${export_table_name}

choose_incrementalType
    [Arguments]    ${datatype}    ${type}    ${fileds}
    [Documentation]    ${datatype} ：目标数据源类型( hive/hbase )
    ...
    ...    ${type} ：增量类型( 全量抽取/时间增量/字段增量 )
    ...
    ...    ${fileds} ：增量字段 及 hbase的行健
    #step1 选择类型
    点击元素    xpath=*//div[@name='${datatype}']/div/div[1]/label[text()=' ${type}']/i
    Sleep    1
    #step2 选择增量字段
    截图    job-{index}
    Run Keyword If    '${type}' == '全量抽取' and '${datatype}' == 'hive'    点击按钮    xpath=*//button[@ng-show="job.jobSubType=='hive'" and text()='创建']    #创建
    Run Keyword If    '${type}' == '字段增量' and '${datatype}' != 'hbase'    choose_1_exportInfo_Addjob_hive    ${fileds}    id
    Run Keyword If    '${type}' == '时间增量' and '${datatype}' != 'hbase'    choose_1_exportInfo_Addjob_hive    ${fileds}    time
    Run Keyword If    '${type}' == '时间增量' and '${datatype}' == 'hbase'    choose_2_exportInfo_Addjob_hbase    ${fileds}    time

choose_1_exportInfo_Addjob_hive
    [Arguments]    ${fileds}    ${type}
    ${tmp_txt}    Set Variable If    '${type}' == 'id'    必须选择整型字段    '${type}' == 'time'    必须选择日期或时间类型字段
    #选择增量字段
    点击元素    xpath=*//div[@name='hive']/div/div/div/div[@placeholder="${tmp_txt}"]    #展开选择增量字段
    Sleep    1
    ${total_zone}    Get Element Count    xpath=*//div[starts-with(@id,'ui-select-choices-row')]    #统计字段的个数
    点击元素    xpath=*//div/span/div[text()='${fileds}']    #选择需要的增量字段
    Sleep    2
    log    ***成功选择增量字段，当前增量字段为:${fileds}***
    截图    job-{index}
    等待元素可见    xpath=*//button[@ng-show="job.jobSubType=='hive'" and text()='创建']
    点击按钮    xpath=*//button[@ng-show="job.jobSubType=='hive'" and text()='创建']

choose_2_exportInfo_Addjob_hbase
    [Arguments]    ${fileds}    ${type}
    ${tmp_txt}    Set Variable If    '${type}' == 'id'    必须选择整型字段    '${type}' == 'time'    必须选择日期或时间类型字段
    #选择增量字段
    点击元素    xpath=*//div[@name='hbase']/div/div/div/div[@placeholder="${tmp_txt}"]    #展开选择增量字段
    Sleep    1
    ${total_zone}    Get Element Count    xpath=*//div[starts-with(@id,'ui-select-choices-row')]    #统计字段的个数
    点击元素    xpath=*//div/span/div[text()='${fileds}']    #选择需要的增量字段
    Sleep    2
    log    ***成功选择增量字段，当前增量字段为:${fileds}***
    #选择行健
    点击Lnk    获取行键
    Wait Until Page Contains    选择行键    8    ERROR, 错误
    Sleep    1
    ${total_zone}    Get Element Count    css=[ng-repeat="o in ocolumns"]    #统计字段的个数（行键）
    点击元素    xpath=*//div[@ng-repeat="o in ocolumns"]/div/span[@title='${fileds}']/../../label    #选择需要的行键字段
    Sleep    2
    log    ***成功选择行键，当前字段为:${fileds}***
    点击按钮    确认
    Sleep    1
    截图    job-{index}
    Sleep    1
    等待元素可见    xpath=*//button[@ng-show="job.jobSubType=='hbase'" and text()='创建']
    点击按钮    xpath=*//button[@ng-show="job.jobSubType=='hbase'" and text()='创建']

verify_Addjob
    [Arguments]    ${jobName}
    [Documentation]    ${jobName} ：作业名称
    #验证
    Wait Until Page Contains    新建结构化数据汇聚成功！    8    ERROR,新增作业失败
    Wait Until Page Does Not Contain    新建结构化数据汇聚成功！    8    ERROR
    #验证 - 搜索
    输入文本    id=filter    ${jobName}
    Sleep    1
    点击按钮    搜索
    Sleep    3
    #验证 - table
    Table Cell Should Contain    css=[class="table table-hover dataSyncTable"]    2    2    ${jobName}
    log    ***验证添加作业成功！***
