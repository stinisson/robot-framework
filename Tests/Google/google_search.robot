*** Settings ***
Library  SeleniumLibrary

Library  OperatingSystem
Suite Setup  Run keywords
...  Setup chromedriver
...  Go to homepage
Suite Teardown  Close All Browsers

*** Variables ***
${EXECDIR}  C:\Python39
${HOMEPAGE}  https://www.google.com/
${BROWSER}  chrome
${KEY}  RETURN

*** Test Cases ***
Google mdh and find mdh.se
    Google and check results  mdh  www.mdh.se

*** Keywords ***
Setup chromedriver
    Set Environment Variable  webdriver.chrome.driver  ${EXECDIR}\chromedriver.exe

Go to homepage
    Open Browser  ${HOMEPAGE}  ${BROWSER}
    Add Cookie  CONSENT  YES+SE.sv+V10+BX+434 domain=google.com
    Reload Page

Google and check results
    [Arguments]  ${searchkey}  ${result}
    Input Text  class=gLFyf  ${searchkey}
    Press Keys  class=gLFyf  RETURN
    Wait Until Page Contains  ${result}
