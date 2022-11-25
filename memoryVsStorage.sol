// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract memoryVsStorage{

string[] public vehicles= ["car","bus","bike"];//state variable ;occupies storage

//the below function will not make any changes to vehicles array; a new array v1 created in memory and v1[0] is changed

function mem() public view {
    string[] memory v1=vehicles;//local variable, so stored in memory as new array v1
    v1[0]="ship";
}

//the below function will alter the vehicles array; array v1 will point to already created vehicles array,
// so any changes in v1 will also reflect in vehicles

function stor() public{
string[] storage v1=vehicles;//local variable, so stored in memory as new array v1
    v1[0]="ship";
}


}