pragma solidity ^0.6.0;
// Modifiers are functions but differnt type of functions that will be applied as  filter on other functions 
// to be executed. In other words that if this modifier is implemnted on any other function then this modeifer will
//execute first then will allow the function to be executed later
// so this is basically a filter or condition on execution of any function.

contract DemoModifier
{

 address owner;

 mapping (address=>uint256) balances;// here we are goinng to map address
 constructor() public{
     owner=msg.sender;// remember ms.sender is that owner who is deploying this smart contract and always have address type data...
 }
 //here is the signature of modeifiers
 //now paste that condition here
modifier _onlyOwner
 {
          require(owner==msg.sender,"Only owner can see the balance");// now here we have added a simple condition without applying modifiers....
           _;
 }
 function addToken(uint256 tokens)public
 {
     balances[msg.sender]=balances[msg.sender]+tokens;
 }
 function showBalance(address participant)public _onlyOwner returns(uint256)// here we have implemented modifier....
 {
     return balances[participant];
 }
 function showOwner()public view returns(string memory,address)// we have added view keyword in order to see address near button rather than console...
 {
    // message="The owner is";
     return ("Owner is",owner);
 }
}

//in this program we will add tokens to address of an owner then will check if that tokens were added to owners address