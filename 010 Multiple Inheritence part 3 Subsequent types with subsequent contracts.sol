pragma solidity ^0.6.0;

contract Human{
    event logString(string);// first declare it and pass arguments
    constructor () public{
        emit logString("I am Human's constructor");
    }
    function doSomething() public virtual
    {
        emit logString ("I am Human");
    }
}
contract Student is Human// now will inherit all public prperties nand methods of Human
{
    constructor () public{
        emit logString("I am Student's constructor");
    }
     function doSomething() public override
     {
        emit logString ("I am Student");
     }
   
}
contract Monitor is Student{
    constructor () public{
        emit logString("I am Monitor's constructor");
    }
    
}
contract Teacher is Human{
    constructor () public{
        emit logString("I am Teacher's constructor");
    }
     function doSomething() public override
     {
        emit logString ("I am Teacher");
     }
}

contract MianContract
{
 
     function doSomething() public returns(string memory)
     {
         Student objStudent=new Student();//it will call human's constructor and then students constructor
         Teacher objTeacher=new Teacher();//itwill call Human's constructor and then Teacher's constructor
         Monitor objMonitir=new Monitor();//obj type is Human and constructor of Monitor is used
         
         objStudent.doSomething();// it will call students doSomething()
         objTeacher.doSomething();// it will call Teacher doSomething()
         objMonitir.doSomething();// it will call students doSomething()
     }
}





