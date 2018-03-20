pragma solidity ^0.4.0;

contract HammerBase {
    struct Hammer {
        string name;
        string color;
        uint256 genes;
    }

    Hammer[3] hammers;
    mapping (uint256 => address) public hammerIndexToOwner;   //đua vào id của hammer và trả về địa chỉ của người sở hữu
    mapping (address => uint256) public ownershipHammerCount; //đưa vào địa chỉ của chủ sở hữu, trả về số hammer người đó sở hữu
    mapping (uint256 => address) public hammerIndexToApproval; //đưa vào token của car, trả về địa chỉ của người được approval
    mapping (uint256 => address)  public upgradeAllowedToAddress;

    function _transfer(address _from, address _to, uint256 _tokenId) internal {
        ownershipHammerCount[_to]++;
        hammerIndexToOwner[_tokenId] = _to;
        if(_from !=address(0)){
            ownershipHammerCount[_from]--;
            delete upgradeAllowedToAddress[_tokenId];
            delete hammerIndexToApproval[_tokenId];
        }
        Transfer(_from, _to, _tokenId);
    }


}
