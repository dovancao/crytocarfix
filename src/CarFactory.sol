pragma solidity ^0.4.0;
import "./saferandomness.sol";


contract CarFactory is CarBase {
    event NewCar(uint carId, string name, uint generation);
    uint generationDigits = 4;
    uint geneModulus = 10 ** generationDigits;

    event Created(address owner, uint256 carId, uint256 matronId, uint256 generation, string type);

    Car[] public cars;
    function _creatCar(
                address _owner;
                uint256 _matronId;
                string _type;
                uint256 _color;
                uint256 _generation;
    ) interal returns (uint) {
                require(_matronId == uint256(uint32(_matronId)));
                require(_color  == uint256(uint32(_color));
                require(_generation == uint256(uint16(_generation)));
                Created(_owner, _matronId,_generation, _type);
    }

    function _generateRandomGeneration() internal view returns (uint) {
                generateSafeRand();
    }

    function _createRandomZombies(_matronId, _type, _color) internal {
                require[ownerCarCount[msg.sender] == 0];
                uint randGener = generateSafeRand();
                _createCar(msg.sender,_matronId, _type, _color, randGener);
    }

}
