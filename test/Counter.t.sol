// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.inc();
    }

    function testInc() public {
        assertEq(counter.count(), 1);
    }

    function testDec() public {
        counter.dec();
        assertEq(counter.count(), 0);
    }

    function testFailDec() public {
        counter.dec();
        vm.expectRevert(stdError.arithmeticError);
    }
}
