*** Settings ***
Library    Browser    run_on_failure=none    
Library    Dialogs

Resource    ../Resources/openpage.resource
Resource    ../Resources/zoek.resource

*** Variables ***
${home_url}    https://www.ns.nl/

*** Test Cases ***

01 - Open en plan reis
    ${van}     Set Variable    Rotterdam Centraal
    ${naar}    Set Variable    Amsterdam Centraal
    
    Open URL    ${home_url}
    Plan reis    ${van}    ${naar}
    Wait For Elements State    //div[@data-test="tripAdviceTravelOptions"]    visible    # wacht tot er opties zijn getoond

        ${description}    Get Text    //a[contains(@class,"rio-jp-travel-option-active")]/span[contains(@id,"trip-description")]    # Haalt omschrijving van de vooraf geselecteerde reis op
        Log    ${description}
        Take Screenshot

    Bestel treinkaartje
    Wait For Elements State    //h1[text()=" Koop kaartjes "]    visible

02 - vertek en bestemming zijn hetzelfde
    ${van}     Set Variable    Rotterdam Centraal
    ${naar}    Set Variable    Rotterdam Centraal
    
    Open URL    ${home_url}
    Plan reis    ${van}    ${naar}
    # Onder zowel het veld VAN als NAAR verschijnt de tekst: "Van en naar zijn hetzelfde"
    Wait For Elements State    (//input[@name="FROM"]/following::span[text()="Van en naar zijn hetzelfde"])[1]    visible
    Wait For Elements State    (//input[@name="TO"]/following::span[text()="Van en naar zijn hetzelfde"])[1]      visible
