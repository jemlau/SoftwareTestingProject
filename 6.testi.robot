<<<<<<< HEAD
=======
*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Screenshot

*** Variables ***
${url}    https://www.jimms.fi/
${facebook_link}    xpath=//a[contains(@href, 'facebook.com')]
${instagram_link}   xpath=//a[contains(@href, 'instagram.com')]
${twitter_link}     xpath=//a[contains(@href, 'twitter.com')]
${youtube_link}     xpath=//a[contains(@href, 'youtube.com')]
${tiktok_link}      xpath=//a[contains(@href, 'tiktok.com')]
${linkedin_link}    xpath=//a[contains(@href, 'linkedin.com')]

*** Test Cases ***
Verify Social Media Links
    [Documentation]    Verifies if social media links in the footer open successfully.
    Open Browser    ${url}    Chrome
    Maximize Browser Window

    # Check each social media link
    Click Element    ${facebook_link}
    Switch Window    NEW
    Location Should Contain    facebook.com
    Close Window

    Switch Window    MAIN
    Click Element    ${instagram_link}
    Switch Window    NEW
    Location Should Contain    instagram.com
    Close Window

    Switch Window    MAIN
    Click Element    ${twitter_link}
    Switch Window    NEW
    Location Should Contain    x.com
    Close Window

    Switch Window    MAIN
    Click Element    ${youtube_link}
    Switch Window    NEW
    Location Should Contain    youtube.com
    Close Window

    Switch Window    MAIN
    Click Element    ${tiktok_link}
    Switch Window    NEW
    Location Should Contain    tiktok.com
    Close Window

    Switch Window    MAIN
    Click Element    ${linkedin_link}
    Switch Window    NEW
    Location Should Contain    linkedin.com
    Close Window

    Close Browser
>>>>>>> 9b33e48ce337d4fb23e11fe8a29c3c323cfe2224
