pragma solidity ^0.4.0;

contract HammerFactory is HammerBase {
    function _generateRandomGeneration() internal view returns (uint) {
        generateSafeRand();
    }

    hammers.push(Hammer(copper,copper,_generateRandomGeneration));
    hammers.push(Hammer(silver,silver,_generateRandomGeneration));
    hammers.push(Hammer(gold,gold,_generateRandomGeneration));


}
