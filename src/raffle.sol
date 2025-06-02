// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";
import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";
import {AutomationCompatibleInterface} from "@chainlink/contracts/src/v0.8/interfaces/AutomationCompatibleInterface.sol";

/**
 * @title A simple raffle contract
 * @dev Inplement chainlink VRFv2.5  .
 * @author @Adesola
 * @notice This contract is for educational purposes only and should not be used in production.
 *  */
contract Raffle is VRFConsumerBaseV2Plus, AutomationCompatibleInterface{
    error Raffle__NotEnoughEth();
    // Chainlink VRF Variables
    uint256 private immutable i_subscriptionId;
    bytes32 private immutable i_gasLane;
    uint32 private immutable i_callbackGasLimit;
    uint16 private constant REQUEST_CONFIRMATIONS = 3;
    uint32 private constant NUM_WORDS = 1;

    // Raffle Variables
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;
    event raffleEntered(address indexed player);
     constructor(
        uint256 subscriptionId,
        bytes32 gasLane, // keyHash
        uint256 interval,
        uint256 entranceFee,
        uint32 callbackGasLimit,
        address vrfCoordinatorV2
    ) VRFConsumerBaseV2Plus(vrfCoordinatorV2) {
        i_gasLane = gasLane;
        i_interval = interval;
        i_subscriptionId = subscriptionId;
        i_entranceFee = entranceFee;
        s_raffleState = RaffleState.OPEN;
        s_lastTimeStamp = block.timestamp;
        i_callbackGasLimit = callbackGasLimit;

    }
    
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