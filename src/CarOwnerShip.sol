pragma solidity ^0.4.0;
// cung cap chuc nang chuyen car cơ bản, chuyển non-fungible cơ bản
contract CarOwnerShip is CarBase, ERC721 {

    string public constant name = "CryptoCar";
    string public constant symbol = "CK";

    // check xem address hiện tại có sở hữu car có tokenid này không
    function _owns(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return carIndexToOwner[_tokenId] == _claimant;
    }


    //claimant là địa chỉ mà chúng ta sẽ comfirm rằng car sẽ được approve
    function _approvedFor(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return carIndexToApproved[_tokenId] == _claimant;
    }

    //function approve dùng để chấp nhận việc đưa car lên aution, và ghi đề lên bất cyws thứ gì đã được approval trước đó
    function _approve(uint256 _tokenId, address _approved) internal {
        carIndexToApproved[_tokenId] = _approved;
    }


    // check balance của user có bao nhiêu car
    function balanceOf(address _owner) public view returns (uint256 count) {
        return ownershipTokenCount[_owner];
    }

    //chuyển car từ người bán sang người mua, việc chuyển phải đảm bảo dựa hoàn toàn vào tiêu chuẩn ERC721 nếu không cẩ sẽ mất vĩn viễn
    function transfer(address _to, uint256 _tokenId) external WhenNotPaused{
        // đảm bảo rằng địa chỉ của người gửi khác 0
        require(_to !=address(0));
        // đảm bảo rằng hàm transfer này không được chứa bất cứ tokenId nào trước đó, vì việc tận dụng codde sẽ được dùng khi transfer 1 car
        require(_to != address(this));
        // đảm bảo rằng chỉ có người sở hữu mới được chuyển
        require(_owns(msg.sender, _tokenId));
        _transfer(msg.sender, _to, _tokenId);
    }

    // tương tự đối với approve
    function approve(address _to, uint256 _tokenId) external WhenNotPaused {
        require(_owns(msg.sender, _tokenId));
        // check xem bên aution đã được chấp nhận chưa
        _approve(_tokenId, _to);
        // đối chứng đối với ERC721
        Approval(msg.sender, _to, _tokenId);
    }

    // hàm check việc chuyển bắt nguồn từ ai
    function transferFrom(address _from, address _to, uint256 _tokenId) external WhenNotPaused {
        require(_to != address(0));
        // yêu cầu hàm transfer đã clear và không được có _to address trước đó
        require(_to != address(this));
        require(_approvedFor(msg.sender, _tokenId));
        // đảm bảo người sở hữu phải sở hữu token này
        require(_owns(_from, _tokenId));
        _transfer(_from, _to, _tokenId);
    }

    // xác định số car đang tồn tại
    function totalSupply() public view returns (uint) {
        return cars.length -1;
    }

    // xác định xem ai là chủ sở hữu của token
    function ownerOf(uint256 _tokenId) external view returns (address owner) {
        owner = kittyIndexToOwner[_tokenId];
        require(owner !=address(0));
    }

    // xác định xem người có dịa chỉ xác định đang sở hữu những token có ID nào
    function tokenOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);
        if(tokenCount == 0){
            return new uint256[](0);
        }else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalCats = totalSupply();
            uint256 resultIndex = 0;
            uint256 carId;

            for(carId = 1; carId <=totalCats; carId++){
                if(kittyIndexToOwner[carId] == _owner){
                    result[resultIndex] = carId;
                    resultIndex++
                }
            }
    return result;
    }
}




function CarOwnerShip(){

}
}
