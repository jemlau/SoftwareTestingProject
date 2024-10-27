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
        Click Element    ${xpath_landing_page}
        ${page_title}    Get Title
        Sleep    1s
        
        Run Keyword And Ignore Error
        ...    Should Not Be Empty    ${page_title}    Kategoriassa ${index + 1} pitäisi olla laskeutumis- eli "landing" -sivu
        
        Run Keyword And Continue On Failure
        ...    Go Back
        
    END

*** Test Cases ***
Search "ps5" in the search bar and take screenshot of 1st product¨
    [Documentation]    Jemina

    Click Element    ${search_input}
    Sleep    2s

    Input Text    ${search_input}    ps5
    Sleep    2s

    Press Keys    ${search_input}    ENTER
    Sleep    2s

    Wait Until Element Is Visible    ${firstproduct}    timeout=10s
    Capture Element Screenshot    ${firstproduct}    first_product.png

Go to the product page and check that it contains "Sony PS5 DualSense Midnight Black, langaton peliohjain"

    Click Element    xpath=//*[@id="productsearchpage"]/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img
    Sleep    2s

    Page Should Contain    Sony PS5 DualSense Midnight Black, langaton peliohjain
    Sleep    2s

*** Test Cases ***
Test if the "Lisää koriin" link and icon is visible
    [Documentation]    Ella

    Element Should Be Visible    css=a[title="Lisää koriin"]

    Wait Until Element Is Visible    ${ICON_XPATH}    timeout=10
    Element Should Be Visible    ${ICON_XPATH}
    Sleep    2s

Take screenshot of the icon
    Capture Element Screenshot    ${ICON_XPATH}    ${SCREENSHOT_PATH}
    File Should Exist    ${SCREENSHOT_PATH}
    Sleep    2s

*** Test Cases ***
Test to add product to shopping cart
    [Documentation]    Hanna
    
    Click Element    xpath://a[@title='Lisää koriin']
    Sleep    2s

    Click Element    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div
    Sleep    2s
    
    Close Browser

