*** Variables ***
#${COMMON.BUTTON.COMMON_MENUARROW_BTN} Xpath comment:
#//img[contains(@src,'menuarrow')] V12
#1. Find search input box on the top bar
#2. Select all ancestor tables of Home icon (search input box)
#3. Select img or svg tag contains 'oraclecould' in @src attribute under step2 tables.
${COMMON.BUTTON.CANCEL}    //button[@title="Cancel" or @accesskey="C"]
${COMMON.BUTTON.COMMON_MENUARROW_BTN}    (//a[contains(@class,'menu')]//*[name()='svg' and @role='img']|//img[contains(@src,'menuarrow')]|//*[@title="Home"]/ancestor::table/descendant::*[(self::img or self::svg) and contains(@src,'oraclecloud')])[1]
${COMMON.BUTTON.COMMON_SIGNOUT_BTN}    //a[text()='Sign Out']
${COMMON.BUTTON.DIALOG_CLOSE}    //a[@title="Close" and not(ancestor::div[@style="display:none"])]
${COMMON.BUTTON.NEXT}    //button[@title="Next" or @accesskey="x" or text()='Next']
${COMMON.BUTTON.OK}    //button[text()="OK"]
${COMMON.BUTTON.SAVE_AND_CLOSE}    //button[@title="Save and Close" or @accesskey="S"]
${COMMON.BUTTON.SUBMIT}    //button[text()="Submit" or @accesskey= 'm']
${COMMON.HEADER.NAVIGATOR}    //a[@title='Navigator']
${COMMON.LABEL.CONFIRMATION}    //div[text()="Confirmation" and not(ancestor::div[@style="display:none"])]
${CREATE_DATA_ROLE.TEXT.DATA_ROLE}    //label[text()='Data Role']/../following-sibling::*//input
${CREATE_DATA_ROLE.TEXT.JOB_ROLE}    //label[text()='Job Role']/../following-sibling::*//input
${CREATE_DATA_ROLE.TEXT.ROLE_DESCRIPTION}    //label[text()='Role Description']/../following-sibling::*//textarea
${CREATE_ROLE_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}    //button[text()="Add Role Membership"]
${CREATE_ROLE_PAGE.BUTTON.ADD_ROLE}    //span[text()="Add Role"]
${CREATE_ROLE_PAGE.BUTTON.SEARCH}    //img[@title="Search"]
${CREATE_ROLE_PAGE.DIV.SEARCH_RESULT}    //div[@title="Search Results"]//label[text()="to_be_replaced"]
${CREATE_ROLE_PAGE.LABEL.ADD_ROLE_MEMBERSHIP}    //div[text()="Add Role Membership"]
${CREATE_ROLE_PAGE.LABEL.DATA_SECURITY_POLICIES}    //h1[contains(text(), "Data Security Policies")]
${CREATE_ROLE_PAGE.LABEL.FUNCTION_SECURITY_POLICIES}    //h1[contains(text(), "Function Security Policies")]
${CREATE_ROLE_PAGE.LABEL.ROLE_HIERARCHY}    //h1[contains(text(), "Role Hierarchy")]
${CREATE_ROLE_PAGE.LABEL.SUMMARY}    //h1[contains(text(), "Summary")]
${CREATE_ROLE_PAGE.LABEL.USERS}    //h1[contains(text(), "Users")]
${CREATE_ROLE_PAGE.LIST.ROLE_CATEGORY_EXPAND}    //label[text()="Role Category"]/../following-sibling::*//input[not(@type="hidden")]
${CREATE_ROLE_PAGE.LIST_ITEM.ROLE_CATEGORY}    //div[@class="AFPopupMenuPopup"]//li
${CREATE_ROLE_PAGE.TEXT.ROLE_CODE}    //label[text()="Role Code"]/../following-sibling::*//input
${CREATE_ROLE_PAGE.TEXT.ROLE_MEMBERSHIP_SEARCH}    //label[text()="Search"]/..//input
${CREATE_ROLE_PAGE.TEXT.ROLE_NAME}    //label[text()="Role Name"]/../following-sibling::*//input
${DOCUMENT_TYPE.ELEMENT.VALUE}    //input[@value = 'View All Document Types']
${DOCUMENT_TYPE.TEXT.DOCUMENT_TYPE}    //label[text()='Document Type Security Profile']/../following-sibling::*//input
${LEGISLATIVE_DATA_GROUP.ELEMENT.VALUE}    //input[@value = 'View All Legislative Data Groups']
${LEGISLATIVE_DATA_GROUP.TEXT.LEGISLATIVE_DATA_GROUP}    //label[text()='LDG Security Profile']/../following-sibling::*//input
${LOGIN.BUTTON.LOGIN_SIGNIN_BTN}    (//button[text()[contains(., 'Sign In ')]])[1]
${LOGIN.PASSWORDBOX.LOGIN_PASSWD_TBOX}    //input[@placeholder='Password']
${LOGIN.TEXTBOX.LOGIN_USER_TBOX}    //input[@placeholder='User ID']
${LOGOUT.BUTTON.LOGOUT_CONFIRM_BTN}    //button[text()[contains(., 'Confirm')]]
${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.BUTTON.CREATE}    //span[text()='Create']
${ORACLE_HOME.LINK.MORE}    //a[text()='More...']
${ORACLE_HOME_NAVI.LINK.FIXED_ASSETS_ASSETS}    //div[./span/text()='Fixed Assets']//following-sibling::div//a[text()='Assets']
${ORACLE_HOME_NAVI.LINK.PAYABLES_INVOICES}    //div[./span/text()='Payables']//following-sibling::div//a[text()='Invoices']
${ORGANIZATION.ELEMENT.VALUE}    //input[@value = 'View All Organizations']
${ORGANIZATION.TEXT.ORGANIZATION_SECURITY_PROFILE}    //label[text()='Organization Security Profile']/../following-sibling::*//input
${PAYROLL_FLOW.ELEMENT.VALUE}    //input[@value = 'View All Flows']
${PAYROLL_FLOW.TEXT.PAYROLL_FLOW}    //label[text()='Flow Pattern Security Profile']/../following-sibling::*//input
${PERSON.ELEMENT.VALUE}    //input[@value = 'View All People']
${PERSON.TEXT.PERSON}    //label[text()='Person Security Profile']/../following-sibling::*//input
${POPUPMENU.H1.NAVIGATOR}    //h1[text()="Navigator"]
${POSITION.ELEMENT.VALUE}    //input[@value = 'View All Positions']
${POSITION.TEXT.POSITION_SECURITY_PROFILE}    //label[text()='Position Security Profile']/../following-sibling::*//input
${PUBLIC_PERSON.ELEMENT.VALUE}    //input[@value = 'View All People']
${PUBLIC_PERSON.TEXT.PUBLIC_PERSON}    //label[text()='Person Security Profile']/../following-sibling::*//input
${SECURITY_CONSOLE.BUTTON.CREATE_ROLE}    //button[text()="Create Role"]
${SECURITY_CRITERIA.TEXT.DOCUMENT_TYPE}    //label[text()='Document Type Security Profile']/../following-sibling::*//input
${SECURITY_CRITERIA.TEXT.LEGISLATIVE_DATA_GROUP}    //label[text()='LDG Security Profile']/../following-sibling::*//input
${SECURITY_CRITERIA.TEXT.ORGANIZATION_SECURITY_PROFILE}    //label[text()='Organization Security Profile']/../following-sibling::*//input
${SECURITY_CRITERIA.TEXT.PAYROLL_FLOW}    //label[text()='Flow Pattern Security Profile']/../following-sibling::*//input
${SECURITY_CRITERIA.TEXT.PERSON}    //td[.//h3[text() = 'Person']]//label[text()='Person Security Profile']/../following-sibling::*//input
${SECURITY_CRITERIA.TEXT.POSITION_SECURITY_PROFILE}    //label[text()='Position Security Profile']/../following-sibling::*//input
${SECURITY_CRITERIA.TEXT.PUBLIC_PERSON}    //td[.//h3[text() = 'Public Person']]//label[text()='Person Security Profile']/../following-sibling::*//input
${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}    //*[text()="Security Console"]
${SETUP.ELEMENT.FINANCIAL_LOAD}    //td[text()='Cash Management and Banking']
${SETUP.ELEMENT.MANAGE_DATA_ROLE_AND_SECURITY_PROFILES}    //a[text()='Manage Data Role and Security Profiles']
${SETUP.ELEMENT.USERS_AND_ROLE_SECURITY}    //td[text() ="Users and Security"]
${SETUP.LIST.SETUP_EXPAND}    //h1[contains(text(),"Setup:")]/../../following-sibling::*//a
${SETUP.LIST_ITEM.SETUP_ITEM}    //div[@class="AFPopupMenuPopup"]//li[text()='Financials']
${SECURITY_CONSOLE.BUTTON.USERS}    //div[text()='Users']
${SECURITY_CONSOLE.BUTTON.ADD_USER_ACCOUNT}    //button[text()='Add User Account']
${USER_ACCOUNT_PAGE.TEXT.FIRST_NAME}     //label[text()="First Name"]/../following-sibling::*//input[not(@type="hidden")]
${USER_ACCOUNT_PAGE.TEXT.LAST_NAME}     //label[text()="Last Name"]/../following-sibling::*//input[not(@type="hidden")]
${USER_ACCOUNT_PAGE.TEXT.EMAIL}     //label[text()="Email"]/../following-sibling::*//input[not(@type="hidden")]
${USER_ACCOUNT_PAGE.TEXT.USER_NAME}    //label[text()="User Name"]/../following-sibling::*//input[not(@type="hidden")]
${USER_ACCOUNT_PAGE.TEXT.PASSWORD}     //label[text()="Password"]/../following-sibling::*//input[not(@type="hidden")]
${USER_ACCOUNT_PAGE.TEXT.CONFIRM_PASSWORD}    //label[text()="Confirm Password"]/../following-sibling::*//input[not(@type="hidden")]
${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE}    //button[text()='Add Role']
${ADD_ROLE_MEMBERSHIP_PAGE.TEXT.ROLE}    //td[.//label[text()='Search']]/following-sibling::*//input[not(@type="hidden")]
${ADD_ROLE_MEMBERSHIP_PAGE.BUTTON.SEARCH}    //td[.//label[text()='Search']]/following-sibling::*//img[@title='Search']
${USER_ACCOUNT_PAGE.TEXT.EMPLOYEE_ROLE_CODE}    //td[text()='ORA_PER_EMPLOYEE_ABSTRACT']
${USER_ACCOUNT_PAGE.BUTTON.ADD_ROLE_MEMBERSHIP}    //button[text()='Add Role Membership']
${USER_ACCOUNT_PAGE.TEXT.APPLICATION_IMPLEMENTATION_CONSULTANT_ROLE_CODE}    //td[text()='ORA_ASM_APPLICATION_IMPLEMENTATION_CONSULTANT_JOB']
${USER_ACCOUNT_PAGE.TEXT.PWC_CUSTOM_BI_ADMINISTRATOR_ROLE_CODE}    //td[text()='PWC_CUSTOM_BI_ADMINISTRATOR_ROLE']
${USER_ACCOUNT_PAGE.TEXT.PWC_CUSTOM_VIEW_ACUSTOM_INFOLET_ROLE_CODE}    //td[text()='PWC_CUSTOM_VIEW_CUSTOM_INFOLET']
${COMMON.BUTTON.DONE}    //button[text()='Done' or @title='Done' or @accesskey = 'o']
${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.SEARCH_ROLE}    //label[text()="Role"]/../following-sibling::*//input
${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.BUTTON.SEARCH}    //button[text()="Search"]
${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.SEARCH_RESULT}    //table[@summary = "Search Results"]//tr[.//span[text() ='Custom HCM Data Role']]
${MANAGE_DATA_ROLE_AND_SECURITY_PROFILES.TEXT.ROLE_STATUS}    //table[@summary = "Search Results"]//tr[.//span[text() ='Custom HCM Data Role']]//span[text()="Complete"]
${SEARCH_PERSON.BUTTON.CREATE_PERSON}    //img[@title = 'Create' or @alt ='Create']
${CREATE_USER_PAGE.TEXT.LAST_NAME}    //label[text()='Last Name']/../following-sibling::*//input
${CREATE_USER_PAGE.TEXT.FIRST_NAME}    //label[text()='First Name']/../following-sibling::*//input
${CREATE_USER_PAGE.TEXT.USER_NAME}    //label[text()='User Name']/../following-sibling::*//input
${CREATE_USER_PAGE.TEXT.PERSON_TYPE}    //label[text()='Person Type']/../following-sibling::*//input
${CREATE_USER_PAGE.LIST.PERSON_TYPE_LIST}    //label[text()='Person Type']/../following-sibling::*//a
${CREATE_USER_PAGE.TEXT.PERSON_TYPE_ITEM}    //li[text()='Employee']
${CREATE_USER_PAGE.TEXT.LEGAL_EMPLOYER}    //label[text()='Legal Employer']/../following-sibling::*//input
${CREATE_USER_PAGE.TEXT.BUSINESS_UNIT}    //label[text()='Business Unit']/../following-sibling::*//input
${CREATE_USER_PAGE.TEXT.EMAIL}    //label[text()='Email']/../following-sibling::*//input
${USER_ACCOUNT_PAGE.TEXT.SEARCH_USER_NAME}    //label[text()='Search']/preceding-sibling::input
${USER_ACCOUNT_PAGE.BUTTON.SEARCH}    //img[@title ='Search' or @alt='Search']
${USER_ACCOUNT_PAGE.LINK.USER}    //a[text()='Dashboard RDC']
${USER_ACCOUNT_PAGE.BUTTON.EDIT}    //button[text()='Edit']
${USER_ACCOUNT_PAGE.TEXT.ORA_AP_ACCOUNTS_PAYABLE_MANAGER_JOB_ROLE_CODE}    //td[text()='ORA_AP_ACCOUNTS_PAYABLE_MANAGER_JOB']
${USER_ACCOUNT_PAGE.TEXT.ORA_GL_GENERAL_ACCOUNTING_MANAGER_JOB_ROLE_CODE}    //td[text()='ORA_GL_GENERAL_ACCOUNTING_MANAGER_JOB']
${USER_ACCOUNT_PAGE.TEXT.ROLE_CODE}    //td[text()='replace_role_code']
${SETUP.TEXT.SEARCH_TASK}    //label[text()='Search Tasks']/../following-sibling::*//input
${SETUP.BUTTON.SEARCH}    //img[@title ='Search' or @alt='Search']
${SETUP.ELEMENT.MANAGE_DATA_ACCESS_AND_USERS}    //a[text()='Manage Data Access for Users']
${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.USERACCESS}    //label[text()='Users with Data Access']
${MANAGE_DATA_ACCESS_AND_USERS_PAGE.TEXT.SEARCH_USER_NAME}    //label[text()='User Name']/../following-sibling::*//input[not(ancestor::div[@style="display:none"])]
${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.SEARCH}    //button[text()='Search' and not(ancestor::div[@style="display:none"])]
${MANAGE_DATA_ACCESS_AND_USERS_PAGE.BUTTON.CREATE}    //img[(@title = 'Create' or @alt ='Create') and not(ancestor::div[@style="display:none"])]
${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME}    (//label[text()='User Name']/preceding-sibling::input[@value =''])[1]
${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME_VERIVY}    //label[text()='User Name']/preceding-sibling::input[@title='verify_user_name_to_be_replaced']
${CREATE_DATA_ACCESS_FOR_USERS.TEXT.ROLE}    (//label[text()='Role']/preceding-sibling::input)[1]
${CREATE_DATA_ACCESS_FOR_USERS.TEXT.SECURITY_CONTEXT}    (//label[text()='Security Context']/preceding-sibling::select)[1]
${CREATE_DATA_ACCESS_FOR_USERS.TEXT.SECURITY_CONTEXT_VALUE}    (//label[text()='Security Context Value']/preceding-sibling::input)[1]
${CREATE_USER_PAGE.BUTTON.SAVE_AND_CLOSE}    //span[text()='Save and Close']
${CREATE_DATA_ACCESS_FOR_USERS.BUTTON.ADD_ROW}    //img[@title = 'Add Row' or @alt='Add Row']


