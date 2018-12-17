*** Settings ***
Suite Teardown    CloseDriverserver
Library           Selenium2Library    timeout=30s    implicit_wait=2s
Resource          resource.robot
Library           String

*** Test Cases ***
01 Create Custom Job Roles
    Open Chrome Browser    ${ORACLE URL}
    # Login Oracle
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    # Go to page: Security Console
    Navigator To Link    Security Console
    Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    # Click button [Create Role]
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.CREATE_ROLE}
    # Fill "Role Name", "Role Code", "Role Category"
    Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_NAME}    PwC Custom View Custom Infolet
    Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_CODE}    PWC_CUSTOM_VIEW_CUSTOM_INFOLET2
    Wait Exists And Click Element    ${CREATE_ROLE_PAGE.LIST.ROLE_CATEGORY_EXPAND}
    Wait Exists And Click Element    ${CREATE_ROLE_PAGE.LIST_ITEM.ROLE_CATEGORY}[text()="Common - Job Roles"]
    # Click [Next] until "Role Hierarchy" tab
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Wait Until Element Is Visible    ${CREATE_ROLE_PAGE.LABEL.FUNCTION_SECURITY_POLICIES}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Wait Until Element Is Visible    ${CREATE_ROLE_PAGE.LABEL.DATA_SECURITY_POLICIES}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Wait Until Element Is Visible    ${CREATE_ROLE_PAGE.LABEL.ROLE_HIERARCHY}
    # Add Role Membership
    Wait Exists And Click Element    ${CREATE_ROLE_PAGE.BUTTON.ADD_ROLE}
    Wait Until Element Is Visible    ${CREATE_ROLE_PAGE.LABEL.ADD_ROLE_MEMBERSHIP}
    # Search Role Membership
    Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_MEMBERSHIP_SEARCH}    BI Administrator Role
    Wait Exists And Click Element    ${CREATE_ROLE_PAGE.BUTTON.SEARCH}
    ${dynamic_xpath}=    Replace String    ${CREATE_ROLE_PAGE.DIV.SEARCH_RESULT}    to_be_replaced    BI Administrator Role
    Wait Exists And Click Element    ${dynamic_xpath}
    Wait Exists And Click Element    ${CREATE_ROLE_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}
    # Click Ok and Next Until Save and Close
    Click Element Until Deleted From Page    ${COMMON.BUTTON.OK}
    Click Element Until Deleted From Page    ${COMMON.BUTTON.CANCEL}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Wait Until Element Is Visible    ${CREATE_ROLE_PAGE.LABEL.USERS}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Wait Until Element Is Visible    ${CREATE_ROLE_PAGE.LABEL.SUMMARY}
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}

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
