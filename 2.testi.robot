*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String

*** Variables ***
${url}    https://www.jimms.fi/

*** Test Cases ***
Open Browser and maximize Window

    Open Browser    ${url}    Chrome
    Maximize Browser Window

*** Test Cases ***
Search "ps5" in the search bar

    Click Element    name:q
    Input Text    name:q    ps5

    Sleep    3s


