pragma solidity ^0.6.0;
// address is always 20 bytes
// there are 2 types of address 
// simple adrress and address payable..
// remeber, whenever you want to send ether you must have to ake the function as payable.
// lets do an example a simple example that we will transfer ether from one address to another

contract TransferMoney
{
    address Ali; // we can also make them payable in this section then later we dont need to type cast int256
    address Umar;
    
    constructor (address _Ali) public // we need this cuz we have to conirm the deployer and owner
    {
        Ali=_Ali;
        Umar=msg.sender;// umar will send money to Ali...
    }
    
    function sendEther() payable public
    {
        payable(Ali).transfer(msg.value);//Ali will send money to desire address ....
    }
    
}

// An alternative way will be...

contract TransferMoney2
{
    address payable Ali;
    address payable Umar;

    constructor (address _Ali) public
    {
        Ali=payable(_Ali);
        Umar=payable(msg.sender);
    }
    function sendEthers()payable public
    {
        Ali.transfer(msg.value);
    }
}

// Without constructor you can send money like

contract TransferMoney3
{
    //address payable Ali;
   // address payable Umar;
    
    
    function senEther(address to) payable public
    {
        
        payable(to).transfer(msg.value);// whenever we click on this button ether will be transfered from current address to
        // desired address as in this case it is "to"
    }
    
}
