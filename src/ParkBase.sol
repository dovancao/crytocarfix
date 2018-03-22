pragma solidity ^0.4.0;
import "./CarAccessControl.sol"

contract ParkBase {

    uint256 public autoParkFee = 0.2 finney;

    struct Park {
        address _master;
        address _guest;
        uint64 _startedAt;
        uint64 _duration;
        uint128 _expReceived;
        uint128 _moneyEscrow; // tiền đặt cọc để đỗ xe
        uint32 _carTokenId;
    }

    Park[] public parks;

    event ParkCreated(uint256 _carTokenId, uint256 _moneyEscrow, uint256 _startedAt, uint256 _duration);
    event ParkSuccesful(uint256 _carTokenId, uint256 _moneyEscrow, uint _exp);
    event ParkPenalize(uint256 _cartokenId);


    mapping (address => uint256) parkIndexTotalCount; // trả về số chỗ còn có thể park của address

    //set park fee : chỉ có COO mới có quyền set
    function setParkFee(uint256 val) external onlyCOO {
        autoParkFee = val
    }

    function _createPark(
        uint256 _carTokenId;
        address _master;
        address _guest;
        uint256 _duration;
        uint256 _moneyEscrow;
    ) internal WhenNotPaused {
        require(carIndexToOwner[_carTokenId]== _guest);
        require(parkIndexTotalCount[_master] >= 1);
        ParkCreated(_carTokenId, _moneyEscrow,now,_duration);
    }

    // bắt đầu tính thời gian đỗ xe
    public uint256 duration = 1 minute; // thoi gian do mac dinh la 1 minute
    pubblic uint256 startExp = 0;       // mặc định exp ban đầu bằng 0
    public uint256 clock;

    // hàm giảm duration cơ bản, mỗi khi được gọi thì duration giảm 1 sec
    function _startDuration(uint256 _tokenId, address _guest) internal view return (uint256){
        duration -= clock;
        return duration;
    }

    // hàm tăng exp cơ bản , mỗi khi được gọi thì exp tăng 1
    function _startIncreaseExp(uint256 _tokenId, address _guest) internal return (uint256) {
        startExp += clock
        return startExp;
    }





}