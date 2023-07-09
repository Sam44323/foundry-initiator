// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Wallet.sol";

contract WalletTest is Test {
    Wallet public wallet;

    // NOTES
    // deal(address, uint) - Set balance of address
    // hoax(address, uint) - deal + prank, Sets up a prank and set balance

    function setUp() public {
        wallet = new Wallet();
    }

    function _send(uint amount) private {
        (bool ok, ) = address(wallet).call{value: amount}("");
        require(ok, "send failed");
    }
}
