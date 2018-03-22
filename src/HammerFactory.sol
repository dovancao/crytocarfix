pragma solidity ^0.4.0;

import "./HammerBase.sol";
import "./Player.sol";

contract HammerFactory is HammerBase {

    Hammer[3] memory hammers = new Hammer[](3);

    hammers.push(Hammer("copper",6408198862413308));
    hammers.push(Hammer("silver",7982210457426099));
    hammers.push(Hammer("gold",8982210457426019));

    //modifier yêu cầu level thích hợp để check xem, đã đủ level để mua búa tương ứng chưa
    modifier aboveLevel(uint _level, uint _userAddress){
        require(players[_userAddress].level >= level);
    }

    modifier

    function buyHammer() internal {

    }

}
