//ECOMMERCE SMART CONTRACT ALGORITHM:

//1. Plan a struct for register products information and an array to keep the products records
//2. Seller registers the product using register()
//3. Buyer buys the product using buy()
//4. Buyer confirms delivery using confirmDelivery()
//5. Declare events and emit them to see details in logs
//------------------------------------------------------------
//PLAN FOR CUSTOM SELF DESTRUCT
//1. Declare and intialize manager address as msg.sender through constructor
//2. Declare and intialise isDestroyed bool variable as false
//3. Declare a modifier so none of the functions (inclusive of destruct function) can work if isDestroyed is true
//4. Write a custom destruct function which will a) work only for manager, b) transfer the contract balance to manager and c) set isDestroyed as true

//LIMITATIONS OF selfdestruct() FUNCTION
//1. When a contract is destroyed at the instance, while a buyer has made payment successfully to buy the product but not received parcel and not yet confirmed delivery ?
//2. When a contract is destroyed, and buyer not aware of this. Buy() payable function is called? => Eth is lost, as the contract is destroyed.


// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract ecommerce{

    bool isDestroyed=false;
    //declare manager address
    address payable manager;
    

    //initialize the manager address as the person who deploys this contract
    constructor(){
        manager=payable(msg.sender);
    }

    //declare a structure to register product details
    struct product{
        uint productId;
        string name;
        string description;
        uint price;
        address payable seller;
        address buyer;
        bool delivered;
    }

    //declare an array that can receive it's items as datatype 'product'. Each item of array is a structure datatype.
    product[] public productsArray;
    //initialise a counter for product id
    uint counter = 1;

    //declare events so we have details in log files of the transaction
    event registered(uint productId,address seller);
    event bought(uint productId,address buyer,uint price);
    event confirmed(uint productId,bool delivered);

    //modifier to stop accessing functions if contract is destructed
    modifier isNotdestroyed{
        require(isDestroyed==false);
        _;
    }

   //function to register the product : done by seller

   function register(string memory _name,string memory _description,uint _price) public isNotdestroyed  {
       //you can only register with price >0
       require(_price>0,"Please Enter Product Price Greater Than Zero");
      //object for the structure
       product memory addProduct;
      //add structure items
       addProduct.productId=counter;
       addProduct.name=_name;
       addProduct.description=_description;
       addProduct.price=_price * 10**18; //converting into wei
       addProduct.seller=payable(msg.sender);//Account from which register function is called will be seller.
       //push it into the array
       productsArray.push(addProduct);
       //increment counter so productId is unique
       counter++;

       //emit
       emit registered(addProduct.productId,addProduct.seller);
   }

   //function to buy the product : done by buyer. Choose a value to send and pass product id as function paraameter

   function buy(uint _productId) public payable isNotdestroyed {
    //you cannot allow seller to buy the product
    require(productsArray[_productId-1].seller!=msg.sender,"Seller cannot buy the item he registered");
    //product price must be equal to msg.value
    require(productsArray[_productId-1].price==msg.value,"Buyer must pay the exact product price");
    //assign buyer as msg.sender
    productsArray[_productId-1].buyer=msg.sender;

    //emit
    emit bought(_productId,msg.sender,msg.value);

   }

   //function to confirm the delivery of the product : done by buyer

   function confirmDelivery(uint _productId) public isNotdestroyed {
       //only product buyer has to confirm delivery
       require(productsArray[_productId-1].buyer==msg.sender,"Only buyer can confirm the delivery");
       //make delivered as true
       productsArray[_productId-1].delivered=true;
       //transfer the money to seller
       productsArray[_productId-1].seller.transfer(productsArray[_productId-1].price);

       //emit
       emit confirmed(_productId,productsArray[_productId-1].delivered);
   }

   //Lastly the self destruct function to recover the contract balance if hacked !

   function destruct() public isNotdestroyed {
        require(manager==msg.sender,"Only Manager can call the self destruct function");
        //transfer contract balance to manager and set isdesyroyed as true
        manager.transfer(address(this).balance);
        isDestroyed=true;
   }
   //JUST FOR DEMONSTRATION: not recommended bewcause of it's limitations discussed above.
//    function destruct() public {
//        require(manager==msg.sender,"Only Manager can call the self destruct function");
//        selfdestruct(manager);//automaticaaly transfers contract balance to manager.
//    }


}




