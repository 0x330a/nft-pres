// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "solmate/tokens/ERC721.sol";

contract CoolNft is ERC721 {

    uint256 public tokens = 0;

    constructor() ERC721("CoolNFT", "CNFT") {
        
    }

    function tokenURI(uint256 id) override public view virtual returns (string memory) {
        return string(abi.encodePacked("https://token.metadata.com/token/", id,".json"));
    }

    function mint(address toMint) public returns (uint256) {
        uint256 tokenNumber = ++tokens;
        _safeMint(toMint, ++tokens);
        return tokens;
    }

}