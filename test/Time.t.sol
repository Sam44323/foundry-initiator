// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Time.sol";

contract AuctionTest is Test {
    Auction public time;

    function setUp() public {
        time = new Auction();
    }
}
