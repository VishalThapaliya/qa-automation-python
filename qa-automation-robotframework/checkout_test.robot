*** Settings ***
Resource            common.resource

*** Test Cases ***
Complete A Checkout Successfully
    [Tags]      smoke       checkout
    Open Saucedemo And Login
    Add Backpack To Cart And Go To Cart
    Complete Checkout       Bishal      Thapaliya       38000
    Element Should Contain     css=.complete-header        Thank you for your order!
    [Teardown]   Close Browser