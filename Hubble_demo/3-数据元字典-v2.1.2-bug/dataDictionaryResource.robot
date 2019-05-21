*** Settings ***
Resource          ../common.robot
Resource          ../../RFS_Basic/verify.txt

*** Keywords ***
AddDic
    [Arguments]    ${name}
    #step1 进入新增页面
    Enter_menu    数据元字典    none
    截图    img_log
    等待元素可见    css=[title="新建字典"]
    点击元素    css=[title="新建字典"]    #点击新增字典
    等待元素可见    xpath=/html/body/div[3]/div/div/div/div[2]/div[2]/input
    #step2 输入字典名称
    Sleep    0.5
    输入文本    xpath=/html/body/div[3]/div/div/div/div[2]/div[2]/input    ${name}
    Sleep    0.5
    点击按钮    确定
    #step3 验证
    Wait Until Page Contains    新增字典成功    8    ERROR    #右上角提示
    Page Should Contain    新增字典成功
    Sleep    0.2
    Element Attribute Should Be Equal    xpath=*//div[@class='dirTree scrollable']/treecontrol/ul/li[last()]/div/span/span[2]    tooltip    ${name}    提示成功，但实际添加失败！！！
    Sleep    1

AddFolder
    [Arguments]    ${dic}    ${folder}
    #step1 选择字典
    Enter_menu    数据元字典    none
    等待元素可见    css=[title=新建目录]
    等待元素可见    xpath=*//span[@tooltip='${dic}']/../..
    点击元素    xpath=*//span[@tooltip='${dic}']/../..    #选中字典
    Sleep    0.2
    #step2 点击新增目录
    点击元素    css=[title=新建目录]
    等待元素可见    xpath=/html/body/div[3]/div/div/div/div[2]/div[2]/input
    Sleep    0.5
    输入文本    xpath=/html/body/div[3]/div/div/div/div[2]/div[2]/input    ${folder}
    Sleep    1
    点击按钮    确定
    Wait Until Page Contains    新增目录成功    8    ERROR    #右上角提示
    Page Should Contain    新增目录成功
    Sleep    0.5
    #step3 验证
    ${ele_att}    Get Element Attribute    xpath=*//span[@tooltip='${dic}' and contains(@class,'nodeName')]/../../..    class
    Run Keyword If    'tree-collapsed' in '${ele_att}'    点击元素    xpath=*//span[@tooltip='${dic}' and contains(@class,'nodeName')]/../..    #判断是否展开
    Element Attribute Should Be Equal    xpath=*//treeitem/ul/li[last()]/div/span/span[2]    tooltip    ${folder}    提示成功，但实际添加失败！！！
    Sleep    1

AddDicList
    [Arguments]    ${dic}    ${fileds}    ${name}    ${desc}    ${GBFile}    ${GBCode}
    #step1 选择字典
    Enter_menu    数据元字典    none
    等待元素可见    xpath=*//span[@tooltip='${dic}']/../..
    点击元素    xpath=*//span[@tooltip='${dic}']/../..    #选中字典
    Sleep    1
    Wait Until Element Is Enabled    css=[class=addDictItemBtn]>button    5    ERROR
    #step2 进入添加词条页面
    鼠标停留    xpath=*//button[text()=' 添加词条']
    Sleep    0.5
    等待元素可见    xpath=*//ul[@ng-show='addDictItemShow']/li[text()='手动添加']
    鼠标停留    xpath=*//ul[@ng-show='addDictItemShow']/li[text()='手动添加']
    点击元素    xpath=*//ul[@ng-show='addDictItemShow']/li[text()='手动添加']
    等待元素可见    xpath=/html/body/div[3]/div/div/div/div[2]/div[1]/div[1]/input
    #step2 输入词条信息
    Sleep    0.5
    输入文本    xpath=*//label[text()='字段标识符']/../input    ${fileds}
    输入文本    xpath=*//label[text()='中文名称']/../input    ${name}
    输入文本    xpath=*//label[text()='描述']/../input    ${desc}
    输入文本    xpath=*//label[text()='国标文件编号']/../input    ${GBFile}
    输入文本    xpath=*//label[text()='国标编码']/../input    ${GBCode}
    点击按钮    确定
    #step3 验证
    Wait Until Page Contains    新增-业务词条成功    8    ERROR    #右上角提示
    Wait Until Page Does Not Contain Element    xpath=*//h3[text()='新增-业务词条']    5    ERROR    #新增框消失
    Element Attribute Should Be Equal    xpath=*//div[@class='dictPacks scrollable']/div[1]/div[1]/span    tooltip    ${fileds}    提示成功，但实际添加失败！！！
    Sleep    1

DelAllDicList
    [Arguments]    ${values}
    Log    ${values}
    Log    删除全部词条
    Enter_menu    数据元字典    none
    等待元素可见    css=[title=删除]
    ${dict_count}    Get Matching Xpath Count    xpath=*//ul[@class='treeUl ng-scope']/li
    : FOR    ${index}    IN RANGE    1    ${dict_count}+1
    \    点击元素    xpath=*//ul[@class='treeUl ng-scope']/li[1]/div
    \    Element Attribute Should Contain    xpath=*//ul[@class='treeUl ng-scope']/li[1]/div    class    selected    未选中！！！
    \    点击元素    css=[title=删除]
    \    等待元素可见    xpath=*//h3[text()='确认删除']
    \    点击按钮    确定
    \    Wait Until Page Does Not Contain Element    xpath=*//h3[text()='确认删除']    8    ERROR
    \    Wait Until Page Contains    删除字典成功    8    ERROR    #右上角提示
    \    Run Keyword If    ${index} < ${dict_count}    Page Should Not Contain Element(attribute)    xpath=*//ul[@class='treeUl ng-scope']/li[1]/div/span/span[2]    tooltip    提示成功，删除失败！！！
    \    ...    ELSE    Page Should Not Contain Element    xpath=*//ul[@class='treeUl ng-scope']/li[1]/div    提示成功，删除失败！！！
    \    Sleep    1
