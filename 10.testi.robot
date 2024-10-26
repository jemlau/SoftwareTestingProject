*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    Screenshot

*** Variables ***
${URL}     https://www.jimms.fi/
${dropdown}    xpath=/html/body/div[1]/div/div/span
${darktheme}    xpath=/html/body/div[1]/div/div/ul/li[2]/button
${lighttheme}    xpath=/html/body/div[1]/div/div/ul/li[1]/button
${autotheme}    xpath=/html/body/div[1]/div/div/ul/li[3]/button

*** Test Cases ***
Open browser
    [Documentation]    Jemina
    
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Change theme to dark
    Click Element    ${dropdown}
    Click Element    ${darktheme}
    
    Sleep    3s
    Take Screenshot    darktheme.jpg

Change theme back to light
    Click Element    ${dropdown}
    Click Element    ${lighttheme}

    Sleep    3s
    Take Screenshot    lighttheme.jpg

    Close Browser
    
    
