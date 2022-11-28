//Polymorphism in Solidity allows us to declare functions with same name but different types/number of arguments so we can process data in more than one form.


// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract poly{
    //same function names used
    function sum(int a,int b) public pure returns (int){
        return a+b;
    }

    function sum(int a,int b,int c) public pure returns (int){
        return a+b+c;
    }

    function sum(string memory a) public pure returns(string memory){
        return a;
    }
}