// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "solmate/tokens/ERC721.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

contract CoolNft is ERC721 {

    using Strings for uint256;

    uint256 public tokens = 0;
    uint256 constant MAX_SUPPLY = 5;

    constructor() ERC721("CoolNFT", "CNFT") {
        
    }

    function contractURI() public pure returns (string memory) {
      return "https://nft-server.fly.dev/contract-meta";
    }

    function tokenURI(uint256 id) override public view virtual returns (string memory) {
      return string.concat("https://nft-server.fly.dev/meta/", id.toString());
    }

    function mint(address toMint) public returns (uint256) {
        uint256 tokenNumber = ++tokens;
        _safeMint(toMint, tokenNumber);
        return tokenNumber;
    }

}