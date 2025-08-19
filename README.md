# Invariant tests
Learn how to write invariant tests in Echidna

## Technology Stack & Dependencies

- Solidity (Writing Smart Contract)
- [Echidna](https://github.com/crytic/echidna) To create hardhat project and install dependencies using npm
- [Solc Compiler](https://docs.soliditylang.org/en/latest/installing-solidity.html) Online IDE for developing smart contracts

### 1. Clone/Download the Repository

### 2. Check if solc compiler is installed:
```
solc --version
```

### 3. Install and use specific Solidity version
```
solc-select install  0.8.1
```
```
solc-select use 0.7.0
```

### 4. Run the invariant tests
```
echidna-test template.sol --contract TestToken.sol
```
