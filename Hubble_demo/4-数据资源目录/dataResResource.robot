*** Settings ***
Resource          ../common.robot
Resource          ../../RFS_Basic/verify.txt

*** Keywords ***
AddFolder
    [Arguments]    ${name}    ${desc}
    ${zone}    Set Variable    banghui_zone
    # 一级目录
    #step1 进入新增页面
    Enter_menu    数据资源目录    none
    Run Keyword    SwitchZone    ${zone}    #banghui_zone
    等待元素可见    css=[ng-click="addDir()"]
    点击元素    css=[ng-click="addDir()"]    #点击添加目录
    等待元素可见    css=[name="dirName"]
    #step2 输入目录名称
    Sleep    0.5
    输入文本    css=[name="dirName"]    ${name}
    输入文本    css=[name="dirDiscription"]    ${desc}
    Sleep    0.5
    点击按钮    确定
    #step3 验证
    Wait Until Page Contains    添加目录成功    8    ERROR    #右上角提示
    Page Should Contain    添加目录成功
    Sleep    0.2
    Element Attribute Should Be Equal    xpath=*//div[@class='dirTree scrollable']/treecontrol/ul/li/treeitem/ul/li[last()]/div/span/span[1]/span[2]    tooltip    ${name}    提示成功，但实际添加失败！！！
    Sleep    0.3
    # 二级目录

AddRes
    [Arguments]    ${res_name}    ${res_code}    ${res_format}    ${res_info}    ${res_appDomain}    ${res_dataScopes}
    ...    ${res_sysProperty}    ${provider_name}
    #step 前提条件
    Comment    Run Keyword    pre_AddRes
    #step 进入添加资源页面
    等待元素可见    xpath=*//button[text()='添加资源']
    鼠标停留    xpath=*//button[text()='添加资源']
    鼠标停留    xpath=*//li[text()='手动添加']
    点击元素    xpath=*//li[text()='手动添加']
    #step2 输入资源信息
    等待元素可见    css=[name="name"]
    Sleep    0.5
    输入文本    css=[name="name"]    banghui_${res_name}    #资源名称
    Sleep    0.5
    输入文本    css=[name="resourceCode"]    ${res_code}    #资源代码
    Sleep    0.5
    输入文本    css=[name="format"]    ${res_format}    #资源摘要
    Sleep    0.5
    输入文本    css=[name="information"]    ${res_info}    #资源格式
    Sleep    0.5
    输入文本    css=[name="appDomain"]    ${res_appDomain}    #资源-应用领域
    Sleep    0.5
    输入文本    css=[name="dataScopes"]    ${res_dataScopes}    #资源-数据覆盖范围
    Sleep    0.5
    输入文本    css=[name="sysProperty"]    ${res_sysProperty}    #资源-系统属性
    点击元素    css=[aria-label="Select box activate"]    #展开选择资源提供方
    ${total_res_provider}    Get Element Count    xpath=*//div[starts-with(@id,'ui-select-choices-row')]    #统计资源提供方的个数
    点击元素    xpath=*//div[starts-with(@id,'ui-select-choices-row')]/span/div[text()='${provider_name}']    #选择需要的资源提供方
    等待元素可见    xpath=*//div[starts-with(@class,'text-center m-t-20 m-b-20')]/button[1]    #确认按钮
    点击元素    xpath=*//div[starts-with(@class,'text-center m-t-20 m-b-20')]/button[1]
    Sleep    2
    点击按钮    取消
    Wait Until Page Does Not Contain    添加资源成功    8    error
    #step3 验证
    输入文本    css=input[placeholder="输入资源名称、资源代码搜索"]    banghui_${res_name}
    Press Key    css=input[placeholder="输入资源名称、资源代码搜索"]    \\13
    Sleep    2
    Element Text Should Be    xpath=*//div[@class="sourcePack ng-isolate-scope"][1]/div[1]/span[2]    banghui_${res_name}

AddResInfo
    [Arguments]    ${infoCNName}    ${infoName}    ${dataLength}    ${infoNote}    ${dataType}    ${sharedProperty}
    ...    ${openProperty}
    #step 添加前提操作
    Comment    Run Keyword    pre_AddResInfo    ${res_name}
    #step4 输入信息项
    等待元素可见    xpath=*//h3[text()='规划-信息项']/../div[1]/button[text()='新增']
    点击元素    xpath=*//h3[text()='规划-信息项']/../div[1]/button[text()='新增']    #点击新增信息项按钮
    等待元素可见    css=[hubble-validate-model="infoItem.cnName"]
    Sleep    0.5
    输入文本    css=[hubble-validate-model="infoItem.cnName"]    ${infoCNName}    #信息项名称
    Sleep    0.5
    输入文本    css=[hubble-validate-model="infoItem.name"]    ${infoName}    #英文字段名
    Sleep    0.5
    输入文本    css=[ng-model="infoItem.dataLength"]    ${dataLength}    #数据长度
    Sleep    0.5
    输入文本    css=[hubble-validate-model="infoItem.note"]    ${infoNote}    #备注
    Sleep    0.5
    Select From List By Value    css=select[ng-model="infoItem.dataType"]    ${dataType}    #数据类型
    Sleep    0.5
    Select From List By Value    css=select[ng-model="infoItem.sharedProperty"]    ${sharedProperty}    #共享属性 0-无条件共享 1-有条件共享 2-不共享
    Sleep    0.5
    Select From List By Value    css=select[ng-model="infoItem.openProperty"]    ${openProperty}    #开放属性 1-开放 0-不开放
    Wait Until Element Is Enabled    css=[ng-show="scope.step == 2"]    8    ERROR,确认按钮不可点击！请检查
    点击元素    css=[ng-show="scope.step == 2"]
    #step5 验证
    Wait Until Page Contains    新增信息项成功    8    error
    Sleep    2

pre_AddResInfo
    [Arguments]    ${res_name}
    #step 验证菜单是否打开
    ${_menu_tmp}    Get Element Attribute    xpath=*//i[@tooltip="数据资源目录"]/../..    class
    Run Keyword If    'active' not in \ '${_menu_tmp}'    点击元素    css=[tooltip=数据资源目录]
    ...    ELSE    Log    菜单已打开 ^_^
    #step1 进入新增页面
    Click Link    xpath=*//span[text()='资源分类管理']/../../a
    #step 切换分区
    Run Keyword    SwitchZone    banghui_zone    #切换分区
    #step2 搜索目标资源
    输入文本    css=input[placeholder="输入资源名称、资源代码搜索"]    ${res_name}
    Press Key    css=input[placeholder="输入资源名称、资源代码搜索"]    \\13
    Sleep    2
    #step3 进入目标资源详情
    点击元素    xpath=*//div[@class="sourcePack ng-isolate-scope"][1]    #点击目标资源
    Wait Until Element Contains    xpath=*//a[text()="资源分类管理"]/../span[1]/span[1]    ${res_name}
    点击元素    xpath=*//div[@class='tab_box']/div[1]/div[text()="信息项"]    #点击信息项按钮

pre_AddRes
    #step 验证菜单是否打开
    ${_menu_tmp}    Get Element Attribute    xpath=*//i[@tooltip="数据资源目录"]/../..    class
    Run Keyword If    'active' not in \ '${_menu_tmp}'    点击元素    css=[tooltip=数据资源目录]
    ...    ELSE    Log    菜单已打开 ^_^
    #step1 进入新增页面
    Click Link    xpath=*//span[text()='资源分类管理']/../../a
    #step 切换分区
    Run Keyword    SwitchZone    banghui_zone    #切换分区
    #step 进入分类
    点击元素    css=[tooltip="推送服务-分类"]    #分类名称
