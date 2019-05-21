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
    dic_大数据平台_new3
