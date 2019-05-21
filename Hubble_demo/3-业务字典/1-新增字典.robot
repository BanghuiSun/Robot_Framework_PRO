*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Test Teardown     Enter_dashboard
Resource          dataDictionaryResource.robot

*** Test Cases ***
case1_adddic_水利局
    [Template]    AddDic
    水利局字典

case2_adddic
    [Template]    AddDic
    中文业务字典
    EnglishDirectory
    中文English
    Eglish中文
    五十字符超长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长
    EngaabbbbbEngaabbbbbEngaabbbbbEngaabbbbbEngaabbbbb
    A_B-4
    888888888888888888888888888888
    1
