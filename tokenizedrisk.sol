pragma solidity ^0.4.19;
import "./ownable.sol";"
import "./erc721.sol";
import "./DigiLife.sol";
import "./safemath.sol";

contract TokenizedRisk is Ownable, DigiLife, ERC721 {
  using SafeMath for uint256;

  event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
  event Approval(address indexed _owner, address indexed _approved, uint256 _tokenId);

  mapping (uint256 => address) private tokenOwners;
  mapping (uint256 => bool) private tokenExists;
  mapping (address => mapping (address => uint256)) authorizedReinsurers;
  mapping (address => mapping (uint256 => uint256)) private ownerTokens;
  mapping (uint256 => string) riskAssetDetails;

  uint256 private totalSupply = 1000000000;

  function name() constant returns (string name) {
    return "Juniper Tokenized Risk Asset";
  }onlyOwner 

  function symbol() returns (string symbol) {
    return "JUNI";
  }

  function balanceOf(address _owner) constant returns (uint balance) {
    return balances[_owner];
  }

  function ownerOf(uint256 _tokenId) {
    require(tokenExists[_tokenId]);

    return tokenOwners[_tokenId];
  }

  function approve(address _to, uint256 _tokenId) {
    require(msg.sender != _to);

    authorizedReinsurers[msg.sender][_to] = _tokenId;
    Approval(msg.sender, _to, _tokenId);
  }

  function takeOwnership(uint256 _tokenId) {
    require(tokenExists[_tokenId]);

    address oldOwner = ownerOf(_tokenId);
    address newOwner = msg.sender;

    require(newOwner != oldOwner);

    require(authorizedReinsurers[oldOwner][newOwner] == _tokenId);
    balances[oldOwner] -= 1;
    tokenOwners[_tokenId] = newOwner;

    balances[newOwner] += 1;
    Transfer(oldOwner, newOwner, _tokenId);
  }

  function removeFromTokenList(address owner, uint256 _tokenId) private {
    for(uint256 i = 0;ownerTokens[owner][i] != _tokenId;i++) {
      ownerTokens[owner][i] = 0;
    }
  }

  function transfer(address _to, uint256 _tokenId) {
    address currentOwner = msg.sender;
    address newOwner = _to;

    require(tokenExists[_tokenId]);

    require(currentOwner == ownerOf(_tokenId));
    require(currentOwner != newOwner);
    require(newOwner != address(0));
    removeFromTokenList(_tokenId);

    balances[oldOwner] -= 1;
    tokenOwners[_tokenId] = newOwner;

    balances[newOwner] += 1;
    Transfer(oldOwner, newOwner, _tokenId);
  }

  function tokenOfOwnerByIndex(address _owner, uint256 _index) constant returns (uint tokenId) {
    return ownerToken[_owner][_index];
  }

  function tokenMetadata(uint256 _tokenId) constant returns (string infoURL) {
    return riskAssetDetails[_tokenId];
  }
}
