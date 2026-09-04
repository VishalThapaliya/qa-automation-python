*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${URL}                  https://www.saucedemo.com
${BROWSER}              chrome

*** Keywords ***
Open Saucedemo And Login
    Open Browser        ${URL}                  ${BROWSER}
    Input Text          id=user-name            standard_user
    Input Text          id=password             secret_sauce
    Click Button        id=login-button
    Wait Until Location Contains                inventory

Add Backpack To Cart And Go To Cart
    Click Element        css=[data-test="add-to-cart-sauce-labs-backpack"]
    Click Element        css=.shopping_cart_link
    Wait Until Location Contains                cart

Complete Checkout       
    [Arguments]         ${first_name}           ${last_name}        ${zip}
    Click Element       css=.checkout_button
    Input Text          id=first-name           ${first_name}
    Input Text          id=last-name            ${last_name}
    Input Text          id=postal-code          ${zip}
    Click Button       id=continue
    Click Button        id=finish