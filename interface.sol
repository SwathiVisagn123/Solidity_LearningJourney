//Interface is more restricted form of abstract contracts. 
//They are an agreement or a contract between itself and other contracts that implements it.
//Interfaces cannot declare state varibles and constructors.
//Interfaces cannot implement functions and functions an only be declared as external.

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//Interface with no state varibales and constructors. function is declared external.
interface data{
function details() view  external returns(address sender,uint gasLimit,uint timestamp);
}

//Child contract inheriting interface; function from interface implemented with override keyword.
contract returnData is data {
   function details() public view override returns(address sender,uint gasLimit,uint timestamp){
       return(msg.sender,block.gaslimit,block.timestamp);
   }
}