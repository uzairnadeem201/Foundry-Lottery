//SPDX-License_Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Raffle
 * @author Uzair Nadeem
 * @notice This is a contract for Learning Solidity
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    uint256 private immutable i_enteranceFee;

    constructor(uint256 enteranceFee) {
        i_enteranceFee = enteranceFee;
    }

    function enterRaffle() public payable {}

    function pickWinner() public {}

    /** Getters */
    function getEnteranceFee() external returns (uint256) {
        return i_enteranceFee;
    }
}
