*** Settings ***
Documentation  Direct Download Link Functionality with Sikuli
Library  SeleniumLibrary
Library  SikuliLibrary     mode=NEW
Library  OperatingSystem
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL1}  ${Browser}
Test Teardown  Close Browser Window

*** Variables ***
${URL1}     https://ccautomation.rbi.qa.forcepoint.com/viewer/loader?tenantId=85752e70-2693-4db6-b169-87f2d871aea5&username=rb@fp.com&url=https://filesamples.com/formats/pdf
${Browser}  Chrome

*** Test Cases ***
Start and Close browser
    Start Sikuli Process
    Add Image Path  C:/RAC Automation_RobotFramework/SanitySuite/SikuliImages
    Input Text    ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${login_Button}
    sleep  2 seconds
    execute javascript  window.scrollTo(0,500)
    sleep  1 seconds
    # Check if Ad close button exist and retry for 2 seconds returning false.
    Click If Exists    ./closeAd.png    ${2}
    #Click             ./closeAd.png
    #Click  closeAd.png
    wait until Screen Contain  samplePDF.png  10
    Click Link    ${pdfFile}
    set selenium implicit wait  20 seconds
    sleep  10 seconds
    Wait Until Screen Contain  downloadedPdfFile.png  10
    #page should contain image  ${fpLogoImg}


*** Keywords ***
Click If Exists
    [Arguments]    ${image}    ${timeout}=${0}
    ${exists}    Exists    ${image}    ${timeout}
    Run Keyword If    "${exists}"=="true"    Click  ${image}
