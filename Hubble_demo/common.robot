*** Settings ***
Resource          ../RFS_Basic/operate.txt
Resource          ../RFS_Basic/verify.txt

*** Variables ***
${url}            http://172.16.2.179/hubble-ui/    # 系统地址
@{users}          banghui    12345678    # 用户名|密码
${tenant}         default    # 租户名称

*** Keywords ***
login
    Open Browser    ${url}    gc
    Maximize Browser Window
    等待元素可见    id=username
    输入文本    name=username    @{users}[0]
    输入密码    name=password    @{users}[1]
    Element Should Be Enabled    id=kc-login
    点击元素    id=kc-login
    Wait Until Page Contains    请选择租户    20    Error
    点击按钮    ${tenant}
    Sleep    1
    Wait Until Element Contains    css=[tooltip=退出]    退出    5    Error
    等待元素可见    css=[tooltip=分区管理]
    点击元素    css=[tooltip=分区管理]
    Sleep    3

Enter_menu
    [Arguments]    ${first_menu}    ${second_menu}
    [Documentation]    进入菜单
    ...
    ...    需要两个参数，一级菜单 和 二级菜单。
    ...
    ...    若无二级菜单，请填写 none
    点击元素    css=[tooltip=${first_menu}]
    Run Keyword If    '${second_menu}' != 'none'    点击元素    css=[tooltip=${second_menu}]

Enter_dashboard
    Comment    点击元素    css=[tooltip=分区总览]
    Go To    ${url}
    Wait Until Element Contains    css=[tooltip=退出]    退出    15    Error
    等待元素可见    css=[tooltip=分区管理]
    点击元素    css=[tooltip=分区管理]
    Sleep    3

SwitchZone
    [Arguments]    ${exp_zone}
    #step1 进入选择分区列表
    Wait Until Element Is Enabled    id=zoneChange    15    ERROR
    Page Should Contain Element    css=[class="quick-nav ng-scope max"]    #切换分区的模块
    点击元素    id=zoneChange
    Page Should Contain    切换分区
    #step2 选择分区
    Mouse Down    xpath=*//h4[contains(text(),'切换到分区')]/../div[1]
    Execute Javascript    document.body.scrollTop=1200    #向下滑动1200
    点击元素    xpath=*//h4[contains(text(),'切换到分区')]/../div[1]/div/div[2]/h3[text() = '${exp_zone}']/../..
    Sleep    1
    Element Attribute Should Contain    xpath=*//h4[contains(text(),'切换到分区')]/../div[1]/div/div[2]/h3[text() = '${exp_zone}']/../..    class    zoneActive    预期不符@
    点击按钮    确定
    Wait Until Page Contains    切换分区成功
    Wait Until Page Does Not Contain    切换分区成功    15    error
    #验证
    Element Text Should Be    id=zoneChange    ${exp_zone}
