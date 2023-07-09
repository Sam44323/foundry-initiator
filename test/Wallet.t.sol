// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Wallet.sol";

contract WalletTest is Test {
    Wallet public wallet;

    // NOTES
    // deal(address, uint) - Set ETH balance of address
    // hoax(address, uint) - deal + prank, Sets up a prank and set balance

    function setUp() public {
        wallet = new Wallet();
    }

    function _send(uint256 amount) private {
        (bool ok, ) = address(wallet).call{value: amount}("");
        require(ok, "send failed");
    }

    function testEthBalance() public view {
        console.log("ETH-Balance", address(this).balance / 1e18);
    }

    function testSendEth() public {
        // testing the deal() - deal doesn't added new balance to the previous balance it overwrites it and set the new-balance

        deal(address(1), 100);
        assertEq(address(1).balance, 100);

        // testing the hoax()
    }
}
