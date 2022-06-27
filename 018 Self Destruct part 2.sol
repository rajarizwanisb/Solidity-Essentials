pragma solidity ^0.6.0;
/*
SELF DESTRUCT:
whenever called your contract will be destroyed or closed forever..
If there is no recieve function in the contratct then self destruct will not workon that contract...
*/

contract SeflDestruction
{
    address public owner;
    event logString(string);
    constructor() public
    {
        owner=msg.sender;
    }
    function close() public returns(bool)// to destroy this contract.....
    {
        require(msg.sender==owner,"Access Denied! Only Owner of this contract can make destroy it");
        selfdestruct(payable(owner));// remeber whenever you want to destroy the crurrent contract you need to make it payable otherwise it will not work...
    }
   
   function checkBalance() external view returns(uint)
   {
       return owner.balance;
   }
   fallback() external payable
   
   {
      emit logString("OK");// dont use transfer statemnt here 
      }
   
   receive() external payable // we have to mention these 2 fallbacks otherwise it will not receive the ethers.....
   
   {
        emit logString("OK");// dont use transfer statemnt here
        // and remeber if we dont use these fallbacks we may lose ethers sent from sinkEther method in Caller contract...
   }
}


// but when we are using metamask then no need for this caller contract cuz that metmask will will working as a caller for the above contract...
contract Caller// we will be using it cuz we need a cller to call the above contract...
{
    // in this function we are calling a function of previosuly deployed contract whose function doesn't exist as we have mentioned 
    
    function sinkEther(address contract_address) payable external returns(bool success, bytes memory data) // we are making it payable cuz we will ne sending ethers from here..
    {
        bytes memory payLoad=abi.encodeWithSignature("KuchBhi()"); //if such function isn't available in the contract then
        // by default fallback (receive in this case) of that contract will be called to save your ethers...
        // if we dont write any fallback function in prevous contract then we will loose our ethers..
        (success,data)=contract_address.call{value:msg.value}(payLoad);// here we will be receiveing both value and data... 
        
    }
     function sendEther(address contract_address) payable external returns(string memory) // we are making it payable cuz we will ne sending ethers from here..
    {
        payable(contract_address).transfer(msg.value);
        return "Successfully Transfered";
        // remeber you have to declare function receive and fallback in previous contract in order to send ethers successfullly....
        // otherwise it will raise an error...
    }
}

// so now we will try to destroy it once then check by deploying it again if its still working... 
/*
All you hvae to do is to deploy the contracrt SeflDestruction then check deployer's balance and address i.e. owner actually...
Then deploy Caler contract
Then from Caller try to sink and send ethers

*/