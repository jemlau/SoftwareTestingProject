*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Collections

*** Variables ***
${URL}    https://www.jimms.fi/
${BROWSER}    Chrome

*** Test Cases ***
Testataan, onko kaikilla tuotteilla landing page
    
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Bugi: Sivu pitää reloadata jotta tuotealueita pystyy klikata
    Reload Page
    Sleep    1s

    Wait Until Element Is Visible    xpath://html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[]/a    5s

    ${elements}=    Get WebElements    xpath://html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[]/a

    Remove From List    ${elements}    -1

    FOR    ${element}    IN    @{elements}
        ${link_text}=    Get Text    ${element}
        Log    Clicking link: ${link_text}
        Run Keyword And Ignore Error    Click Element    ${element}

        Go Back

        Sleep    1

        Wait Until Element Is Visible    xpath://html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]/a    10s
    END