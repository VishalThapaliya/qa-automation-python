test_results = ["login test: PASS", "sort test: FAIL", "checkout test: PASS"]

with open("results.txt", "w") as file:
    for result in test_results:
        file.write(result + "\n")

print("File written successfully")