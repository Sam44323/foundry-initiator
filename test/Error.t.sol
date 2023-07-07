// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    function testFail() public {
        err.throwError();
    }
}
