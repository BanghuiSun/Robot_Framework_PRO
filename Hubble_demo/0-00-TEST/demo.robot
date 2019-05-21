*** Settings ***
Resource          ../../RFS_Basic/operate.txt

*** Test Cases ***
DateTime
    ${value}    Generate Random String
    log    ${value}
