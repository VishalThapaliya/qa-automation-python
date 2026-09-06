# Saucedemo Test Suite — Robot Framework + Selenium

A keyword-driven E2E test suite for saucedemo.com, built with Robot Framework
and SeleniumLibrary, including a custom Python keyword library for numeric
verification (cart total calculation).

## Stack
- Robot Framework + SeleniumLibrary
- Custom Python keyword library (price parsing/summing)
- Tags for smoke/regression suite selection

## What's covered
- Login (valid and invalid credentials)
- Full checkout flow, built from reusable custom keywords
- Cart total verification — computes the expected total independently from
  real on-page data, using a custom Python keyword, rather than asserting
  against a hardcoded number

## Running locally
\`\`\`bash
pip install robotframework robotframework-seleniumlibrary
robot login_test.robot checkout_test.robot price_test.robot
\`\`\`

## Running only smoke tests
\`\`\`bash
robot --include smoke login_test.robot checkout_test.robot price_test.robot
\`\`\`

## Viewing results
Open `report.html` for a summary, or `log.html` for a detailed step-by-step log.