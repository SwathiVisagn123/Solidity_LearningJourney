//Dynamic array size not mentioned at compile time
//we can push,pop elements from array and check array length




// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract DynamicArray {
uint[] public array;//declaration

function insert(uint element) public {
array.push(element);//insert 
}

function pop() public{
array.pop();//delete last lement
}

function length() public view returns(uint){
return array.length;
}
}