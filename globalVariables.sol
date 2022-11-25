 // SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//refer doc: https://docs.soliditylang.org/en/v0.8.17/units-and-global-variables.html
//to convert epoch timestamp: https://www.epochconverter.com/

contract globalVariables{
    function getInfo() public view returns(uint blockNumber,uint gasLimit,address owner,uint timestamp){
        return(block.number,block.gaslimit,msg.sender,block.timestamp);
    }
}