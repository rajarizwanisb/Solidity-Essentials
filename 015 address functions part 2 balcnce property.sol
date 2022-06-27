pragma solidity ^0.6.0;
// similarly in this address function we will see about balance 
// we can return current balance from this built in property

contract TransferEther
{
    address payable Ali;
    address payable Umar;
    
    function sendEther(address _Umar) payable public returns (uint256)
    {
        
        payable(_Umar).transfer(msg.value);
        Umar=payable(_Umar);// here you will assign the_umar to actual state varibal Umar..
    }
    function showBalance(address _address) public view returns(uint256)
    {
        return _address.balance;
    }
     function showCurrentBalance() public view returns(uint256)
    {
        return msg.sender.balance;
    }
    
    function umarBalcnce() public view returns(uint256)
    {
        return Umar.balance;
    }
    
}