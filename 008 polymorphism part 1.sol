pragma solidity ^0.6.0;

contract Human{
    
    uint age;
    event logString(string);// first declare it and pass arguments
  
    function setAge(uint _age) public virtual// we must tell compiler that this gonna reused in child
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
    function setAge(uint _age) public override// and child must be informed that this function is gonna override
    {
        age=_age;
    }
    
}

contract MianContract
{
   Student public objStudent;
     function doSomething() public returns(uint){
         objStudent=new Student();// here the contrcutor will be called as it's been deployed
         objStudent.setAge(32);
         return objStudent.getAge();
     }
    
}

// in this program we have useed the behaviour of polymorphism



