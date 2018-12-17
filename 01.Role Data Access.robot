*** Settings ***
Suite Teardown    CloseDriverserver
Library           Selenium2Library    timeout=30s    implicit_wait=2s
Resource          resource.robot

*** Test Cases ***
01 Create Custom Job Roles
    Open Chrome Browser    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Security Console
    #Click Button    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    #Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.CREATE_ROLE}
    #Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_NAME}    PwC Custom View Custom Infolet
    #Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_CODE}    PWC_CUSTOM_VIEW_CUSTOM_INFOLET
    #Select From List By Label    ${CREATE_ROLE_PAGE.TEXT.ROLE_CATEGORY}    Common - Job Roles
    #Wait Exists And Input Text    ${COMMON.TEXT.ROLE_CODE}    PWC_CUSTOM_VIEW_CUSTOM_INFOLET

02 Create HCM Data Role
    Open Chrome Browser    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Security Console

03 Create Migration User Account
    Open Chrome Browser    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Security Console

04 Create Dashboard User Account
    Open Chrome Browser    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Security Console

05 Create RDCConversion User Account
    Open Chrome Browser    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Security Console
