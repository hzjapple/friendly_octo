*** Variables ***
${COMMON.HEADER.NAVIGATOR}    //a[@title='Navigator']
${ORACLE_HOME_NAVI.LINK.PAYABLES_INVOICES}    //div[./span/text()='Payables']//following-sibling::div//a[text()='Invoices']
${ORACLE_HOME_NAVI.LINK.FIXED_ASSETS_ASSETS}    //div[./span/text()='Fixed Assets']//following-sibling::div//a[text()='Assets']
${ORACLE_HOME.LINK.MORE}    //a[text()='More...']
${LOGIN.TEXTBOX.LOGIN_USER_TBOX}    //input[@placeholder='User ID']
${LOGIN.PASSWORDBOX.LOGIN_PASSWD_TBOX}    //input[@placeholder='Password']
${LOGIN.BUTTON.LOGIN_SIGNIN_BTN}    (//button[text()[contains(., 'Sign In ')]])[1]
${SECURITY_TOOL_BAR.BUTTON.SECURITY_CONSOLE}    //*[text()="Security Console"]
${SECURITY_CONSOLE.BUTTON.CREATE_ROLE}    //button[text()="Create Role"]
${CREATE_ROLE_PAGE.TEXT.ROLE_NAME}    //label[text()="Role Name"]/../following-sibling::*//input
${CREATE_ROLE_PAGE.TEXT.ROLE_CODE}    //label[text()="Role Code"]/../following-sibling::*//input
${CREATE_ROLE_PAGE.LIST.ROLE_CATEGORY_EXPAND}    //label[text()="Role Category"]/../following-sibling::*//input[not(@type="hidden")]
${CREATE_ROLE_PAGE.LIST_ITEM.ROLE_CATEGORY}    //div[@class="AFPopupMenuPopup"]//li
${COMMON.BUTTON.NEXT}    //button[@title="Next" or @accesskey="x"]
