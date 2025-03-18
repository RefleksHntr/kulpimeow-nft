// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "forge-std/Script.sol";
import "../src/KulpimeowNFT.sol";

contract DeployKulpimeowNFT is Script {
    function run() external {
        vm.startBroadcast();
        
        // Deploy NFT contract dengan pemilik dari variabel ENV
        KulpimeowNFT nft = new KulpimeowNFT(vm.envAddress("OWNER_ADDRESS"));
        
        console.log("KulpimeowNFT deployed at:", address(nft));

        vm.stopBroadcast();
    }
}
