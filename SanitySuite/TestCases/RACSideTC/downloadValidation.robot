*** Settings ***
Documentation  Direct Download File Validation Functionality
Library  SeleniumLibrary
Library  OperatingSystem
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL1}  ${Browser}
Test Teardown  Close Browser Window
Suite Setup  Before Each Test Suite
Suite Teardown  After Each Test Suite

*** Variables ***
#${URL}  https://ccautomation.qa.cyberinc.com/viewer/#https://www.google.com
${URL1}  https://ccautomation.rbi.qa.forcepoint.com/viewer/loader?tenantId=85752e70-2693-4db6-b169-87f2d871aea5&username=rb@fp.com&url=https://filesamples.com/formats/pdf
${Browser}  headlesschrome
*** Test Cases ***
Download PDF
    # create unique folder

    ${now}    Get Time    epoch
    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${download directory}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # list of plugins to disable. disabling PDF Viewer is necessary so that PDFs are saved rather than displayed
    ${disabled}    Create List    Chrome PDF Viewer
    ${prefs}    Create Dictionary    download.default_directory=${download directory}    plugins.plugins_disabled=${disabled}
    Call Method  ${chrome options}  add_argument   headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method     ${chrome_options}    to_capabilities
    Call Method     ${chrome options}    add_argument    --disable-notifications
    Call Method  ${chrome options}  add_argument  --disable-infobars
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${chrome options}

    reload page
    Goto  ${URL1}
    sleep  2 seconds
    maximize browser window
    sleep  2 seconds
    Input Text    ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${login_Button}
    #set selenium implicit wait  30 seconds
    sleep  5 seconds
    execute javascript  window.scrollTo(0,500)
    #scroll element into view  ${pdfFile}
    sleep  1 seconds
    Click Link    ${pdfFile}    # downloads a file
    # wait for download to finish
    ${file}    Wait Until Keyword Succeeds    1 min    2 sec    Download should be done    ${download directory}
    #sleep  5 seconds
    #Goto  ${URL2}
    #sleep  10 seconds
*** Keywords ***
Download should be done
    [Arguments]    ${directory}
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...
    ...    Returns path to the file
    ${files}    List Files In Directory    ${directory}
    Length Should Be    ${files}    1    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Chrome is still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    [Return]    ${file}