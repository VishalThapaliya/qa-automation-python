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
        Open Browser        ${URL}      ${BROWSER}      options=add_argument("--headless=new");add_argument("--disable-gpu")
    ELSE
        Open Browser        ${URL}      ${BROWSER}
    END
    Set Selenium Timeout    10s

Open Saucedemo And Login
    Open Saucedemo
    Wait Until Element Is Visible                   id=user-name
    Input Text              id=user-name            ${VALID_USERNAME}
    Input Text              id=password             ${VALID_PASSWORD}
    Click Element Via JS     \#login-button
    Wait Until Location Contains                    inventory

Add Backpack To Cart And Go To Cart
    Wait Until Element Is Visible       css=[data-test="add-to-cart-sauce-labs-backpack"]
    Click Element Via JS                [data-test="add-to-cart-sauce-labs-backpack"]
    Wait Until Element Is Visible       css=.shopping_cart_link
    Click Element Via JS                .shopping_cart_link
    Wait Until Element Is Visible       css=.checkout_button

Complete Checkout       
    [Arguments]         ${first_name}           ${last_name}        ${zip}
    Click Element Via JS                        .checkout_button
    Wait Until Element Is Visible               id=first-name
    Input Text          id=first-name           ${first_name}
    Input Text          id=last-name            ${last_name}
    Input Text          id=postal-code          ${zip}
    ${filled_first}=    Get Value               id=first-name
    ${filled_last}=     Get Value               id=last-name
    ${filled_zip}=      Get Value               id=postal-code
    Log     Right before Continue click - first: '${filled_first}' last: '${filled_last}' zip: '${filled_zip}'
    Click Element       id=continue
    Wait Until Element Is Visible               id=finish
    Click Element       id=finish