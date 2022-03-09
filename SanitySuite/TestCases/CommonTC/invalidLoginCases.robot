*** Settings ***
Documentation  Invalid Login Functionality
Library  SeleniumLibrary
Library  DataDriver  ../TestData/invalidCredentials.csv
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL}  ${Browser}
Test Teardown  Close Browser Window
Suite Setup  Before Each Test Suite
Suite Teardown  After Each Test Suite
Test Template  Invalid Login Scenarios

*** Variables ***
${Browser}  headlesschrome
${URL}  https://ccautomation.qa.cyberinc.com/viewer/loader?tenantId=9bea9106-fcb1-4286-8edc-5e2ee1459131&username=rb@fp.com&url=https://www.google.com

*** Test Cases ***

Invalid Login Scenarios
    Input Text    ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${login_Button}