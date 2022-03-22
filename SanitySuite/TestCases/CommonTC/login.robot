*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL}  ${Browser}
Test Teardown  Close Browser Window
Suite Setup  Before Each Test Suite
Suite Teardown  After Each Test Suite

*** Variables ***
${URL}  https://ccautomation.rbi.qa.forcepoint.com/viewer/loader?tenantId=85752e70-2693-4db6-b169-87f2d871aea5&username=rb@fp.com&url=https://www.google.com
${Browser}  headlesschrome

*** Test Cases ***
Start and Close browser
    Input Text    ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${login_Button}




