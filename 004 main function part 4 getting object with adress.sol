pragma solidity ^0.6.0;

contract Human{
    
    string Name;
    function setName(string memory nm)public
    {
        Name=nm;
    }
    function getName()public returns(string memory)
    {
        return Name;
    }
}

contract MainContract{
    
    Human public objHuman;
    function setAddress(address adr)public{
        objHuman=Human(adr);
    }
    function doSomething() public returns(string memory nm)
    {
       
        return objHuman.getName();
    }
}

// In this program we will set the name from human contract then will get an adress as it was deployed on EVM
//the EVM generated object's address will be used in MainContract
//then we deploy maincontract after getting address the set the adress copied previosuly from deployed human contract
//the set that address u will see the address has been activated then set your name in that adress
