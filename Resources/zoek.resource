*** Settings ***
Library    Browser
Library    Dialogs

*** Variables ***

*** Keywords ***
Plan reis
    [Documentation]
    [Arguments]    ${van}    ${naar}
    Fill Text    //input[@name="FROM"]    ${van}
    Click    //span[@class="autosuggestItem has-stop"][text()="${van}"]
    Fill Text    //input[@name="TO"]    ${naar}
    Click    //span[@class="autosuggestItem has-stop"][text()="${naar}"]
    Click    //span[text()="Plannen"]

Bestel treinkaartje
    Click    //span[text()=" Bestel treinkaartje "]
