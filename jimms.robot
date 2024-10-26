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
${menu_base_xpath}    /html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul
@{menu_items}    li[1]    li[2]    li[3]    li[4]    li[5]    li[6]    li[7]    li[8]    li[9]    li[10]    li[11]

*** Test Cases ***
Open Browser and maximize Window

    Open Browser    ${url}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window

*** Test Cases ***
Testataan, onko kaikilla tuotteilla landing page
    [Documentation]    Hanna

    FOR    ${item}    IN    @{menu_items}
    ${xpath}    Set Variable    ${menu_base_xpath}/${item}
    Run Keyword And Continue On Failure    Check If Element Exists    ${xpath}
    END

*** Keywords ***
Check If Element Exists
    [Arguments]    ${xpath}
    ${exists}    Run Keyword And Return Status    Element Should Be Visible    ${xpath}
    Run Keyword If    ${exists}    Log    Element found for ${xpath}
    Run Keyword Unless    ${exists}    Log    Element not found for ${xpath}

    Sleep    2s
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


