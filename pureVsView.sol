//View :1) Read from a state variable or local variable2) used when returning a state variable /local variable 
//No View or Pure: 1) Modify the value of state variable 3) when we modify, we dont read from state variable , so return will not work
//Pure : 1)Do not read or modify a state varible 2) Used when Local variable is declared, initiated and returned by a function

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract pureView{
uint a;//state variable
uint b;

//Only read from state variable : View
function read() public view returns(uint)
{
    return a;
}

//Modify the state variable : 1) Neither View nor Pure 2) value cannot be returned as we are not reading
function modify() public {
b=a+100;
}

//Donot read/modify state variable : pure
function local() public pure returns(string memory){
    string memory name = "swathika";
    return name;
}
}