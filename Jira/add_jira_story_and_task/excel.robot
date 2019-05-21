*** Settings ***
Suite Setup
Suite Teardown
Library           ExcelRobot
Resource          jira_add_resource.robot

*** Test Case ***
read_myExcel
    [Tags]    exel_task
    [Setup]    login
    #######读Excel文件，并保存为list
    Open Excel    C:\\Users\\Administrator\\Desktop\\task.xls
    ${sheetname}    Get Sheet Names    #读取所有sheet页
    ${count_col_sheet1}    Get Column Count    ${sheetname}[0]    #获取文本行/列数
    ${count_row_sheet1}    Get Row Count    ${sheetname}[0]    #获取文本行/列数
    : FOR    ${循环行号}    IN RANGE    ${count_row_sheet1 -1}    #读取Count-1次（不读取第一行）
    \    log    执行Excel第几行记录：${循环行号 + 1}    #输出所在行
    \    ${read_row_sheet1}    Get Row Values    ${sheetname}[0]    ${循环行号 + 1}    #${}是Excel的sheet名，1代表Excel的第一行，读完${read_column_sheet1_A}是一个list
    \    log    设置项目命令的value值 \ 思路：如果“项目名称”为空，设置值为 -1；否则读取excel的值
    \    ${项目名称_value}    Set Variable If    '' == '${read_row_sheet1}[4][1]'    -1    ${read_row_sheet1}[4][1]    #如果“项目名称”为空，设置值为 -1；否则读取excel的值
    \    log    设置title前缀 \ 思路：设置前缀；判断excel中模块不为空时，则是产品
    \    ${prefix}    Set Variable If    '' != '${read_row_sheet1}[3][1]'    【产品】(${read_row_sheet1}[0][1])    【项目】(${read_row_sheet1}[0][1])    #设置前缀；判断excel中模块不为空时，则是产品
    \    log    步骤3： 执行用例
    \    Run Keyword    add_task    ${read_row_sheet1}[0][1]    ${prefix}---${read_row_sheet1}[1][1]    ${read_row_sheet1}[2][1]    ${read_row_sheet1}[3][1]
    \    ...    ${项目名称_value}    ${read_row_sheet1}[5][1]    ${read_row_sheet1}[6][1]    ${read_row_sheet1}[7][1]
    [Teardown]    Close Browser
