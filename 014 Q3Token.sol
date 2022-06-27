pragma solidity ^0.8.0;
interface  Q3TokenInterface
{
    function transfer(address from, address to, uint amount) external returns(bool) ;//it will transfer money to teh address "to" 
    function mint(uint amount)external returns (bool);// we will add money in current account i.e. intital the amount...
    function balances()external returns(uint);// it will simply show the amount of current address...
}

contract Q3Token is Q3TokenInterface
{
    mapping(address=>uint) internal _balances;// we declared it as internal cuz only he himself and his child can call it
    function transfer(address from, address to, uint amount) override external  returns(bool)// we mad e it external cuz
    {
        _balances[from]= _balances[from]-amount;
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

