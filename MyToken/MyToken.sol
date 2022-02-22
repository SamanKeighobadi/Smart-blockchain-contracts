// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyToken {
    string public name;
    string public symbol;
    uint256 public priceToken;
    uint256 public totalSupply;
    uint8 public decimals;
    address public owner;
    mapping(address => uint256) public balances;

    event Transfer(address from, address to, uint256 amount);

    constructor(uint256 _supply) public {
        owner = msg.sender;
        totalSupply = _supply;
        balances[owner] = totalSupply;
        priceToken = 10**12;
        name = "SamToken";
        symbol = "SK";
        decimals = 18;
    }
}
