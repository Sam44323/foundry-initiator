// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "../src/Event.sol";
import "forge-std/Test.sol";

contract EventTest is Test {
    Event public eve;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        eve = new Event();
    }

    function testEmitEventTransfer() public {
        // function expectEmit(
        //     bool checkTopic1,
        //     bool checkTopic2,
        //     bool checkTopic3,
        //     bool checkData
        // ) external;
        // 1. Tell Foundry which data to check
        // Check index 1, index 2 and data

        vm.expectEmit(true, true, false, true);

        // 2. Emit the expected event
        emit Transfer(address(this), address(123), 456);

        // 3. Call the function that should emit the event
        eve.transfer(address(this), address(123), 456);

        // Check only index 1
        vm.expectEmit(true, false, false, false);
        emit Transfer(address(this), address(123), 456);

        // NOTE: index 2 and data (amount) doesn't match but the test will still pass
        eve.transfer(address(this), address(111), 222);
    }
}
