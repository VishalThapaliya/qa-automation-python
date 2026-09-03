# an array of str
test_results = ["login test: PASS", "sort test: FAIL", "checkout test: PASS"]

# writing to a file
with open("results.txt", "w") as file:
    for result in test_results:
        file.write(result + "\n")

print("File written successfully")

# reading a file
with open("results.txt", "r") as file:
    lines = file.readlines()

for line in lines:
    print(line)