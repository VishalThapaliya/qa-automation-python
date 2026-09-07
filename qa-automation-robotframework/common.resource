*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${URL}                  https://www.saucedemo.com
${BROWSER}              chrome
${VALID_USERNAME}       standard_user
${VALID_PASSWORD}       secret_sauce
${HEADLESS}             False

*** Keywords ***
Click Element Via JS
    [Arguments]             ${css_selector}
    Execute Javascript      document.querySelector('${css_selector}').click();

Open Saucedemo
    IF  '${HEADLESS}' == 'True'
        Open Browser        ${URL}      ${BROWSER}      options=add_argument("--headless=new")
    ELSE
        Open Browser        ${URL}      ${BROWSER}
    END
    Set Selenium Timeout    10s

Open Saucedemo And Login
    Open Saucedemo
    Input Text          id=user-name            ${VALID_USERNAME}
    Input Text          id=password             ${VALID_PASSWORD}
    Click Button        id=login-button
    Wait Until Location Contains                inventory

Add Backpack To Cart And Go To Cart
    Wait Until Element Is Visible       css=[data-test="add-to-cart-sauce-labs-backpack"]
    Click Element                       css=[data-test="add-to-cart-sauce-labs-backpack"]
    Wait Until Element Is Visible       css=.shopping_cart_link
    Click Element                       css=.shopping_cart_link
    Wait Until Element Is Visible       css=.checkout_button

Complete Checkout       
    [Arguments]         ${first_name}           ${last_name}        ${zip}
    Click Element Via JS                        .checkout_button
    Wait Until Element Is Visible               id=first-name
    Input Text          id=first-name           ${first_name}
    Input Text          id=last-name            ${last_name}
    Input Text          id=postal-code          ${zip}
    Click Element Via JS                        \#continue
    Wait Until Element Is Visible               id=finish
    Click Element Via JS    \#finish