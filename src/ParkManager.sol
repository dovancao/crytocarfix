pragma solidity ^0.4.0;
import "./ParkBase.sol";
import "./CarBase.sol";


// quản lí mọi thay đổi liên quan đến việc Park
contract ParkManager {

    public bool parkCar = true ;
    function parkIn (uint _tokenId, address _guest) internal {
        clock = 1;
        clockExp = 1;
        require(carIndexToOwner[_tokenId] == _guest && ownershipTokenCount[_guest] > 1);
        while (duration > 0 ){
            _startDuration(_tokenId, _guest);
            _startIncreseExp(_tokenId, _guest);
            event ParkCreated(uint _tokenId, 0 , now , _startDuration(_tokenId, _guest));

        }
        eventParkSuccesful(uint _tokenId, 0, startExp);

    }

    // đỡ ở nơi không có biển P
    function parkOut(uint _tokenId, address _guest) internal{
        msg.sender = _guest;
        require(msg.value == autoParkFee);
        clock = 1;
        clockExp = 100;
        require(carIndexToOwner[_tokenId] == _guest && ownershipTokenCount[_guest] > 1);
        while (duration > 0 ){
            _startDuration(_tokenId, _guest);
            _startIncreseExp(_tokenId, _guest);
            event ParkCreated(uint _tokenId, autoParkFee , now , _startDuration(_tokenId, _guest));
        }
        eventParkSuccesful(uint _tokenId, autoParkFee , startExp);
    }
}




