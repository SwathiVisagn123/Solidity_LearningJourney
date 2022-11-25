//bool data type holds value as true or false
//When bool variable is not initialized, default value taken as false

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract boolean{
    function checkNumber(int num) public pure returns(bool){
        bool value = true;
        if(num>0){
            return value;
        }
        else return value=false;
    }
}