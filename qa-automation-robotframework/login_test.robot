*** Settings ***
Resource                 common.resource

*** Test Cases ***
Login With Valid Credentials
    [Tags]  smoke       login
    Open Saucedemo And Login
    [Teardown]          Close Browser

Login With Invalid Credentials
    Open Browser        ${URL}                  ${BROWSER}
    Input Text          id=user-name            invalid_user
    Input Text          id=password             wrong_password
    Click Button        id=login-button
    Element Should Be Visible                   css=.error-message-container
    [Teardown]          Close Browser