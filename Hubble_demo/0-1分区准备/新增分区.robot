*** Settings ***
Resource          zoneResource.robot

*** Test Cases ***    zoneName          desc                                  function
case01                [Tags]            zone
                      [Setup]           login
                      [Template]        AddZone
                      原始区               我是描述信息                                应用业务字典
                      缓冲区               我是描述信息                                应用业务字典
                      贴源区               我是描述信息                                数据资源地图
                      业务区               我是描述信息                                推送服务
                      应用服务区             我是描述信息                                数据资源地图
                      [Teardown]        Close Browser

TEST                  [Tags]            demo
                      ${TMP}            Set Variable                          你不好
                      ${func}           Set Variable If                       "${TMP}" == "你好"      OK1       "${TMP}" == "他好"    OK2    "${TMP}" == "你不好"    OK3
                      Run Keyword If    "${TMP}" not in ["你不好","他好","你不好"]    Fail
                      LOG               ${func}
                      ${TMP}            Set Variable                          好,你好
                      ${TMP1}           Set Variable If                       "${TMP}" == "好,你好"    好,你好      3
                      Log               ${TMP1.split(",")}
                      @{TMP}            Set Variable                          ${TMP1.split(",")}
                      : FOR             ${222}                                IN                    @{TMP}
                      \                 LOG                                   ${222}
                      log               outside loop
