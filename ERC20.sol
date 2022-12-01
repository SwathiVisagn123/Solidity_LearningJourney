// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

interface ERC20Interface{
    //returns total number of tokens in existence
    function totalSupply() external view returns (uint);

    //returns amount of tokens owned by account
    function balanceOf(address tokenOwner) external view returns (uint balance);

    //moves amount of tokens from caller's account to the 'to' address (recipient)
    function transfer(address to, uint tokens) external returns (bool success);

    //returns amount of tokens spender is allowed to spend on behalf of owner; this is zero by default; changes when approve and transferFrom is called
    function allowance(address tokenOwner, address spender) external view returns (uint remaining) ;

    //sets the amount of tokens as the allowance of spender over caller's tokens;emits approval event
    function approve(address spender, uint tokens) external returns (bool success);

//transferFrom uses allowance mechanism, this will move tokens 'from' to 'to' and deducts token from allowance
    //moves the amount of tokens 'from' sender 'to' recipent and amount is deducted from the caller's allowance set for spender;Emits a transfer event
    function transferFrom(address from, address to, uint tokens) external returns (bool success);

    //events
    event Transfer(address indexed from,address indexed to,uint tokens); //will be emitted by transferFrom
    event Approval(address indexed tokenOwner,address indexed spender,uint tokens); //will be emitted by Approve
}

contract Block is ERC20Interface {

    //declaring state variables
    address public founder;
    string name = "Block";
    string symbol = "BLK";
    uint public override totalSupply;
    mapping(address=>uint) public balances;
    mapping(address=>mapping(address=>uint)) allowed; //nested mapping for approval: address 1 allows address A to spend n tokens
    string public decimal="0";

   //intialise 
    constructor(){
        totalSupply = 100000;
        founder = msg.sender;
        balances[founder]=totalSupply;
    }

    function balanceOf(address tokenOwner) public view override returns (uint tokens){

        return balances[tokenOwner];
    }

    function transfer(address to,uint tokens) public override returns (bool success){

        require(balances[msg.sender]>=tokens,"Insufficient balance");
        balances[to]+=tokens; //balances[to]=balances[to]+tokens;
        balances[msg.sender]-=tokens; //balances[msg.sender]=balances[msg.sender]-tokens;
        emit Transfer(msg.sender,to,tokens);
        return true;
    }

    function approve(address spender,uint tokens) public override returns(bool success){

        require(tokens>0);
        require(balances[msg.sender]>=tokens,"Insufficient balance");
        allowed[msg.sender][spender]=tokens;
        emit Approval(msg.sender,spender,tokens);
        return true;
        
    }

    function allowance(address tokenOwner,address spender) public view override returns(uint noOftokens){
        return allowed[tokenOwner][spender];
    }

    function transferFrom(address from,address to,uint tokens) public override returns(bool success){
        require(allowed[from][to]>=tokens); //checks allowance is >=tokens
        require(balances[from]>=tokens,"Insufficient Balance");
        balances[to]+=tokens; 
        balances[from]-=tokens; 
        return true;
    }

}