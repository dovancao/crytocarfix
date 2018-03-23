pragma solidity ^0.4.0;

contract Player {
    struct Player {
        address addressPlayer;
        uint32 userId;
        uint8 level;
        uint32 exp;
    }

    Players[] players;
    modifier aboveLevel(uint _level){
        require(players.level > _level );
        _;
    }

}
