//Ecommerce applications with Pay Button will trigger events to complete order process
//Decentralised apps will have Pay Button that communicates with Smart Contract that will have the business logic for the payment process
//Smart Contract will emit the event back with details. The events are then stored in log files which is low cost storage.





// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract eventsDemo{
    
    string message ;
    //an event is declared which will emit the sender address and a message parameter.
    event register(address sender,string message);

    //the event: register will be emitted when below function is called.
    //when the contract is deployed, the log will have no data, when we call the function check, log will emit sender and message data.
    function check(string memory str) public  {
        message=str;
        //emit keyword used to use the event
        emit register(msg.sender,message);
    }
}