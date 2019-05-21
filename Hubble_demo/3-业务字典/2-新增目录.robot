*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Test Teardown     Enter_dashboard
Resource          dataDictionaryResource.robot

*** Test Cases ***
case1_addfolder
    [Template]    AddFolder
    EnglishDirectory    中文业务字典
    EnglishDirectory    EnglishDirectory
    EnglishDirectory    中文English
    EnglishDirectory    Eglish中文
    EnglishDirectory    五十字符超长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长
    EnglishDirectory    EngaabbbbbEngaabbbbbEngaabbbbbEngaabbbbbEngaabbbbb
    EnglishDirectory    A_B-4
    EnglishDirectory    888888888888888888888888888888
    EnglishDirectory    1
