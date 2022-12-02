// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//refer to https://docs.openzeppelin.com/contracts/2.x/api/token/erc20

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

    //founder to tokenOwner(as founder is only person who has total supply)
    function transfer(address to,uint tokens) public virtual override returns (bool success){

        require(balances[msg.sender]>=tokens,"Insufficient balance");
        balances[to]+=tokens; //balances[to]=balances[to]+tokens;
        balances[msg.sender]-=tokens; //balances[msg.sender]=balances[msg.sender]-tokens;
        emit Transfer(msg.sender,to,tokens);
        return true;
    }

    // tokenOwner approves certain tokens to spender over tokenOwner's tokens. tokenOwner is caller from this function.
    function approve(address spender,uint tokens) public override returns(bool success){
        require(tokens>0);
        require(balances[msg.sender]>=tokens,"Insufficient balance");
        allowed[msg.sender][spender]=tokens;
        emit Approval(msg.sender,spender,tokens);
        return true; 
    }

    //returns token allowance from nested mapping
    function allowance(address tokenOwner,address spender) public view override returns(uint noOftokens){
        return allowed[tokenOwner][spender];
    }

    //transfer tokens from tokenOwner to spender and the tokens must be <=approved tokens
    function transferFrom(address from,address to,uint tokens) public virtual override returns(bool success){
        require(allowed[from][to]>=tokens); //checks allowance is >=tokens
        require(balances[from]>=tokens,"Insufficient Balance");
        balances[to]+=tokens; 
        balances[from]-=tokens; 
        return true;
    }

}

contract ICO is Block {
    //declare state varibles:
    //addresses
    address public manager;
    address payable public deposit;
    //ICO
    uint icoStart = block.timestamp; 
    uint icoEnd = block.timestamp + 3600; //3 hours
    //token
    uint public tokenPrice = 0.1 ether;
    uint public tokenTradeTime = icoEnd+3600; //3 hours after ICO end
    //investment
    uint public minLimit = 0.1 ether;
    uint public maxLimit = 10 ether;
    uint public cap = 300 ether;
    uint public raisedAmount;
    //ICO state
    enum State {beforeStart,running,afterEnd,halted}
    State public ICOstate;

     constructor(address _deposit){
        deposit=payable(_deposit);
        manager=msg.sender;
        ICOstate = State.beforeStart;
    }

   //Only manager can call certain functions
    modifier onlyManager{
        require(msg.sender==manager);
        _;
    }

    function halt() public onlyManager{
        ICOstate=State.halted;
    }

    function resume() public onlyManager{
        ICOstate=State.running;
    }

    function changeDepositAddress(address payable newDeposit) onlyManager public {
        deposit=newDeposit;
    }

   //returns state of ICO
    function getState() public view returns(State){
    if( ICOstate == State.halted){
        return State.halted;
    }else if(block.timestamp>=icoStart && block.timestamp<=icoEnd){
        return State.running;
    }else if(block.timestamp<=icoStart){
        return State.beforeStart;
    }
    else return State.afterEnd;
    }

   //invest in ICO
   function invest() public payable returns (bool success){
    //ICO should be running
    ICOstate=getState();
    require(ICOstate==State.running);
    //invest amount must be >=minLimit and <=maxLimit
    require(msg.value>=minLimit && msg.value<=maxLimit);
    //after investment, the raised amount must be <=cap value
    raisedAmount+=msg.value;
    require(raisedAmount<=cap);
    //if all above 3 conditions passed; proceed to offering tokens
    //calculate tokens
    uint tokens = msg.value/tokenPrice;
    //offer tokens to msg.sender and deduct from founder
    balances[msg.sender]+=tokens;
    balances[founder]-=tokens;
    //transfer the amount paid to the deposit address
    deposit.transfer(msg.value);
    return true;
    }

    //Once ICO is completed, manager can burn the remaining tokens to increase the demand
    function burn() public onlyManager returns (bool success){
    ICOstate=getState();
    require(ICOstate==State.afterEnd);
    balances[founder]=0;
    return true;
    }

    //transfer function from parent contract Block is overridden
    function transfer(address to,uint tokens) public override returns(bool success){
    //ICO must be completed to start trading tokens
    ICOstate=getState();
    require(ICOstate==State.afterEnd);
    require(block.timestamp>=tokenTradeTime);
    //super; transfer from parent contract is called to avoid infinite loops
    super.transfer(to,tokens);
    return true;
} 

 //transferFrom function from parent contract Block is overridden
function transferFrom(address from,address to,uint tokens) public override returns(bool success){
    //ICO must be completed to start trading tokens
    ICOstate=getState();
    require(ICOstate==State.afterEnd);
    require(block.timestamp>=tokenTradeTime);
      //super; transfer from parent contract is called to avoid infinite loops
    super.transferFrom(from,to,tokens);
    return true;
}

}