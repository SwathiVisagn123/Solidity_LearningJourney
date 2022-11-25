//Dynamic bytes array will accept elements and grows in size
//Declared as bytes and size not specified
//We can push into the array but not modify single items




//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract dynamicBytesArray {

  bytes public array;//declare 
  
  function insert(bytes1 item) public {
  array.push(item);//add an element
  }

  function checkIndex(uint index) public view returns(bytes1){
      if(index<array.length){return array[index];}
      else return 0;
      
  }
  }