// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Create2.sol";

/**
 * @title Create2Deployer
 * @dev This contract allows anyone to deploy new contracts using CREATE2,
 * ensuring the same address across different chains for identical bytecode and salt.
 */
contract Create2Deployer {
    /**
     * @dev Emitted when a new contract is deployed
     * @param deployer The address that initiated the deployment
     * @param addr The address of the newly deployed contract
     * @param salt The salt used for deployment
     */
    event Deployed(address indexed deployer, address addr, bytes32 salt);

    /**
     * @dev Deploys a new contract using CREATE2
     * @param bytecode The bytecode of the contract to be deployed
     * @param seed A string used to generate the salt
     * @return addr The address of the newly deployed contract
     */
    function deploy(bytes memory bytecode, string memory seed) public returns (address addr) {
        // Generate a unique salt from the provided seed
        bytes32 salt = keccak256(abi.encodePacked(seed));

        // Deploy the new contract
        addr = Create2.deploy(0, salt, bytecode);

        // Emit an event with deployment details
        emit Deployed(msg.sender, addr, salt);

        // Return the address of the newly deployed contract
        return addr;
    }

    /**
     * @dev Computes the address where a contract will be deployed using CREATE2
     * @param bytecode The bytecode of the contract to be deployed
     * @param seed A string used to generate the salt
     * @return The address where the contract will be deployed
     */
    function computeAddress(bytes memory bytecode, string memory seed) public view returns (address) {
        // Generate a unique salt from the provided seed
        bytes32 salt = keccak256(abi.encodePacked(seed));

        // Compute and return the address
        return Create2.computeAddress(salt, keccak256(bytecode));
    }
}
