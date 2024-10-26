*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Screenshot
Library    Collections

*** Variables ***
${url}    https://www.jimms.fi/
${search_input}   id=searchinput
${firstproduct}    xpath=//*[@id="productsearchpage"]/div[2]/div[5]/div/div[1]/product-box
${ICON_XPATH}    //addto-cart-wrapper//a//span 
${SCREENSHOT_PATH}    lisää_koriin_ikoni.png

*** Test Cases ***
Open Browser and maximize Window

    Open Browser    ${url}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window

*** Test Cases ***
*** Test Cases ***
Testataan, onko kaikilla tuotteilla landing page
    [Documentation]    Hanna
    
    Open Browser    ${url}    Chrome
    Maximize Browser Window

    # Odotetaan, että navigointivalikko tulee näkyviin
    Wait Until Element Is Visible    xpath://jim-drilldown-mega-menu/nav/ul    5s

    ${elements}=    Get WebElements    xpath://jim-drilldown-mega-menu/nav/ul/li/a

    FOR    ${element}    IN    @{elements}
        ${link_text}=    Get Text    ${element}
        Log    Klikkaus: ${link_text}

        # Klikkaa elementtiä
        Run Keyword And Continue On Failure    Click Element    ${element}
        
        # Odotetaan että uusi sivu latautuu tarkistamalla, että <h1> tulee näkyviin
        Wait Until Page Contains Element    xpath://h1    10s  

        # Halutessasi, voit tarkistaa, ettei sivulla ole virhe-elementtejä
        # Wait Until Page Does Not Contain    Virhe tai 404

        Go Back

        # Päivitetään valikkorakenne sivun takaisin siirtymisen jälkeen
        Wait Until Element Is Visible    xpath://jim-drilldown-mega-menu/nav/ul    10s
        ${elements}=    Get WebElements    xpath://jim-drilldown-mega-menu/nav/ul/li/a
    END


*** Test Cases ***
Search "ps5" in the search bar and take screenshot of 1st product¨
    [Documentation]    Jemina

    Click Element    ${search_input}
    Input Text    ${search_input}    ps5

    Press Keys    ${search_input}    ENTER

    Wait Until Element Is Visible    ${firstproduct}    timeout=10s
    Capture Element Screenshot    ${firstproduct}    first_product.png

Go to the product page and check that it contains "Sony PS5 DualSense Midnight Black, langaton peliohjain"

    Click Element    xpath=//*[@id="productsearchpage"]/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img

    Page Should Contain    Sony PS5 DualSense Midnight Black, langaton peliohjain

*** Test Cases ***
Test if the "Lisää koriin" link and icon is visible
    [Documentation]    Ella

    Element Should Be Visible    css=a[title="Lisää koriin"]

    Wait Until Element Is Visible    ${ICON_XPATH}    timeout=10
    Element Should Be Visible    ${ICON_XPATH}

Take screenshot of the icon
    Capture Element Screenshot    ${ICON_XPATH}    ${SCREENSHOT_PATH}
    File Should Exist    ${SCREENSHOT_PATH}

*** Test Cases ***
Testaa lisätä tuote ostoskoriin
    [Documentation]    Hanna
    
    Click Element    xpath://a[@title='Lisää koriin']


