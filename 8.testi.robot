*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    Screenshot

*** Variables ***
${URL}     https://www.jimms.fi/
${apple}    xpath=//*[@id="cListGroup"]/div/ul/li[1]/div/div/a/span
${maxprice}    xpath=//*[@id="cFilterPrice"]/div/div[1]/div/div[3]/div/input
${productlist}    xpath=//*[@id="initproductlist"]
${iconbutton}    xpath=//*[@id="productlist"]/div[2]/list-view-toggler/div/button[1]/i
${price_element}    xpath=//*[@id="initproductlist"]/div[5]/product-box/div[2]/div[3]/div/span/span

*** Test Cases ***
Open browser and click on "Tietokoneet/Computers"
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

    Execute JavaScript    window.location.href="/fi/Product/Tietokoneet"

*** Test Cases ***
Click on Apple computers and set the max price to 900
    Wait Until Element Is Visible    ${apple}    timeout=4s
    Click Element    ${apple}

    Click Element    ${maxprice}
    Input Text    ${maxprice}    900

    Press Keys    ${maxprice}    ENTER

*** Test Cases ***
Check that the robot only lists products that are 900e or less
    Wait Until Page Contains Element    ${productlist}    timeout=10s
    ${products}=    Get WebElements    ${productlist}
    FOR    ${product}    IN    @{productlist}
        ${price}=    Get Text    ${price_element}
        ${price}=    Replace String    ${price}    €    ''
        ${price}=    Replace String    ${price}    ,    .
        Should Be True    ${price} <=900
    END





    

