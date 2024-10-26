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

    Wait Until Element Is Visible    xpath://html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li/a    5s

    ${elements}=    Get WebElements    xpath://html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li/a

    FOR    ${element}    IN    @{elements}
        ${link_text}=    Get Text    ${element}
        Log    Clicking link: ${link_text}
        Run Keyword And Ignore Error    Click Element    ${element}

        # Odota, että linkin klikkaus vie meidät oikealle sivulle
        Sleep    2
        # Tarkista, että olemme oikealla sivulla. Tämä voi olla esim. elementin odottaminen, joka näkyy vain tuotesivulla.
        Wait Until Page Contains Element    xpath://*[@id='product-specific-element']    10s

        Go Back

        # Odota, että pääset takaisin alkuperäiselle sivulle
        Sleep    1

        Wait Until Element Is Visible    xpath://html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li/a    10s
    END
