//Enums are user defined data types used to assign names to integral values or constants
//Here allowed takes value 0 and not_allowed takes value 1.
//Enums improves readability, and can be used for small sets of values.
//Restricts the user to stick with small set of names/values.

//Here we can see how u1 takes value 0 and then changes to 1 after calling change()
//We can also see how lottery value changes based on the value of u1



// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract enumsDemo{
    enum user {allowed,not_allowed}
    user public u1 = user.allowed; 
    uint public lottery=10000;

    function check() public{
        if(u1==user.not_allowed){
            lottery=0;
        }  
    }

    function change() public{
        u1=user.not_allowed;
    }

}