pragma solidity ^0.6.0;
contract Functions
{
    int a;
    int b;
    function multipleVariables(int _a, int  _b)public
    {
        a=_a;
        b=_b;
    }
    function sum()public view returns(int result)// returning multiple values with varibles in parameter
    //so no need to write returns keyword in the function if its is returned in the paramanetr....
    {
       result=a+b;
    }
}