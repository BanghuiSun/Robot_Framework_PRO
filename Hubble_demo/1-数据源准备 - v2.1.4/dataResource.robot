*** Settings ***
Resource          ../common.robot
Resource          ../../RFS_Basic/verify.txt

*** Keywords ***
Start_AddDataSource
    [Arguments]    ${zone}    ${dataSourceType}
    [Documentation]    ${zone} | \ 分区
    ...    ${dataSourceType} | \ 数据源类型
    #step1 进入新增页面
    Enter_menu    数据源管理    none
    Run Keyword    SwitchZone    ${zone}    #成都民政局
    点击元素    css=[ng-show="manageDataSourceAuth"]
    Element Should Be Enabled    name=ip
    #step2 选择数据源
    等待元素可见    xpath=*//div[contains(@ng-show,"type.label !='PGXZ'")][text()='${dataSourceType}']/../img[2]
    Click Image    xpath=*//div[contains(@ng-show,"type.label !='PGXZ'")][text()='${dataSourceType}']/../img[2]
    Sleep    1
    Element Attribute Should Contain    xpath=*//div[contains(@ng-show,"type.label !='PGXZ'")][text()='${dataSourceType}']/..    class    active    ERROR

End_AddDataSource
    [Arguments]    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}
    [Documentation]    ${dataSourceOwnerPlatform} | 所属单位
    ...    ${dataSourceOwnerName} | 联系人姓名
    ...    ${dataSourceOwnerTEL} | 联系人电话
    ...
    ...
    ...
    ...    以下用于验证:
    ...    ${dataSourceName} | 数据源名称
    ...    ${dataSourceType} | 数据源类型
    #step3-2 输入共有信息
    #2.1.4选择数据提供方
    ${name}    Set Variable    Japancloud-华云@2019
    点击元素    css=[placeholder="选择数据提供单位"]    #展开
    ${total_datasource}    Get Element Count    xpath=*//div[starts-with(@ng-attr-id,'ui-select-choices-row')]    #统计个数
    点击元素    xpath=*//div[starts-with(@ng-attr-id,'ui-select-choices-row')]/span/div[text()='${name}']    #选择需要的
    Sleep    1
    Comment    输入文本    css=[cc-validate-model="dataSourceOwner.owner"]    ${dataSourceOwnerPlatform}
    Comment    输入文本    css=[cc-validate-model="dataSourceOwner.ownerPlatform"]    ${dataSourceOwnerName}
    Comment    输入文本    css=[cc-validate-model="dataSourceOwner.ownerTEL"]    ${dataSourceOwnerTEL}
    #step4 确认操作
    点击按钮    确定
    Wait Until Page Contains    新建数据源成功    8    ERROR,新增数据源失败
    Wait Until Page Does Not Contain    新建数据源成功    8    ERROR
    #验证
    Mouse Down    CSS=[class="panel-body scrollable"]
    Execute Javascript    document.body.scrollTop=2200
    点击元素    xpath=*//div[@ng-click="selectSource(category)"]/div[2]/div/span[text() = '${dataSourceType}']/../../..
    Mouse Over    css=[ng-model="query.dataSourceName"]
    输入文本    css=[ng-model="query.dataSourceName"]    ${dataSourceName}
    Sleep    1
    Element Attribute Value Should Be    xpath=*//div[@ng-repeat="each in dataSourceNew"][1]/div[1]/div[1]/div/div    uib-tooltip    ${dataSourceName}
    Sleep    1

mysqlDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${dataSourceIP}    ${dataSourcePort}    ${mysqlDatabase}    ${mysqlUserName}
    ...    ${mysqlUserPwd}    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    [Documentation]    DataSource头信息：
    ...    ${zone} | 分区
    ...
    ...
    ...    DataSource尾信息：
    ...    ${dataSourceOwnerPlatform} | 所属单位
    ...    ${dataSourceOwnerName} | 联系人姓名
    ...    ${dataSourceOwnerTEL} | 联系人电话
    ...
    ...
    ...    mysql连接信息：
    ...    ${dataSourceName} | 数据源名称
    ...    ${dataSourceIP} | IP
    ...    ${dataSourcePort} | 端口
    ...    ${mysqlDatabase} | 数据库名称
    ...    ${mysqlUserName} | 用户名
    ...    ${mysqlUserPwd} | 密码
    ${dataSourceType}    Set Variable    Mysql
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='MYSQL'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    name=ip    ${dataSourceIP}
    输入文本    css=[cc-validate-model="source.mysqlPort"]    ${dataSourcePort}
    输入文本    css=[cc-validate-model="source.mysqlName"]    ${mysqlDatabase}
    输入文本    css=[cc-validate-model="source.mysqlUsername"]    ${mysqlUserName}
    输入文本    css=[cc-validate-model="source.mysqlPassword"]    ${mysqlUserPwd}
    截图    mysql
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}

oracleDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${dataSourceIP}    ${dataSourcePort}    ${serviceName}    ${userName}
    ...    ${Schema}    ${userPwd}    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    [Documentation]    DataSource头信息：
    ...    ${zone} | 分区
    ...
    ...    DataSource尾信息：
    ...    ${dataSourceOwnerPlatform} | 所属单位
    ...    ${dataSourceOwnerName} | 联系人姓名
    ...    ${dataSourceOwnerTEL} | 联系人电话
    ...
    ...    Oracle连接信息：
    ...    ${dataSourceName} | 数据源名称
    ...    ${dataSourceIP} | IP
    ...    ${dataSourcePort} | 端口
    ...    ${serviceName} | 服务名
    ...    ${userName} | 用户名
    ...    ${Schema} | 模式
    ...    ${userPwd} | 密码
    ${dataSourceType}    Set Variable    Oracle
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='ORACLE'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    name=ip    ${dataSourceIP}
    输入文本    css=[cc-validate-model="source.oraclePort"]    ${dataSourcePort}
    输入文本    css=[cc-validate-model="source.oracleServiceName"]    ${serviceName}
    输入文本    css=[cc-validate-model="source.oracleUsername"]    ${userName}
    输入文本    css=[cc-validate-model="source.oracleSchema"]    ${Schema}
    输入文本    css=[cc-validate-model="source.oraclePassword"]    ${userPwd}
    截图    oracle
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}

GreenplumDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${dataSourceIP}    ${dataSourcePort}    ${DBName}    ${Schema}
    ...    ${userName}    ${userPwd}    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    ${dataSourceType}    Set Variable    Greenplum
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='GREENPLUM'|| currentType=='gp'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    name=ip    ${dataSourceIP}
    输入文本    css=[cc-validate-model="source.pgxzPort"]    ${dataSourcePort}
    输入文本    css=[cc-validate-model="source.pgxzDbName"]    ${DBName}
    输入文本    css=[cc-validate-model="source.pgxzModel"]    ${Schema}
    输入文本    css=[cc-validate-model="source.pgxzUsername"]    ${userName}
    输入文本    css=[cc-validate-model="source.pgxzPassword"]    ${userPwd}
    截图    greenplum
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}

hiveDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${dataSourceIP}    ${dataSourcePort}    ${DBName}    ${userName}
    ...    ${userPwd}    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    ${dataSourceType}    Set Variable    Hive
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='HIVE'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    name=ip    ${dataSourceIP}
    输入文本    css=[cc-validate-model="source.hiveServer2Port"]    ${dataSourcePort}
    输入文本    css=[cc-validate-model="source.hiveDbName"]    ${DBName}
    输入文本    css=[cc-validate-model="source.hiveUsername"]    ${userName}
    输入文本    css=[cc-validate-model="source.hivePassword"]    ${userPwd}
    截图    hive
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}

ElasticSearchDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${dataSourceIP}    ${dataSourcePort}    ${userName}    ${userPwd}
    ...    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    ${dataSourceType}    Set Variable    ElasticSearch
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='ELASTICSEARCH' || currentType=='es'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    css=[ng-model="source.elasticsearchHost"]    ${dataSourceIP}
    输入文本    css=[cc-validate-model="source.elasticsearchPort"]    ${dataSourcePort}
    输入文本    css=[cc-validate-model="source.elasticsearchName"]    ${userName}
    输入文本    css=[cc-validate-model="source.elasticsearchPassword"]    ${userPwd}
    截图    elasticsearch
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}

HBaseDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${zookeeperUrl}    ${Port}    ${path}    ${namespace}
    ...    ${userName}    ${userPwd}    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    ${dataSourceType}    Set Variable    HBase
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='HBASE'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    css=[cc-validate-model="source.zookeeperUrl"]    ${zookeeperUrl}
    输入文本    css=[cc-validate-model="source.zkClientPort"]    ${Port}
    输入文本    css=[cc-validate-model="source.znodePath"]    ${path}
    输入文本    css=[cc-validate-model="source.namespace"]    ${namespace}
    输入文本    css=[cc-validate-model="source.username"]    ${userName}
    输入文本    css=[cc-validate-model="source.password"]    ${userPwd}
    截图    hbase
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}

HDFSDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${hdfsIPl}    ${Port}    ${path}    ${userName}
    ...    ${userPwd}    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    ${dataSourceType}    Set Variable    HDFS
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='HDFS'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    css=[ng-model="source.hdfsIP"]    ${hdfsIPl}
    输入文本    css=[cc-validate-model="source.hdfsdataSerport"]    ${Port}
    输入文本    css=[cc-validate-model="source.hdfsBasePath"]    ${path}
    输入文本    css=[cc-validate-model="source.username"]    ${userName}
    输入文本    css=[cc-validate-model="source.password"]    ${userPwd}
    截图    hdfs
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}

FTPDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${ip}    ${Port}    ${userName}    ${userPwd}
    ...    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    ${dataSourceType}    Set Variable    FTP
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='FTP'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    name=ip    ${ip}
    输入文本    CSS=[cc-validate-model="source.ftpPort"]    ${Port}
    输入文本    css=[cc-validate-model="source.ftpUsername"]    ${userName}
    输入文本    css=[cc-validate-model="source.ftpPassword"]    ${userPwd}
    截图    FTP
    ${dataSourceType2}    Set Variable    Ftp    #2018年12月25日21:23:38 修改
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType2}    ${dataSourceName}

SqlserverDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${ip}    ${Port}    ${DBName}    ${schema}
    ...    ${userName}    ${userPwd}    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    ${dataSourceType}    Set Variable    SQLServer
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='SQLSERVER'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    name=ip    ${ip}
    输入文本    css=[cc-validate-model="source.sqlServerPort"]    ${Port}
    输入文本    css=[cc-validate-model="source.sqlServerDbName"]    ${DBName}
    输入文本    css=[cc-validate-model="source.sqlServerSchema"]    ${schema}
    输入文本    css=[cc-validate-model="source.sqlServerUsername"]    ${userName}
    输入文本    css=[cc-validate-model="source.sqlServerPassword"]    ${userPwd}
    截图    sqlserver
    ${dataSourceType2}    Set Variable    Sqlserver    #2018年12月25日21:23:38 修改
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType2}    ${dataSourceName}

DamengDataSource
    [Arguments]    ${zone}    ${dataSourceName}    ${ip}    ${Port}    ${schema}    ${userName}
    ...    ${userPwd}    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}
    ${dataSourceType}    Set Variable    Dameng
    Run Keyword    Start_AddDataSource    ${zone}    ${dataSourceType}
    Element Attribute Value Should Be    xpath=*//form[@class = 'ng-pristine ng-valid']/div[1]    ng-if    currentType=='DAMENG'
    Mouse Over    css=[cc-validate-model="source.dataSourceName"]
    #step3 输入数据源信息
    输入文本    css=[cc-validate-model="source.dataSourceName"]    ${dataSourceName}
    输入文本    name=ip    ${ip}
    输入文本    css=[cc-validate-model="source.damengPort"]    ${Port}
    输入文本    css=[cc-validate-model="source.damengSchema"]    ${schema}
    输入文本    css=[cc-validate-model="source.damengUsername"]    ${userName}
    输入文本    css=[cc-validate-model="source.damengPassword"]    ${userPwd}
    截图    Dameng
    Run Keyword    End_AddDataSource    ${dataSourceOwnerPlatform}    ${dataSourceOwnerName}    ${dataSourceOwnerTEL}    ${dataSourceType}    ${dataSourceName}
