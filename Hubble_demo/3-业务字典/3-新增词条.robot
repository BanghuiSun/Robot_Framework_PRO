*** Settings ***
Suite Setup       login
Suite Teardown    Close Browser
Test Teardown     Enter_dashboard
Resource          dataDictionaryResource.robot

*** Test Cases ***
case1_adddiclist_水利局
    [Template]    AddDicList
    水利局字典    id    唯一键    水利局-唯一键    GA/T id    GA DE -id
    水利局字典    code    河段编号    水利局-河段编号    GA/T code    GA DE -code
    水利局字典    name    河段名称    水利局-河段名称    GA/T name    GA DE -name
    水利局字典    begin_lon    起点断面经度    水利局-起点断面经度    GA/T begin_lon    GA DE -begin_lon
    水利局字典    begin_lat    起点断面纬度    水利局-起点断面纬度    GA/T begin_lat    GA DE -begin_lat
    水利局字典    end_lon    终点断面经度    水利局-终点断面经度    GA/T end_lon    GA DE -end_lon
    水利局字典    end_lat    终点断面纬度    水利局-终点断面纬度    GA/T end_lat    GA DE -end_lat
    水利局字典    in_section_code    入境断面编号    水利局-入境断面编号    GA/T in_section_code    GA DE -in_section_code
    水利局字典    in_section_name    入境断面名称    水利局-入境断面名称    GA/T in_section_name    GA DE -in_section_name
    水利局字典    out_section_code    出境断面编号    水利局-出境断面编号    GA/T out_section_code    GA DE -out_section_code
    水利局字典    out_section_name    出境断面名称    水利局-出境断面名称    GA/T out_section_name    GA DE -out_section_name
    水利局字典    reach_len    河段长度    水利局-河段长度    GA/T reach_len    GA DE -reach_len
    水利局字典    dike_len    堤防长度    水利局-堤防长度    GA/T dike_len    GA DE -dike_len
    水利局字典    city_dike_len    城区段堤防长度    水利局-城区段堤防长度    GA/T city_dike_len    GA DE -city_dike_len
    水利局字典    village_dike_len    穿村段堤防长度    水利局-穿村段堤防长度    GA/T village_dike_len    GA DE -village_dike_len
    水利局字典    has_water_improv_plant    是否计划进行水质改善工作    水利局-是否计划进行水质改善工作    GA/T has_water_improv_plant    GA DE -has_water_improv_plant
    水利局字典    city_water_quantity    城区段河道水量估算    水利局-城区段河道水量估算    GA/T city_water_quantity    GA DE -city_water_quantity
    水利局字典    has_sewage_outfall    是否含污水处理厂    水利局-是否含污水处理厂    GA/T has_sewage_outfall    GA DE -has_sewage_outfall
    水利局字典    sewage_outfall    排污口数量    水利局-排污口数量    GA/T sewage_outfall    GA DE -sewage_outfall
    水利局字典    has_outfall_improv_plant    排污口是否已纳入治理计划    水利局-排污口是否已纳入治理计划    GA/T has_outfall_improv_plant    GA DE -has_outfall_improv_plant
    水利局字典    ischeck_sanitation    是否环境考核    水利局-是否环境考核    GA/T ischeck_sanitation    GA DE -ischeck_sanitation
    水利局字典    ischeck_water    是否水质考核    水利局-是否水质考核    GA/T ischeck_water    GA DE -ischeck_water
    水利局字典    aim_water_grades_val    目标水质类别数值    水利局-目标水质类别数值    GA/T aim_water_grades_val    GA DE -aim_water_grades_val
    水利局字典    aim_water_grades_name    目标水质类别名称    水利局-目标水质类别名称    GA/T aim_water_grades_name    GA DE -aim_water_grades_name
    水利局字典    ischeck_makeup    是否水质检测补偿    水利局-是否水质检测补偿    GA/T ischeck_makeup    GA DE -ischeck_makeup
    水利局字典    water_score_rule_id    水质评分规则唯一键    水利局-水质评分规则唯一键    GA/T water_score_rule_id    GA DE -water_score_rule_id
    水利局字典    water_score_rule_name    水质评分规则名称    水利局-水质评分规则名称    GA/T water_score_rule_name    GA DE -water_score_rule_name
    水利局字典    sanitation_score_rule_id    考核评分规则唯一键    水利局-考核评分规则唯一键    GA/T sanitation_score_rule_id    GA DE -sanitation_score_rule_id
    水利局字典    sanitation_score_rule_name    考核评分规则名称    水利局-考核评分规则名称    GA/T sanitation_score_rule_name    GA DE -sanitation_score_rule_name
    水利局字典    remark    备注    水利局-备注    GA/T remark    GA DE -remark
    水利局字典    check_dept_code    考核部门编码    水利局-考核部门编码    GA/T check_dept_code    GA DE -check_dept_code
    水利局字典    check_dept_name    考核部门名称    水利局-考核部门名称    GA/T check_dept_name    GA DE -check_dept_name
    水利局字典    county_code    区县编码    水利局-区县编码    GA/T county_code    GA DE -county_code
    水利局字典    county_name    区县名称    水利局-区县名称    GA/T county_name    GA DE -county_name
    水利局字典    river_id    河道唯一键    水利局-河道唯一键    GA/T river_id    GA DE -river_id
    水利局字典    river_name    河道名称    水利局-河道名称    GA/T river_name    GA DE -river_name
    水利局字典    river_type    河道分类    水利局-河道分类    GA/T river_type    GA DE -river_type
    水利局字典    river_type_name    河道分类名称    水利局-河道分类名称    GA/T river_type_name    GA DE -river_type_name
    水利局字典    river_manager_id    河长唯一键    水利局-河长唯一键    GA/T river_manager_id    GA DE -river_manager_id
    水利局字典    river_manager_name    河长姓名    水利局-河长姓名    GA/T river_manager_name    GA DE -river_manager_name
    水利局字典    river_manager_aid_id    河长助理唯一键    水利局-河长助理唯一键    GA/T river_manager_aid_id    GA DE -river_manager_aid_id
    水利局字典    river_manager_aid_name    河长助理姓名    水利局-河长助理姓名    GA/T river_manager_aid_name    GA DE -river_manager_aid_name
    水利局字典    sort    排序    水利局-排序    GA/T sort    GA DE -sort
    水利局字典    origin_reach_code    水源河道编码    水利局-水源河道编码    GA/T origin_reach_code    GA DE -origin_reach_code
    水利局字典    origin_reach_name    水源河道名称    水利局-水源河道名称    GA/T origin_reach_name    GA DE -origin_reach_name

case2_adddiclist
    [Template]    AddDicList
    EnglishDirectory    1    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    a    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    English123    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    123English    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    _    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    -    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    -_    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    _-_    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    _English    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    _English_-_    身份证号    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    01    1    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    02    12345678901234567890123456789012345678901234567890    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    03    {}    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    04    []【】    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    05    是的123    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    06    123斯蒂芬    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    07    _    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    08    -    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    09    -_    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    10    _-_    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    11    {}】【】】（）-    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    12    斯蒂芬是否-_    身份证号    GA/T ID-Card    Card-001
    EnglishDirectory    desc    描述    在出席上海合作组织青岛峰会后，习近平开始在山东考察。12日上午，习近平首先来到青岛海洋科学与技术试点国家实验室，了解实验室研究重大前沿科学问题、系统布局和自主研发海洋高端装备、推进海洋军民融合等情况。离开实验室时，科研人员纷纷围聚过来，向总书记问好。习近平说，建设海洋强国，我一直有这样一个信念。发展海洋经济、海洋科研是推动我们强国战略很重要的一个方面，一定要抓好。关键的技术要靠我们自主来研发，海洋经济的发展前途无量。他勉励大家，再接再厉，创造辉煌，为祖国为民族立新功。（记者张晓松）哈哈哈哈哈哈哈哈哈哈哈哈    GA/T ID-Card    Card-001

case3_adddiclist
    [Template]    AddDicList
    中文业务字典    SFHM1    身份证号    身份证号    GA/T ID-Card    Card-001
    中文业务字典    SFHM2    身份证号    身份证号    GA/T ID-Card    Card-001
    中文业务字典    SFHM3    身份证号    身份证号    GA/T ID-Card    Card-001
    中文业务字典    SFHM4    身份证号    身份证号    GA/T ID-Card    Card-001
    中文业务字典    SFHM5    身份证号    身份证号    GA/T ID-Card    Card-001
