// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/CoolNft.sol";

contract CoolNftTest is Test {

    CoolNft public nft;

    address constant toMint = address(0x1234abcd);

    function setUp() public {
        nft = new CoolNft();
    }

    function testMint() public {
        uint256 index = nft.mint(toMint);
        assertEq(nft.ownerOf(index), toMint);
    }

    function testUri() public {
        uint256 index = nft.mint(toMint);
        assertEq(nft.tokenURI(index), string(abi.encodePacked("https://token.metadata.com/token/",index,".json")));
    }

    function testOwned() public {
        uint256 index = nft.mint(toMint);
        assertEq(nft.ownerOf(index), toMint);
    }

}
