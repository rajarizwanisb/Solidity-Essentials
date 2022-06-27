pragma solidity ^0.6.0;

contract Human{
    
    uint age;
    event logString(string);// first declare it and pass arguments
    constructor () public
    {
        age=5;
        emit logString("Contrcutor of Human called called");
    }
    function setAge(uint _age) public
    {
        age=_age;
        
    }
 function getAge()public view returns(uint)
 {
     return age;
 }
}

contract MianContract
{
    Human public objhuman;
     function doSomething() public returns(uint){
         objhuman=new Human();// here the contrcutor will be called as it's been deployed
         return objhuman.getAge();
     }
    
}

// in this progrma we havent called any setfunction of human contract within main contract
// in order to check if contructor takes default valueof varibal age
// and yes its working by logging string i.e. "Contrcutor of Human called called"


