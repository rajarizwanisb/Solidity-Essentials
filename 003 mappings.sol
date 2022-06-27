pragma solidity ^0.6.0;
//mappings is basically a complex data type and is usde to store key-value pairs. Then from keys u can access what data has been 
//stored at that particular key.
//there are different rules for mappings
// You can only declare mappings at state level not in methods
// you can not perfrom any kind of iteration on mappings
// you can only access that mappings in function with reference that has been decalred at state level..
contract Family
{
    mapping(address=>uint) balances;
    mapping (int => string)  names;// this is the basic signature of decalring mapping at state level....
    function setNames() public
    {
        // here you will assign values to keys....
        names[1]="Ashiq";
        names[2]="Fatima";
        names[3]="Ali";
        names[4]="Nino";
        names[5]="Billa";
        
    }
    
    function getNames() public view returns(string memory)
    {
        return names[2];// here you will access those keys-values.. and we will get result after clicking getNames "Fatima"
    }
    function setInUpdateMapping(address adr,uint amount) public
    {
        balances[adr]=amount;
    }
    function showInUpdateMapping() public view returns(uint)
    {
        return balances[msg.sender];
    }
}