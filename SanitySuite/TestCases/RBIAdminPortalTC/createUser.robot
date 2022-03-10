*** Settings ***
Documentation  Create New User Functionality
Library  SeleniumLibrary
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL}  ${Browser}
Test Teardown  Close Browser Window
Suite Setup  Before Each Test Suite
Suite Teardown  After Each Test Suite

*** Variables ***
${URL}  https://ccautomation.qa.cyberinc.com
${Browser}  Chrome
*** Test Cases ***

Login to RBI Admin Portal
    #${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method  ${chrome options}  add_argument   headless
    #Call Method    ${chrome_options}   add_argument    disable-gpu
    #Call Method     ${chrome_options}    to_capabilities
    #Create Webdriver    Chrome    chrome_options=${chrome options}

    set selenium implicit wait  20 seconds
    ${default_t}=  get selenium implicit wait
    log to console  ${default_t}
    Input Text    ${adminPortalUsernameField}  ${username}
    Input Text  ${adminPortalPasswordField}  ${password}
    Click Button  ${signInButton}
    wait until page contains  Web Security
    #Create User Functionality
    sleep  3 seconds
    click element  ${UsersOption}
    sleep  3 seconds
    wait until page contains  Users
    click element  ${createNewUserButton}
    sleep  1 seconds
    Input Text  ${displayName}  User1
    Input Text  ${usernameEmail}  User1@fp.com
    Input Text  ${enterPassword}  ${password}
    Input Text  ${confirmPassword}  ${password}
    click element  ${enableUser}
    execute javascript  window.scrollTo(0,700)
    double click element  ${userRole}
    sleep  1 seconds
    double click element  ${confirmButton}
    Click Button  ${saveButton}
    #Delete Newly Created User Functionality
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    click element  ${deleteButton}
    click button  ${confirmButton}
    #Verify User has been deleted successfully
    Input Text  ${searchSpace}  User1
    wait until page contains  User deleted successfully









