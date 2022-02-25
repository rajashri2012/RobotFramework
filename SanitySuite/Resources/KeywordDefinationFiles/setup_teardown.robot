*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***

Start Browser and Maximize
    [Arguments]  ${URL}  ${Browser}
    open browser  ${URL}  ${Browser}
    maximize browser window
    sleep  2 seconds

Close Browser Window
    Close Browser

Before Each Test Suite
    Log  Before Each Test Suite

After Each Test Suite
    Log  After Each Test Suite