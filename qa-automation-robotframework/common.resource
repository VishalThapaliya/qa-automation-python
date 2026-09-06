*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${URL}                  https://www.saucedemo.com
${BROWSER}              chrome
${VALID_USERNAME}       standard_user
${VALID_PASSWORD}       secret_sauce
${HEADLESS}             False

*** Keywords ***
Open Saucedemo
    IF  '${HEADLESS}' == 'True'
        Open Browser        ${URL}      ${BROWSER}      options=add_argument("--headless=new")
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
    Click Element        css=[data-test="add-to-cart-sauce-labs-backpack"]
    Wait Until Element Is Visible       css=.shopping_cart_link
    Click Element        css=.shopping_cart_link
    Wait Until Location Contains        cart

Complete Checkout       
    [Arguments]         ${first_name}           ${last_name}        ${zip}
    Wait Until Element Is Visible        css=.checkout_button
    Click Element       css=.checkout_button
    Input Text          id=first-name           ${first_name}
    Input Text          id=last-name            ${last_name}
    Input Text          id=postal-code          ${zip}
    Click Button       id=continue
    Wait Until Element Is Visible        id=finish
    Click Button        id=finish