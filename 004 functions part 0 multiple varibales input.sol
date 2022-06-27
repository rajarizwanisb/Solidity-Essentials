pragma solidity ^0.6.0;
contract Functions
{
    int x;
    int y;
    function multipleVariables(int a, int b)public // multiple varibales input here...
    {
        x=a;
        y=b;
    }
    function sum()public view returns(int)
    {
        return x+y;
    }
}