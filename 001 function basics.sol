pragma solidity ^0.6.0;
contract Functions{
 int number;
 
 function adding_Numbers(int a) public 
{
     number=a;
 }
 function showing_Number()public view  returns(int)
 {
     return number+1;
 }
  
}