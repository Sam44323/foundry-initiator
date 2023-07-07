// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Wallet.sol";
import "forge-std/console.sol";

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSetOwner() public {
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
    }

    function testFailNotOwner() public {
        vm.prank(address(1)); // this changes the address of msg.sender
        wallet.setOwner(address(1));
    }

    function testFailSetOwnerRepeat() public {
        wallet.setOwner(address(1));

        vm.startPrank(address(1)); // Set all subsequent msg.sender to address(1)

        // all calls made from address(1)
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));

        // Reset all subsequent msg.sender to address(this)
        vm.stopPrank();

        console.log("owner: ", wallet.owner());

        // call made from address(this) - this will fail
        wallet.setOwner(address(1));

        console.log("owner", wallet.owner());
    }
}
