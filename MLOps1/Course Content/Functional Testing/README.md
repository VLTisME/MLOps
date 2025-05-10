# Functional Testing  

Functional testing is a type of software testing where the system is validated against functional requirements/specifications. It tests the application by providing inputs and examining the outputs in alignment with what the software is expected to do.  

---  

>>> # Test-driven Development (TDD)  

**Test-driven Development (TDD)** is a development process that emphasizes writing automated tests before writing the actual code. TDD helps ensure that the software delivers the intended features and minimizes bugs early in the development cycle.  

**3 Steps in TDD:**  

1. **Write a test for the next feature:**  
   - Define a test function that specifies the expected behavior of a new feature.  
   - Share the test with reviewers to check for completeness: "Is this enough? Does it account for all edge cases and requirements?"  
   - Revise the test until all reviewers agree that it thoroughly covers the intended behavior.  

2. **Write the minimal code to make the test pass:**  
   - Develop the feature, focusing only on satisfying the test conditions.  
   - Iterate on the code until all written tests succeed.  

3. **Refactor the code:**  
   - Improve the code's structure and readability while ensuring all tests still pass.  
   - Optimize performance, naming, and organization without altering the external behavior.  

**Alternative approach:**  
- **Behavior Driven Development (BDD):**  
  - Similar to TDD but focuses on defining behaviors and business outcomes (often in natural language).  
  - Scenarios are written using a format such as Gherkin, making tests more understandable for non-developer stakeholders.  

---  

>>> # Types of Testing: Manual & Automated  

**Manual Testing:**  
- **Scope:** Suitable for exploratory and ad-hoc testing.  
- **Effort & Time:** Labor-intensive, usually slower.  
- **Accuracy:** Prone to human error; depends on tester’s skill and attention.  
- **Cost:** High for repetitive or extensive test cases; low for one-time or exploratory tasks.  

**Automated Testing:**  
- **Scope:** Ideal for regression, load, and repetitive testing.  
- **Effort & Time:** Higher initial setup, but fast execution and reusable test scripts.  
- **Accuracy:** High consistency and reproducibility; eliminates manual errors.  
- **Cost:** More cost-effective for large projects in the long run.  

**Popular Tools:**  
- **Selenium:** Web automation (UI-testing)  
- **Pytest:** Python testing framework  
- **JUnit / TestNG:** Java ecosystems   
- **Cypress, Playwright:** Modern web app testing  
- **Robot Framework, Cucumber:** BDD-focused  

---  

>>> # Software Testing Methods  

### Black-box Testing  
- Tests functionality without internal knowledge of the system’s workings.  
- Testers provide inputs and observe outputs, focusing on "what" the software does.  

### Grey-box Testing  
- Combines black-box and white-box methods.  
- Tester has limited knowledge of the internal structure, allowing for more informed testing of interfaces and integrations.  

### White-box Testing  
- Tester examines source code, logic, and structure.  
- Used to uncover hidden bugs, optimize code paths, and check for logical errors.  
- Requires in-depth knowledge of the application’s internals.  

---  

>>> # Software Testing Levels  

### Functional vs Non-functional Testing  

#### **Functional Testing**  
- Validates if the application performs its required functions as expected.  

**Four steps in functional testing:**  
1. Identify application functionalities to be tested.  
2. Prepare appropriate test data and define the expected results.  
3. Write test scenarios and execute test cases.  
4. Compare actual results with expected results and report discrepancies.  

**Types of functional tests:**  
- **Unit Testing:**  
  Focuses on the smallest testable parts of the code (functions, methods, classes).  
  Example tools: Pytest, unittest.  

- **Integration Testing:**  
  Verifies interactions between components or systems.  
  May use tools like Testcontainers for simulating dependencies (e.g., fake databases, services).  

- **System Testing:**  
  Tests the complete integrated application to assess overall compliance with requirements.  

- **Acceptance Testing:**  
  Validates if the system meets business requirements and is ready for delivery.  
  - **User Acceptance Testing (UAT):** End-users test the application in real-world scenarios.  
  - **Alpha Testing:** Internal staff testing before public release.  
  - **Beta Testing:** Release to a limited external user group before full rollout.  

---  

#### **Non-functional Testing**  

Evaluates the quality attributes of a software system—essential for assessing user experience, reliability, and robustness.  

- **Performance Testing:**  
  - **Load Testing:** Evaluates system behavior under expected or peak user loads.  
  - **Stress Testing:** Assesses performance under extreme conditions to determine the system’s break point.  
  - **Scalability Testing:** Measures the ability to handle increasing workloads and expansion.  

- **Usability Testing:**  
  Determines how intuitive, user-friendly, and accessible the application is for end-users.  

- **Security Testing:**  
  Identifies vulnerabilities and verifies the effectiveness of security controls (e.g., authentication, authorization, data protection).  

- **Compatibility Testing:**  
  Ensures the software operates correctly across various devices, operating systems, browsers, or network environments.  

- **Reliability Testing:**  
  Assesses the software's ability to perform consistently over time without failures.  

**Other important test types:**  
- **Regression Testing:** Ensures new changes haven’t adversely affected existing functionality.  
- **Smoke Testing:** Preliminary testing to detect major issues before
