// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SignTest is Test {
    // signature-creation in foundry test
    // private key = 123
    // public key = vm.addr(private key)
    // message = "secret message"
    // message hash = keccak256(message)
    // vm.sign(private key, message hash)

    function testSignature() public {
        uint256 pKey = 1234;
        address pAddr = vm.addr(pKey);

        // messageHash
        bytes32 messageHash = keccak256("secret message");
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(pKey, messageHash);
        address signer = ecrecover(messageHash, v, r, s);
        assertEq(signer, pAddr);

        // Test invalid message
        bytes32 invalidHash = keccak256("Not signed by Alice");
        signer = ecrecover(invalidHash, v, r, s);

        assertTrue(signer != pAddr);
    }
}
