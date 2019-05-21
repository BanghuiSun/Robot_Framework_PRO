*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Resource          jira_add_resource.robot

*** Test Cases ***    Story              问题标题                                                          问题描述                                      产品模块               项目名称value    钉钉单号                     经办人      预估时间
add_task_2019-5-13    [Tags]             task
                      [Template]         add_task
                      TESTCENTER-6457    【产品】(story:6457)---FAST V1.2版本测试--参与FASTV1.2数据质量设置review会议    参与FASTV1.2数据质量设置review会议                  【产品】FAST V1.x版本    -1           \                        sunbh    4h
                      TESTCENTER-6487    【项目】(story:6487)--修改HLD项目测试大纲《JD数据中心资源管理系统出所验收大纲》             修改HLD项目专家评审后的测试大纲 《JD数据中心资源管理系统出所验收大纲》    \                  HLD 云计算      201904151550000099060    sunbh    6h
                      TESTCENTER-6457    【产品】(story:6457)---FAST V1.2版本测试--熟悉新功能需求                     熟悉新功能需求 数据质量专题报告                          【产品】FAST V1.x版本    -1           \                        sunbh    4h
