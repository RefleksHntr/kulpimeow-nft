// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract KulpimeowNFT is ERC721, Ownable {
    uint256 public constant MAX_SUPPLY = 5555;
    uint256 private _nextTokenId;
    string private _baseTokenURI;

    event MetadataUpdated(string newURI);

    constructor(address initialOwner) ERC721("KULPIMEOW", "KMEOW") Ownable(initialOwner) {
        _baseTokenURI = "ipfs://bafkreidmoqh4lpb2wgjtnqqzdo6n624nx2l4akg6kgjhto4mu52tzdlbdq";
    }

    function safeMint(address to) public onlyOwner returns (uint256) {
        require(_nextTokenId < MAX_SUPPLY, "Max supply reached");
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        return tokenId;
    }

    function setBaseURI(string memory newURI) public onlyOwner {
        _baseTokenURI = newURI;
        emit MetadataUpdated(newURI);
    }

    function getBaseURI() external view returns (string memory) {
        return _baseTokenURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }
}
