# CREATE2 Same Address Deployer

Deploy contracts with the same address across multiple blockchains using CREATE2.

## 📖 Overview

The CREATE2 Same Address Deployer is a Solidity smart contract that allows developers to deploy contracts with identical addresses across different blockchain networks. This tool is particularly useful for cross-chain applications and projects that require consistent contract addresses across multiple networks.

## ⚠️ Important Notes

- Ensure you use the same bytecode and seed across different networks to get the same address.
- Once a contract is deployed to an address, subsequent deployments to the same address will fail.
- The address of the deployer contract itself is crucial. To achieve the same deployed contract address across different chains, this CREATE2 deployer contract must also have the same address on all chains.

The Create2Deployer has been deployed to these chains:

`0xB278cEa7C413600F14e7eD92600B7AA0B2A86Df5`

- Wanchain Testnet
- Wanchain Mainnet
- PLYR PHI
- PLYR TAU Testnet
- Avalanche
- Avalanche fuji Testnet

If you want more chains, please create issue to tell me.

## 🌟 Features

- Deploy contracts with predictable addresses
- Ensure the same contract address across different blockchains
- Open for use by any address (no owner restrictions)
- Compute contract addresses before deployment
- Built with OpenZeppelin for enhanced security

## 🛠 Installation

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/create2-same-address.git
   ```
2. Install dependencies:
   ```
   npm install
   ```

## 📊 Usage

### Deploying a Contract

```solidity
function deploy(bytes memory bytecode, string memory seed) public returns (address)
```

- `bytecode`: The bytecode of the contract to be deployed
- `seed`: A string used to generate the salt for CREATE2

### Computing a Contract Address

```solidity
function computeAddress(bytes memory bytecode, string memory seed) public view returns (address)
```

- `bytecode`: The bytecode of the contract to be deployed
- `seed`: The same string used in the deploy function

## 🔍 Example

```solidity
// Deploy a contract
bytes memory bytecode = type(YourContract).creationCode;
string memory seed = "uniqueSeed";
address deployedAddress = create2Deployer.deploy(bytecode, seed);

// Compute address before deployment
address computedAddress = create2Deployer.computeAddress(bytecode, seed);
```

## ⚠️ Important Notes

- Ensure you use the same bytecode and seed across different networks to get the same address.
- Once a contract is deployed to an address, subsequent deployments to the same address will fail.

## 🔒 Security

This contract uses OpenZeppelin's CREATE2 library, which has been audited and widely tested. However, always exercise caution when deploying contracts, especially those handling valuable assets.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check [issues page](https://github.com/yourusername/create2-same-address/issues).

## 📄 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

## 📞 Contact

If you have any questions or feedback, please open an issue in this repository.
