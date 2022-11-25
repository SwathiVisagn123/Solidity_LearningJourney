//String data types by default take contract storage as state variable when declared at contract level
//Strings as State varibles declared at contract level, need memory keyword in function returns, as we are using inside a function
//If string(Reference type) has to be declared as local, we have to mention memory keyword to tell compiler; so it will be stored in memory(RAM)




// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract strings{
    string public name ="swathika";//state variable

    function stringState() public view returns(string memory){
        return name;
    }

    function stringLocal() public pure returns(string memory){
        string memory name1 = "ILoveSolidity";//local variable: so specify memory keyword
        return name1;
    }
}
