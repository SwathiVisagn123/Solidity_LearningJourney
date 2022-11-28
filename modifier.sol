//Modifier and require statements are closely related to each other
//Modifier will avoid the repetition of the require statements within al functions
//the _; within modifier will be replaced automatically by the body of the respective function using it.

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//require function to allow only the owner of the contract to execute a function

contract demoOwner{
    
    address  public owner;

    constructor(){
      owner= msg.sender;  
    }

    modifier checkOwner{
        require(owner==msg.sender,"You have to be the owner to access this data");
        _;
    }

//below functions use modifier checkOwner which avoids repetition of require statements

    function getGasLimit() public view checkOwner returns (uint){
        return block.gaslimit;
    }

    function getTimestamp() public view checkOwner returns (uint){
        return block.timestamp;
    }

}