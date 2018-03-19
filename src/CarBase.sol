pragma solidity ^0.4.0;

contract CarBase is CarAccessControl {

    struct CarBase{
        string name;
        string type;
        uint16 generation;
        uint64 upgradeTime;
        uint64 cooldownUpgrade; // thoi gian gioi han giua 2 lan do xe
        uint32 matronId;        //id cua xe duoc do khi đập với búa
        uint32 hammerId;        // id cua búa
        uint16 cooldownIndex;   // số lần độ - sẽ giới hạn index <3 / 1 ngày
    }

    uint32[14] public cooldowns = [
        uint32(1 minutes),
        uint32(2 minutes),
        uint32(5 minutes),
        uint32(10 minutes),
        uint32(30 minutes),
        uint32(1 hours),
        uint32(2 hours),
        uint32(4 hours),
        uint32(6 hours),
        uint32(12 hours),
        uint32(1 days),
        uint32(4 days),
        uint32(7 days),
    ];

// thoi gian giua cac block la
    uint256 public secondsPerBlock = 15;

    Car[] cars; /// tạo 1 mảng chứa car

    mapping (uint256 => address)  public carIndexToOwner;       //mapping đưa vào iD của car va trả về address của chủ sở hữ
    mapping (address => uint256)  public ownershipTokenCount;   // trả về số token (số car) mà người đó sở hữu
    mapping (uint256 => address)  public carIndexToApproval;    //value la id cua car trả về address của người được approval transfer
    mapping (uint256 => address)  public upgradeAllowedToAddress;
// chuyen ô tô hiếm _tokenId là id của car
    function _transfer(address _from, address _to, uint256 _tokenId) internal {
            ownershipTokenCount[_to]++;
            carIndexToOwner[_tokenId] = _to;
            if(_from != address(0)){
                ownershipTokenCount[_from]--;
                delete upgradeAllowedToAddress[_tokenId];
                delete carIndexToApproval[_tokenId];
            }
            Transfer(_from, _to, _tokenId);
    }

}
