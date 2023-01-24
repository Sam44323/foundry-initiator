// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import "../src/mock/ERC20.sol";
import "../src/StakeContract.sol";

contract CounterTest is Test {
    StakeContract public stakeContract;
    ERC20 public token;
    uint256 public constant AMOUNT = 10e18; // 10 tokens

    function setUp() public {
        stakeContract = new StakeContract();
        token = new TestToken("Test", "TST");
    }

    function testStake() public {
        token.approve(address(stakeContract), AMOUNT);
        bool success = stakeContract.stake(AMOUNT, address(token));
        assertTrue(success);
    }
}
