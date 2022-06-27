pragma solidity ^0.6.0;
contract Functions
{
    string firstName;
    string lastName;
    function multipleVariables(string memory _firstName, string memory _lastName)public
    {
        firstName=_firstName;
        lastName=_lastName;
    }
    function sum()public view returns(string memory, string memory)// returning multiple values as tuples
    {
        return (firstName,lastName);
    }
}