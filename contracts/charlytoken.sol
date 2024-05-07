// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CharlyToken is ERC20 {
    address public marketingWallet;

    constructor(uint256 initialSupply, address _marketingWallet, address initialHolder) ERC20("CharlyToken", "CHT") {
        marketingWallet = _marketingWallet;
        _mint(initialHolder, initialSupply * 90 / 100); // 90% to initial holder
        _mint(marketingWallet, initialSupply * 10 / 100); // 10% to marketing wallet
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        uint256 fee = amount * 1 / 100; // 1% fee
        uint256 amountAfterFee = amount - fee;
        super._transfer(_msgSender(), marketingWallet, fee);
        super._transfer(_msgSender(), recipient, amountAfterFee);
        return true;
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
