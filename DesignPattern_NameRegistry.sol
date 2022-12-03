// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

//DESIGN PATTERNS : 4. NAMING REGISTRY
//Solidity recommends to create a mapping to store the addresses of the contracts to easily access the functions

contract Company{

    struct details{
        string name;
        string description;
        address owner;
    }

    details public info;
    //mapping of a name(string) to a structure
    mapping(string=>details) registry;
    
    function createRegistry(string memory _name,string memory _desc,address _address) public {
       info.name=_name;
       info.description=_desc;
       info.owner=_address;
       registry[_name]=info;
    }

    //access the contract address from the registry based on the usecases
    function accessContracts(string memory _name) payable public{
        payable(registry[_name].owner).transfer(msg.value);
    }
  

}
 contract CEO{

 }

 contract HR {

 }

 contract ADMIN {

 }