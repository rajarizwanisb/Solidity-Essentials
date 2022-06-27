pragma solidity ^0.6.0;
//The main differnce between calls and delegatecall is that simpe calls uses the storage and context of libraries
//while deligate calls dont use the libraries' or others contract's context i.e. storage but current contract's..
contract Math
{
    uint public result;
    string public myString;
    function add(uint a, uint b) external returns (bool)// bydefualt uint is actual uint256
    {
        result=a+b;
        return true;
        }
    function doSomething() external  returns (string memory)
    {
        myString= "Hello Mudabbir Ali";
        return myString;
    }
        
}

contract Calculator
{
    uint public result;// this is the variable that is using the storage of this contract....// remeber this variable must be same as math contract has
    string public myString;// again this must has to be the saem variable as delcalredd in Maths contract other wise u cant see result..
    
    function additionSimpleCall(address Maths,uint a, uint b) external returns(bool success,bytes memory data ) // Now you have o take address of Math contract in order to make calls of Math
    //contract into this contract...
    {
        //bool status;
        //bytes memory data;
        bytes memory payLoad=abi.encodeWithSignature("add(uint256,uint256)",a,b);// remeber make sure to put same name as mentioned in the add() method of
        //Math's contract otherwise it wont work... and one more thing that you need to specify that uint i.e. 256 so mention that otherwise it will
        // not work....
        (success,data)=Maths.call(payLoad);
        //Now in this simple call we made transaction from here after deploying Math contract. After transaction we can see
        //result does not appear on this button but will find that on math's contract. Why?
        // because simple call always uses libraries' context i.e. Math in this case.
    }
    function additionDelegateCall(address Mathss, uint x, uint y)external returns (bool success,bytes memory data)
    {
        //bool status;
       // bytes memory data;
        bytes memory payLoad2=abi.encodeWithSignature("add(uint256,uint256)",x,y);
        (success,data)= Mathss.delegatecall(payLoad2);
        //Now in this delegatecall we made transaction from here after deploying Math contract. After transaction we can see
        //result does appear not on this button but will find that on math's contract. Why?
        // because delegatecall always uses its own context i.e. Calculator in this case.
    }
    
    function simpleCallWithBytes(address Mathsss) public returns(bool success,bytes memory data)// this time we will return bytes payload as well to check what actually we recieved in bytes format i.e. hexa decimal  
    {
        bytes memory payLoad3=abi.encodeWithSignature("doSomething()");
        (success,data)=Mathsss.call(payLoad3);// it must return bool is true and payLoad3 as 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001248656c6c6f204d7564616262697220416c690000000000000000000000000000
        //which is basically Hello Mudabbir Ali in hexadicmal format....
    }
}
//hence simple calls are updating storage values of Math contracts while delegate calls are updating its own state varibales...