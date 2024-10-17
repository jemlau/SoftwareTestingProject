*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Screenshot

*** Variables ***
${url}    https://www.jimms.fi/
${search_input}   id=searchinput
${firstproduct}    xpath=//*[@id="productsearchpage"]/div[2]/div[5]/div/div[1]/product-box

*** Test Cases ***
Open Browser and maximize Window

    Open Browser    ${url}    Chrome
    Maximize Browser Window

*** Test Cases ***
Search "ps5" in the search bar and take screenshot of 1st product

    Click Element    ${search_input}
    Input Text    ${search_input}    ps5

    Press Keys    ${search_input}    ENTER

    Capture Element Screenshot    ${firstproduct}    first_product.png

*** Test Cases ***
Go to the product page and check that it contains 

    Click Element    ${firstproduct}

    Page Should Contain    ps5
    Page Should Contain    Sony PS5 DualSense Midnight Black, langaton peliohjain






