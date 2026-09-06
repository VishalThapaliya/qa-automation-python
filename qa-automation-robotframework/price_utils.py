from robot.libraries.BuiltIn import BuiltIn

def price_string_to_float(price_string: str) -> float:
    """Converts a price like '$29.99' into the number 29.99"""
    cleaned = price_string.replace("$", "").strip()
    return float(cleaned)

def sum_prices(price_string: list) -> float:
    """Takes a list of price strings like ['$29.99', '$9.99'] and returns their total"""
    total = 0.0
    for price in price_string:
        total += price_string_to_float(price)
    return round(total, 2)

def get_item_prices_on_cart_page() -> list:
    """Returns the text of every element matching the item price locator on the current page"""
    selenium_lib = BuiltIn().get_library_instance("SeleniumLibrary")
    elements = selenium_lib.driver.find_elements("css selector", ".inventory_item_price")
    return [element.text for element in elements]