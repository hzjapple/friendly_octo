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
    Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_CODE}    PWC_CUSTOM_VIEW_CUSTOM_INFOLET4
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
    Wait Exists And Click Element    ${COMMON.BUTTON.OK}
    Wait Until Page Does Not Contain Element    ${COMMON.LABEL.CONFIRMATION}
    Click Element Until Deleted From Page    ${COMMON.BUTTON.DIALOG_CLOSE}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Wait Until Element Is Visible    ${CREATE_ROLE_PAGE.LABEL.USERS}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Wait Until Element Is Visible    ${CREATE_ROLE_PAGE.LABEL.SUMMARY}
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    Logout Oracle

02 Create HCM Data Role
    #Open Chrome Browser    ${ORACLE URL}
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    # Login Oracle
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Setup and Maintenance
    # Select the Users and Security Functional Areas, click the Manage Data Role and Security Profiles task.
    Wait Exists And Click Element    ${SETUP.LIST.SETUP_EXPAND}
    Wait Exists And Click Element    ${SETUP.LIST_ITEM.SETUP_ITEM}
    Wait Until Page Contains Element    ${SETUP.ELEMENT.FINANCIAL_LOAD}
    Wait Exists And Click Element    ${SETUP.ELEMENT.USERS_AND_ROLE_SECURITY}    10
    Wait Exists And Click Element    ${SETUP.ELEMENT.MANAGE_DATA_ROLE_AND_SECURITY_PROFILES}    10
    # Create Custom Role
    Wait Exists And Click Element    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.BUTTON.CREATE}
    Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.DATA_ROLE}    Custom HCM Data Role
    Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.JOB_ROLE}    Human Resource Analyst
    Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.ROLE_DESCRIPTION}    Custom HCM Data Role Data for inheriting 'Human Resource Analyst' Job Role
    Click Element    ${COMMON.BUTTON.NEXT}
    # Fill Data Role Info: ' Organization: View All Organizations',Position: View All Positions,Legislative Data Group: View All Legislative Data Groups,Person: View All People,Public Person: View All People,Document Type: View All Document Types,Payroll Flow: View All Flows
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.ORGANIZATION_SECURITY_PROFILE}    View All Organizations
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.POSITION_SECURITY_PROFILE}    View All Positions
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.LEGISLATIVE_DATA_GROUP}    View All Legislative Data Groups
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PERSON}    View All People
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PUBLIC_PERSON}    View All People
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.DOCUMENT_TYPE}    View All Document Types
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PAYROLL_FLOW}    View All Flows
    Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Organization Security Profile    ${ORGANIZATION.ELEMENT.VALUE}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Position Security Profile    ${POSITION.ELEMENT.VALUE}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Legislative Data Group Security Profile    ${LEGISLATIVE_DATA_GROUP.ELEMENT.VALUE}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Person Security Profile    ${PERSON.ELEMENT.VALUE}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Public Person Security Profile    ${PUBLIC_PERSON.ELEMENT.VALUE}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Document Type Security Profile    ${DOCUMENT_TYPE.ELEMENT.VALUE}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Payroll Flow Security Profile    ${PAYROLL_FLOW.ELEMENT.VALUE}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Wait Exists And Click Element    ${COMMON.BUTTON.SUBMIT}

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
