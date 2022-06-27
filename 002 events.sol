pragma solidity ^0.6.0;

contract EventLogging{
    
    uint age;
    event ageRead(uint);// first declare it and pass argiments
    function updateAge(uint _age) public
    {
        age=_age;
        emit ageRead(age);//here uou will lgg and check if the provided varibale is working and settin the age here
    }
 
}

// events are used for logging the transaction
// moreover it will help DAPPS andother wallets to listen whats happeing within the contract and they will be acknowledged
// one thing to be remember that contract can fire event but cant listen it however these events are fired and created within the contract while other dapps can..


