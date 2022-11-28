//We can see about various visibility specifiers that decide the access levels of the functions 

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Parent{
    //accessed from within contract ,by derived contracts, Other contracts and outside world
    function f1() public pure returns(uint){
        return 1;
    }

//accessed by derived contracts, Other contracts and outside world
    function f2() external pure returns(uint){
        return 2;
    }
//accessed only from within the contract
    function f3() private pure returns(uint){
        return 3;
    }

 //accessed only from within the contract and derived contracts
    function f4() internal pure returns(uint){
        return 4;
    }   

}

//child contract inheriting parent : a derived contract
contract derived is Parent {

 //public function f1 can be accessed in derived  contracts  
int public x=f1();

//private function f2 cannot be accessed anywhere except within contract
int public y=f3();

//internal function f4 can be accessed within contract and in derived contracts
int public z= f4();

//as derived contract, f2 is already inherited from parent. we cannot call it within the contract here.
int public a=f2();
}

//Other contract not inheriting parent
contract other{

//public function f1 accessed everywhere
Parent parent = new Parent();
int x= parent.f1();

//external contract f2 can be accessed in other contracts
int y = parent.f2();

}