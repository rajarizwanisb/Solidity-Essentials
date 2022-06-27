pragma solidity ^0.6.0;
/*
In this example we will be waisting our money means we are sending money to none and ethers will be burnd......
*/

contract Transformation
{
    address public owner;
    uint public current_balance;
    event logString(string);
    constructor()public
    {
        owner=msg.sender;
        current_balance=owner.balance;
    }
    
    function sendEther() payable external returns(string memory) 
    {
        require(msg.sender==owner,"Access Denied! Only owner can make Transactions");
        payable(owner).transfer(msg.value);
        current_balance=owner.balance;
        return "Successfully sent!";
    } 
    fallback() external payable     {
         payable(owner).transfer(msg.value);
        
         emit logString("revert back");
    }
}

contract Caller
{
    function Calling(address contract_address) payable public returns (bool success, bytes memory data) 
    {
        bytes memory payLoad=abi.encodeWithSignature("sendEther()");// ethers wasted...
        (success,data)=contract_address.call{value:msg.value}(payLoad);
    }
}