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
    Maximize Browser Window

*** Test Cases ***
Testataan, onko kaikilla tuotteilla landing page
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
    
    Click Element    xpath://a[@title='Lisää koriin']


