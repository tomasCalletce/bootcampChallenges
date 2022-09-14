// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract BootCamp0 {

    address public admin;
    address public winner;
    bytes32 ansHash = 0xd344f074c815fded543cd5a29a47659de529cd0adb1c1fae6eda2d685d422bd8;
    string public winnerMessage;

    constructor(){
        admin = msg.sender;
    }
   
    function guess(uint8 _guess) external {
        require(winner == address(0));
        require(keccak256(abi.encode(_guess)) == ansHash);
        winner = msg.sender;
    }

    function leaveChampionMessage(string calldata _message) external {
        require(msg.sender != address(0));
        require(msg.sender == winner || msg.sender == admin);
        winnerMessage = _message;
    }


}