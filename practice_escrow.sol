//Should deposit fund.
//Should not deposit if transfer exceed total escrow amount.
//Should not deposit if not sending from payer.
//Should not release if full amount not received.
//Should not release if not thirdParty.

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract escrowAccount{
    address public payer;
    address payable public payee;
    address public thirdParty;
    uint public amount;

    constructor(address payable _payee,uint full_amount)
    {
        payer=msg.sender;
        payee=_payee;
        amount=full_amount;
    }

    function deposit() public payable {
        require(payer==msg.sender,"Payer must be an authorized address");
        require(address(this).balance<amount,"Cannot Deposit Limt Exceeded");
    }

    function release() payable public{
        require(thirdParty==msg.sender,"Can be released only by authorised third party");
        require(address(this).balance==amount,"Release Amount Limit Not Reached Yet");
        payee.transfer(amount);
    }

    function checkBalance() view public returns(uint){
        return address(this).balance;
    }

}