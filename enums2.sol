    // SPDX-License-Identifier: MIT
    pragma solidity >=0.5.0 <0.9.0;

    contract enumsDemo2{

        enum House {SMALL,MEDIUM,LARGE}
        House choice;
   

    function setLarge() public {
        choice = House.LARGE;
    }

    function setMedium() public {
        choice=House.MEDIUM;
    }

//as enum is a userdefined data type, returns will take name of enum created
    function getChoice() public view returns (House) {
        return choice;
    }
    }
 