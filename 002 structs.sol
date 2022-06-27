pragma solidity ^0.6.0;
// STRUCTURES....
// remeber we can only decalre multuple varibales in structre means you are creating custom data types in it
// no usiness logic definition no initialization no nothing
// just kind of composite varibale declaration
// so you can make it once and then can use it multiole time by creating multiple instances 
// remeber you can not define any function in it or return them in functions... Solidity hasnt any support for such feature till now....
// but YES you can use structs in contracts..

contract STRUCTURES
{
    struct Student
    {
        uint age;
        string name;
        bool isMarried;
        // you can not define function in it....
        // be careful about sequence of these varibales while using this Student struct later...
    }
    
    Student std = Student(20,"ALi",false);// varibale declared of type Student at state level.....
    
    function dontUpdate()public view returns(uint,string memory,bool)
    {
        
        return (std.age,std.name,std.isMarried);// now here you are ony returning the default value of age i.e. 20 name as Ali and isMarried as false in this case..
    }
    
    function update(uint _age,string memory _name,bool _isMarried)public returns(uint,string memory,bool)
    {
        std.age=_age;
        std.name=_name;
        std.isMarried=_isMarried;
        return (std.age,std.name,std.isMarried);
    }
    function inUpdate(uint _age, string memory _name, bool _isMarried)public returns(uint,string memory,bool)
    {
        Student memory std1=Student(_age,_name,_isMarried);
        return (std1.age,std1.name,std1.isMarried);
    }
  
    
}