*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Resource          dataResResource.robot

*** Test Cases ***
case
    [Tags]    datares_f
    [Setup]
    [Template]    AddFolder
    Auto_test    desc
    Auto_test2    desc
    Auto_test3    desc
    [Teardown]    Enter_dashboard
