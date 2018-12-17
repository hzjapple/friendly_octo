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
    Navigator To Link    Setup and Maintenance
    #Wait Exists And Click Element    ${SETUP.ELEMENT.FINANCIAL}
    #Wait Exists And Click Element    ${SETUP.ELEMENT.USERS_AND_ROLE_SECURITY}
    #Wait Exists And Click Element    ${SETUP.ELEMENT.MANAGE_DATA_ROLE_AND_SECURITY_PROFILES}
    #Wait Exists And Click Element    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.BUTTON.CREATE}
    #Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.DATA_ROLE}    Custom HCM Data Role
    #Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.JOB_ROLE}    Human Resource Analyst
    #Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.ROLE_DESCRIPTION}    CustomHCM Data Role Data for inheriting 'Human Resource Analyst' Job Role
    #Click Buton    ${CREATE_DATA_ROLE.BUTTON.NEXT}
    #Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.ORGANIZATION_SECURITY_PROFILE}    View All Organizations
    #Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.POSITION_SECURITY_PROFILE}    View All Positions
    #Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.LEGISLATIVE_DATA_GROUP}    View All Legislative Data Groups
    #Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PERSON}    View All People
    #Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PUBLIC_PERSON}    View All People
    #Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.DOCUMENT_TYPE}    View All Document Types
    #Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PAYROLL_FLOW}    View All Flows
    #Click Buton    ${SECURITY_CRITERIA.BUTTON.NEXT}
    #Verify Page And Click Next    ${ORGANIZATION.BUTTON.NEXT}    ${ORGANIZATION.TEXT.ORGANIZATION_SECURITY_PROFILE}    View All Organizations
    #Click Next And Verify Page    ${POSITION.BUTTON.NEXT}    ${POSITION.TEXT.POSITION_SECURITY_PROFILE}    View All Positions
    #Click Next And Verify Page    ${LEGISLATIVE_DATA_GROUP.BUTTON.NEXT}    ${POSITION.TEXT.LEGISLATIVE_DATA_GROUP}    View All Legislative Data Groups
    #Click Next And Verify Page    ${PERSON.BUTTON.NEXT}    ${POSITION.TEXT.PERSON}    View All People
    #Click Next And Verify Page    ${PUBLIC_PERSON.BUTTON.NEXT}    ${PUBLIC_PERSON.TEXT.PUBLIC_PERSON}    View All People
    #Click Next And Verify Page    ${DOCUMENT_TYPE.BUTTON.NEXT}    ${DOCUMENT_TYPE.TEXT.DOCUMENT_TYPE}    View All Document Types
    #Click Next And Verify Page    ${PAYROLL_FLOW.BUTTON.NEXT}    ${PAYROLL_FLOW.TEXT.PAYROLL_FLOW}    View All Flows
    #Wait Exists And Click Element    ${REIVEW.ELEMENT.SUBMIT}

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
