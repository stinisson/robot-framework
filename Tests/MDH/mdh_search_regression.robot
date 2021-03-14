*** Settings ***
Library  SeleniumLibrary

Library  OperatingSystem
Suite Setup  Run keywords
...  Setup chromedriver
...  Go to homepage
Suite Teardown  Close All Browsers

*** Variables ***
${EXECDIR}  C:\Python39
${HOMEPAGE}  https://www.mdh.se/en/malardalen-university/education/find-education?query=&page=0&educationType=courses&successivedeepening=ALL
${BROWSER}  chrome
${KEY}  RETURN

*** Test Cases ***
Search Regression testing and select course from drop down menu
    Search Regression testing, select from drop down menu, check result  Regression testing  Quality assurance - Regression testing and fault prediction

*** Keywords ***
Setup chromedriver
    Set Environment Variable  webdriver.chrome.driver  ${EXECDIR}\chromedriver.exe

Go to homepage
    Open Browser  ${HOMEPAGE}  ${BROWSER}

Search Regression testing, select from drop down menu, check result
    [Arguments]  ${searchkey}  ${result}
    Input Text  id=education-search-input  ${searchkey}
    Mouse Over  xpath=//div[@class="mdh-search-autosuggest__results-container"]
    Click Element  xpath=//li[@data-suggestion-index=0]
    Wait Until Page Contains  ${result}
