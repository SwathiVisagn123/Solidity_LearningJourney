// Local variables declared inside a function unlike state variables
// Local variabls are stored on stack, so no gas fee, it's free
// By default, certain datatypes like string are referenced as state variables. 
// To use string variable as local variable, use memory keyword to allocate space on stack
//Memory keyword cannot be used at contract level

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract local{
    function setAge() public pure returns(int){
        
        int age = 100;
        return age;
    }
    function setName() public pure returns(string memory){
         string memory name = "swathika";
         return name;
    }
}