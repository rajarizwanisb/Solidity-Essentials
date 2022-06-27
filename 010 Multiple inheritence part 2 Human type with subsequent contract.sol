pragma solidity ^0.6.0;

contract Human{
    event logString(string);// first declare it and pass arguments
    function doSomething() public virtual
    {
        emit logString ("I am Human");
    }
}
contract Student is Human// now will inherit all public prperties nand methods of Human
{
     function doSomething() public override
     {
        emit logString ("I am Student");
     }
   
}
contract Monitor is Student{
    
}
contract Teacher is Human{
    
     function doSomething() public override
     {
        emit logString ("I am Teacher");
     }
}

contract MianContract
{
 
     function doSomething() public returns(string memory)
     {
         Human objStudent=new Student();//obj type is Human and constructor of Student is used 
         Human objTeacher=new Teacher();//obj type is Human and constructor of Teacher is used
         Human objMonitir=new Monitor();//obj type is Human and constructor of Monitor is used
         
         objStudent.doSomething();// it will call students doSomething()
         objTeacher.doSomething();// it will call Teacher doSomething()
         objMonitir.doSomething();// it will call students doSomething()
  
     }
    
}





