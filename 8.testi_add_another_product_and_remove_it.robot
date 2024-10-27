*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    Screenshot

*** Variables ***
${URL}     https://www.jimms.fi/
${apple}    xpath=//*[@id="cListGroup"]/div/ul/li[1]/div/div/a/span
${addtocart}    xpath=//*[@id="initproductlist"]/div[1]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
${cartbutton}    xpath=//*[@id="headercartcontainer"]/a
${plusbutton}    xpath=//*[@id="jim-main"]/div/div/div/div[1]/article/div/div[2]/div/div[3]/div[1]/div/i[2]
${totalprice}    9 998,00 €

*** Test Cases ***
Open browser and click on "Tietokoneet/Computers"
    [Documentation]    Jemina

    Open Browser    ${URL}    Chrome
    Maximize Browser Window

    Execute JavaScript    window.location.href="/fi/Product/Tietokoneet"

Click on Apple, add first result to cart and open cart and take ss
    Click Element    ${apple}

    Wait Until Element Is Visible    ${addtocart}    timeout=3s
    Click Element    ${addtocart}

    Sleep    2s

    Click Element    ${cartbutton}

    Sleep    3s

    Capture Element Screenshot    xpath=//*[@id="jim-main"]/div/div    oldprice.jpg

Press the + button and check if price doubles
    Click Element    ${plusbutton}
    
    Sleep    2s

    Wait Until Element Is Visible    xpath=//*[@id="jim-main"]/div/div/div/div[2]/div/div[1]/ul/li[5]/span    timeout=4s
    ${price_element}=    Get Text    xpath=//*[@id="jim-main"]/div/div/div/div[2]/div/div[1]/ul/li[5]/span
    Should Be Equal    ${price_element}    ${totalprice}

Take screenshot of new price
    Capture Element Screenshot    xpath=//*[@id="jim-main"]/div/div    newprice.jpg

    Close Browser