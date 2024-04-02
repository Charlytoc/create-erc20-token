// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CharlyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("CharlyToken", "CHT") {
        _mint(msg.sender, initialSupply);
    }
}