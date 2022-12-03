// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//assert is similar to require but assert can be used anywhere in middle of the function rather than just the beginning like require
//require will save a lot of gas but assert consumes gas if it's going to revert the transaction at the end when condition not met

contract Assert{
    uint public balance = 100;
    function deposit(uint amount) public {
    balance+=amount;
    assert(balance<=500);
    }
}