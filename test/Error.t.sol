// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    function testFail() public view {
        err.throwError();
    }

    // use the name testRevert when testing revert
    function testRevert() public {
        vm.expectRevert();
        err.throwError();
    }

    // as here we are testing for the message instead of just expecting the revert, we don't need to start with testFail...
    function testRequireMessage() public {
        vm.expectRevert(bytes("not authorized"));
        err.throwError();
    }

    // function testFailExpectError() public {
    //     vm.expectRevert(Error.NotAuthorized.selector);
    //     err.throwCustomError();
    // }
}