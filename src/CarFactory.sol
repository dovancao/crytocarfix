pragma solidity ^0.4.0;
import "./saferandomness.sol";
import "./CarBase.sol";


contract CarFactory is CarBase {
    event NewCar(uint carId, string name, uint generation);
    uint generationDigits = 4;
    uint geneModulus = 10 ** generationDigits;

    event Created(address owner, uint carId, uint matronId, uint generation, string type);


    function _creatCar(
                address _owner;
                uint32 _matronId;
                string _type;
                uint8 _color;
                uint8 _generation;
    ) interal returns (uint) {
                require(_matronId == uint256(uint32(_matronId)));
                require(_color  == uint256(uint32(_color));
                require(_generation == uint256(uint16(_generation)));
                Created(_owner, _matronId,_generation, _type);
    }

    function _generateRandomGeneration() internal view returns (uint) {
                generateSafeRand();
    }

    function _createRandomCars(_matronId, _type, _color) public {
                require[ownerCarCount[msg.sender] == 0];
                uint randGener = generateSafeRand();
                _createCar(msg.sender,_matronId, _type, _color, randGener);
                cars.push(_name,_type,randGener,,,,,,);
    }




}
