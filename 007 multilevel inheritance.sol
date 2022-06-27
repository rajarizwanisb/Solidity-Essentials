pragma solidity ^0.6.0;

contract Human{
    
    uint age;
    event logString(string);// first declare it and pass arguments
    constructor () public
    {
        age=5;
        emit logString("I am Human's constructor");
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
contract Student is Human// now will inherit all public prperties nand methods of Human
{
    
        constructor () public
    {
        emit logString("I am Students Constructor");// this event is accessbile from parents property
        
    }
}
contract Monitor is Student{
  constructor () public
  {
      emit logString("I am Monitors constructor");
  }
}
contract MianContract
{
    Monitor public objMonitor;
     function doSomething() public returns(uint){
         objMonitor=new Monitor();// here the contrcutor will be called as it's been deployed
         return objMonitor.getAge();
     }
    
}

// in this program constructor of both child and parents are called in a stacked manner means
// parent's constructor is called first then child's contructor is called



