pragma solidity ^0.6.0;
contract Human{
    
    int age;
    
    function setAge(int a) public {
        age=a;
    }
  function getAge() public view returns(int)
  {
      return age;
  }
  
}


contract MainCOntract//Now this will work as etherum virtual machine and will eploy on it directy instaad of EVM
{
//Human ojhuman;//for that we will create object
Human public ojhuman;//if we write public with it then we can also see it on that deployed EVM

function calling()public returns(int){
    
    ojhuman = new Human();//here we have instatiated that created object and Deployed
    ojhuman.setAge(23);//transaction  takes place
return  ojhuman.getAge();//result achieved
}
//keep tracking of address being allocated to object
//address: 0x0000000000000000000000000000000000000000  => when calling function is not pressed
//address: 0xEE02c312A78fA5deaDb0AECc245da4A004384D6D => when calling function is pressd a once
//address: 0xAca6c30b2Cf85927246B2cF2299cdF32Ca13FABE => when we again pressed the alling button.. so each time we call the calling function in main contract address
//will be changed every time which means more times u called call function the more objects will be created...
//the new keyword is generating new addresses actually...
//Now we want to access the first address to be used only then we need to use data type address




function settingAddress(address adr)public
{
    ojhuman=Human(adr);//Now here we are not going to put new keyword cuz we dont want a new address but the old one that has been delpoyed on previous calling function
    }
    function gettingAgeWithAddress()public returns(int)//Now this is another getting age function that will be accessed through address
    {
        //ojhuman.setAge(33);
        return ojhuman.getAge();
    }

}