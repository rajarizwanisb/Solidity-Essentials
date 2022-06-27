pragma solidity ^0.6.0;
contract ConstructorExample
{
    int age;
    string name;
    //constructor without parameters
    constructor() public
    {
        age=27;
        name ="Ali";    
        
    }
    function showMessage()public view returns(int,string memory)
    {
        return (age,name);
    }
    
    
}

contract ConstructorExampleWithParameter
{
    int age;
    //string name="Ali";
    constructor(int _age) public// now before deploying it will ask you to enter default age...
    {
        age=_age;
    }
    function showMessage()public view returns(int)
    {
        return (age);
    }
}