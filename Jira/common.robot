*** Settings ***
Resource          ../RFS_Basic/operate.txt
Resource          ../RFS_Basic/verify.txt

*** Variables ***
${url}            http://jira.chinacloud.com.cn/login.jsp    # 系统地址
@{users}          sunbh    hui930626    # 用户名|密码

*** Keywords ***
login
    Open Browser    ${url}    gc
    Maximize Browser Window
    等待元素可见    id=login-form-username
    输入文本    id=login-form-username    @{users}[0]
    输入密码    id=login-form-password    @{users}[1]
    Element Should Be Enabled    id=login-form-submit
    点击元素    id=login-form-submit
    Wait Until Element Is Visible    id=header-details-user-fullname    12    登录失败！！！
    Element Attribute Should Be Equal    id=header-details-user-fullname    data-username    @{users}[0]    登录账户和实际账户不一致
    Sleep    2
