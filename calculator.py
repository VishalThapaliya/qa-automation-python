# Simple calculator: a function that takes two numbers and an operator ("+", "-", "*", "/") 
# and returns the result

def calculator(num1: float, num2: float, operator: str) -> float:
    if operator == "+":
        total = num1 + num2
        return total
    elif operator == "-":
        total = num1 - num2
        return total
    elif operator == "*":
        total = num1 * num2
        return total
    elif operator == "/":
        total = num1 / num2
        return total
    else:
        raise ValueError(f"Unsupported operator: {operator}")

add = calculator(10, 5, '+')
substract = calculator(10, 5, '-')
multiply = calculator(10, 5, '*')
division = calculator(10, 5, '/')


print("Addition: ", add)
print("Substraction: ", substract)
print("Multiplication: ", multiply)
print("Division: ", division)