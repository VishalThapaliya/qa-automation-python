# Variables - no type keyword needed, no semicolons
name = "Bishal"
years_experience = 6
is_learning_python = True

print(name, years_experience, is_learning_python)

# f-strings - Pythons template literals
print(f"{name} has {years_experience} years of experience")

# Lists - like JS arrays
tools = ["Selenium", "Playwright", "Robot Framework"]
tools.append("Python")
print(tools)

# Dictionaries - Lik JS objects
user = { "name": "Bishal", "role": "QA Automation Engineer" }
print(user["name"], user["role"])

# Loops - no curly braces, indentation IS th block
for tool in tools:
    print(f"Learning: {tool}")


# Conitionals - same idea, identation-based again
if years_experience > 5:
    print("Senor-level experience")
else:
    print("Still building experience")

# Functions
def greet(name: str) -> str:
    return f"Hello, {name}!"

print(greet("Bishal"));

# Classes
class TestUser:
    def __init__(self, name: str, email: str):
        self.name = name
        self.email = email

    def display_info(self) -> str:
        return f"{self.name} < {self.email}"

user = TestUser("Bishal", "bishal@example.com")
print(user.display_info())