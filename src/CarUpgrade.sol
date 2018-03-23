pragma solidity ^0.4.0;

import "./Player.sol";

contract CarUpgrade is CarOwnerShip,HammereOwnerShip,Player {
    // upgrade chỉ xảy ra đối với 1 cặp búa và car hợp lệ,
    event Upgrade(address owner, uint matronId, uint hammerId, uint256 cooldownEndBlock);
    // set phí upgrade là 2 finney
    uint256 public autoUpgradeFee = 2 finney;
    //tạo 1 biến để track những car được upgrade
    uint256 public counUpgradeCars;
    modifier ownerOfToken(address _owner, uint _matronId){
        require(carIndexToOwner[_matronId] == _owner);
        _;
    }
    modifier ownerOfHammer(address _owner, uint _hammerId){
        require(hammerIndexToOwner[_hammerId] == _owner);
        _;
    }


    function aboveLevel(uint _levelLow, uint _levelHigh)internal view returns (uint){
        // gọi 1 player trong tập hợp player có level tương ứng
        require(players[addressPlayer].level > _levelLow  && players[addressPlayer].level < _levelHigh  );
        return _level;
    }
    function aboveGeneration(uint _genLow, uint _genHigh) internal view returns(uint){
        require(cars[matronId].generation > _genLow && cars[matronId].generation < _genHigh );
        return _generationCar;
    }

    function readyUpgrade(address _owner, uint _matronId, uint _hammerId) ownerOfToken ownerOfHammer{
        if(hammers.type == copper){
            //none require level
            _aboveLevel(0,10);
            _aboveGeneration(2010, 2018);
        }else if(hammers.type == silver)
        {
            _aboveLevel(10, 20);
            _aboveGeneration(1995, 2010);
        }else if(hammers.type == gold) {
            _aboveLevel(20,30);
            _aboveGeneration(1950, 1995);
        }
    }

    function Upgrade(address _owner, uint _matronId, uint _hammerId) {




    }


}
