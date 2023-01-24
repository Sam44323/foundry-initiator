// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import "../src/StakeContract.sol";

contract CounterTest is Test {
    StakeContract public stakeContract;

    function setUp() public {
        stakeContract = new StakeContract();
        stakeContract.setNumber(0);
    }

    function testIncrement() public {
        stakeContract.increment();
        assertEq(stakeContract.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        stakeContract.setNumber(x);
        assertEq(stakeContract.number(), x);
    }
}
