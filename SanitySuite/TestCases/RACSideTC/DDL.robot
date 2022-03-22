*** Settings ***
Documentation  Direct Download Link Functionality with Sikuli
Library  SeleniumLibrary
#Library  SikuliLibrary   mode=NEW
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL1}  ${Browser}
Test Teardown  Close Browser Window

*** Variables ***
${URL1}  https://ccautomation.rbi.qa.forcepoint.com/viewer/loader?tenantId=85752e70-2693-4db6-b169-87f2d871aea5&username=rb@fp.com&url=https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf
${Browser}  Chrome

*** Test Cases ***
Start and Close browser

    sleep  1 seconds
    Input Text    ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${login_Button}
    sleep  5 seconds
    #Start Sikuli Process
    #Add Image Path  C:/RAC Automation_RobotFramework/SanitySuite/SikuliImages
    #Wait Until Screen Contain  file.png  10
    wait until page contains  downloadedPdfFile.png
    #page should contain image  downloadedPdfFile.png


