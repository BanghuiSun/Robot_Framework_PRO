*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Test Teardown     Enter_dashboard
Resource          dataDictionaryResource.robot

*** Test Cases ***
case0_adddic
    banghui_dic
