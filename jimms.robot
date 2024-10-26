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
Testataan, onko kaikilla tuotteilla landing page
    [Documentation]    Hanna
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Sleep    2s

    ${xpaths_category}    Create List
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]    # tietokoneet
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[2]    # kampanjat
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[3]    # oheislaitteet
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[4]    # pelaaminen
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[5]    # sim racing
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[6]    # verkkotuotteet
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[7]    # tarvikkeet
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[8]    # erikoistuotteet
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[9]    # ohjelmistot
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[10]   # palvelut

    FOR    ${index}    IN RANGE    0    10  # 11 on kategoria XPath:ien määrä
        ${xpath_landing_page}    Get From List    ${xpaths_category}    ${index}
        Reload Page

        # Odota, että elementti on näkyvissä
        Wait Until Element Is Visible    ${xpath_landing_page}    timeout=5s
        Sleep    1s  # Lisää lyhyt odotus ennen klikkaamista

        # Tarkista, että elementti on vuorovaikutteinen
        ${is_visible}    Run Keyword And Return Status    Element Should Be Visible    ${xpath_landing_page}
        Run Keyword If    not ${is_visible}    Log    Element ${xpath_landing_page} is not visible. Skipping...

        # Klikkaa elementtiä
        Click Element    ${xpath_landing_page}

        # Tarkista sivun otsikko
        ${page_title}    Get Title
        
        # Tarkista, onko sivu tyhjää
        ${is_empty}    Run Keyword And Return Status    Should Not Be Empty    ${page_title}

        # Jos sivu on tyhjää, merkitse se bugiksi ja palauta pääsivulle
        Run Keyword If    not ${is_empty}
        ...    Log    Kategoria ${index + 1} johtaa tyhjään laskeutumissivuun. Tämä on bugi!
        ...    Fail    Kategoria ${index + 1} ei ole toimiva laskeutumissivu!

        # Palataan pääsivulle
        Go Back
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


