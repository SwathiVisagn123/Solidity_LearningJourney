// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//DESIGN PATTERNS : 1. FACTORY PATTERN 
//Keeping track of the object instances created while a contract is called.
//we have 2 contracts below, where contract Company has a function to create instances of Employee contract so we can access the functions from it.
//Solidity recommends to use a dynamic array to store all the instances so we can keep track of all the objects created.
//-----------------------------------
//NOT RECOMMENDED: We have no track of the objects created to access functions from Employee contract
// contract Company{

// function createInstance(){
//     Employee employee = new Employee();
// }

// }

// contract Employee{

// }
//--------------------------------------
//RECOMMENDED : Whenever we create new instances of the contract, we keep track of the objects created.
contract Company{

    Employee[] public employee;
    function createInstance ()  public
    {
    employee.push(new Employee());
    }
}

contract Employee{

}