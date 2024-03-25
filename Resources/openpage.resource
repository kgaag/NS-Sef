*** Settings ***
Library    Browser

*** Variables ***

${browser}     chromium    # chromium, webkit of firefox
${headless}    False
${channel}     chrome   

*** Keywords ***
Open URL
    [Documentation]
    [Arguments]    ${url}
    New Browser    ${browser}    headless=${headless}    channel=${channel}
    New Page    ${url}
    Set Viewport Size    1920    1080
    Accepteer cookies

Accepteer cookies
    [Documentation]
    ${cookie_popup}    Run Keyword And Return Status    Wait For Elements State    //h2[@class="cookie-notice__heading"]    visible    timeout=2s
    IF    ${cookie_popup} == ${TRUE}
        Click    //button[text()="Akkoord"]
    END

