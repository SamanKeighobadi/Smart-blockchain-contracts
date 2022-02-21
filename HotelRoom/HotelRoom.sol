// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.6.0;

contract HotelRoom {
    address payable public owner;

    enum Status {
        Vacant,
        Occupied
    }
    Status currentStatus;
    event Occupy(address _occupant, uint256 _value);

    constructor() public {
        owner = msg.sender;
        currentStatus = Status.Vacant;
    }

    modifier OnlyWhileVanact() {
        require(currentStatus == Status.Vacant, "Book is not vacant");
        _;
    }

    modifier costs(uint256 _amount) {
        require(msg.value >= _amount, "Not enough Ether provided");
        _;
    }

    receive() external payable OnlyWhileVanact costs(2 ether) {
        currentStatus = Status.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}
