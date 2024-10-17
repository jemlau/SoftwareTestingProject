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

    Sleep    3s

*** Test Cases ***
Search "ps5" in the search bar and take screenshot of 1st product

    Click Element    ${search_input}
    Input Text    ${search_input}    ps5

    Sleep    3s

    Press Keys    ${search_input}    ENTER

    Wait Until Element Is Visible    ${firstproduct}    timeout=10s
    Capture Element Screenshot    ${firstproduct}    first_product.png

    Sleep    2s

*** Test Cases ***
Go to the product page and check that it contains

    Click Element    xpath=//*[@id="productsearchpage"]/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img

    Page Should Contain    Sony PS5 DualSense Midnight Black, langaton peliohjain

    Sleep    2s




