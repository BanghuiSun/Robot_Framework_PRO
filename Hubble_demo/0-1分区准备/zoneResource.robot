*** Settings ***
Resource          ../common.robot
Resource          ../../RFS_Basic/verify.txt

*** Keywords ***
AddZone
    [Arguments]    ${zone_name}    ${zone_desc}    ${zone_func}
    [Documentation]    参数： 分区名称、分区描述、分区功能
    ...
    ...    ${zone_name} | ${zone_desc} | ${zone_func}
    ...
    ...    ${zone_func}只接收参数：应用业务字典 、推送服务、数据资源地图
    #step1 进入新增页面
    Enter_menu    分区管理    none
    点击按钮    新建    #点击新增字典
    等待元素可见    css=[hubble-validate="name_task"]
    Mouse Over    css=[hubble-validate="name_task"]
    #step2 输入分区信息
    Sleep    0.5
    输入文本    css=[hubble-validate="name_task"]    ${zone_name}
    Mouse Over    css=[hubble-validate="description"]
    输入文本    css=[hubble-validate="description"]    ${zone_desc}
    #step 打开分区对应功能
    ${func}    Set Variable If    "${zone_func}" == "应用业务字典"    css=input[ng-model="addParam.businessDictionary"]    "${zone_func}" == "推送服务"    css=input[ng-model="addParam.pushService"]    "${zone_func}" == "数据资源地图"
    ...    css=input[ng-model="addParam.dataMap"]
    Run Keyword If    "${zone_func}" not in ["应用业务字典","推送服务","数据资源地图"]    Fail
    点击元素    css=label[class="cus-switch i-switch bg-success"]    #打开数据资源目录功能
    Sleep    1
    点击元素    ${func}
    #step3 点击确认按钮
    点击按钮    确认
    Wait Until Page Contains    新建成功    15    ERROR    #右上角提示
    Page Should Contain    新建成功
    Sleep    0.2
    #验证
    #step1 搜索已新增的分区
    输入文本    css=[ng-model="searchParam.search"]    ${zone_name}
    Sleep    1
    点击元素    css=[class="fa fa-search"]
    Sleep    3
    #step2 验证搜索结果
    Element Attribute Should Be Equal    xpath=*//div[@class='data-card ng-isolate-scope'][1]/div/div/h3    uib-tooltip    ${zone_name}    未找到！！！
