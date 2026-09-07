*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${URL}                  https://www.saucedemo.com
${BROWSER}              chrome
${VALID_USERNAME}       standard_user
${VALID_PASSWORD}       secret_sauce
${HEADLESS}             False

*** Keywords ***
Click And Verify
    [Arguments]         ${click_locator}        ${verify_locator}
    Click Element       ${click_locator}
    Wait Until Element Is Visible       ${verify_locator}       timeout=3s

Click And Wait For Element
    [Arguments]         ${click_locator}        ${verify_locator}       ${timeout}=20s
    Wait Until Keyword Succeeds     ${timeout}      1s      Click And Verify        ${click_locator}        ${verify_locator}


Open Saucedemo
    IF  '${HEADLESS}' == 'True'
        Open Browser        ${URL}      ${BROWSER}      options=add_argument("--headless=new --disable-gpu")
    ELSE
        Open Browser        ${URL}      ${BROWSER}
    END

Open Saucedemo And Login
    Open Saucedemo
    Input Text          id=user-name            standard_user
    Input Text          id=password             secret_sauce
    Click Button        id=login-button
    Wait Until Location Contains                inventory

Add Backpack To Cart And Go To Cart
    Wait Until Element Is Visible       css=[data-test="add-to-cart-sauce-labs-backpack"]
    Click And Wait For Element        css=[data-test="add-to-cart-sauce-labs-backpack"]     css=.shopping_cart_link
    Click And Wait For Element        css=.shopping_cart_link       css=.checkout_button

Complete Checkout       
    [Arguments]         ${first_name}           ${last_name}        ${zip}
    Click And Wait For Element        css=.checkout_button          id=first-name
    Input Text          id=first-name           ${first_name}
    Input Text          id=last-name            ${last_name}
    Input Text          id=postal-code          ${zip}
    Click And Wait For Element       id=continue        id=finish
    Click Button        id=finish