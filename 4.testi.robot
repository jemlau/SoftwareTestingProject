*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}     https://www.jimms.fi/
${ICON_XPATH}    //addto-cart-wrapper//a//span 
${SCREENSHOT_PATH}    lisää_koriin_ikoni.png

*** Test Cases ***

Testaa Lisää Koriin Linkin Ikoni Ja Ota Kuvankaappaus
    [Documentation]    Tarkistaa löytyykö "Lisää koriin" -linkkiin liittyvä ikoni ja ottaa siitä kuvankaappauksen
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    # Siirry tuotesivulle
    Go To    https://www.jimms.fi/fi/Product/Show/199044/1000040194/sony-ps5-dualsense-midnight-black-langaton-peliohjain
    # Tarkista, että ikoni löytyy "Lisää koriin" -linkin yhteydestä
    Wait Until Element Is Visible    ${ICON_XPATH}    timeout=10
    # Ota kuvankaappaus ikonista
    Capture Element Screenshot    ${ICON_XPATH}    ${SCREENSHOT_PATH}
    # Varmista, että kuvankaappaus on luotu
    File Should Exist    ${SCREENSHOT_PATH}
    Close Browser
