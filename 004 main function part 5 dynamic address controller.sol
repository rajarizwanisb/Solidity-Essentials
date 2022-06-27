pragma solidity ^0.6.0;

contract Student{
    
    //string  name;
    mapping(address=>string) name;
    function setName(address adr,string memory nm) public // we willset the names of each addresses available
    {
        name[adr]=nm;
    }
    function getName(address adr)public view returns(string memory)// here we will simply access the name of desired address
    {
        return name[adr];
    }
    
}
contract MainContract
{

Student public objStudent;// object for previosly deployed contract is created but not instantiated...
mapping(address=>string) names;

constructor(address addresses) public
{
    objStudent=Student(addresses);// we have took and assistance of previously deployed contract by access its address here
    // this will successfully instantiate our student object
}


function getNames(address adr)public view returns (string memory)
{
   return objStudent.getName(adr);// now you can access whatever you want
}

}


