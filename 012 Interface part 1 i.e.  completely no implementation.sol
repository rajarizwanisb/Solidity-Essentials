pragma solidity ^0.6.0;
////////////////////////////////////////////////////////////
abstract contract Human// and you need to specfy them that its an abstarct class/contract... before 0.6 versions here is no need to
//put abstarct...
{
    // note that in interfaces none of the method is implemented within parent contract.....
    int age;
    event logString(string);
    
    constructor () public
    {
        age=5;
        emit logString("Human's constructor");
    }
    //Now there is no implementation of setAge and getAge....
    function setAge(int _age) public virtual;
    function getAge()public virtual view returns(int) ;// remeber when you dont define it then need to mark it as virtual cuz child 
    //classes going to define them while overriding
    function doSomething() public virtual returns (int) ;
 
}
////////////////////////////////////////////////////////////
contract Student is Human
{
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

