contract ERC721 {
   // ERC20 compatible functions
   function name() constant returns (string name);
   function symbol() constant returns (string symbol);
   function totalSupply() constant returns (uint256 totalSupply);
   function balanceOf(address _owner) constant returns (uint balance);
   // Functions that define ownership
   function ownerOf(uint256 _tokenId) constant returns (address owner);
   function approve(address _to, uint256 _tokenId);
   function takeOwnership(uint256 _tokenId);
   function transfer(address _to, uint256 _tokenId);
   function tokenOfOwnerByIndex(address _owner, uint256 _index) constant returns (uint tokenId);
   // Token metadata
   function tokenMetadata(uint256 _tokenId) constant returns (string infoUrl);
   // Events
   event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
   event Approval(address indexed _owner, address indexed _approved, uint256 _tokenId);
}
