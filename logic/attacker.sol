// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./victim.sol";  

contract attacker {
        victim public targetContract;
        mapping(address => uint256) public balances;
        event a(address indexed user, uint256 amount);

    constructor(address _etherWalletAddress) {
        targetContract = victim(_etherWalletAddress);
    }

    function getETH() external payable{
        balances[msg.sender] += msg.value;
        emit a(msg.sender, msg.value);
}
// 10 ether = 10000000000000000000 wei
    function depositETH(uint256 amount) external{
        targetContract.deposit{value: amount}();
}

    function withdrawFromWallet(uint256 amount) external payable{
        targetContract.withdraw(amount);
    }
receive() external payable{
}  }
