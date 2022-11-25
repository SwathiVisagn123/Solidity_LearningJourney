// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract demo{
    int number;
    constructor(){
        number = 5;
    }
    function set() public view returns(int){
        return number;
    }
    function increment() public{
        number = number+1;
    }
}