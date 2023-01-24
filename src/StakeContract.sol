// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error StakeContractError(string message);

contract StakeContract {
    mapping(address => uint256) public _balances;

    function stake(uint256 amount, address token) external returns (bool) {
        _balances[msg.sender] += amount;
        bool sucesss = IERC20(token).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        if (!sucesss) {
            revert StakeContractError("Stake failed");
        }
        return sucesss;
    }
}
