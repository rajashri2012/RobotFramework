*** Settings ***
Documentation  Add License Key Functionality
Library  SeleniumLibrary
#Library  DataDriver  ../TestData/key1.txt
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL}  ${Browser}
Test Teardown  Close Browser Window
Suite Setup  Before Each Test Suite
Suite Teardown  After Each Test Suite
#Test Template  Add License Key
*** Variables ***
${URL}       https://ccautomation.rbi.qa.forcepoint.com
${Browser}   Chrome
*** Test Cases ***
Add Products License Key
    [Arguments]  ${licenseKey}
    set selenium implicit wait  20 seconds
    ${default_t}=  get selenium implicit wait
    log to console  ${default_t}
    Input Text    ${adminPortalUsernameField}  ${username}
    Input Text  ${adminPortalPasswordField}  ${password}
    Click Button  ${signInButton}
    wait until page contains  Web Security
    click element  ${myOrganization}
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Input Text  ${enterLicenseKey}  ${licenseKey}
    click button  ${updateButton}
    sleep  1 seconds
    wait until page contains  The license key installation is successful

