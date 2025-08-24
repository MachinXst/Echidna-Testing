Echidna is an open-source software provided by Trail of Bits.
This uses the target contract you provide, and the function (defined with 'echidna' keyword)
within that contract in order to work. Just below is a link to the origin of Echidna
to learn more.

https://github.com/crytic/echidna

### Invariant tests
You need to define good invariants for these tests to work correctly.
Echidna attempts to run various combinations of inputs to throw the parameters of
what's being tested (true/false)

### Fuzz tests
The goal is to stress the program by generating random inputs that run hundreds
or thousands of times depending on the parameters you've set for a given test.
If the test fails, take note of the input.

## Technology Stack & Dependencies

- Solidity (Writing Smart Contract)
- [Echidna](https://github.com/crytic/echidna) To create hardhat project and install dependencies using npm
- [Solc Compiler](https://docs.soliditylang.org/en/latest/installing-solidity.html) Online IDE for developing smart contracts
- Docker install: `docker run -it --rm -v "$PWD":/code trailofbits/echidna echidna-test /code/template.sol --contract TestToken`

### 1. Clone/Download the Repository

run `npm install` in the file directory in your terminal `code/invariant-tests-master`

### 2. Check if solc compiler is installed:
```
solc --version
```

### 3. Install and use specific Solidity version
```
solc-select install  0.8.20
```
```
solc-select use 0.7.0
```
Note: If you try to run the tests below and get back an output that looks like
`echidna-test: Couldn't compile given file`
Double-check the compiler version you're using, it should be 0.7.0

### 4. Run the invariant tests

## Test 1 Overflow Behavior:

Ensure you're in `/invariant-tests-master/part1/exercise1` folder before running the following test
```
echidna-test template.sol --contract TestToken
```
Upon running the test, it should fail due to overflow in Solidity 0.7.0
For this to pass, update the Solidity compiler to version 0.8.20, and both the
contracts `template.sol` and `token.sol` to ^0.8.20 because in this version, Solidity
automatically checks the math operations for overflow and underflow

## Test 2 Access-Control bug:

Ensure you're in `/invariant-tests-master/part1/exercise2` folder, update the Solidity compiler
to 0.8.20 before running the following test
```
echidna-test template.sol --contract TestToken
```
Upon running the test, it should fail and show the sequence of functions that caused it to fail.
The issue with this contract is the visibility for the Owner function is `public` and therefore
the Owner can be set by anyone calling the function. Setting the visibility to external will also
cause the test to fail. That function's visibility (located in token.sol) is set to public, but
if we set it to internal or private, save, and run the test again, it passes.

Note: If you try to run the test in your terminal as `echidna-test template.sol --contract TestToken.sol`
The `.sol` at the end of the command will give an output like `Compiling template.sol... Done! (0.186640229s)
echidna-test: Given contract "TestToken.sol" not found in given file`  This isn't the output you should
be expecting. Echidna’s `--contract` flag takes the contract name inside the file, not the filename itself.

## Closing Notes

This repository represents my applied walkthrough with Echidna, focusing on Part 1 property-based testing.
While the contracts here are simple, the lessons are foundational to building an auditor’s mindset:

Security is not about testing “Happy paths,” but proving what must always hold true. Property-based testing
forces us to ask: what could go wrong if an attacker has unlimited attempts? Even small exercises sharpen
intuition for real-world auditing of DeFi, DAO, and NFT protocols. This project fits into my broader GitHub
portfolio, where I’m building and auditing smart contracts. Echidna adds another layer to that journey. Moving
from writing code, to testing it, to formally verifying its resilience under adversarial conditions.

## Next steps:

- Expanding into stateful properties and custom invariants

- Applying Echidna to my original projects

- Combining Echidna with other auditor tools (Slither, Foundry, etc.) to simulate a full audit workflow.

### The Takeaway: 

Property-based testing is more than just another test framework, it’s a core skill for
Solidity auditors, and this repo is one step in my path toward becoming a top-tier smart contract auditor.