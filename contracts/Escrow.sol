// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Escrow {
    mapping(address => uint256) public balance;
    address private _token;

    constructor() {}

    event Funded(address indexed payee, uint256 value);
    event Withdrew(address indexed payee);

    function fund(address payee) external payable {
        balance[payee] += msg.value;
        emit Funded(payee, msg.value);
    }

    function withdraw() external {
        require(balance[msg.sender] > 0, "You don't have values to receive");
        uint256 value = balance[msg.sender];
        balance[msg.sender] = 0;

        payable(msg.sender).transfer(value);
        emit Withdrew(msg.sender);
    }
}
