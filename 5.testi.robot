*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Collections

*** Variables ***
${URL}    https://www.jimms.fi/
 
*** Test Cases ***

Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Sleep    2s


Testaa lisätä tuote ostoskoriin
    
    
    Click Element    xpath://a[@title='Lisää koriin']

