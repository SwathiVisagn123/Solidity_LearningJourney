//how to use mapping to point to a structure
//Instead of giving just 1 value to the key, we can make key to point to multiples values that arepart of a structure
//creating objects for this structure is not needed as we point it to the key from the map.


   // SPDX-License-Identifier: MIT
    pragma solidity >=0.5.0 <0.9.0;

    contract mapStruct{
        struct details {
            string name;
            uint NHS_Number;
            bool Vaccinated;
        }

        mapping(uint=>details) public registration_number;

        function input(uint _registration_number,string memory name,uint NHS_Number,bool Vaccinated) public{
            registration_number[_registration_number]=details(name,NHS_Number,Vaccinated);
        }
    }