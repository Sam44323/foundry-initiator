// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Event.sol";

contract EventTest is Test {
    Event public eve;

    function setUp() public {
        eve = new Event();
    }
}
