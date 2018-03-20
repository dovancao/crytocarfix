pragma solidity ^0.4.0;

contract CarUpgrade is CarOwnerShip,HammereOwnerShip {
    // upgrade chỉ xảy ra đối với 1 cặp búa và car hợp lệ,
    event Upgrade(address owner, uint matronId, uint hammerId, uint256 cooldownEndBlock);
    // set phí upgrade là 2 finney
    uint256 public autoUpgradeFee = 2 finney;
    //tạo 1 biến để track những car được upgrade
    uint256 public counUpgradeCars;

    function readyUpgrade(address _owner, uint _matronId, uint _hammerId){
        if(hammers.type == copper){
            //none require level
            require(cars._generation > 2010);
            //logic dat vao day
        }else if(hammers.type == silver){
            //require level >20;
            require(lvel lon hon 20);
            require(cars._generation > 1990 && cars._generation <2010);
            //logic dat vao day
        }else if(hammers.type == golde) {
            //require level > 30;
            require(lvel lon hon 20);
            require(cars._generation > 1980 && cars._generation <1990);
            // lo gic dat vao day
        }
    }

    function Upgrade(address _owner, uint _matronId, uint _hammerId) {
        
    }


}
