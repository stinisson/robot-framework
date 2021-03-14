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
    Filter and check result  Deep Learning for Industrial Imaging

*** Keywords ***
Setup chromedriver
    Set Environment Variable  webdriver.chrome.driver  ${EXECDIR}\chromedriver.exe

Go to homepage
    Open Browser  ${HOMEPAGE}  ${BROWSER}

Filter and check result
    [Arguments]  ${result}
    Click Element  xpath=//option[@id="successivedeepening-A1N"]
    Click Element  xpath=//label[@for="semester-HT21"]
    Click Element  xpath=//label[@for="language-EN"]
    Click Element  xpath=//label[@for="studypace-0-25"]
    Click Element  xpath=//label[@for="teachingform-Distance"]
    Click Element  xpath=//div[@class="mdh-form__dropdown"]
    Wait Until Page Contains  ${result}



