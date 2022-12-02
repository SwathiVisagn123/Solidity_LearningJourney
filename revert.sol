// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//revert does same action what require does at it's backstage
//revert will change the state of variables to the state they were before the function was called
//In the demo below, revert when executed, will change serviceCharge to 0 from 50

contract Revert{
    uint public balance = 500;
    uint serviceCharge = 0;

    function deposit(uint amount) public returns (uint){
        serviceCharge = 50;
        balance+=amount;
        if(balance>=1000){
            return balance;
        } else revert("Balance threshold reached");
    }
}



