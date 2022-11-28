//Abstract contract has keyword "abstract" with atleast 1 incomplete function (virtual function) that is not implemented. 
//They define the structure of the contract.
//Contract that is derived from the abstract contract by inherting it will have the implementation
//of the incomplete function.
//If inherited contract donot implement the function, then its also named abstract. 
//Purpose is inherited contracts are restricted to have implememtation of functions in parent contract


// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

abstract contract addition{
   uint sum ;
//virtual function without implementation
  function addNumbers(uint256 _num1,uint256 _num2) public virtual returns(uint sum) ;
}

//child contract
contract add is addition{
    //function implementted with override keyword
    function addNumbers(uint256 _num1,uint256 _num2) public pure override returns(uint sum) {
        sum = _num1+_num2;
        return sum;
    }
}

