// For this project, write a smart contract that implements the require(), assert() and revert() statements.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrainSystem{

    struct Passenger{
        string Name;
        bool hasTkt;
    }
    Passenger[]  passengers;
    function AddPassenger(string memory _name , bool _tkt) public {
        Passenger memory newPassenger = Passenger( {
            Name : _name,
            hasTkt : _tkt
        });
        passengers.push(newPassenger);
    }

    function getPassengerCount() public view returns (uint) {
        return passengers.length;
    }
    function GetPassenger(uint _index) public  view returns(string memory, bool){
        require(_index < passengers.length,"Not Found"); // to check the index num  
        // and get data
        Passenger storage passenger= passengers[_index];
        return (passenger.Name , passenger.hasTkt);

    }
    
    uint public currentTime = block.timestamp;
    uint public scheduledDepartureTime = 10; 

    function AllPassengerHaveTicket() public view returns(bool){
        for(uint i =0;i<passengers.length;i++){
            if(!passengers[i].hasTkt)
                revert ("Not all passengers have ticket");
        }
        return true;
    }
    
modifier checkDepartureConditions() {
    require( currentTime >= scheduledDepartureTime && AllPassengerHaveTicket(), "Cannot depart, conditions not met.");
    _;
}



function departTrain() checkDepartureConditions external view returns(string memory){
    // Train Went from station to next station 
    return ("TRAIN DEPARTED!");
}

function CheckTkt() internal view {
    assert(AllPassengerHaveTicket());

}
function Emergency () external pure  {
    
    revert("Emergency has occured!");
    
}










}
