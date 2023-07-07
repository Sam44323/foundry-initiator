// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Event.sol";

contract EventTest is Test {
    Event public eve;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        eve = new Event();
    }

    function testEmitTransferEvent() public {
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

    function testEmitManyTransferEvent() public {
        address[] memory to = new address[](3);
        to[0] = address(111);
        to[1] = address(222);
        to[2] = address(333);

        uint256[] memory amounts = new uint[](3);
        amounts[0] = 1;
        amounts[1] = 2;
        amounts[2] = 3;

        for (uint256 i = 0; i < to.length; i++) {
            // 1. Tell Foundry which data to check
            vm.expectEmit(true, true, false, true);
            // 2. Emit the expected event
            emit Transfer(address(this), to[i], amounts[i]);
        }

        // 3. Call the function that should emit the event
        eve.transferMany(address(this), to, amounts);
    }
}
