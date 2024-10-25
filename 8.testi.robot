*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${URL}     https://www.jimms.fi/
${computers}    xpath=//*[@id="sitemegamenu"]/nav/ul/li[1]/a

*** Test Cases ***
Open browser and click on "Tietokoneet/Computers"
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

    Click Element    ${computers}

    

