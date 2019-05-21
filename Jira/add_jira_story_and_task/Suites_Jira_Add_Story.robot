*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Resource          jira_add_resource.robot

*** Test Cases ***    项目关键字                问题类型         问题标题     问题描述
add_story             [Tags]               story
                      [Template]           add_story
                      测试中心 (TESTCENTER)    story        测试用谢谢    测试用谢谢
