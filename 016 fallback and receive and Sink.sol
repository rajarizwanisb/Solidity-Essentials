pragma solidity ^0.6.0;
// in this program we will discuss about the usage of fallback functions
// basically this function assits us securing our ether
// in other words when there is contract develped in which there is no function of reciveing and you send ethers
// then unfortunatly you can not retrive that sent ethers 
// lets take an example in which we are sinking our ethers and there will be no way to retrive our ethers
// remeber this will be as value transaction not a data transaction example..

//this ontract havny any other function but receiving...
contract Sink
{
    event Received (address,uint);
    // this fucntionwill recieve ether as you used to send to a desired address but this time you not address but deployed this Sink address
    receive () external payable // remeber these types of functions are always external 
    {
        emit Received(msg.sender,msg.value);// but in this contract there is not anyother code avaialbel that you can
        // omit or retrive your recieved ether as there is no other function to transfer your recevied ethers to anyother address..
    }
}

// this contract will send ethers to desired address...
contract Sender
{
    function sendEthers(address sinker)public payable returns(bool success)
    {
        payable(sinker).transfer(msg.value);// from here you are simply sending ethers to desired address
    }
}

//Now here Fallback function helps us in such situations and works on data transactions..
// and we are making it to send ethers..
contract Fallback{
    string public theString;
    address owner;
    constructor(address _owner) public
    {
        owner=_owner;
    }
    fallback() payable external // remeber these types of functions are always external
    {
        payable(owner).transfer(msg.value);
    }
    
  }

contract Caller
{
    //string public name;
    function doSomething(address _address) public returns(bool success,bytes memory data, string memory nam)
    
    {
        bytes memory payLoad=abi.encodeWithSignature("blood()");// whatever we write the type of signature it will run fallback function....
        //means if none of the function is called or existed then fallback will be called automatically...
        //data transaction
        (success,data)=_address.call(payLoad);
        
    }
    function doSomething1(address _address) payable public returns(bool success,bytes memory data, string memory nam)
    
    {
        bytes memory payLoad=abi.encodeWithSignature("blood()");// whatever we write the type of signature it will run fallback function....
        //means if none of the function is called or existed then fallback will be called automatically...
        //value transaction
        (success,data)=_address.call{value:msg.value}(payLoad);
        
    }
}