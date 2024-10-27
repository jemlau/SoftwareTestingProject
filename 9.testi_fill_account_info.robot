## Code made by Hanna Honkonen

*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    Screenshot

*** Variables ***
${url}    https://www.jimms.fi/

*** Test Cases ***
Testing account creation
    [Documentation]    Hanna
    
    Open Browser    ${url}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    1s


    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div
    Sleep    1s
    
    Click Element    xpath=/html/body/main/div/div[1]/div/div/div/div[2]/input
    Sleep    1s

    Click Element    name:EmailAddress
    Input Text    name:EmailAddress    TestiMato@sposti.fi
    Sleep    1s

    Wait Until Element Is Visible    id:pf-Password    timeout=5
    Input Password    id:pf-Password    Testi1
    Sleep    1s

    Click Element    name:ConfirmPassword
    Input Password    name:ConfirmPassword    Testi1
    Sleep    1s

    Scroll Element Into View    name:FirstName
    Click Element    name:FirstName
    Input Text    name:FirstName    Testi
    Sleep    1s

    Click Element    name:LastName
    Input Text    name:LastName    Mato
    Sleep    1s

    Scroll Element Into View    name:Address
    Click Element    name:Address
    Input Text    name:Address    Omppula
    
    Sleep    1s

    Scroll Element Into View    name:PostalCode
    Click Element    name:PostalCode
    Input Text    name:PostalCode    11130
    Sleep    1s

    Click Element    name:City
    Input Text    name:City    Pääkaupunki
    Sleep    1s

    Scroll Element Into View    name:Phone
    Click Element    name:Phone
    Input Text    name:Phone    0987654321
    Sleep    1s

    Scroll Element Into View    name:GDPR
    Click Element    name:GDPR

    Take Screenshot    filledAccountInformation.png
    Sleep    2s
    
    Close Browser