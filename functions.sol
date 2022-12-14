//when a state variable is declared as public, it will generate a getter function by default 
//functions can be used to get or set value, and we can pass 1 or more arguments to the functions
//when ever a setter function is called which change the value of the state variable, gas is consumed

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract functions{
    uint public height=100;

    //The below getter function is not needed, as height is declared public, it gets an autogenerated getter function

    // function getHeight() public view returns(uint){
    //  return height;
    // }

    function returnNewStateHeight(uint newHeight) public {
        height = newHeight+height;
    }

    function returnLocalHeight() public pure returns(uint){
        uint length = 200;
        return length;
    }

}