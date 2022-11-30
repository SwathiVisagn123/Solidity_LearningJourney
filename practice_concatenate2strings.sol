//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Strings {
   
    function concatenate(string memory str1, string memory str2) public pure returns (string memory)
    {
        //Get string 1 and string 2 into byte size dynamic arrays
        bytes memory str_bytes1 = bytes(str1);
        bytes memory str_bytes2 = bytes(str2);

        //Get total length of string 1 and string 2 
        string memory str = new string(str_bytes1.length + str_bytes2.length);

        //Declare a new array of length = total length of string 1 and string 2
        bytes memory str_bytes = bytes(str);

        
        //Iterate through string 1 and string 2 to get items into new array
        //NOTE index of dynamic arrays will expand until it reaches the declared length
        
        uint index = 0;
        for (uint i = 0; i < str_bytes1.length; i++) {
            str_bytes[index] = str_bytes1[i];
            index++;
        }

        for (uint i = 0; i < str_bytes2.length; i++) {
            str_bytes[index] = str_bytes2[i];
            index++;
        }

        return string(str_bytes);
    }
}

