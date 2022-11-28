// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//Payable functions are required for a contract to receive ether from an account.
//Payable address have to declared for a contract to transfer ether to the declared account.

//WALLET CREATION

contract WalletDemo1 {
    address payable[] public accounts;
    address payable public owner;

//making account[0] as the owner of the contract
        constructor(address _owner) {
            owner = payable(_owner);
            accounts.push(payable(owner));
        }

     //a payable function to recieve ether from any account
        function deposit() public payable {
        }

//function to check only contract owner can send ether to the payable address
        function sendEther(address _to,uint _amount) public payable {
            require(owner==msg.sender,"sender is not allowed");
            payable(_to).transfer(_amount);
        }

//checks the balance of the contract before and after transactions
        function balanceOf() public view returns(uint) {
            return address(this).balance;
        }
}

//Store your current contract address as owner
//Make my wallet to receive ether from any account
//Make your wallet to transfer ether to any account
//Have a function to check balance

contract WalletDemo2{

//Store your current contract address as owner
address payable public owner;

constructor(){
owner = payable(msg.sender);
}

//Make my wallet to receive ether from any account
function recieveEther() public payable {

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