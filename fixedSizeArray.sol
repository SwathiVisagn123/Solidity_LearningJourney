//Size of Fixed Sized Arrays are known at compile time
//we can insert array elements only upto size of array
//Array index starts from zero
//When Array value not initialised, by default the element values are taken as zero

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract FixedSizeArrays{
uint [3] public arr1=[10,20,30];
uint [5] public arr2;

function insert(uint index,uint element) public {
    arr1[index]=element;
}

function viewArray2() public view returns(uint){
    return arr2.length;
}

}