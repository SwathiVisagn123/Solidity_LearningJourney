//Different types of loops like for,while and do while used below
//Loops cannot be used at contract level
//array is also a reference type like string, so use memory keyword while initiating or returning through functions



//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract loops{
    uint[5] public array=[1,2,3,4,5];
    uint public sum;
    function forLoopReturn() public pure returns(uint8[5] memory){
        uint8[5] memory array1 =[1,2,3,4,5];
       for(uint count=0;count<array1.length;count++){
        array1[count]*=2;
        }
        return array1;
    }

function whileSum() public {
     sum=0;
    uint count=0;
    while(count<array.length){
       sum=sum+array[count];
        count++; 
    }
  
}

function doWhileSum() public {
     sum=0;
    uint count=0;
    do{
       sum=sum+array[count];
        count++;  
    }
    while(count<array.length);
    
}
}