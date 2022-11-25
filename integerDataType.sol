//major types of data types used in solidity are int and uint.
//int8 to int256 : takes positive and negative numbers; formula: -2^(n-1)to 2^(n-1)
//uint8 to uint256: takes only unsigned/positive numbers;formula: 0 to 2^(n-1)
//when range not specified, default int and uint  taken as 256 

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract integer{
    int8 public a = 290; //too large to fit in int8
    int public b = 500; //default taken as int256
    uint public c= -200;//cannot fit signed integers;only positive
    uint public d= 450;//default taken as 256
}