*** Settings ***
Library           OperatingSystem
Resource          variables.robot
Resource          web elements.robot
Resource          credential.txt

*** Keywords ***
Click Element Until Added To Page
    [Arguments]    ${locator}    ${locator_added}    ${max retry}=30    ${wait}=1s
    # Retry 30 times by default
    : FOR    ${i}    IN RANGE    1    ${max retry}
    \    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${locator}
    \    Run Keyword And Ignore Error    Click Element    ${locator}
    \    Sleep    ${wait}
    \    ${result}    ${returnvalue}    Run Keyword And Ignore Error    Page Should Contain Element    ${locator_added}
    \    Exit For Loop If    '${result}'=='PASS'

Click Element Until Deleted From Page
    [Arguments]    ${locator}    ${max retry}=30    ${wait}=1s
    # Retry 30 times by default
    : FOR    ${i}    IN RANGE    1    ${max retry}
    \    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${locator}
    \    Run Keyword And Ignore Error    Click Element    ${locator}
    \    Sleep    ${wait}
    \    ${result}    ${returnvalue}    Run Keyword And Ignore Error    Page Should Not Contain Element    ${locator}
    \    Exit For Loop If    '${result}'=='PASS'

CloseDriverserver
    Close All Browsers

FormatName
    [Arguments]    ${name}
    : FOR    ${c}    IN    ${SPACE}    -    (    )
    ...    .    ,    /    \\    ;    =
    ...    +    #    :
    \    ${name}    Replace String    ${name}    ${c}    _
    ${name}    Get Substring    ${name}    0    60
    [Return]    ${name}

Login Oracle
    [Arguments]    ${account}    ${pwd}
    #Login of Oracle page
    Wait Exists And Input Text    ${LOGIN.TEXTBOX.LOGIN_USER_TBOX}    ${account}
    Input Password    ${LOGIN.PASSWORDBOX.LOGIN_PASSWD_TBOX}    ${pwd}
    Run Keyword And Continue On Failure    Wait Exists And Click Element    ${LOGIN.BUTTON.LOGIN_SIGNIN_BTN}

Logout Oracle
    #Logout of Oracle page
    Wait Exists And Click Element    ${COMMON.BUTTON.COMMON_MENUARROW_BTN}
    Sleep    3s
    Wait Exists And Click Element    ${COMMON.BUTTON.COMMON_SIGNOUT_BTN}
    Wait Exists And Click Element    ${LOGOUT.BUTTON.LOGOUT_CONFIRM_BTN}

Navigator To Link
    [Arguments]    ${link name}
    # Click Navigator Icon until Popup Mune exists
    Click Element Until Added To Page    ${COMMON.HEADER.NAVIGATOR}    ${POPUPMENU.H1.NAVIGATOR}    5
    ${xpath}=    Set Variable    //a[text()='${link name}']
    # If link does not exist, click "More".
    : FOR    ${i}    IN RANGE    1    5
    \    ${link element count}=    Get Element Count    ${xpath}    # Check if link exists
    \    Sleep    2s
    \    Exit For Loop If    ${link element count}>0
    \    Run Keyword If    ${link element count}==0    Wait Exists And Click Element    ${ORACLE_HOME.LINK.MORE}
    # Find the link and click it.
    Run Keyword If    "${link name}"=="Invoices"    Wait Exists And Click Element    ${ORACLE_HOME_NAVI.LINK.PAYABLES_INVOICES}
    ...    ELSE IF    "${link name}"=="Assets"    Wait Exists And Click Element    ${ORACLE_HOME_NAVI.LINK.FIXED_ASSETS_ASSETS}
    ...    ELSE    Wait Exists And Click Element    ${xpath}

Open Chrome Browser
    [Arguments]    ${url}    ${width}=1600    ${height}=900
    Set Environment Variable    webdriver.chrome.driver    ${CHROME DRIVER}
    Open Browser    ${url}    browser=${BROWSER}
    Set Window Size    ${width}    ${height}
    Go To    ${url}

Open Chrome Headless
    [Arguments]    ${url}    ${width}=1600    ${height}=900
    @{args}=    Create List    --headless    window-size=${width},${height}
    &{chrome_option}=    Create Dictionary    args=@{args}
    &{desired_capabilities}=    Create Dictionary    chromeOptions=&{chrome_option}
    Create Webdriver    ${BROWSER}    desired_capabilities=${desired_capabilities}
    Go To    ${url}

Open Chromium Browser
    [Arguments]    ${URL}    ${width}=1600    ${height}=900
    @{args}=    Create List    window-size=${width},${height}
    &{chrome_option}=    Create Dictionary    binary=${CHROMIUM BIN}    args=@{args}
    &{desired_capabilities}=    Create Dictionary    chromeOptions=&{chrome_option}
    Create Webdriver    ${BROWSER}    desired_capabilities=${desired_capabilities}
    Go To    ${URL}

Open Chromium Headless
    [Arguments]    ${URL}    ${width}=1600    ${height}=900
    # Set args
    @{args}=    Create List    --no-sandbox    --headless    window-size=${width},${height}
    # Set prefs
    &{downloadBehavior}=    Create Dictionary    behavior=allow    downloadPath=${DOWNLOAD_DIR}
    &{prefs}=    Create Dictionary    credentials_enable_service=false    Browser.setDownloadBehavior=&{downloadBehavior}    download.default_directory=${DOWNLOAD_DIR}    download.directory_upgrade=True
    # Set chrome option
    &{chrome_option}=    Create Dictionary    binary=${CHROMIUM BIN}    args=@{args}    prefs=&{prefs}
    # Set desired capabilities
    &{desired_capabilities}=    Create Dictionary    chromeOptions=&{chrome_option}
    Create Webdriver    ${BROWSER}    desired_capabilities=${desired_capabilities}

Scroll Element Into View
    [Arguments]    ${element}
    Execute Javascript    var elmnt = document.evaluate("${element}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; elmnt.scrollIntoView();

Scroll To Element
    [Arguments]    ${locator}
    ${x}=    Get Horizontal Position    ${locator}
    ${y}=    Get Vertical Position    ${locator}
    Execute Javascript    window.scrollBy(${x}, ${y});

Wait Exists And Click Element
    [Arguments]    ${locator}    ${time_out}=5
    # Wait and frontend loading exception handling
    Wait Until Page Contains Element    ${locator}
    #Wait Until Element Is Visible    ${locator}
    : FOR    ${i}    IN RANGE    1    ${time_out}
    \    Sleep    0.5
    \    ${result}    ${returnvalue}    Run Keyword And Ignore Error    Click Element    ${locator}
    \    Continue For Loop If    """StaleElementReferenceException""" in """${returnvalue}"""
    \    Continue For Loop If    """ElementNotVisibleException""" in """${returnvalue}"""
    \    Exit For Loop If    '${result}'=='PASS'

Wait Exists And Input Text
    [Arguments]    ${locator}    ${text}    ${time_out}=5
    # Wait and frontend loading exception handling
    Wait Until Page Contains Element    ${locator}
    : FOR    ${i}    IN RANGE    1    ${time_out}
    \    ${result}    ${returnvalue}    Run Keyword And Ignore Error    Input Text    ${locator}    ${text}
    \    Continue For Loop If    """StaleElementReferenceException""" in """${returnvalue}"""
    \    Continue For Loop If    """ElementNotVisibleException""" in """${returnvalue}"""
    \    Exit For Loop If    '${result}'=='PASS'

Wait Until File Download Complete
    [Arguments]    ${path}    ${filename}    ${timeout}=30
    : FOR    ${i}    IN RANGE    1    ${timeout}
    \    Sleep    1s
    \    ${result}    ${returnvalue}    Run Keyword And Ignore Error    File Should Exist    ${path}${/}${filename}
    \    Exit For Loop If    '${result}'=='PASS'

Open Chrome Browser With useAutomationExtension
    [Arguments]    ${URL}
    [Documentation]    Opens _Google Chrome_ to a given web page.
    ...    For more information on what capabilities that _Google Chrome_
    ...    supports, see [https://sites.google.com/a/chromium.org/chromedriver/capabilities%7Cthis Capabilities & ChromeOptions page].
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_experimental_option    useAutomationExtension    ${False}
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    # Maximize Browser Window    # doesn't work under XVFB
    Go To    ${URL}

Verify Page
    [Arguments]    ${page title}    ${page element locator}
    Wait Until Page Contains    ${page title}
    Wait Until Page Contains Element    ${page element locator}

Wait Until Element Be Clicked
    [Arguments]    ${xpath}
    # If element exist, click it.
    Wait Exists And Click Element    ${xpath}
    : FOR    ${i}    IN RANGE    1    5
    \    ${element count}=    Get Element Count    ${xpath}    # Check if element exists
    \    Sleep    1s
    \    Exit For Loop If    ${element count}==0
    \    Run Keyword If    ${element count}>0    Wait Exists And Click Element    ${xpath}


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
    Wait Exists And Click Element    ${CREATE_DATA_ACCESS_FOR_USERS.BUTTON.ADD_ROW}
    # Input user name
    Wait Exists And Input Text    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME}    ${user_name}
    # Verify user name
    #${dynamic_verify_user_name_xpath}=    Replace String    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME_VERIVY}    verify_user_name_to_be_replaced    ${user_name}
    #Wait Until Page Contains Element    ${dynamic_verify_user_name_xpath}
    # Click user name from dropdown list
    #${dynamic_user_name_xpath}=    Replace String    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.USER_NAME_ITEM}    data_access_user_name_to_be_replaced    ${user_name}
    #Wait Exists And Click Element    ${dynamic_user_name_xpath}
    # design method to avlid sleep
    Sleep    15s
    Wait Exists And Input Text    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.ROLE}    ${role_name}
    ${dynamic_role_name_xpath}=    Replace String    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.ROLE_NAME_ITEM}    data_access_role_name_to_be_replaced    ${role_name}
    Wait Exists And Click Element    ${dynamic_role_name_xpath}

    Sleep    15s
    Select From List By Label   ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.SECURITY_CONTEXT}    ${security_context}
    Sleep    15s
    Wait Exists And Input Text    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.SECURITY_CONTEXT_VALUE}    ${security_context_value}
    ${dynamic_security_context_value_xpath}=    Replace String    ${CREATE_DATA_ACCESS_FOR_USERS.TEXT.CONTEXT_SECURITY_VALUE_ITEM}    data_access_security_context_value_to_be_replaced    ${security_context_value}
    Wait Exists And Click Element    ${dynamic_security_context_value_xpath} 

