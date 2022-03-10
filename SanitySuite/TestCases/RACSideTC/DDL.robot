*** Settings ***
Documentation  Direct Download Link Functionality
Library  SeleniumLibrary
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL1}  ${Browser}
Test Teardown  Close Browser Window

*** Variables ***
${URL1}  https://ccautomation.qa.cyberinc.com/viewer/loader?tenantId=9bea9106-fcb1-4286-8edc-5e2ee1459131&url=https://file-examples-com.github.io/uploads/2017/02/file_example_CSV_5000.csv
#${URL2}  https://ccautomation.qa.cyberinc.com/viewer/loader?tenantId=9bea9106-fcb1-4286-8edc-5e2ee1459131&url=https://file-examples-com.github.io/uploads/2017/02/zip_2MB.zip
#${URL3}  https://ccautomation.qa.cyberinc.com/viewer/loader?tenantId=9bea9106-fcb1-4286-8edc-5e2ee1459131&url=https://file-examples-com.github.io/uploads/2018/04/file_example_WMV_480_1_2MB.wmv
${Browser}  headlesschrome
*** Test Cases ***

Start and Close browser
    sleep  1 seconds
    Input Text    ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${login_Button}
    set selenium implicit wait  20 seconds
#DDL Functionality
     sleep  10 seconds
     page should contain image  ${fpLogoImg}


