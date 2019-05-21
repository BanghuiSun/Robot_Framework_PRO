*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Test Teardown     Enter_dashboard
Resource          dataDictionaryResource.robot

*** Test Cases ***
case1_addfolder
    [Template]    AddFolder
    dic_大数据平台_new    banghui_dic
    EnglishDirectory    中文业务字典
    EnglishDirectory    EnglishDirectory
