// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;


interface NoName {
    function getKey() external returns(uint);
}


contract C2 {

    address public admin;
    address public winner;
    string public winnerMessage;

    constructor(){
        admin = msg.sender;
    }
   
    function iWillWin(address _helper) external {
        require(winner == address(0));
        NoName nn = NoName(_helper);
        require(nn.getKey() == 44,"not equal");
        winner = msg.sender;
    }

    function leaveChampionMessage(string calldata _message) external {
        require(msg.sender != address(0));
        require(msg.sender == winner || msg.sender == admin);
        winnerMessage = _message;
    }


}
