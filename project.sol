// For this project, write a smart contract that implements the require(), assert() and revert() statements.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


    
contract transaction {
    function test(uint _input) public pure returns(string memory){
        if ( _input > 999 ether){
            revert("Not possible");
        }
        else if(_input <500){
            return "NO! Funds";
        }
        else{
            return "WOrked!";
        }
        // return "Even";
    }

    uint public bal;
    constructor(){
        bal=address(this).balance;
    }
    function  withdraw(uint _val) public  returns(string memory){
        require(bal>_val,"insufficient funds");
        bal-=_val;
        payable(msg.sender).transfer(_val); 
        return "Withdrawal successful!";
    }
    function SendTo(address _friend,uint _value) public view returns(string memory){
        assert(bal>_value);
        return "Yes , you have funds to send money to your friend...";
    }
    
    
    
}
