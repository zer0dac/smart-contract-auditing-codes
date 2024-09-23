pragma solidity ^0.8.13;

contract victim {
    address public owner;

    // Constructor to set the deployer's address as the owner
    constructor() payable {
        owner = msg.sender;
    }

    // Function to allow the owner to change the owner address
    function setOwner(address newOwner) public {
        require(newOwner != address(0), "New owner cannot be the zero address");
        owner = newOwner;
    }   
}