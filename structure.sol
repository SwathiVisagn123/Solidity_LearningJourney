// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

  struct student 
    {
        uint roll;
        string name;
    }
contract structureDemo
   {
     student public s1; //create a object to access student 

     constructor(uint _roll,string memory _name)
     {
        s1.roll=_roll;
        s1.name=_name;
     }

     function changeValues(uint _roll,string memory _name) public
     {
         //creating a second object inside function, have to use memory keyword like string & arrays
       student memory new_student = student({
           roll:_roll,
           name:_name
       });
       s1=new_student;
     }

   }