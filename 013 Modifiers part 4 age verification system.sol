pragma solidity ^0.6.0;

contract VerificationCentre
{
    int age;
    uint256 balance;
    function addBalance(uint256 _balance)public
    {
        
        balance=_balance;
    }
    function setAge(int _age)public
    {
        age=_age;
    }
    function showBalance()public ageRestriction view returns(uint256)
    {
        return balance;
    }
    modifier ageRestriction{
        require(age>20,"Sorry your age is less than 20");
        _;
    }
}