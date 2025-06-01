// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
/**
 * @title A simple raffle contract
 * @dev Inplement chainlink VRFv2.5  .
 * @author @Adesola
 * @notice This contract is for educational purposes only and should not be used in production.
 *  */
contract Raffle{
    error Raffle__NotEnoughEth();
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;
    event raffleEntered(address indexed player);
    constructor(uint256 entranceFee){i_entranceFee= entranceFee;}
    
    
    function enterRaffle() public payable  {
        if(msg.value> i_entranceFee)
           revert Raffle__NotEnoughEth();
        s_players.push(payable(msg.sender));
        emit raffleEntered(msg.sender);

        
    }
    function pickWinner() public returns(uint256){

    }
    /** Getter function */
    function getEntranceFee() public view returns (uint256){
        return i_entranceFee;
    }



}