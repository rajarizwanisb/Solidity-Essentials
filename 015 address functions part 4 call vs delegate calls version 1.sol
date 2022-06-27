pragma solidity ^0.6.0;
//The main differnce between calls and delegatecall is that simpe calls uses the storage and context of libraries
//while deligate calls dont use the libraries' or others contract's context i.e. storage but current contract's..
contract Math
{
    uint public result;
    function add(uint a, uint b) external returns (bool)// bydefualt uint is actual uint256
    {
        result=a+b;
        return true;
        }
        
}

contract Calculator
{
    uint public result;// this is the variable that is using the storage of this contract....// remeber this variable must be same as math contract has
    
    function additionSimpleCall(address Math,uint a, uint b) external returns(bool success) // Now you have o take address of Math contract in order to make calls of Math
    //contract into this contract...
    {
       // bool status;
        bytes memory payLoad=abi.encodeWithSignature("add(uint256,uint256)",a,b);// remeber make sure to put same name as mentioned in the add() method of
        //Math's contract otherwise it wont work... and one more thing that you need to specify that uint i.e. 256 so mention that otherwise it will
        // not work....
        (success,)=Math.call(payLoad);
        //Now in this simple call we made transaction from here after deploying Math contract. After transaction we can see
        //result does not appear on this button but will find that on math's contract. Why?
        // because simple call always uses libraries' context i.e. Math in this case.
    }
    function additionDelegateCall(address Math, uint x, uint y)external returns (bool success)
    {
        bytes memory payLoad2=abi.encodeWithSignature("add(uint256,uint256)",x,y);
        (success,)= Math.delegatecall(payLoad2);
        //Now in this delegatecall we made transaction from here after deploying Math contract. After transaction we can see
        //result does appear not on this button but will find that on math's contract. Why?
        // because delegatecall always uses its own context i.e. Calculator in this case.
    }
}
//hence simple calls are updating storage values of Math contracts while delegate calls are updating its own state varibales...