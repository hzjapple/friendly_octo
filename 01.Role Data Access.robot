*** Settings ***
Suite Teardown    CloseDriverserver
Library           SeleniumLibrary    timeout=30s    implicit_wait=2s
Resource          resource.robot
Library           OperatingSystem
Library           ExcelLibrary
Library           String
Library           Dialogs
Library           List

*** Variables ***
${unit_excel_file}    Unit_DT.xls
${E2E_excel_file}    E2E_DT.xls

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
    # Veripy pages content
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
    # Submit data
    Wait Exists And Click Element    ${COMMON.BUTTON.SUBMIT}
    # Logout Oralce
    Logout Oracle

03 Create Migration User Account
    Open Chrome Browser    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Security Console
    Wait Exists And Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    # Add User and fill information
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.USERS}
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.ADD_USER_ACCOUNT}
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.FIRST_NAME}    RDC
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.LAST_NAME}    Analyst
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.EMAIL}    nita.ye@pwc.com
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.USER_NAME}    RDCAnalyst
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.PASSWORD}    Welcome1
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.CONFIRM_PASSWORD}    Welcome1
    # Open Add Roles page
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}
    # Add Role - Employee with code 'ORA_PER_EMPLOYEE_ABSTRACT'
    Add Role    Employee    ORA_PER_EMPLOYEE_ABSTRACT
    # Add Role - Application Implementation Consultant with code 'ORA_ASM_APPLICATION_IMPLEMENTATION_CONSULTANT_JOB'
    Add Role    Application Implementation Consultant    ORA_ASM_APPLICATION_IMPLEMENTATION_CONSULTANT_JOB
    # Add Role - PwC Custom BI Administrator Role with code 'PWC_CUSTOM_BI_ADMINISTRATOR_ROLE'
    Add Role    PwC Custom BI Administrator Role    PWC_CUSTOM_BI_ADMINISTRATOR_ROLE
    # Add Role - PwC Custom View Custom Infolet with code 'PWC_CUSTOM_VIEW_CUSTOM_INFOLET'
    Add Role    PwC Custom View Custom Infolet    PWC_CUSTOM_VIEW_CUSTOM_INFOLET
    # Add Roles are completed and then click Done button to back Edit page
    Wait Until Element Be Clicked    ${COMMON.BUTTON.DONE}
    # Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    # Logout Oralce
    Logout Oracle

14 Create Dashboard User Account
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    #Navigator To Link    Setup and Maintenance
    Sleep    10s
    # Select the Users and Security Functional Areas, click the Manage Data Access for Users task.
    Wait Exists And Click Element    ${SETUP.LIST.SETUP_EXPAND}
    Wait Exists And Click Element    ${SETUP.LIST_ITEM.SETUP_ITEM}
    Wait Until Page Contains Element    ${SETUP.ELEMENT.FINANCIAL_LOAD}
    Wait Exists And Click Element    ${SETUP.ELEMENT.USERS_AND_ROLE_SECURITY}
    Wait Exists And Input Text    ${SETUP.TEXT.SEARCH_TASK}    Manage Data Access for Users
    Wait Exists And Click Element    ${SETUP.BUTTON.SEARCH}
    Wait Exists And Click Element    ${SETUP.ELEMENT.MANAGE_DATA_ACCESS_AND_USERS}
    Wait Until Page Contains    Manage Data Access for Users
    Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.USERACCESS}
 
    #Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.CREATE}
    # Add data access to Role with unit
    Grant Data Access to User Role    RDC2Dashboard2    Employee    Business unit    DELWP2 BU1    # PwC South Africa cannot be found
    # Add another role
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.BUTTON.ADD_ROW}
    Sleep    15s
    Grant Data Access to User Role    RDC2Dashboard2    Accounts Receivable Manager    Business unit    DELWP2 BU1    # PwC South Africa cannot be found
    # Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    
    # Logout Oralce
    Logout Oracle

04 Create Dashboard User Account
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Users and Roles
    # Add person
    Wait Exists And Click Element    ${SEARCH_PERSON.BUTTON.CREATE_PERSON}
    Wait Until Page Contains    Create User
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.LAST_NAME}    RDC
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.FIRST_NAME}    Dashboard
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.USER_NAME}    RDCDashboard
    Wait Exists And Click Element    ${CREATE_USER_PAGE.LIST.PERSON_TYPE_LIST}
    Wait Exists And Click Element    ${CREATE_USER_PAGE.TEXT.PERSON_TYPE_ITEM}
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.LEGAL_EMPLOYER}    MS_HIA_CORP    20    #PG US West cannot be found
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.BUSINESS_UNIT}    DELWP2 BU1    #11000 cannot be found
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.EMAIL}    chaitanya.jain@pwc.com
    # Save and Close
    Wait Exists And Click Element    ${CREATE_USER_PAGE.BUTTON.SAVE_AND_CLOSE}
    # Open Edit Roles page
    Navigator To Link    Security Console
    Wait Exists And Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.USERS}
    # Search Users
    Wait Until Page Contains    User Accounts
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.SEARCH_USER_NAME}    RDCDashboard
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.LINK.USER}
    Wait Until Page Contains    User Account Details: Dashboard RDC
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.EDIT}
    # Open Add Roles page
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}
    # Add Role - Employee with code 'ORA_PER_EMPLOYEE_ABSTRACT'
    Add Role    Employee    ORA_PER_EMPLOYEE_ABSTRACT
    # Add Role - Application Implementation Consultant with code 'ORA_ASM_APPLICATION_IMPLEMENTATION_CONSULTANT_JOB'
    Add Role    Application Implementation Consultant    ORA_ASM_APPLICATION_IMPLEMENTATION_CONSULTANT_JOB
    # Add Role - PwC Custom View Custom Infolet with code 'PWC_CUSTOM_VIEW_CUSTOM_INFOLET'
    Add Role    PwC Custom View Custom Infolet    PWC_CUSTOM_VIEW_CUSTOM_INFOLET
    # Add Roles are completed and then click Done button to back Edit page
    Wait Until Element Be Clicked    ${COMMON.BUTTON.DONE}
    # Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    # Step 7 - Grant access role
    Navigator To Link    Setup and Maintenance
    # Select the Users and Security Functional Areas, click the Manage Data Access for Users task.
    Wait Exists And Click Element    ${SETUP.LIST.SETUP_EXPAND}
    Wait Exists And Click Element    ${SETUP.LIST_ITEM.SETUP_ITEM}
    Wait Until Page Contains Element    ${SETUP.ELEMENT.FINANCIAL_LOAD}
    Wait Exists And Click Element    ${SETUP.ELEMENT.USERS_AND_ROLE_SECURITY}
    Wait Exists And Input Text    ${SETUP.TEXT.SEARCH_TASK}    Manage Data Access for Users
    Wait Exists And Click Element    ${SETUP.BUTTON.SEARCH}
    Wait Exists And Click Element    ${SETUP.ELEMENT.MANAGE_DATA_ACCESS_AND_USERS}
    Wait Until Page Contains    Manage Data Access for Users
    Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.USERACCESS}

    #Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.CREATE}
    # Add data access to Role with unit
    Grant Data Access to User Role    RDC2Dashboard2    Employee    Business unit    DELWP2 BU1    # PwC South Africa cannot be found
    # Add another role
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.BUTTON.ADD_ROW}
    Sleep    10s
    Grant Data Access to User Role    RDC2Dashboard2    Accounts Receivable Manager    Business unit    DELWP2 BU1    # PwC South Africa cannot be found
    # Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    # Logout Oralce
    Logout Oracle

05 Create RDCConversion User Account
    #Open Chrome Browser    ${ORACLE URL}
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Security Console
    Wait Exists And Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    # Add User and fill information
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.USERS}
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.ADD_USER_ACCOUNT}
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.FIRST_NAME}    RDC
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.LAST_NAME}    Conversion
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.EMAIL}    chaitanya.jain@pwc.com
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.USER_NAME}    RDCConversion
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.PASSWORD}    Welcome1
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.CONFIRM_PASSWORD}    Welcome1
    # Open Add Roles page
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}
    # Add Role - Employee with code 'ORA_PER_EMPLOYEE_ABSTRACT'
    Add Role    Employee    ORA_PER_EMPLOYEE_ABSTRACT
    # Add Role - Application Implementation Consultant with code 'ORA_ASM_APPLICATION_IMPLEMENTATION_CONSULTANT_JOB'
    Add Role    Application Implementation Consultant    ORA_ASM_APPLICATION_IMPLEMENTATION_CONSULTANT_JOB
    # Add Role - PwC Custom BI Administrator Role with code 'PWC_CUSTOM_BI_ADMINISTRATOR_ROLE'
    Add Role    PwC Custom BI Administrator Role    PWC_CUSTOM_BI_ADMINISTRATOR_ROLE
    # Add Roles are completed and then click Done button to back Edit page
    Wait Until Element Be Clicked    ${COMMON.BUTTON.DONE}
    # Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    # Logout Oralce
    Logout Oracle

*** Keywords ***
Fill Web Locator
    [Arguments]    ${web_page}    ${type}    ${alias}    ${xpath}
    Wait Exists And Input Text    (//span[text()="Web Page*"]/../../following-sibling::*)[1]//input    ${web_page}
    Wait Exists And Input Text    //span[text()="Type*"]/../../following-sibling::*//input    ${type}
    Wait Exists And Input Text    //span[text()="Alias*"]/../../following-sibling::*//input    ${alias}
    Wait Exists And Input Text    //span[text()="XPath"]/../../following-sibling::*//input    ${xpath}

Add Role
    [Arguments]    ${role_name}    ${role_code}
    Wait Exists And Input Text    ${ADD_ROLE_MEMBERSHIP_PAGE.TEXT.ROLE}    ${role_name}
    Wait Exists And Click Element    ${ADD_ROLE_MEMBERSHIP_PAGE.BUTTON.SEARCH}
    ${dynamic_role_code_xpath}=    Replace String    ${USER_ACCOUNT_PAGE.TEXT.ROLE_CODE}    replace_role_code    ${role_code}   
    Wait Exists And Click Element    ${dynamic_role_code_xpath}
    Sleep    2s
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}
    Wait Until Element Be Clicked    ${COMMON.BUTTON.OK}

Grant Data Access to User Role
    [Arguments]    ${user_name}    ${role_name}    ${security_context}    ${security_context_value}
    Wait Until Page Contains    Create Data Access for Users
    # Input user name
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME}
    ${input_name}=    Set Variable    document.evaluate("${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value='${user_name}'
    Execute Javascript    ${input_name}
    Sleep    2s
    # Input user role by click dropdown list and cannot use javascript because the value will become null wihout knowing why. 
    ${dynamic_role_name_xpath}=    Replace String    ${SERACH_USER_ROLE_PAGE.BUTTON.ROLE_NAME_ITEM}    replace_role_name    ${role_name} 
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.ROLE_NAME_LIST}
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.ROLE_NAME_MORE}
    Wait Exists And Input Text    ${SERACH_USER_ROLE_PAGE.TEXT_ROLE_NAME}    ${role_name}    10
    Wait Exists And Click Element    ${SERACH_USER_ROLE_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${dynamic_role_name_xpath}
    Wait Exists And Click Element    ${SERACH_USER_ROLE_PAGE.BUTTON.OK}
    Sleep    2s

    # Select Security Context
    Select From List By Label   ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.SECURITY_CONTEXT}    ${security_context}

    Sleep    2s
    ${input_security_context_value}=    Set Variable    document.evaluate("${CREATE_DATA_ACCESS_FOR_USERS.TEXT.SECURITY_CONTEXT_VALUE}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value='${security_context_value}'
    Execute Javascript    ${input_security_context_value}
    Sleep    2s

