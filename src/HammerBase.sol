pragma solidity ^0.4.0;

contract HammerBase {
    struct Hammer {
        string name;
        uint32 genes;
    }


    mapping (uint => address) public hammerIndexToOwner;   //đua vào id của hammer và trả về địa chỉ của người sở hữu
    mapping (address => uint) public ownershipHammerCount; //đưa vào địa chỉ của chủ sở hữu, trả về số hammer người đó sở hữu
    mapping (uint => address)  public upgradeAllowedToAddress;

    function _transfer(address _from, address _to, uint _tokenId) internal {
        ownershipHammerCount[_to]++;
        hammerIndexToOwner[_tokenId] = _to;
        if(_from !=address(0)){
            ownershipHammerCount[_from]--;
            delete upgradeAllowedToAddress[_tokenId];
        }
        Transfer(_from, _to, _tokenId);
    }



}
