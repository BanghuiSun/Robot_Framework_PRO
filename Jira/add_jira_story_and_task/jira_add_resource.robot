*** Settings ***
Resource          ../common.robot
Resource          ../../RFS_Basic/operate.txt

*** Keywords ***
add_story
    [Arguments]    ${projectName}    ${type}    ${summary}    ${desc}
    #step1 进入新增task页面
    Go To    http://jira.chinacloud.com.cn/secure/CreateIssue!default.jspa    #进入创建问题页面
    Wait Until Element Contains    xpath=//*[@id="content"]/header/div/div/h1    创建问题    8    未成功进入创建问题页面
    choose_mode    id=project-field    ${projectName}
    choose_mode    id=issuetype-field    ${type}
    #点击新建，进入新建页面
    Wait Until Element Is Enabled    id=issue-create-submit    3    按钮不可点击
    点击元素    id=issue-create-submit
    #step2 输入issue基本信息
    enter_issue_basic_info    ${summary}    ${desc}
    #step3 确认新建问题
    点击元素    id=issue-create-submit
    #step4 验证
    Wait Until Element Is Visible    id=summary-val    10    超时
    Element Text Should Be    id=summary-val    ${summary}    Pass @@@${type}添加成功！    Fail @@@${type}添加失败！
    #step 提取单号
    ${issueNo}    Get Text    id=key-val

add_task
    [Arguments]    ${storyid}    ${summary}    ${desc}    ${模块}    ${项目名称的value}    ${钉钉单号}
    ...    ${owner}    ${预估时间}
    ${projectName}    ${type} =    Set Variable    测试中心 (TESTCENTER)    任务
    log    step1 搜索自定story并进入子级创建页面
    search_issue    ${storyid}
    log    step2 选择项目及类型
    choose_mode    id=project-field    ${projectName}
    choose_mode    id=issuetype-field    ${type}
    log    step3 输入issue基本信息（标题、描述）
    等待元素可见    css=[title="获取问题类型的本地帮助"]    #验证问题后的小问号
    enter_issue_basic_info    ${summary}    ${desc}
    log    step4 输入issue高级信息(模块、项目名称、钉钉单号、经办人)
    enter_issue_ext_info    ${模块}    ${项目名称的value}    ${钉钉单号}    ${owner}
    log    step5 设置预估时间
    enter_issue_time    xpath=*//strong[text()='Plan']    ${预估时间}
    log    step6 确认新建
    等待元素可见    id=create-issue-submit
    点击元素    id=create-issue-submit
    log    step7 验证
    Wait Until Page Contains    ${summary} 已成功创建。    10    新建超时！

choose_mode
    [Arguments]    ${ele}    ${keywords}
    #resouce
    等待元素可见    ${ele}
    Sleep    0.5
    输入文本    ${ele}    ${keywords}
    Sleep    0.5
    回车键    ${ele}
    Sleep    0.5

enter_issue_basic_info
    [Arguments]    ${summary}    ${desc}
    #resource 输入issue基本信息
    等待元素可见    id=summary
    输入文本    id=summary    ${summary}    #title
    Sleep    0.5
    等待元素可见    id=description
    输入文本    id=description    ${desc}    #desc
    Sleep    0.5

enter_issue_time
    [Arguments]    ${ele}    ${time}
    #resource 设置task的预估时间
    等待元素可见    ${ele}
    点击元素    ${ele}    #点击PLAN，设置时间
    等待元素可见    id=timetracking_originalestimate
    输入文本    id=timetracking_originalestimate    ${time}    #story的时间

search_issue
    [Arguments]    ${search}
    #resource 搜索问题-添加task用
    #step1 搜索
    Wait Until Element Is Enabled    id=quickSearchInput    5    ERROR
    输入文本    id=quickSearchInput    ${search}
    回车键    id=quickSearchInput
    #step2 验证
    等待元素可见    id=key-val
    ${search}    Evaluate    '${search}'.strip()    #去掉前后的空格
    Element Text Should Be    id=key-val    ${search}    搜索结果不匹配
    #step3 进入子级创建页面
    等待元素可见    id=child_create_link_button
    点击元素    id=child_create_link_button

enter_issue_ext_info
    [Arguments]    ${mode}    ${projectValue}    ${dingNUM}    ${owner}
    #选择模块、项目名称、钉钉单号、经办人
    #step1 模块-产品用
    Run Keyword If    '' != '${mode}'    choose_mode    id=components-textarea    ${mode}    #为空时，不执行
    #step2 项目及钉钉单号-项目用
    等待元素可见    id=customfield_11801
    Select From List By Value    id=customfield_11801    ${projectValue}
    等待元素可见    id=customfield_11800
    输入文本    id=customfield_11800    ${dingNUM}
    #step3 经办人
    choose_mode    id=assignee-field    ${owner}
