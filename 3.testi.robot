*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://www.jimms.fi/

*** Test Cases ***
Testaa Lisää Koriin Linkki
    [Documentation]    Tarkistaa löytyykö tuotesivulta "Lisää koriin" -linkki
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    # Siirry tuotesivulle
    Go To    https://www.jimms.fi/fi/Product/Show/199044/1000040194/sony-ps5-dualsense-midnight-black-langaton-peliohjain
    # Tarkista, että "Lisää koriin" -linkki on näkyvissä
    Element Should Be Visible    css=a[title="Lisää koriin"]
    Close Browser

