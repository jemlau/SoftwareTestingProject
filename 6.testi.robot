*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}     https://www.jimms.fi/
@{SOCIAL_MEDIA_LINKS}     //a[contains(@title,'facebook')]    \
                          //a[contains(@title,'instagram')]   \
                          //a[contains(@title,'twitter')]     \
                          //a[contains(@title,'youtube')]     \
                          //a[contains(@title,'TicTok')]      \
                          //a[contains(@title,'LinkedIn')]
${SCREENSHOT_PATH}    some_{index}.png
*** Test Cases ***
Testaa Toimiiko Some Linkit
    [Documentation]    Tarkistaa toimivatko footerissa olevat some ikonit linkkinä
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Go To    ${URL}
    
    FOR    ${index}    IN RANGE    1    7
        ${link_xpath}=    Set Variable    ${SOCIAL_MEDIA_LINKS}[${index - 1}]
        ${screenshot_path}=    Set Variable    some_${index}.png
        
        # Scroll the specific social media icon into view
        Scroll Element Into View    ${link_xpath}
        
        # Wait until the element is visible and ensure it's also displayed
        Wait Until Element Is Visible    ${link_xpath}    timeout=30
        
        # Check if the element is actually displayed
        Run Keyword If    Element Should Be Visible    ${link_xpath}
        
        # Capture a screenshot of the element
        Capture Element Screenshot    ${link_xpath}    ${screenshot_path}
        
        # Ensure the screenshot file exists
        File Should Exist    ${screenshot_path}
    END

    Close Browser
