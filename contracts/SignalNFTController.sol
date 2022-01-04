// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC721/ERC721.sol)

pragma solidity ^0.8.0;

import "./ModdedERC721Flat.sol";

contract NFTMarketplace {
    address _owner;
    string _mkt_name;
    string _platformURI;

    struct Bid {
      address from;
      uint256 amount;
      uint256 expiration;
    }
    
    mapping (address => bool) operators; 
    mapping (bytes32 => address) tokens;  // TokenID => contractAddress
    mapping (string => Bid) bids; // TokenID
    bytes32[] tokenIDs;
    
    mapping (address => string) owners;

    constructor (string memory mkt_name_, string memory platformURI_) {
        _mkt_name = mkt_name_;
        _platformURI = platformURI_;
        _owner = msg.sender;
    }

    function mktName() public view returns (string memory){
        return _mkt_name;
    }

    function platformURI() public view returns (string memory){
        return _platformURI;
    }

    function mergeBytes(bytes memory a, bytes memory b) public pure returns (bytes memory c) {
        // Store the length of the first array
        uint alen = a.length;
        // Store the length of BOTH arrays
        uint totallen = alen + b.length;
        // Count the loops required for array a (sets of 32 bytes)
        uint loopsa = (a.length + 31) / 32;
        // Count the loops required for array b (sets of 32 bytes)
        uint loopsb = (b.length + 31) / 32;
        assembly {
            let m := mload(0x40)
            // Load the length of both arrays to the head of the new bytes array
            mstore(m, totallen)
            // Add the contents of a to the array
            for {  let i := 0 } lt(i, loopsa) { i := add(1, i) } { mstore(add(m, mul(32, add(1, i))), mload(add(a, mul(32, add(1, i))))) }
            // Add the contents of b to the array
            for {  let i := 0 } lt(i, loopsb) { i := add(1, i) } { mstore(add(m, add(mul(32, add(1, i)), alen)), mload(add(b, mul(32, add(1, i))))) }
            mstore(0x40, add(m, add(32, totallen)))
            c := m
        }
    }

    function __createTokenID(address creator_) internal view returns (bytes32){
      bytes memory addr_b = abi.encodePacked(uint256(uint160(creator_)));
      bytes memory ts = abi.encodePacked(block.timestamp);
      bytes memory concatted = mergeBytes(addr_b, ts);
      return keccak256(concatted);
    }

    function __placeBid(bytes32 tokenID_) internal {
      
    }

    function __deployERC721(string memory name_, string memory symbol_) internal returns (bytes32){
        bytes32 newTokenID = __createTokenID(msg.sender);
        ERC721 newContract = new ERC721(name_, symbol_, _platformURI); // Requires tokenURI constructor 
        tokens[newTokenID] = address(newContract);
        tokenIDs.push(newTokenID);
        return newTokenID;
    }

    function __tradeERC721() internal {
        
    }

    function deployNFT(string memory name_, string memory symbol_) public returns (bytes32) {
        bytes32 tokenID = __deployERC721(name_, symbol_);
        return tokenID;
    }

    function placeBid(bytes32 tokenID_, uint amount_) public payable {

    }

    function startBidding(string calldata tokenId_) public {
        
    }

    function checkBid(string calldata tokenID_) public view {
    
    }

    function resolveTrade() public {
        
    }

    function getTokenAddressFromID(bytes32 tokenID_) public view returns (address tokenAddress){
        return tokens[tokenID_];
    }

    function getAllTokenIDs() public view returns (bytes32[] memory) {
        return tokenIDs;
    }

}