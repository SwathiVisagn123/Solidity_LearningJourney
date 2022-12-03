// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//DESIGN PATTERNS : 2. MAPPING ITERATOR
//whenever we create a mapping,it is good practice to create a dynamic array to store the keys
//So we have a track of who accessed the deposit function

contract Balance{

    mapping(address=>uint) public balances;
    address[] public track;

function deposit(uint value) public {
    balances[msg.sender]=value;
    track.push(msg.sender);
}

function returnTrack() public view returns(address[] memory ){
return track;
}
}