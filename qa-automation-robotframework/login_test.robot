*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${URL}                  https://www.saucedemo.com
${BROWSER}              chrome  

*** Test Cases ***
Login With Valid Credentials
    Open Browser        ${URL}                  ${BROWSER}
    Input Text          id=user-name          standard_user
    Input Text          id=password           secret_sauce
    Click Button        id=login-button
    Wait Until Location Contains                inventory
    [Teardown]          Close Browser

Login With Invalid Credentials
    Open Browser        ${URL}                  ${BROWSER}
    Input Text          id=user-name            invalid_user
    Input Text          id=password             wrong_password
    Click Button        id=login-button
    Element Should Be Visible                   css=.error-message-container
    [Teardown]          Close Browser