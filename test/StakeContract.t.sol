// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import "../src/mock/ERC20.sol";
import "../src/StakeContract.sol";

contract CounterTest is Test {
    StakeContract public stakeContract;
    ERC20 public token;

    function setUp() public {
        stakeContract = new StakeContract();
        token = new TestToken("Test", "TST");
    }

    function testStake(uint16 amount) public {
        token.approve(address(stakeContract), amount);
        bool success = stakeContract.stake(amount, address(token));
        assertTrue(success);
    }
}
