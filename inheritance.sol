//Inheritance is the ability of a contract to inherit the attributes and methods of another contract.
//Why Inheritance ? : Re-usability of code, avoids repetition
//Child inherits from Parent but not vice versa
//When we deploy the child contract, we can see all attributes and functions of parent inherited

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//PARENT
contract Master{
    string public name;
    address public sender = msg.sender;

    function setName(string memory _name) public{
        name=_name;
    }
}

//CHILD inherits PARENT
contract Child is Master{
    function returnInfo() public view returns(address,string memory){
        return (sender,name);
    }
}