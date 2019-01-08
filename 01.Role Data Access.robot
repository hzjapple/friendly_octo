*** Settings ***
Suite Teardown    CloseDriverserver
Library           SeleniumLibrary    timeout=30s    implicit_wait=2s
Resource          resource.robot
Library           OperatingSystem
Library           ExcelLibrary
Library           String
Library           Dialogs

*** Variables ***
${role_excel_file}    custom_role_info.xls

*** Test Cases ***
01 Create Custom Job Roles
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    # Login Oracle
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    # Go to page: Security Console
    Navigator To Link    Security Console
    Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    # Open Excel file
    Open Excel    ${role_excel_file}
    ${sheet_name}=    Set Variable    case1-Create-Custom-Job-Role
    ${r_cnt}    Get Row Count    ${sheet_name}
    : FOR    ${r}    IN RANGE    1    ${r_cnt}
    \    ${role_name}    Read Cell Data By Coordinates    ${sheet_name}    0    ${r}
    \    ${role_code}    Read Cell Data By Coordinates    ${sheet_name}    1    ${r}
    \    ${role_category}    Read Cell Data By Coordinates    ${sheet_name}    2    ${r}
    \    ${role_membership}    Read Cell Data By Coordinates    ${sheet_name}    3    ${r}
    \    Sleep    5s
    \    Log To Console    this is ${r} with user ${role_name},${role_code},${role_category},${role_membership}
    \    Run Keyword If    '${role_name}'==''    Exit For Loop
    # Click button [Create Role]
    \    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.CREATE_ROLE}
    \    Run Keyword    Create Custom Job Role    ${role_name}    ${role_code}    ${role_category}    ${role_membership}
    \    Sleep    15s
    Logout Oracle

02 Create HCM Data Roles
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
    # Open Excel file
    Open Excel    ${role_excel_file}
    ${sheet_name}=    Set Variable    case2-Create-HCM-Data-Roles
    ${r_cnt}    Get Row Count    ${sheet_name}
    : FOR    ${r}    IN RANGE    1    ${r_cnt}
    \    ${role_name}    Read Cell Data By Coordinates    ${sheet_name}    0    ${r}
    \    ${job_role}    Read Cell Data By Coordinates    ${sheet_name}    1    ${r}
    \    ${role_description}    Read Cell Data By Coordinates    ${sheet_name}    2    ${r}
    \    ${organization}    Read Cell Data By Coordinates    ${sheet_name}    3    ${r}
    \    ${position}    Read Cell Data By Coordinates    ${sheet_name}    4    ${r}
    \    ${legislative_data_group}    Read Cell Data By Coordinates    ${sheet_name}    5    ${r}
    \    ${person}    Read Cell Data By Coordinates    ${sheet_name}    6    ${r}
    \    ${public_person}    Read Cell Data By Coordinates    ${sheet_name}    7    ${r}
    \    ${document_type}    Read Cell Data By Coordinates    ${sheet_name}    8    ${r}
    \    ${payroll_flow}    Read Cell Data By Coordinates    ${sheet_name}    9    ${r}
    \    Sleep    5s
    \    Log To Console    this is ${r} with user ${role_name},${job_role},${role_description},${organization}
    \    Run Keyword If    '${role_name}'==''    Exit For Loop
    # Click button [Create Role]
    \    Wait Exists And Click Element    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.BUTTON.CREATE}
    \    Run Keyword    Create HCM Data Role    ${role_name}    ${job_role}    ${role_description}    ${organization}
    \    ...    ${position}    ${legislative_data_group}    ${person}    ${public_person}    ${document_type}
    \    ...    ${payroll_flow}
    \    Sleep    15s
    Logout Oracle

03 Create Migration User Accounts
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    # Login Oracle
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    # Go to page: Security Console
    Navigator To Link    Security Console
    # Click OK button if warning pop up
    Run Keyword And Ignore Error    Wait Exists And Click Element    ${SECURITY_CONSOLE_WARNING.BUTTON.OK}
    Wait Exists And Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    # Add User and fill information
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.USERS}
    # Open Excel file
    Open Excel    ${role_excel_file}
    ${sheet_name}=    Set Variable    case3-Create-Migration-User-Acc
    ${r_cnt}    Get Row Count    ${sheet_name}
    ${r_len}=    Evaluate    ${r_cnt} - 1
    : FOR    ${r}    IN RANGE    1    ${r_cnt}
    \    ${first_name}    Read Cell Data By Coordinates    ${sheet_name}    0    ${r}
    \    ${last_name}    Read Cell Data By Coordinates    ${sheet_name}    1    ${r}
    \    ${email}    Read Cell Data By Coordinates    ${sheet_name}    2    ${r}
    \    ${user_name}    Read Cell Data By Coordinates    ${sheet_name}    3    ${r}
    \    ${password}    Read Cell Data By Coordinates    ${sheet_name}    4    ${r}
    \    ${confirm_password}    Read Cell Data By Coordinates    ${sheet_name}    5    ${r}
    \    ${role_name}    Read Cell Data By Coordinates    ${sheet_name}    6    ${r}
    \    ${role_code}    Read Cell Data By Coordinates    ${sheet_name}    7    ${r}
    \    ${r_more_one}=    Evaluate    ${r} + 1
    \    Log To Console    this is ${r} with user ${first_name},${last_name},${role_name},${role_code}
        # Add Role Complete and save user with last row in case r_len is more than actual rows
    \    Run Keyword If    '${role_name}'==''    Create User Account - Save User
    \    Run Keyword If    '${role_name}'==''    Exit For Loop
    # Add New User and Role
    \    Run Keyword Unless    '${first_name}'==''    Create User Account - Add User    ${first_name}    ${last_name}    ${email}
    \    ...    ${user_name}    ${password}    ${confirm_password}
    \    Run Keyword Unless    '${first_name}'==''    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}
    \    Add Role    ${role_name}    ${role_code}
    # Add Role Complete and save user with last row in case r_len is same with actual rows
    \    Run Keyword If    ${r}==${r_len}    Create User Account - Save User
    \    Run Keyword If    ${r}==${r_len}    Exit For Loop
    # Add Role Complete for current user when there are other users to be added.
    \    ${r_more_one}=    Evaluate    ${r} + 1
    \    ${role_complete}    Read Cell Data By Coordinates    ${sheet_name}    1    ${r_more_one}
    \    Run Keyword Unless    '${role_complete}'==''    Create User Account - Save User
    \    Sleep    30s

    # Logout Oralce
    Logout Oracle

04 Create Dashboard User Account
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    # Add Persons
    Create Dashboard User Account - Persons    case4-Create-Dashboard-Usr
    # Add Roles
    Sleep    15s
    Create Dashboard User Account - Roles    case4-Create-Dashboard-Usr
    # Add Data Access
    Sleep    15s
    Create Dashboard User Account - Data Access    case4-Create-Dashboard-Usr
    # Logout Oralce
    Logout Oracle

05 Create RDCConversion User Account
    Open Chrome Browser With useAutomationExtension    ${ORACLE URL}
    # Login Oracle
    Login Oracle    ${ACCOUNT}    ${PASSWORD}
    # Go to page: Security Console
    Navigator To Link    Security Console
    # Click OK button if warning pop up
    Run Keyword And Ignore Error    Wait Exists And Click Element    ${SECURITY_CONSOLE_WARNING.BUTTON.OK}
    Wait Exists And Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    # Add User and fill information
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.USERS}
    # Open Excel file
    Open Excel    ${role_excel_file}
    ${sheet_name}=    Set Variable    case5-Create-RDCConversion-User
    ${r_cnt}    Get Row Count    ${sheet_name}
    ${r_len}=    Evaluate    ${r_cnt} - 1
    : FOR    ${r}    IN RANGE    1    ${r_cnt}
    \    ${first_name}    Read Cell Data By Coordinates    ${sheet_name}    0    ${r}
    \    ${last_name}    Read Cell Data By Coordinates    ${sheet_name}    1    ${r}
    \    ${email}    Read Cell Data By Coordinates    ${sheet_name}    2    ${r}
    \    ${user_name}    Read Cell Data By Coordinates    ${sheet_name}    3    ${r}
    \    ${password}    Read Cell Data By Coordinates    ${sheet_name}    4    ${r}
    \    ${confirm_password}    Read Cell Data By Coordinates    ${sheet_name}    5    ${r}
    \    ${role_name}    Read Cell Data By Coordinates    ${sheet_name}    6    ${r}
    \    ${role_code}    Read Cell Data By Coordinates    ${sheet_name}    7    ${r}
    \    ${r_more_one}=    Evaluate    ${r} + 1
    \    Log To Console    this is ${r} with user ${first_name},${last_name},${role_name},${role_code}
        # Add Role Complete and save user with last row in case r_len is more than actual rows
    \    Run Keyword If    '${role_name}'==''    Create User Account - Save User
    \    Run Keyword If    '${role_name}'==''    Exit For Loop
    # Add New User and Role
    \    Run Keyword Unless    '${first_name}'==''    Create User Account - Add User    ${first_name}    ${last_name}    ${email}
    \    ...    ${user_name}    ${password}    ${confirm_password}
    \    Run Keyword Unless    '${first_name}'==''    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}
    \    Add Role    ${role_name}    ${role_code}
    # Add Role Complete and save user with last row in case r_len is same with actual rows
    \    Run Keyword If    ${r}==${r_len}    Create User Account - Save User
    \    Run Keyword If    ${r}==${r_len}    Exit For Loop
    # Add Role Complete for current user when there are other users to be added.
    \    ${r_more_one}=    Evaluate    ${r} + 1
    \    ${role_complete}    Read Cell Data By Coordinates    ${sheet_name}    1    ${r_more_one}
    \    Run Keyword Unless    '${role_complete}'==''    Create User Account - Save User
    \    Sleep    30s

    # Logout Oralce
    Logout Oracle

*** Keywords ***
Add Role
    [Arguments]    ${role_name}    ${role_code}
    Wait Exists And Input Text    ${ADD_ROLE_MEMBERSHIP_PAGE.TEXT.ROLE}    ${role_name}
    Wait Exists And Click Element    ${ADD_ROLE_MEMBERSHIP_PAGE.BUTTON.SEARCH}
    ${dynamic_role_code_xpath}=    Replace String    ${USER_ACCOUNT_PAGE.TEXT.ROLE_CODE}    replace_role_code    ${role_code}
    Wait Exists And Click Element    ${dynamic_role_code_xpath}
    Sleep    5s
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}
    Sleep    5s
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.OK}

Grant Data Access to User Role
    [Arguments]    ${user_name}    ${role_name}    ${security_context}    ${security_context_value}
    Wait Until Page Contains    Create Data Access for Users
    # Input user name
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME}
    ${input_name}=    Set Variable    document.evaluate("${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value='${user_name}'
    Execute Javascript    ${input_name}
    Sleep    5s
    # Input user role by click dropdown list and cannot use javascript because the value will become null wihout knowing why.
    ${dynamic_role_name_xpath}=    Replace String    ${SERACH_USER_ROLE_PAGE.BUTTON.ROLE_NAME_ITEM}    replace_role_name    ${role_name}
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.ROLE_NAME_LIST}
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.ROLE_NAME_MORE}
    Wait Exists And Input Text    ${SERACH_USER_ROLE_PAGE.TEXT_ROLE_NAME}    ${role_name}    10
    Wait Exists And Click Element    ${SERACH_USER_ROLE_PAGE.BUTTON.SEARCH}
    Wait Exists And Click Element    ${dynamic_role_name_xpath}
    Wait Exists And Click Element    ${SERACH_USER_ROLE_PAGE.BUTTON.OK}
    Sleep    5s
    # Select Security Context
    Select From List By Label    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.SECURITY_CONTEXT}    ${security_context}
    Sleep    5s
    ${input_security_context_value}=    Set Variable    document.evaluate("${CREATE_DATA_ACCESS_FOR_USERS.TEXT.SECURITY_CONTEXT_VALUE}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value='${security_context_value}'
    Execute Javascript    ${input_security_context_value}
    Sleep    5s

Create Custom Job Role
    [Arguments]    ${role_name}    ${role_code}    ${role_category}    ${role_membership}
    # Fill "Role Name", "Role Code", "Role Category"
    Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_NAME}    ${role_name}
    Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_CODE}    ${role_code}
    Wait Exists And Click Element    ${CREATE_ROLE_PAGE.LIST.ROLE_CATEGORY_EXPAND}
    ${dynamic_role_category_xpath}=    Replace String    ${CREATE_ROLE_PAGE.LIST_ITEM.ROLE_CATEGORY}    role_category_to_be_replaced    ${role_category}
    Wait Exists And Click Element    ${dynamic_role_category_xpath}
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
    Wait Exists And Input Text    ${CREATE_ROLE_PAGE.TEXT.ROLE_MEMBERSHIP_SEARCH}    ${role_membership}
    Wait Exists And Click Element    ${CREATE_ROLE_PAGE.BUTTON.SEARCH}
    ${dynamic_xpath}=    Replace String    ${CREATE_ROLE_PAGE.DIV.SEARCH_RESULT}    to_be_replaced    ${role_membership}
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
    Wait Exists And Click Element    ${CREATE_ROLE_PAGE.BUTTON.OK}

Create HCM Data Role
    [Arguments]    ${role_name}    ${job_role}    ${role_description}    ${organization}    ${position}    ${legislative_data_group}
    ...    ${person}    ${public_person}    ${document_type}    ${payroll_flow}
    # Create Custom Role
    Wait Exists And Click Element    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.BUTTON.CREATE}
    Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.DATA_ROLE}    ${role_name}
    Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.JOB_ROLE}    ${job_role}
    Wait Exists And Input Text    ${CREATE_DATA_ROLE.TEXT.ROLE_DESCRIPTION}    ${role_description}
    Click Element    ${COMMON.BUTTON.NEXT}
    # Fill Data Role Info: ' Organization: View All Organizations',Position: View All Positions,Legislative Data Group: View All Legislative Data Groups,Person: View All People,Public Person: View All People,Document Type: View All Document Types,Payroll Flow: View All Flows
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.ORGANIZATION_SECURITY_PROFILE}    ${organization}
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.POSITION_SECURITY_PROFILE}    ${position}
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.LEGISLATIVE_DATA_GROUP}    ${legislative_data_group}
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PERSON}    ${person}
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PUBLIC_PERSON}    ${public_person}
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.DOCUMENT_TYPE}    ${document_type}
    Wait Exists And Input Text    ${SECURITY_CRITERIA.TEXT.PAYROLL_FLOW}    ${payroll_flow}
    Click Element    ${COMMON.BUTTON.NEXT}
    # Veripy pages content
    Verify Page    Assign Security Profiles to Role: Organization Security Profile    ${organization}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Position Security Profile    ${position}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Legislative Data Group Security Profile    ${legislative_data_group}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Person Security Profile    ${person}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Public Person Security Profile    ${public_person}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Document Type Security Profile    ${document_type}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    Verify Page    Assign Security Profiles to Role: Payroll Flow Security Profile    ${payroll_flow}
    Wait Exists And Click Element    ${COMMON.BUTTON.NEXT}
    # Submit data
    Verify Page    Create Data Role: Review    ${payroll_flow}
    Wait Exists And Click Element    ${COMMON.BUTTON.SUBMIT}

    # Search the role to ensure its status is 'Requested'
    Wait Until Page Does Not Contain Element    ${COMMON.BUTTON.SUBMIT}    120
    Wait Exists And Input Text    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.SEARCH_ROLE}    ${role_name}    60
    Wait Exists And Click Element    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.BUTTON.SEARCH}
    ${dynamic_manage_role_name_result_path}=    Replace String    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.SEARCH_RESULT}    manage_data_role_name_to_be_replace    ${role_name}
    Wait Until Page Contains Element     ${dynamic_manage_role_name_result_path}
    ${dynamic_manage_role_status_path}=    Replace String    ${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.ROLE_STATUS}    manage_data_role_status_to_be_replace    ${role_name}
    Page Should Contain Element    ${dynamic_manage_role_status_path}

Create User Account - Add User
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${user_name}    ${password}    ${confirm_password}
    # Add User and fill information
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.ADD_USER_ACCOUNT}
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.FIRST_NAME}    ${first_name}
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.LAST_NAME}    ${last_name}
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.EMAIL}    ${email}
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.USER_NAME}    ${user_name}
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.PASSWORD}    ${password}
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.CONFIRM_PASSWORD}    ${confirm_password}

Create User Account - Save User
    Log To Console    Role complete
    # For last user Add Roles are completed and then click Done button to back Edit page
    Wait Exists And Click Element    ${COMMON.BUTTON.DONE}
    # For last user Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}


Create Dashboard User Account - Add Person
    [Arguments]    ${first_name}    ${last_name}    ${user_name}    ${person_type}    ${legal_employer}    ${business_unit}
    ...    ${email}

    # Add person
    Wait Exists And Click Element    ${SEARCH_PERSON.BUTTON.CREATE_PERSON}
    Wait Until Page Contains    Create User
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.LAST_NAME}    ${last_name}
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.FIRST_NAME}    ${first_name}
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.USER_NAME}    ${user_name}
    Wait Exists And Click Element    ${CREATE_USER_PAGE.LIST.PERSON_TYPE_LIST}
    ${dynamic_person_type_xpath}=    Replace String    ${CREATE_USER_PAGE.TEXT.PERSON_TYPE_ITEM}    replace_person_type    ${person_type}
    Wait Exists And Click Element    ${dynamic_person_type_xpath}
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.LEGAL_EMPLOYER}    ${legal_employer}    20    #PG US West cannot be found
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.BUSINESS_UNIT}    ${business_unit}    #11000 cannot be found
    Wait Exists And Input Text    ${CREATE_USER_PAGE.TEXT.EMAIL}    ${email}
    # Save and Close
    Wait Exists And Click Element    ${CREATE_USER_PAGE.BUTTON.SAVE_AND_CLOSE}

Create Dashboard User Account - Navigate to Add Role Page
    [Arguments]    ${user_name}

    # Search Users
    Wait Until Page Contains    User Accounts
    Wait Exists And Input Text    ${USER_ACCOUNT_PAGE.TEXT.SEARCH_USER_NAME}    ${user_name}
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.SEARCH}
    ${dynamic_user_name_xpath}=    Replace String    ${USER_ACCOUNT_PAGE.LINK.USER}    user_link_to_replace    ${user_name}
    
    Wait Exists And Click Element    ${dynamic_user_name_xpath}
    Wait Until Page Contains    User Account Details
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.EDIT}
    # Open Add Roles page
    Wait Exists And Click Element    ${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}

Create Dashboard User Account - Save Role
    Log To Console    Role complete
    # For last user Add Roles are completed and then click Done button to back Edit page
    Wait Exists And Click Element    ${COMMON.BUTTON.DONE}
    # For last user Save role and then close
    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    # Back to user search page
    Wait Until Page Contains    User Account Details
    Wait Exists And Click Element    ${COMMON.BUTTON.DONE}

Create Dashboard User Account - Persons
    [Arguments]    ${sheet_name}
    # Open Excel file
    Open Excel    ${role_excel_file}
    #${sheet_name}=    Set Variable    case4-Create-Dashboard-Usr
    ${r_cnt}    Get Row Count    ${sheet_name}
    ${r_len}=    Evaluate    ${r_cnt} - 1
    
    # Navigate to add Users
    Navigator To Link    Users and Roles
    # Click OK button if warning pop up
    Run Keyword And Ignore Error    Wait Exists And Click Element    ${SECURITY_CONSOLE_WARNING.BUTTON.OK}
    # Add Person
    : FOR    ${r}    IN RANGE    1    ${r_cnt}
    \    ${last_name}    Read Cell Data By Coordinates    ${sheet_name}    0    ${r}
    \    ${first_name}    Read Cell Data By Coordinates    ${sheet_name}    1    ${r}
    \    ${user_name}    Read Cell Data By Coordinates    ${sheet_name}    2    ${r}
    \    ${person_type}    Read Cell Data By Coordinates    ${sheet_name}    3    ${r}
    \    ${legal_employer}    Read Cell Data By Coordinates    ${sheet_name}    4    ${r}
    \    ${business_unit}    Read Cell Data By Coordinates    ${sheet_name}    5    ${r}
    \    ${email}    Read Cell Data By Coordinates    ${sheet_name}    6    ${r}
    \    Log To Console    this is ${r} with user ${user_name}
    \    Exit For Loop If    '${user_name}'==''
    # Add New User
    \    Run Keyword Unless    '${user_name}'==''    Create Dashboard User Account - Add Person    ${first_name}    ${last_name}    ${user_name}    ${person_type}    ${legal_employer}    ${business_unit}    ${email}
    \    Sleep    30s

Create Dashboard User Account - Roles
    [Arguments]    ${sheet_name}
    # Open Excel file
    Open Excel    ${role_excel_file}
    #${sheet_name}=    Set Variable    case4-Create-Dashboard-Usr
    ${r_cnt}    Get Row Count    ${sheet_name}
    ${r_len}=    Evaluate    ${r_cnt} - 1
    # Open Edit Roles page
    Navigator To Link    Security Console
    # Click OK button if warning pop up
    Run Keyword And Ignore Error    Wait Exists And Click Element    ${SECURITY_CONSOLE_WARNING.BUTTON.OK}
    # Navigate to Users
    Wait Exists And Click Element    ${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}
    Wait Exists And Click Element    ${SECURITY_CONSOLE.BUTTON.USERS}

    # Add Role
    : FOR    ${r}    IN RANGE    1    ${r_cnt}
    \    ${user_name}    Read Cell Data By Coordinates    ${sheet_name}    8    ${r}
    \    ${add_role_name}    Read Cell Data By Coordinates    ${sheet_name}    9    ${r}
    \    ${add_role_code}    Read Cell Data By Coordinates    ${sheet_name}    10    ${r}
    \    Log To Console    this is ${r} with user ${user_name}
        # Add Role Complete for all users and save user with last row
    \    Run Keyword If    '${add_role_name}'==''    Create Dashboard User Account - Save Role
    \    Run Keyword If    '${add_role_name}'==''    Exit For Loop
    # Add New User
    \    Run Keyword Unless    '${user_name}'==''    Create Dashboard User Account - Navigate to Add Role Page    ${user_name}
    # Add first role for user
    \    Add Role    ${add_role_name}    ${add_role_code}
     # Add Role Complete and save user with last row in case r_len is same with actual rows
    \    Run Keyword If    ${r}==${r_len}    Create Dashboard User Account - Save Role
    \    Run Keyword If    ${r}==${r_len}    Exit For Loop
    # Add Role Complete for current user when there are other users to be added.
    \    ${r_more_one}=    Evaluate    ${r} + 1
    \    ${role_complete}    Read Cell Data By Coordinates    ${sheet_name}    8    ${r_more_one}
    \    Run Keyword Unless    '${role_complete}'==''    Create Dashboard User Account - Save Role
    \    Sleep    30s

Create Dashboard User Account - Data Access
    [Arguments]    ${sheet_name}
    # Step 7 - Grant access role
    #Navigator To Link    Setup and Maintenance
    Wait Exists And Click Element    ${COMMON.BUTTON.COMMON_MENUARROW_BTN}
    Wait Exists And Click Element     //a[text()='Setup and Maintenance']

    # Click OK button if warning pop up
    Run Keyword And Ignore Error    Wait Exists And Click Element    ${SECURITY_CONSOLE_WARNING.BUTTON.OK}
    # Select the Users and Security Functional Areas, click the Manage Data Access for Users task.
    Wait Exists And Click Element    ${SETUP.LIST.SETUP_EXPAND}
    Wait Exists And Click Element    ${SETUP.LIST_ITEM.SETUP_ITEM}
    Wait Until Page Contains Element    ${SETUP.ELEMENT.FINANCIAL_LOAD}
    Wait Exists And Click Element    ${SETUP.ELEMENT.USERS_AND_ROLE_SECURITY}
    Wait Exists And Input Text    ${SETUP.TEXT.SEARCH_TASK}    Manage Data Access for Users
    Wait Exists And Click Element    ${SETUP.BUTTON.SEARCH}
    Wait Exists And Click Element    ${SETUP.ELEMENT.MANAGE_DATA_ACCESS_AND_USERS}
    Wait Until Page Contains    Manage Data Access for Users
    # Click Add Data Access button
    Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.USERACCESS}

    # Open Excel file
    Open Excel    ${role_excel_file}
    #${sheet_name}=    Set Variable    case4-Create-Dashboard-Usr
    ${r_cnt}    Get Row Count    ${sheet_name}
    ${r_len}=    Evaluate    ${r_cnt} - 1
    ${new_user_name}=    Set Variable    ''

    : FOR    ${r}    IN RANGE    1    ${r_cnt}
    \    ${user_name}    Read Cell Data By Coordinates    ${sheet_name}    12    ${r}
    \    ${assign_data_access_role_name}    Read Cell Data By Coordinates    ${sheet_name}    13    ${r}
    \    ${assign_data_access_security_context}    Read Cell Data By Coordinates    ${sheet_name}    14    ${r}
    \    ${assign_data_access_security_context_value}    Read Cell Data By Coordinates    ${sheet_name}    15    ${r}
    \    Log To Console    this is ${r} with user ${user_name}
        # Add data access Complete for all users and save user with last row
    \    Run Keyword If    '${assign_data_access_role_name}'==''    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    \    Run Keyword If    '${assign_data_access_role_name}'==''    Exit For Loop
    # Add New User
    \    Run Keyword Unless    '${user_name}'==''  Wait Exists And Click Element    ${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.CREATE}
    \    ${new_user_name}=    Set Variable If    '${user_name}'==''    ${new_user_name}    ${user_name}
    # Add first data access to user with unit
    \    Grant Data Access to User Role    ${new_user_name}    ${assign_data_access_role_name}    ${assign_data_access_security_context}    ${assign_data_access_security_context_value}
    \    Run Keyword If    ${r}==${r_len}    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}
    \    Run Keyword If    ${r}==${r_len}    Exit For Loop
    # Add data access Complete for current user when there are other users to be added.
    \    ${r_more_one}=    Evaluate    ${r} + 1
    \    ${role_complete}    Read Cell Data By Coordinates    ${sheet_name}    12    ${r_more_one}
    \    ${user_complete}    Read Cell Data By Coordinates    ${sheet_name}    13    ${r_more_one}
    \    ${user_complete_not_null}=    Get Length    ${user_complete}
    # Add another data access for current user
    \    Run Keyword If    '${role_complete}'=='' and ${user_complete_not_null} > 0    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.BUTTON.ADD_ROW}
    \    Sleep    10s
    \    Run Keyword Unless    '${role_complete}'==''    Wait Exists And Click Element    ${COMMON.BUTTON.SAVE_AND_CLOSE}