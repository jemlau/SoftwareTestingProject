*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Testataan, onko kaikilla tuotteilla landing page
    # Avataan Jimmsin nettikauppa
    Open Browser    http://jimms.fi    Chrome
    Maximize Browser Window
    Sleep    2s
    
    # Hae tuotteiden valikon kaikki linkit
    ${navbar_items}=    Get WebElements    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul
    
    # Loopataan jokaisen valikon otsikko, ja tarkistetaan, onko tuotteilla laskeutumissivu
    FOR
