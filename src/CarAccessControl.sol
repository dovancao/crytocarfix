pragma solidity ^0.4.0;
///  CEO, làm mọi thứ, thay đổi address của user dựa vào smart contract, dừng smart contract
///  vào CEO có thể ấn định bất cứ ai có thể làm vai trò nào
CFO trả lại fung từ car core và hợp đồng đấu giá
///  COO tạo những con car đời 2018 để đấu giá và làm promotion car
///
contract CarAccessControl {
    even ContractUpgrade(address newContract);

// địa chỉ của những account đặc biệt, CEO, CFO
    address public ceoAddress;
    address public cfoAddress;
    address public cooAddress;

// đặt 1 giá trị để track khi nào contract bị pause
    bool public paused = false;

/// modifier chỉ có CEO mới access được
    modifier onlyCEO(){
            require(msg.sender == ceoAddress);
            _;
    }

    modifier onlyCFO(){
            require(msg.sender == cfoAddress);
            _;
    }

    modifier onlyCOO(){
            require(msg.sender == cooAddress);
    }

    modifier onlyClevel(){
            require(
            msg.sender == ceoAddress ||
            msg.sender == cooAddress ||
        msg.sender == cfoAddress ||
    );
    _;
    }

//CEO có quyền set address mới cho họ
    function setCEO(address _newCEO) external onlyCEO {
            require(_newCEO != address(0));  // yêu cầu địa chỉ phải là 1 dãy hợp lệ
            ceoAddress = _newCEO;
    }

    function setCFO(address _newCFO)  external onlyCEO {
            require(_newCFO != address(0));   // yêu cầu address mới phải là 1 address hợp lệ
            cfoAddress = _newCFO;
    }

    function setCOO(address _newCOO)  external onlyCOO {
            require(_newCOO != address(0));
            cooAddress = _newCOO;
    }

// modifier check xem chương trình còn chạy không
    modifier whenNotPaused() {
            require(!paused);
            _;
    }

    modifier WhenPaused {
            require(paused);
            _;
    }

// tạo 1 nút thắt để có thể dừng chương trình khi có sự cố, bảo hahf, nâng cấp
// tất nhiên phải yêu cầu khi chương trình không paused thì mới paused rồi
    function pause() external onlyCleve WhenNotPaused() {
            paused = true;
    }

// cfo, coo có quyền dừng khi chương tình không hoạt động, nhưng CEO có thể bác bỏ việc này để tranhs cfo, coo lạm dụng
    function unpause() external onlyCEO WhenPaused() {
            paused = false;
    }
//    function CarAccessControl(){
//
//    }
}
