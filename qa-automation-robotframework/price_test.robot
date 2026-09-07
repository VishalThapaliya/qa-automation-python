*** Settings ***
Resource            common.resource
Library             price_utils.py

*** Test Cases ***
Cart Total Should Match Sum Of Item Prices
    [Tags]              smoke               checkout
    Open Saucedemo And Login
    Wait Until Element Is Visible           css=[data-test="add-to-cart-sauce-labs-backpack"]
    Click And Wait For Element       css=[data-test="add-to-cart-sauce-labs-backpack"]          css=[data-test="add-to-cart-sauce-labs-bike-light"]
    Click And Wait For Element       css=[data-test="add-to-cart-sauce-labs-bike-light"]        css=.shopping_cart_link
    Click And Wait For Element       css=.shopping_cart_link        css=.inventory_item_price

    @{item_prices}=     Get Item Prices On Cart Page
    ${expected_total}=  Sum Prices          ${item_prices}

    Log           Expected total based on individual item prices: ${expected_total}
    Should Be Equal As Numbers          ${expected_total}               39.98

    [Teardown]      Close Browser

Cart Total Should Match Sum Of Three Item Prices
    [Tags]              smoke           checkout
    Open Saucedemo And Login
    Wait Until Element Is Visible           css=[data-test="add-to-cart-sauce-labs-backpack"]
    Click And Wait For Element              css=[data-test="add-to-cart-sauce-labs-backpack"]               css=[data-test="add-to-cart-sauce-labs-bike-light"]
    Click And Wait For Element              css=[data-test="add-to-cart-sauce-labs-bike-light"]             css=[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click And Wait For Element              css=[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]           css=.shopping_cart_link
    Click And Wait For Element              css=.shopping_cart_link        css=.inventory_item_price

    @{item_prices}=     Get Item Prices On Cart Page
    ${expected_total}=  Sum Prices          ${item_prices}

    Log         Expected total based on individual item prices: ${expected_total}
    Should Be Equal As Numbers          ${expected_total}       55.97

    [Teardown]      Close Browser