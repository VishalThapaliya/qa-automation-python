*** Settings ***
Resource            common.resource
Library             price_utils.py

*** Test Cases ***
Cart Total Should Match Sum Of Item Prices
    [Tags]              smoke               checkout
    Open Saucedemo And Login
    Click Element       css=[data-test="add-to-cart-sauce-labs-backpack"]
    Click Element       css=[data-test="add-to-cart-sauce-labs-bike-light"]
    Click Element       css=.shopping_cart_link
    Wait Until Page Contains Element    css=.inventory_item_price

    @{item_prices}=     Get Item Prices On Cart Page
    Log     ${item_prices}
    ${expected_total}=  Sum Prices          ${item_prices}

    Log           Expected total based on individual item prices: ${expected_total}
    Should Be Equal As Numbers          ${expected_total}               39.98

    [Teardown]      Close Browser

Cart Total Should Match Sum Of Three Item Prices
    [Tags]              smoke           checkout
    Open Saucedemo And Login
    Click Element       css=[data-test="add-to-cart-sauce-labs-backpack"]
    Click Element       css=[data-test="add-to-cart-sauce-labs-bike-light"]
    Click Element       css=[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element       css=.shopping_cart_link
    Wait Until Page Contains Element        css=.inventory_item_price

    @{item_prices}=     Get Item Prices On Cart Page
    ${expected_total}=  Sum Prices          ${item_prices}

    Log         Expected total based on individual item prices: ${expected_total}
    Should Be Equal As Numbers          ${expected_total}       55.97

    [Teardown]      Close Browser