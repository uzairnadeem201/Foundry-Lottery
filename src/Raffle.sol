// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions
//SPDX-License_Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Raffle
 * @author Uzair Nadeem
 * @notice This is a contract for Learning Solidity
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    /** Errors */
    error Raffle_SendMoreToEnterRaffle();
    uint256 private immutable i_enteranceFee;
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;
    address payable[] private s_players;
    /* Events */
    event RaffleEntered(address indexed player);

    constructor(uint256 enteranceFee, uint256 interval) {
        i_enteranceFee = enteranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        //require(msg.value >= i_enteranceFee, "Not Enough ETH Sent");
        if (msg.value < i_enteranceFee) {
            revert Raffle_SendMoreToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    function pickWinner() external {
        if ((block.timestamp - s_lastTimeStamp) > i_interval) {}
    }

    /** Getters */
    function getEnteranceFee() external returns (uint256) {
        return i_enteranceFee;
    }
}
