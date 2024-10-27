*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem


*** Variables ***
${URL}     https://www.jimms.fi/
${productpage}    https://www.jimms.fi/fi/Product/Show/199044/1000040194/sony-ps5-dualsense-midnight-black-langaton-peliohjain
${addtocart}    xpath=//*[@id="product-cta-box"]/div/div[3]/div[2]/addto-cart-wrapper/div/a
${cartbutton}    xpath=//*[@id="headercartcontainer"]/a
${emptycart}    xpath=//*[@id="jim-main"]/div/div/div/div[1]/div/button   
${emptycartButton}    xpath=//*[@id="resetcartmodal"]/div/div/div[3]/form/input[3]

*** Test Cases ***
Open browser and go to product page
    [Documentation]    Jemina

    Open Browser    ${URL}    Chrome
    Maximize Browser Window

    Go To    ${productpage}

Add product to cart and go to cart
    Click Element    ${addtocart}
    Sleep    1s
    Click Element    ${cartbutton}
    Sleep    2s

Empty shopping cart and check that it's empty
    Wait Until Element Is Visible    ${emptycart}    timeout=4s
    Click Element    ${emptycart}

    Sleep    2s

    Wait Until Element Is Visible    ${emptycartButton}    timeout=5s
    Click Button    ${emptycartButton}

    Sleep    1s

    Page Should Contain    Ostoskorisi on tyhjä

    Close Browser
