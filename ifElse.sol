//If else statements can be used only within a function and not at contract level

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract ifElse{
    function checkNumber(int num) public pure returns(string memory){
        string memory str;
        if(num%2==0){
            str="Even Number";
        }
        else if(num<0){
            str="Negative Number";
        }
        else str="Odd Number";
        return str;
    }
}