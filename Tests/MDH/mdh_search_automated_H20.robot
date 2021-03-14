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
Search Automated Test Generation Autumn 2020 and find Automatisk testgenerering course
    Search Automated Test Generation 2020 and check results  Automated Test Generation  Automated Test Generation

*** Keywords ***
Setup chromedriver
    Set Environment Variable  webdriver.chrome.driver  ${EXECDIR}\chromedriver.exe

Go to homepage
    Open Browser  ${HOMEPAGE}  ${BROWSER}


Search Automated Test Generation 2020 and check results
    [Arguments]  ${searchkey}  ${result}
    Input Text  id=education-search-input  ${searchkey}
    Click Element  xpath=//label[@for="semester-HT20"]
    Click Button  class=mdh-button.mdh-button--secondary.mdh-search-form__submit-button.mdh-search-education__submit-button
    Wait Until Page Contains  ${result}

