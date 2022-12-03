// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//DESIGN PATTERNS : 3. WITHDRAWAL PATTERN
//Solidity recommends to have 2 separate functions when contract involves receiving and withdrawing ethers from it.

//NOT RECOMMENDED
// contract findRichest {

//     address payable public richest;
//     uint public max;

//     constructor() payable {
//         richest=payable(msg.sender);
//         max=msg.value;
//         richest.transfer(msg.value);
//     }

//     function invest() payable public {
//         require(msg.value>max,"Sorry you're not the richest");
//         richest=payable(msg.sender);
//         max=msg.value;
//         richest.transfer(msg.value);
//         //when invest function called by a contract rather than an individual account, the transfer to contract address will call a fallback function that transfer ethers back.
//     }

// }

//RECOMMENDED
contract findRichest {

    address payable public richest;
    uint public max;
    mapping (address=>uint) investors;


    constructor() payable {
        richest=payable(msg.sender);
        max=msg.value;
        richest.transfer(msg.value);
    }

    //Always have separate functions to receive and transfer ethers
    function invest() payable public {
        require(msg.value>max,"Sorry you're not the richest");
        richest=payable(msg.sender);
        max=msg.value;
        investors[msg.sender]=msg.value;
    }

    function withdraw() public {
        //the below 2 lines are good practices to avoid reverse attack
        uint amount = investors[msg.sender];
        investors[msg.sender]=0;
        payable(msg.sender).transfer(amount); //this will invoke fallback at demo contract
    }

}