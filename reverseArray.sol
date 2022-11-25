//a simple program to reverse the items of array

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Day1 {
    uint[3] public array= [5,10,15];
    function reverseArray() public returns(uint[3] memory){
    uint i=1;
    for(uint count=0;count<array.length;count++){
    array[count]=array[array.length-i];
    i++;
    }
    return array;

}
}