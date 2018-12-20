*** Settings ***
Suite Teardown    CloseDriverserver
Library           SeleniumLibrary    timeout=30s    implicit_wait=2s
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
    Wait Exists And Click Element    ${SETUP.ELEMENT.USERS_AND_ROLE_SECURITY}
    Wait Exists And Click Element    ${SETUP.ELEMENT.MANAGE_DATA_ROLE_AND_SECURITY_PROFILES}
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
    Verify Page    Create Data Role: Review    ${COMMON.BUTTON.SUBMIT}
    Wait Exists And Click Element    ${COMMON.BUTTON.SUBMIT}
    # Search the role to ensure its status is 'Requested'
    #Wait Exists And Click Element    //h1[text() ='Manage Data Roles and Security Profiles']
    Wait Exists And Input Text    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.SEARCH_ROLE}    Custom HCM Data Role
    Wait Exists And Click Element    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.BUTTON.SEARCH}
    Wait Until Page Contains Element    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.SEARCH_RESULT}
    Page Should Contain Element    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.ROLE_STATUS}
    # Logout Oralce
    Logout Oracle

03 Create Migration User Account
    #Open Chrome Browser    ${ORACLE URL}
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
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
    Wait Exists And Input Text    ${ADD_ROLE_MEMBERSHIP_PAGE.TEXT.ROLE}    Employee
    Wait Exists And Click Element    ${ADD_ROLE_MEMBERSHIP_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.TEXT.EMPLOYEE_ROLE_CODE}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}
    Wait Until Element Be Clicked    ${COMMON.BUTTON.OK}
    # Add Role - Application Implementation Consultant with code 'ORA_ASM_APPLICATION_IMPLEMENTATION_CONSULTANT_JOB'
    #Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}
    Wait Exists And Input Text    ${ADD_ROLE_MEMBERSHIP_PAGE.TEXT.ROLE}    Application Implementation Consultant
    Wait Exists And Click Element    ${ADD_ROLE_MEMBERSHIP_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.TEXT.APPLICATION_IMPLEMENTATION_CONSULTANT_ROLE_CODE}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}
    #sleep    3s
    Wait Until Element Be Clicked    ${COMMON.BUTTON.OK}
    # Add Role - PwC Custom BI Administrator Role with code 'PWC_CUSTOM_BI_ADMINISTRATOR_ROLE'
    #Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}
    Wait Exists And Input Text    ${ADD_ROLE_MEMBERSHIP_PAGE.TEXT.ROLE}    PwC Custom BI Administrator Role
    Wait Exists And Click Element    ${ADD_ROLE_MEMBERSHIP_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.TEXT.PWC_CUSTOM_BI_ADMINISTRATOR_ROLE_CODE}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}
    Wait Until Element Be Clicked    ${COMMON.BUTTON.OK}
    # Add Role - PwC Custom View Custom Infolet with code 'PWC_CUSTOM_VIEW_CUSTOM_INFOLET'
    #Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}
    Wait Exists And Input Text    ${ADD_ROLE_MEMBERSHIP_PAGE.TEXT.ROLE}    PwC Custom View Custom Infolet
    Wait Exists And Click Element    ${ADD_ROLE_MEMBERSHIP_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.TEXT.PWC_CUSTOM_VIEW_ACUSTOM_INFOLET_ROLE_CODE}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}
    Wait Until Element Be Clicked    ${COMMON.BUTTON.OK}
    Wait Until Element Be Clicked    ${COMMON.BUTTON.DONE}
    # Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    # Logout Oralce
    Logout Oracle

14 Create Dashboard User Account
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
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
    Wait Exists And Click Element    ${SETUP.ELEMENT.MANAGE_DATA_ACCESS_AND_USERS}
    Wait Until Page Contains    Manage Data Access for Users
    Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.USERACCESS}
    Wait Exists And Input Text    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.TEXT.SEARCH_USER_NAME}    RDCDashboard
    Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.SEARCH}
    # Add data access to Role with unit
    Grant Data Access to User Role    RDCDashboard    Accounts Payable Manager    Business unit    PWC US BU    # PwC South Africa cannot be found
    Grant Data Access to User Role    RDCDashboard    Accounts Receivable Manager    Business unit    PWC US BU    # PwC South Africa cannot be found
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
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.LAST_NAME}    RDC5
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.FIRST_NAME}    Dashboard5
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.USER_NAME}    RDCDashboard5
    Wait Exists And Click Element    ${CREATE_USER_PAGE.LIST.PERSON_TYPE_LIST}
    Wait Exists And Click Element    ${CREATE_USER_PAGE.TEXT.PERSON_TYPE_ITEM}
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.LEGAL_EMPLOYER}    US1 Legal Entity    20    #PG US West cannot be found
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.BUSINESS_UNIT}    BU1    #11000 cannot be found
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.EMAIL}    chaitanya.jain@pwc.com
    # Save and Close
    Wait Exists And Click Element    ${CREATE_USER_PAGE.BUTTON.SAVE_AND_CLOSE}
    # Open Edit Roles page
    Navigator To Link    Security Console
    Wait Exists And Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.USERS}
    # Search Users
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
    Wait Exists And Click Element    ${SETUP.ELEMENT.MANAGE_DATA_ACCESS_AND_USERS}
    Wait Until Page Contains    Manage Data Access for Users    1
    Select Radio Button    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.USERACCESS}
    Wait Exists And Input Text    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.TEXT.SEARCH_USER_NAME}    RDCDashboard
    Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.SEARCH}
    # Add data access to Role with unit
    Grant Data Access to User Role    RDCDashboard    Accounts Payable Manager    Business unit    PWC US BU    # PwC South Africa cannot be found
    Grant Data Access to User Role    RDCDashboard    Accounts Receivable Manager    Business unit    PWC US BU    # PwC South Africa cannot be found
    # Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    # Logout Oralce
    Logout Oracle

05 Create RDCConversion User Account
    Open Chrome Browser    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    Navigator To Link    Security Console
