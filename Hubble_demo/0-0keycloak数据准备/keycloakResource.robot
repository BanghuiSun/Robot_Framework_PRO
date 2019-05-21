*** Settings ***
Resource          ../../RFS_Basic/operate.txt

*** Variables ***
${keycloakUrl}    http://172.16.0.164:19000    # 系统地址
@{keycloakUsers}    keycloak    keycloak    # 用户名|密码

*** Keywords ***
loginToKeycloak
    Open Browser    ${keycloakUrl}    gc
    Maximize Browser Window
    点击Lnk    Administration Console
    等待元素可见    id=username
    输入文本    id=username    @{keycloakUsers}[0]
    输入密码    id=password    @{keycloakUsers}[1]
    Element Should Be Enabled    id=kc-login
    点击元素    id=kc-login
    Wait Until Page Contains    Sign Out    5    登录超时

AddGroup
    [Arguments]    ${group_name}
    #step1 进入新增页面
    等待元素可见    css=[data-ng-show="access.queryGroups"]
    点击元素    css=[data-ng-show="access.queryGroups"]
    等待元素可见    id=createGroup
    点击按钮    id=createGroup    #点击新增Group
    等待元素可见    id=name
    #step2 输入group信息
    输入文本    id=name    ${group_name}
    Sleep    1
    点击按钮    Save
    #验证
    Wait Until Page Contains    Success! Group Created    8    ERROR    #上方提示
    Sleep    1.5
    等待元素可见    css=[data-ng-show="access.queryGroups"]
    点击元素    css=[data-ng-show="access.queryGroups"]
    等待元素可见    css=[placeholder="Search..."]
    #step1 搜索
    输入文本    css=[placeholder="Search..."]    ${group_name}
    Sleep    1
    点击元素    id=groupSearch
    Sleep    3
    #step2 验证搜索结果
    ${tmp}    Get Text    xpath=//*[@id="view"]/div[1]/table/tbody/tr/td/div/ul/li/div/ul/li[1]/span
    Should Be Equal    ${tmp}    ${group_name}    搜索结果不匹配@请检查

UpdateGroup
    [Arguments]    ${group_name_old}    ${group_name_new}
    [Documentation]    参数： 旧group名称、新group名称
    #step1 搜索要修改的group
    等待元素可见    css=[data-ng-show="access.queryGroups"]
    点击元素    css=[data-ng-show="access.queryGroups"]
    等待元素可见    id=createGroup
    输入文本    css=[placeholder="Search..."]    ${group_name_old}
    Sleep    1
    点击Lnk    id=groupSearch
    Sleep    3
    #step2 进入编辑页面
    点击元素    xpath=//*[@id="view"]/div[1]/table/tbody/tr/td/div/ul/li/div/ul/li[1]/span
    Wait Until Element Is Enabled    id=editGroup
    点击按钮    id=editGroup
    Sleep    1
    #step3 输入新信息
    输入文本    id=name    ${group_name_new}
    Sleep    1
    点击按钮    Save
    Wait Until Page Contains    Success! Your changes have been saved to the group.    8    ERROR    #上方提示

AddUsers
    [Arguments]    ${username}    ${group_name}
    [Documentation]    参数： 用户名、需要加入的group名称
    #step1 进入新增页面
    等待元素可见    css=[data-ng-show="access.queryUsers"]
    点击元素    css=[data-ng-show="access.queryUsers"]
    等待元素可见    id=createUser
    点击Lnk    id=createUser    #点击新增Users
    等待元素可见    id=username
    #step2 输入user信息
    输入文本    id=username    ${username}
    Sleep    1
    点击按钮    Save
    Wait Until Page Contains    Success! The user has been created.    8    ERROR    #上方提示
    #选择group
    #step1 进入Groups选择页面
    等待元素可见    css=[ng-class="{active: path[4] == 'groups'}"]
    点击元素    css=[ng-class="{active: path[4] == 'groups'}"]
    等待元素可见    css=[node-id=id]
    #step2 选择具体的groups
    点击元素    xpath=//*[@id="view"]/div[1]/form/div/div/div/div[2]/table/tbody/tr/td/div/ul/li/span[text()='${group_name}'] \
    Sleep    1
    点击按钮    id=joinGroup
    Wait Until Page Contains    Success! Added group membership    8    ERROR    #上方提示

modifyUserPWD
    [Arguments]    ${user}    ${pwd}
    #step1 进入新增页面
    等待元素可见    css=[data-ng-show="access.queryUsers"]
    点击元素    css=[data-ng-show="access.queryUsers"]
    #step2 查找用户
    等待元素可见    css=[placeholder="Search..."]
    输入文本    css=[placeholder="Search..."]    ${user}
    Sleep    1
    点击元素    id=userSearch
    Sleep    1
    #step3 点击编辑，进入用户详细
    点击元素    xpath=*//tr[1]/td[text()='Edit']
    Wait Until Page Contains    Credentials
    点击Lnk    Credentials
    #step4 修改新密码
    等待元素可见    id=password
    输入文本    id=password    ${pwd}
    输入文本    id=confirmPassword    ${pwd}
    Wait Until Page Contains    Reset Password
    点击按钮    Reset Password
