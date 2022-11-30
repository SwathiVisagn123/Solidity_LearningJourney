// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//calculates fibonacci number of the nth term
contract Fibonacci {
    function fibo(uint n) public pure returns (uint) {

        require(n>1,"n has to be > 1");
        uint x = 1;
        uint y = 1;
        for (uint256 i = 2; i < n; i++) {
            uint nextTerm = x+y;
            x = y;
            y = nextTerm;
        }
        return y;
    }
}

//returns fibonacci array until nth term

contract FibonacciArray {

    function fibo(uint n) public pure returns (uint[] memory) {

        require(n>1,"n has to be > 1");

        uint[] memory fibonacciSequence = new uint[](n+1);
        fibonacciSequence[0]=0;
        fibonacciSequence[1]=1;

        for (uint i = 2; i < fibonacciSequence.length; i++) {
           fibonacciSequence[i]=fibonacciSequence[i-1]+fibonacciSequence[i-2];
        }
        
        return fibonacciSequence;
    }
}