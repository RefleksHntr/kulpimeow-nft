// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "forge-std/Test.sol";
import "../src/KulpimeowNFT.sol";

contract KulpimeowNFTTest is Test {
    KulpimeowNFT nft;
    address owner = address(this);
    address user1 = address(0x123);

    function setUp() public {
        nft = new KulpimeowNFT(owner);
    }

    function testInitialMetadata() public view {
    assertEq(nft.getBaseURI(), "ipfs://bafkreidmoqh4lpb2wgjtnqqzdo6n624nx2l4akg6kgjhto4mu52tzdlbdq");
    }


    function testMintNFT() public {
        uint256 tokenId = nft.safeMint(user1);
        assertEq(nft.ownerOf(tokenId), user1);
    }

    function testSetBaseURI() public {
        nft.setBaseURI("ipfs://newmetadataCID");
        assertEq(nft.getBaseURI(), "ipfs://newmetadataCID");
    }
}
