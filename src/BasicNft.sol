// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract BasicNft is ERC721 {
    mapping(uint256 tokenId => string tokenUri) private s_tokenIdToUri;

    uint256 private s_tokenCounter;

    constructor() ERC721("BasicNFT", "BNFT") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        uint256 newTokenId = s_tokenCounter;
        s_tokenIdToUri[newTokenId] = tokenUri;
        _mint(msg.sender, newTokenId);

        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
