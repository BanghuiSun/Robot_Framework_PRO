*** Settings ***
Resource          keycloakResource.robot

*** Test Cases ***
新增Group
    [Tags]    keycloak
    [Setup]    loginToKeycloak
    [Template]    AddGroup
    公安局
    社保局
    民政局
    水利局
    [Teardown]    Close Browser

更新Group
    [Tags]    keycloak
    [Setup]    loginToKeycloak
    [Template]    UpdateGroup
    我符文    AUTO_TEST
    [Teardown]    Close Browser

新增User
    [Tags]    keycloak
    [Setup]    loginToKeycloak
    [Template]    AddUsers
    #user    #租户
    lisi    社保局
    wangwu    民政局
    zhangsan    水利局
    banghui    default
    [Teardown]    Close Browser

修改User
    [Tags]    keycloak
    [Setup]    loginToKeycloak
    [Template]    modifyUserPWD
    #user    #密码
    banghui    12345678
    [Teardown]    Close Browser
