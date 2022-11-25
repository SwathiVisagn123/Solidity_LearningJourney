//Bytes Sized arrays have sizes in bytes and stored as hexadecimal numbers.
//Sizes can be from 1 to 32
//Fixed Bytes Arrays when not initialized, take value as 0x00 (for bytes1) based on the size of the array


//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract FixedSizeArray {

  bytes1 public array;//declare

  function insert(bytes1 item) public {
  array=item;//initialise
  }

  function check() public view returns(bytes1){
      return array;
  }
}