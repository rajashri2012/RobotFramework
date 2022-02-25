*** Settings ***
Documentation  Direct Download Link Functionality
Library  SeleniumLibrary
Variables  ../WebElements.py
Resource  ../Resources/KeywordDefinationFiles/setup_teardown.robot
Test Setup  Start Browser and Maximize  ${URL}  ${Browser}
Test Teardown  Close Browser Window

*** Variables ***
${Browser}  Chrome
${URL}  https://ccautomation.qa.cyberinc.com/viewer/#https://www.google.com
#${URL1}  https://ccautomation.qa.cyberinc.com/viewer/#https://file-examples-com.github.io/uploads/2017/10/file-example_PDF_1MB.pdf
${URL1}  https://ccautomation.qa.cyberinc.com/viewer/#https://file-examples-com.github.io/uploads/2017/02/file_example_CSV_5000.csv
${URL2}  https://ccautomation.qa.cyberinc.com/viewer/#https://file-examples-com.github.io/uploads/2017/02/zip_2MB.zip
${URL3}  https://ccautomation.qa.cyberinc.com/viewer/#https://file-examples-com.github.io/uploads/2018/04/file_example_WMV_480_1_2MB.wmv

*** Test Cases ***

Start and Close browser
    sleep  1 seconds
    Input Text    ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${login_Button}
    set selenium implicit wait  20 seconds
#DDL Functionality
    go to  ${URL1}
    sleep  10 seconds
    page should contain image  ${fpLogoImg}
    go to  ${URL2}
    sleep  10 seconds
    page should contain image  ${fpLogoImg}
    go to  ${URL3}
    sleep  10 seconds
    page should contain image  ${fpLogoImg}