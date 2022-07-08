import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  /*
    The attacker does not know the secret factor that is used to determine if the result of coin flip is 1 or 0.
    At the same time, if the result of uint256(blockhash(block.number - 1)) is equal to factor, then flip will be 1.
    
    The easiest strategy involves copying the factor from CoinFlip.sol into this contract.
    
    A read storage attack cannot be performed, because the unknown factor is declared as a constant (thus it does not use storage).
    A brute force strategy seems to be the only possible "honest" way to beat the game, but the attack could run out of gas.
  */

  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();
  }
};

export default helper;
