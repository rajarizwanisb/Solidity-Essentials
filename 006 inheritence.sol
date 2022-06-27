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
    
    event logStrings(string);
    constructor () public
    {
        emit logStrings("I am Students Constructor");
        
    }
}

contract MianContract
{
    Student public objStudent;
     function doSomething() public returns(uint){
         objStudent=new Student();// here the contrcutor will be called as it's been deployed
         return objStudent.getAge();
     }
    
}

// in this program constructor of both child and parents are called in a stacked manner means
// parent's constructor is called first then child's contructor is called



