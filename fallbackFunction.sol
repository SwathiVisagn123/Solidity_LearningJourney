//Fallback Function: When ever someone tries to send money to the contract address directly without the recieveEther function
//fallback function is a function within a smart contract that is called if no other function in the contract matches the specified function in the call. 
//This can happen if the call has a typo or if it specifies no function at all.


// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract WalletDemo2
{
address payable public owner;

//fallback function
fallback() external payable{
    payable(msg.sender).transfer(msg.value);
}

//fallback needs a receive function
receive() external payable{}

constructor(){
owner = payable(msg.sender);
}

//Make my wallet to receive ether from any account
function recieveEther() payable public {

}

//Make your wallet to transfer ether to any account
function tranferEther(address toAddress,uint amount) payable public {
    require(owner==msg.sender,"You are not authorized to access wallet");
    payable(toAddress).transfer(amount);
}

//check balance before and after transactions
function checkBalance() public view returns(uint){
    require(owner==msg.sender,"You are not authorized to access wallet");
    return address(this).balance;
}


}