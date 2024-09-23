// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract victim {

    mapping(address => uint256) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Must send some ether");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance"); 
        balances[msg.sender] += amount; 
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}
