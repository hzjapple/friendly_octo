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
${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}    //*[text()="Security Console"]
${SETUP.ELEMENT.FINANCIAL_LOAD}    //td[text()='Cash Management and Banking']
${SETUP.ELEMENT.MANAGE_DATA_ROLE_AND_SECURITY_PROFILES}    //a[text()='Manage Data Role and Security Profiles']
${SETUP.ELEMENT.USERS_AND_ROLE_SECURITY}    //td[text() ="Users and Security"]
${SETUP.LIST.SETUP_EXPAND}    //h1[contains(text(),"Setup:")]/../../following-sibling::*//a
${SETUP.LIST_ITEM.SETUP_ITEM}    //div[@class="AFPopupMenuPopup"]//li[text()='Financials']
