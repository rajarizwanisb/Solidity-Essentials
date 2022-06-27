pragma solidity ^0.8.0;

interface  Q3TokenInterface
{
    function transfer(address to, uint amount) external returns(bool) ;//it will transfer money to teh address "to" 
    function mint(uint)external returns (bool);// we will add money in current account i.e. intital the amount...
    function balances()external returns(uint);// it will simply show the amount of current address...
}

contract Q3Token is Q3TokenInterface
{
      mapping(address=>uint) internal _balances;// we declared it as internal cuz only he himself and his child can call it
    function transfer(address to, uint amount) override external  returns(bool)// we mad e it external cuz
    {
        _balances[msg.sender]= _balances[msg.sender]-amount;
        _balances[to]=_balances[to] + amount;
    
        return true;// just to confirm if transaction is successfull
    }
    
    function mint(uint amount) override public  returns(bool)
    {
        _balances[msg.sender]= _balances[msg.sender] + amount; //
        return true;// just to confirm if transaction is successfull
    }
    function balances() override public view returns(uint)
    {
        return _balances[msg.sender];// will return only current address whatever it is......
    }
}

contract ShoolPayrol {
    
    Q3TokenInterface public tokens;//it shows address actually..
    
    
   function showValue()public view returns(Q3TokenInterface)
   {
       
       return tokens;// only return address....
   }
   function showValueOfconstructor() public returns(Q3TokenInterface)
   {
       tokens=new Q3Token();
       return tokens;// this will also return address with some newly generated address..
   }
   
}