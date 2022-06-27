pragma solidity ^0.6.0;
////////////////////////////////////////////////////////////
//these are som rules beofre making any interface//
// you can not declare any state variables
// you can not create constructor
// you must have to put external with methods under interface
//and all of them must be virtual
// and lastly all f them must be deined later in child classes..
interface  Human// remeber while we are creating interfaces w dont need to put contract after interface keyword....
{
    
    // note that in interfaces none of the method is implemented within parent contract.....
    //int age;
    event logString(string);
    
  
    //Now there is no implementation of setAge and getAge....
    function setAge(int _age) external virtual;// one more tihing you will alwasy use external keyword with interfaces OK!!!
    
    function getAge()external virtual view returns(int) ;// remeber when you dont define it then need to mark it as virtual cuz child 
    
    //classes going to define them while overriding
    function doSomething() external virtual returns (int) ;
 
}
////////////////////////////////////////////////////////////
contract Student is Human
{
    int age;
    function setAge(int _age) public override
    {
    age=_age;
    }
    function getAge()public override view returns(int) 
    {
    return age;
    }
    function doSomething()public override returns  (int){
        int x;
        emit logString("...Student's doSomething....");
        x=getAge();
        return x;
    }
}
////////////////////////////////////////////////////////////
contract MainContract
{
    
}
