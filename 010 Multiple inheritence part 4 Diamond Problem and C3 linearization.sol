// C3 Linearization
pragma solidity ^0.6.0;
////////////////////////////////////////////////////////////
contract Human{
    int age;
    event logString(string);
    
    constructor () public
    {
        age=5;
        emit logString("Human's constructor");
    }
    function setAge(int _age) public
    {
        age=_age;
    }
    function getAge()public view returns(int)
    {
        return age;
    }
    function doSomething() public virtual
    {
        emit logString ("....Human doSomething....");
    }
}
///////////////////////////TEACHER/////////////////////////////////
contract Teacher is Human
{
    function doSomething()public override virtual
    {
        emit logString("....Teacher doSomething....");
    }
}
////////////////////////////STUDENT////////////////////////////////
contract Student is Human
{
    function doSomething()public override virtual// again now monitor is going to be inheritedand that Monitor 
    //is going to use its function so virtual keyword will be used along with override keywor
    {
        emit logString("....Student doSomething....");
    }
}
//////////////////////////MONITOR//////////////////////////////////
contract Monitor is Student
{
    // in case we dont define it the we can use it under Voter's doSomething() cuz there will be no need of virtual and override....
    function doSomething()public override // now this doSomething() is usedto be override
    {
        emit logString("....Monitor's doSomething....");
    }
}
/////////////////////////VOTER///////////////////////////////////
contract Voter is Teacher,Student//for multiple inheritnece in case of diamond problem.... DOnt worry about the arrangments!!
{
    function doSomething()public override (Teacher,Student)// Now here we have to specify that whose function is overridden 
    //so we have to put Student and Teacher after overridden function of Voter... Moreover one thing to be noted that whose function is virtual
    //will be specified here not others cuz Voter is Studentand Student is virtualed and Voter is Teacher and virtualed so parent's method need to
    // to be specified here...
    // Onemore thing you cant use super super parent class that is Human in this example otherwise it will give an error...
    //this concpet is called C3 linearization.....
    {
        emit logString("....Voter's doSomething....");
    }
}
/////////////////////////MAIN///////////////////////////////////
contract MianContract
{
 
     function doSomething() public returns(string memory)
     {
         Human objTeacher=new Teacher();// will call human's constructor then teacher's default constructor....
         Human objStudent=new Student();//will call Human's constructor then Student's default constructor.....
         Human objMonitor=new Monitor();//wil call Human's constructor then Student's default constructor and then Monitor's default constructor....
         Human objVoter=new Voter();//will call Human's constructor then Student's default constructor then Teacher's default constructor and then its own.... 
          
         objTeacher.doSomething();// will call Teacher's doSomething()....
         objStudent.doSomething();// will call Student's doSomething()....
         objMonitor.doSomething();// will call Monitor's doSomething()....
         objVoter.doSomething();// will call Voter's doSomething()....
     }
}





