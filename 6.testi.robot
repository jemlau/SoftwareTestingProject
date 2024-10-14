*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}     https://www.jimms.fi/
@{SOCIAL_MEDIA_LINKS}     /html/body/footer/div[1]/div[1]/div[2]/div/div/a[1]    \
                          /html/body/footer/div[1]/div[1]/div[2]/div/div/a[2]    \
                          /html/body/footer/div[1]/div[1]/div[2]/div/div/a[3]    \
                          /html/body/footer/div[1]/div[1]/div[2]/div/div/a[4]    \
                          /html/body/footer/div[1]/div[1]/div[2]/div/div/a[5]    \
                          /html/body/footer/div[1]/div[1]/div[2]/div/div/a[6]
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
        Wait Until Element Is Visible    ${link_xpath}    timeout=10
        Capture Element Screenshot    ${link_xpath}    ${screenshot_path}
        File Should Exist    ${screenshot_path}
    END

    Close Browser
