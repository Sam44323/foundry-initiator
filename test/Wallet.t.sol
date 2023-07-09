// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Wallet.sol";

contract WalletTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }
}
