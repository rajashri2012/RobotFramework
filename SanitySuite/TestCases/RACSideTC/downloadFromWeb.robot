*** Settings ***
Documentation  Download Diffrent File Formats from Local Website
Library  SeleniumLibrary
Library  SikuliLibrary   mode=NEW
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL1}  ${Browser}
Test Teardown  Close Browser Window

*** Variables ***
${URL1}     https://ccautomation.rbi.qa.forcepoint.com/viewer/loader?tenantId=85752e70-2693-4db6-b169-87f2d871aea5&username=rb@fp.com&url=http://203.115.112.227/up-down/
${Browser}  Chrome

*** Test Cases ***
Start and Close browser
    set selenium implicit wait  20 seconds
    ${default_t}=  get selenium implicit wait
    log to console  ${default_t}
    SeleniumLibrary.Input Text    ${username_field}  ${username}
    SeleniumLibrary.Input Text    ${password_field}  ${password}
    Click Button  ${login_Button}
    sleep  5 seconds
    Start Sikuli Process
    Add Image Path  C:/RAC Automation_RobotFramework/SanitySuite/SikuliImages/downloadFromWeb
    click button  ${csvFile}
    sleep  5 seconds
    wait until screen contain  downloadedCSVFile.PNG  10






