//Only one Constrtuctor can be created per contract and it is executed only ONCE by compiler
//Constructors are used to 1.Initialize state varibles 2.Initialize owner of smart contract
//Constructors are optional to create, if you don't create a default constructor is created by compiler which do not affect smart contract



// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract construct{
    uint public a;
    constructor(uint b){
        a=100+b;
    }
}