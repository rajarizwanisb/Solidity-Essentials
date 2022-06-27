pragma solidity ^0.6.0;
//The main differnce between calls and delicate calls is that simpe calls uses the storage and context of libraries
//while deligate calls dont use the libraries' or others contract's context i.e. storage but current contract's..

contract SchoolPayroll
{
    
    address public owner; // the address of owner..........
    address public token; //this will be the address where the token has been deployed.....
   // remeber we have to deploy it first in order to generate the address of token and we will be using Q3Token to deployed that we have
   // written previously....
   constructor(address Q3Token) public
   {
       owner=msg.sender;
       token=Q3Token;
   }
    function payFees( uint amount) external returns(bool success)  
    {
        
        //Now we will use address of token and have to transfer the amount from 'from' to 'to'.
        bytes memory payLoad = abi.encodeWithSignature("transfer(address,address,uint)",msg.sender,owner,amount);// in this we have 
        //to initialize the method and its parameter..
        //this will be sent to ABI file and ABI will encode it with hash having payLoad attached...
        //So basically it will be the signature for a method
//signature is (bool, bytes memmory)= addrress.call(that signature)
    (success,)=token.call(payLoad);// it will return boolena that either trnasction success or not and the other returning parameter
    //wil; be data and if you leave it empty then no data is returened...
    //now this is address' method and that method is delgate call and we have dicussed aready about
        //this tupe of call...
        // One more thing need to be noted here is that if you dont return any value then warning will be generated
        // SO you need to return boolean
        
    }
  
}

