pragma solidity ^0.6.0;
/*
REQUIRE:
It says if these conditions are satisfied then function will execute otherwise NO..
Benifit is that if transaction falied then GAS reuired for cnsumptions is revert back to deployer No loss of money

When To Use?
when we want to check values coming from outside means for paramter checking

How To Use?
Reuquires 2 arguments
Condition + message

ASSERT:
Same as above statement but with the differnce i.e. GAS is consumed for that specific transcation even if failed 

When To Use?
when we want to check values of current states/data being manipulated.. 
We usually use it truffle for unit testing...

How To Use?
Reuquires 1 arguments
Only Condition


In the above statements the Failed transacion is that if a state varibale encounters some unknown condition...

REVERT:
Just like exception handling
we usulayy use try catch instead
and GAS is reverted as well and saved

When To Use?
Whenever we want to end the execution of the function or we want to get out of the fucntion...

How To Use?
Only message after ifcondition...

In all above statements your state is rolled back to initial state

*/

contract Require
{
   
    function sendEther(address to, uint _age)payable public returns(string memory)
    {
        require(_age>30,"You must be 30+ to initaite transaction");// always consider or look for false statements.....
        payable(to).transfer(msg.value);
        return "Successfully Trasnferred!";
    }
    function showBalance() public view returns(uint)
    {
        return msg.sender.balance;
    }
    
}

contract Assert
{
    
    function sendEther(address to, uint _age)payable public returns (string memory)
    {
        require(_age>30,"You must be 30+ to initiate this transaction!");// manipulating values from outside
        assert(_age<50);// manipulating current values as in this case we have passed it from require statemnt... 
        // gas consumed but ethers saved... function haulted...
        payable(to).transfer(msg.value);
        return "Successfully Trasnferred!";
      
    }
    function showBalance() public view returns(uint)
    {
        return address(this).balance;
    }
}

contract Revert
{
    function sendEther(address to, uint _age)payable public returns (string memory)
    {
        require(_age>30,"You must be 30+ to initiate this transaction!");// manipulating values from outside
        if (_age>50)
        {
            revert("Age must be greater than 30 and less than 50");
        }
        payable(to).transfer(msg.value);
        return "Successfully Trasnferred!";
      
    }
    function showBalance() public view returns(uint)
    {
        return address(this).balance;
    }
}