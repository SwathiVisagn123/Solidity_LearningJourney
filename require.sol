//Require statements are exactly like if else statements ; they improve the reada


// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//require function to allow only the owner of the contract to execute a function

contract demo1{
    address owner = msg.sender;

//compile, deploy the contract 1)execute get without any issue, 2) change the account address and execute get: transaction
    function get() public view returns (uint){
        require(owner==msg.sender,"you are not the authorized owner");
        return block.gaslimit;
    }
}

//require function to check number is odd

contract demo2{

    function get(uint x) public pure returns (string memory){

        require(x/2==0,"Number is Odd");
        return "Number is Even";
    }
}

//maaping to store user balance; retrieving user balance using require
contract demo3 {
    mapping(address => uint256) balances;

    function updateBalance(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }

    function checkBalance(address _user) public view returns (uint256) {
        require(msg.sender == _user, "You are not the owner of the account");
        return balances[_user];
    }
}