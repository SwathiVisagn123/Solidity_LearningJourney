//3 ways to initialise state variable: 1) inline where it's declared 2)constructor method 3) public function
    //access modifier public will allow us to view the variable once contract is deployed
    //state variables stored in blockchain/contract storage, so consumes gas
    //varibales initialised at compile time are considered

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract stateVariable{
    
    //method 1:
    uint public age;
  
    function setAge() public{
        age=150;
    }

    //method 2:
    //uint public age =100;

    //method 3:
    // constructor(){
    //     age = 150;
    // }

}