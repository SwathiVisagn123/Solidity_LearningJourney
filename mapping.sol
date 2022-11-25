   //Mapping is used to assign values to keys, it's all about key value concept
   //Uses Hashing technique
   //Why Mapping and not arrays here? 
   //In order to have a student with roll number 50, we have to create/declare
   //an array of size 50 or more and have all the rest of the indexes as zero just for 1 student. Memory wastage.
   //Mapping will overcome that complexity and uses hashing method to assign values to key.
   
   
   
   // SPDX-License-Identifier: MIT
    pragma solidity >=0.5.0 <0.9.0;

    contract mappingDemo{
        mapping(uint=>string) public vegetables;//declaring
        function input(uint serial,string memory name) public {
            vegetables[serial]=name;
        }
    }