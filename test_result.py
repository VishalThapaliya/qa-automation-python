class TestResult:
    # constuctor
    def __init__(self, test_name: str, status: str):
        self.test_name = test_name
        self.status = status

    # print_summary method
    def print_summary(self) -> None:
        print(f"[{self.status}] {self.test_name}")

    # is_pass method
    def is_pass(self) -> bool:
        return self.status == "PASS"

# results array
result1 = TestResult("Login test", "PASS")
result2 = TestResult("Checkout test", "PASS")
result3 = TestResult("Sort test", "FAIL")

results = [result1, result2, result3]

# result summary
for result in results:
    result.print_summary()

# pass_count
pass_count = 0

for result in results:
    if result.is_pass():
        pass_count += 1

print("================================================")
print(f"{pass_count} out of {len(results)} tests passed")
print("================================================")
