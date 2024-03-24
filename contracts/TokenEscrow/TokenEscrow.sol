// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Token.sol";

contract TokenEscrow {
    mapping(address => uint256) public balance;
    Token private _token;

    constructor(Token token_) {
        _token = token_;
    }

    event Funded(address indexed payee, uint256 value);
    event Withdrew(address indexed payee);

    function fund(address payee_, uint256 value_) external {
        _token.transferFrom(msg.sender, address(this), value_);
        balance[payee_] += value_;
        emit Funded(payee_, value_);
    }


    function withdraw() external {
        require(balance[msg.sender] > 0, "You don't have values to receive");
        uint256 value = balance[msg.sender];
        balance[msg.sender] = 0;
        
        _token.transfer(msg.sender, value);
        emit Withdrew(msg.sender);
    }
}