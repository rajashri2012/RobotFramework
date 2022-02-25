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
${Browser}  headlesschrome
${URL}  https://ccautomation.qa.cyberinc.com/viewer/#https://www.google.com

*** Test Cases ***

Start and Close browser
    Input Text    ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${login_Button}




